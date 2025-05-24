import unittest
from unittest.mock import patch, MagicMock, mock_open
import os # For path manipulations if needed by mocks

# Modules to test
from butils.commands.compress.video import (
    compress,
    compress_video,
    get_compression_factor, # Re-used from image, but let's test its context here
    get_abs_paths,
)

class TestVideoCompression(unittest.TestCase):

    @patch('butils.commands.compress.video.input', return_value='25')
    @patch('butils.commands.compress.video.compress_video')
    def test_compress_with_input_crf(self, mock_compress_video, mock_input_func):
        compress("dummy.mp4", crf=None) # CRF is None, so input() should be called
        mock_input_func.assert_called_once()
        mock_compress_video.assert_called_once_with("dummy.mp4", '25')

    @patch('butils.commands.compress.video.input', return_value='') # User presses Enter
    @patch('butils.commands.compress.video.compress_video')
    def test_compress_with_input_crf_default_on_empty(self, mock_compress_video, mock_input_func):
        compress("dummy.mp4", crf=None)
        mock_input_func.assert_called_once()
        mock_compress_video.assert_called_once_with("dummy.mp4", 29) # Default CRF

    @patch('butils.commands.compress.video.input')
    @patch('butils.commands.compress.video.compress_video')
    def test_compress_with_given_crf(self, mock_compress_video, mock_input_func):
        compress("dummy.mp4", crf=20)
        mock_input_func.assert_not_called()
        mock_compress_video.assert_called_once_with("dummy.mp4", 20)

    @patch('butils.commands.compress.video.os.path.exists', return_value=True)
    @patch('butils.commands.compress.video.os.path.split', return_value=('head', 'tail.mp4'))
    @patch('butils.commands.compress.video.os.path.splitext', return_value=('tail', '.mp4'))
    @patch('butils.commands.compress.video.os.path.join', return_value='head/tail--compressed.mp4')
    @patch('butils.commands.compress.video.ffmpeg.input')
    @patch('butils.commands.compress.video.ffmpeg.output')
    @patch('butils.commands.compress.video.get_compression_factor')
    @patch('butils.commands.compress.video.time.time', side_effect=[100.0, 105.0])
    @patch('builtins.print')
    @patch('butils.commands.compress.video.os.path.abspath', return_value='/abs/path/to/output')
    def test_compress_video_success(
        self, mock_abspath, mock_print, mock_time, mock_get_comp_factor, mock_ffmpeg_output,
        mock_ffmpeg_input, mock_join, mock_splitext, mock_split, mock_exists
    ):
        mock_input_stream_obj = MagicMock()
        mock_ffmpeg_input.return_value = mock_input_stream_obj
        
        mock_output_stream_obj = MagicMock()
        mock_output_stream_obj.run = MagicMock()
        mock_ffmpeg_output.return_value = mock_output_stream_obj

        compress_video("dummy_input.mp4", crf=23)

        mock_exists.assert_called_once_with("dummy_input.mp4")
        mock_split.assert_called_once_with("dummy_input.mp4")
        mock_splitext.assert_called_once_with("tail.mp4")
        mock_join.assert_called_once_with('head', 'tail--compressed.mp4')
        
        mock_ffmpeg_input.assert_called_once_with("dummy_input.mp4")
        mock_ffmpeg_output.assert_called_once_with(
            mock_input_stream_obj,
            'head/tail--compressed.mp4',
            vcodec="libx264", format="mp4", crf=23
        )
        mock_output_stream_obj.run.assert_called_once()
        mock_get_comp_factor.assert_called_once_with("dummy_input.mp4", 'head/tail--compressed.mp4')
        
        printed_text = ""
        for call_args in mock_print.call_args_list:
            printed_text += " ".join(map(str, call_args[0])) + "\n"
        self.assertIn("Done in 5.0 seconds.", printed_text)
        self.assertIn("Output path: /abs/path/to/output", printed_text)


    @patch('butils.commands.compress.video.os.path.exists', return_value=False)
    def test_compress_video_input_not_exists(self, mock_exists):
        with self.assertRaises(ValueError) as context:
            compress_video("nonexistent.mp4", crf=23)
        self.assertEqual(str(context.exception), "Input file does not exist.")
        mock_exists.assert_called_once_with("nonexistent.mp4")

    @patch('butils.commands.compress.video.os.path.getsize')
    @patch('butils.commands.compress.video.os.path.abspath', side_effect=lambda x: '/abs/' + x)
    @patch('builtins.print')
    def test_get_compression_factor_video(self, mock_print, mock_abspath, mock_getsize):
        # This function is identical to the one in image.py, so this is more of an integration test
        # within the context of video compression.
        mock_getsize.side_effect = [10 * 1024 * 1024, 2 * 1024 * 1024] # Original 10MiB, Compressed 2MiB
        
        # In video.py, get_compression_factor is called by compress_video, 
        # but here we test it directly as a utility.
        get_compression_factor("input.mp4", "output.mp4")

        self.assertEqual(mock_getsize.call_count, 2)
        mock_getsize.assert_any_call("input.mp4")
        mock_getsize.assert_any_call("output.mp4")
        
        # get_compression_factor calls abspath twice in its print statements in some versions.
        # In the provided video.py, it's called once in the version I have.
        # Let's assume the version from video.py is the target.
        # If it were called by compress_video, abspath would be called by that too.
        # Since we call it directly, we only count calls within get_compression_factor.
        # The provided code for video.py's get_compression_factor calls abspath once.
        mock_abspath.assert_any_call("output.mp4") # Output path is printed with abspath

        printed_text = ""
        for call_args in mock_print.call_args_list:
            printed_text += " ".join(map(str, call_args[0])) + "\n"
            
        self.assertIn("Output path: /abs/output.mp4", printed_text)
        self.assertIn("Original size: 10.00 MiB", printed_text)
        self.assertIn("Compressed size: 2.00 MiB", printed_text)
        self.assertIn("Compression ratio: 5.0 to 1", printed_text) # 10.0 / 2.0 = 5.0
        self.assertIn("Compression factor: 80%", printed_text) # 1 - (2/10) = 0.8

    @patch('butils.commands.compress.video.os.walk')
    @patch('butils.commands.compress.video.os.path.abspath')
    @patch('butils.commands.compress.video.os.path.join')
    def test_get_abs_paths(self, mock_join, mock_abspath, mock_os_walk):
        # Configure os.walk to return a structure for a directory with files and subdirectories
        mock_os_walk.return_value = [
            ('/testdir', ['subdir'], ['file1.txt', 'file2.txt']),
            ('/testdir/subdir', [], ['file3.txt']),
        ]
        
        # Configure os.path.join and os.path.abspath to return predictable paths
        # These will be called for each file
        def join_side_effect(dirpath, filename):
            return f"{dirpath}/{filename}"
        mock_join.side_effect = join_side_effect
        
        def abspath_side_effect(path):
            return f"/abs{path}" # Keep it simple, ensure it's "absolute"
        mock_abspath.side_effect = abspath_side_effect

        result_paths = list(get_abs_paths("/testdir"))

        mock_os_walk.assert_called_once_with("/testdir")
        
        # Check calls to join and abspath
        # Expected join calls:
        # ('/testdir', 'file1.txt'), ('/testdir', 'file2.txt'), ('/testdir/subdir', 'file3.txt')
        # Expected abspath calls with results of join:
        # ('/testdir/file1.txt'), ('/testdir/file2.txt'), ('/testdir/subdir/file3.txt')
        
        self.assertEqual(mock_join.call_count, 3)
        self.assertEqual(mock_abspath.call_count, 3)
        
        expected_paths = [
            "/abs/testdir/file1.txt",
            "/abs/testdir/file2.txt",
            "/abs/testdir/subdir/file3.txt",
        ]
        self.assertListEqual(result_paths, expected_paths)

if __name__ == '__main__':
    unittest.main()
