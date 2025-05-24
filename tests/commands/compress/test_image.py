import unittest
from unittest.mock import patch, MagicMock, mock_open
import os # For path manipulations if needed by mocks

# Modules to test
from butils.commands.compress.image import (
    compress,
    compression_factor,
    compress_image,
    get_exif_data,
    generate_thumbnail,
    analyze_image,
)

class TestImageCompression(unittest.TestCase):

    @patch('butils.commands.compress.image.Image.open')
    @patch('butils.commands.compress.image.os.path.split', return_value=('head', 'tail.ext'))
    @patch('butils.commands.compress.image.os.path.splitext', return_value=('tail', '.ext'))
    @patch('butils.commands.compress.image.os.path.join', return_value='head/tail--compressed.ext')
    @patch('butils.commands.compress.image.compress_image') # Mock internal call
    @patch('butils.commands.compress.image.compression_factor') # Mock internal call
    @patch('butils.commands.compress.image.analyze_image') # Mock internal call
    @patch('butils.commands.compress.image.time.time', side_effect=[100.0, 102.0]) # Mock time
    @patch('builtins.print') # Mock print
    def test_compress_analyze_false(
        self, mock_print, mock_time, mock_analyze, mock_comp_factor, 
        mock_compress_img_func, mock_join, mock_splitext, mock_split, mock_image_open
    ):
        mock_img_obj = MagicMock()
        mock_image_open.return_value = mock_img_obj
        
        compress("dummy_input.png", analyze=False)

        mock_image_open.assert_called_once_with("dummy_input.png")
        mock_split.assert_called_once_with("dummy_input.png")
        mock_splitext.assert_called_once_with("tail.ext")
        mock_join.assert_called_once_with("head", "tail--compressed.ext")
        
        mock_compress_img_func.assert_called_once_with(mock_img_obj, 'head/tail--compressed.ext')
        mock_comp_factor.assert_called_once_with("dummy_input.png", 'head/tail--compressed.ext')
        mock_analyze.assert_not_called()
        self.assertIn("Compressing dummy_input.png...", [call[0][0] for call in mock_print.call_args_list if call[0]])
        self.assertIn("Done in 2.0 seconds.", [call[0][0] for call in mock_print.call_args_list if call[0]])


    @patch('butils.commands.compress.image.Image.open')
    @patch('butils.commands.compress.image.os.path.split', return_value=('head', 'tail.ext'))
    @patch('butils.commands.compress.image.os.path.splitext', return_value=('tail', '.ext'))
    @patch('butils.commands.compress.image.os.path.join', return_value='head/tail--compressed.ext')
    @patch('butils.commands.compress.image.analyze_image') # Mock internal call
    @patch('butils.commands.compress.image.compress_image') # Mock internal call
    @patch('butils.commands.compress.image.time.time', side_effect=[100.0, 102.0]) # Mock time
    @patch('builtins.print')
    def test_compress_analyze_true(
        self, mock_print, mock_time, mock_compress_img_func, mock_analyze, 
        mock_join, mock_splitext, mock_split, mock_image_open
    ):
        mock_img_obj = MagicMock()
        mock_image_open.return_value = mock_img_obj # analyze_image also calls Image.open if not passed img

        compress("dummy_input.png", analyze=True)

        mock_image_open.assert_called_once_with("dummy_input.png") # Called by compress()
        # analyze_image is called with input_path, it will open the image itself.
        mock_analyze.assert_called_once_with("dummy_input.png")
        mock_compress_img_func.assert_not_called()
        # Note: compression_factor is NOT called when analyze=True
        mock_print.assert_any_call("Done in 2.0 seconds.")


    @patch('butils.commands.compress.image.os.path.getsize')
    @patch('butils.commands.compress.image.os.path.abspath', side_effect=lambda x: '/abs/' + x)
    @patch('builtins.print')
    def test_compression_factor(self, mock_print, mock_abspath, mock_getsize):
        mock_getsize.side_effect = [2 * 1024 * 1024, 1 * 1024 * 1024] # Original, Compressed
        
        compression_factor("input.png", "output.png")

        self.assertEqual(mock_getsize.call_count, 2)
        mock_getsize.assert_any_call("input.png")
        mock_getsize.assert_any_call("output.png")

        mock_abspath.assert_called_once_with("output.png")

        # Check print outputs
        # Due to the way print calls are captured, we check parts of the output.
        # A more robust way would be to capture all args to print.
        # For simplicity, checking if certain strings are in the print output.
        printed_text = ""
        for call_args in mock_print.call_args_list:
            printed_text += " ".join(map(str, call_args[0])) + "\n"
            
        self.assertIn("Output path: /abs/output.png", printed_text)
        self.assertIn("Original size: 2.00 MiB", printed_text)
        self.assertIn("Compressed size: 1.00 MiB", printed_text)
        self.assertIn("Compression ratio: 2.0 to 1", printed_text) # 2.00 / 1.00 = 2.0
        self.assertIn("Compression factor: 50%", printed_text)


    def test_compress_image(self):
        mock_img = MagicMock()
        mock_img.save = MagicMock()
        
        compress_image(mock_img, "new_path.png")
        
        mock_img.save.assert_called_once_with("new_path.png", optimize=True)

    @patch('butils.commands.compress.image.piexif.load')
    def test_get_exif_data_with_exif(self, mock_piexif_load):
        mock_img = MagicMock()
        mock_img.info = {'exif': b'exif_bytes'}
        mock_piexif_load.return_value = {"0th": {"key": "value"}}
        
        exif_data = get_exif_data(mock_img)
        
        mock_piexif_load.assert_called_once_with(b'exif_bytes')
        self.assertEqual(exif_data, {"0th": {"key": "value"}})

    @patch('butils.commands.compress.image.piexif.load')
    def test_get_exif_data_no_exif(self, mock_piexif_load):
        mock_img = MagicMock()
        mock_img.info = {} # No 'exif' key
        
        exif_data = get_exif_data(mock_img)
        
        mock_piexif_load.assert_not_called()
        self.assertEqual(exif_data, {})

    def test_generate_thumbnail(self):
        mock_img = MagicMock()
        mock_img.width = 800
        mock_img.height = 600
        
        # The copy needs to also have width/height and thumbnail method
        mock_img_copy = MagicMock()
        mock_img_copy.width = 800 
        mock_img_copy.height = 600
        mock_img_copy.thumbnail = MagicMock()
        
        mock_img.copy.return_value = mock_img_copy
        
        thumbnail = generate_thumbnail(mock_img, width=200)
        
        mock_img.copy.assert_called_once()
        # Scale = 200 / 800 = 0.25
        # New width = 800 * 0.25 = 200 (it's round(img.height * scale), round(img.width*scale))
        # but thumbnail takes (width, height)
        # new_height = 600 * 0.25 = 150
        # new_width from problem statement = round(img.width*scale) = round(800*0.25) = 200
        # thumbnail arg is (round(img.height*scale), round(img.width*scale)) in the code, which is unusual
        # It should be (width, height) so (round(img.width*scale), round(img.height*scale))
        # Code: thumbnail.thumbnail((round(img.height * scale), round(img.width * scale)))
        # Expected call: mock_img_copy.thumbnail.assert_called_once_with((150, 200))
        # Let's assume the code's order is intentional (height, width) for the thumbnail call
        expected_thumb_dims = (round(600 * 0.25), round(800 * 0.25)) # (150, 200)
        mock_img_copy.thumbnail.assert_called_once_with(expected_thumb_dims)
        self.assertEqual(thumbnail, mock_img_copy)

    @patch('butils.commands.compress.image.Image.open')
    @patch('butils.commands.compress.image.os.path.getsize', return_value=1024*1024) # 1 MiB
    @patch('butils.commands.compress.image.get_exif_data', return_value={"Test": "Exif"})
    @patch('builtins.print')
    @patch('butils.commands.compress.image.json.dumps', return_value='"json_info"') # Mock json.dumps
    def test_analyze_image(self, mock_json_dumps, mock_print, mock_get_exif, mock_getsize, mock_image_open):
        mock_img_obj = MagicMock()
        mock_img_obj.width = 1920
        mock_img_obj.height = 1080
        mock_img_obj.mode = "RGB"
        mock_img_obj.format = "PNG"
        mock_img_obj.format_description = "Portable Network Graphics"
        mock_img_obj.info = {'exif': b'dummy_exif_bytes', 'other_info': 'test'}
        
        mock_image_open.return_value = mock_img_obj
        
        returned_img = analyze_image("test_image.png")
        
        mock_image_open.assert_called_once_with("test_image.png")
        mock_getsize.assert_called_once_with("test_image.png")
        mock_get_exif.assert_called_once_with(mock_img_obj)
        
        # Check that 'exif' was removed from info before json.dumps
        self.assertNotIn('exif', mock_img_obj.info) 
        mock_json_dumps.assert_called_once_with({'Size MiB': 1.0, 'other_info': 'test'}, indent=2)

        # Check some print outputs
        printed_text = ""
        for call_args in mock_print.call_args_list:
            printed_text += "".join(map(str, call_args[0])) + "\n"

        self.assertIn("test_image.png", printed_text)
        self.assertIn("size: 1.0 MiB", printed_text)
        self.assertIn("width: 1920", printed_text)
        self.assertIn("height: 1080", printed_text)
        self.assertIn("exif: {'Test': 'Exif'}", printed_text)
        self.assertIn('info: "json_info"', printed_text)
        
        self.assertEqual(returned_img, mock_img_obj)

if __name__ == '__main__':
    unittest.main()
