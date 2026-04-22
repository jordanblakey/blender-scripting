import subprocess
import sys
import os

def run_conversion():
    # If you drag and drop a file, it comes in as an argument
    if len(sys.argv) < 2:
        print("Usage: Drag your .mkv file onto this script or run:")
        print("python grid_to_webp.py your_video.mkv")
        input("\nPress Enter to close...")
        return

    input_file = sys.argv[1]
    # Creates 'output.webp' in the same folder as the source
    output_file = os.path.splitext(input_file)[0] + ".webp"

    # Your custom "Golden Settings"
    command = [
        'ffmpeg',
        '-i', input_file,
        '-vcodec', 'libwebp',
        '-filter:v', 'fps=24,scale=960:-1',
        '-lossless', '0',
        '-q:v', '40',
        '-loop', '0',
        '-an',
        output_file,
        '-y' # Automatically overwrite old versions
    ]

    try:
        print(f"--- Converting: {os.path.basename(input_file)} ---")
        subprocess.run(command, check=True)
        print(f"--- Success! Created: {os.path.basename(output_file)} ---")
    except subprocess.CalledProcessError:
        print("\nError: FFmpeg failed. Check if your .mkv is valid.")
    except FileNotFoundError:
        print("\nError: 'ffmpeg' not found. Make sure ffmpeg is installed and in your PATH.")
    
    # Keeps the window open so you can see if it worked
    input("\nPress Enter to exit...")

if __name__ == "__main__":
    run_conversion()