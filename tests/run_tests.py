import argparse
import os
import sys
import unittest

import coverage

# TODO: add include and exclude directories with .coveragerc
# TODO: exclude /snap/blender/6181/4.4/scripts/modules/bpy/
# TODO: exclude /tests directory


# ANSI escape codes for colors
class Colors:
    GREEN = "\033[92m"
    RED = "\033[91m"
    RESET = "\033[0m"


# Add the project root to the Python path so butils can be imported
# This script is assumed to be at the project root directory.
project_root = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")
if project_root not in sys.path:
    sys.path.append(project_root)

# Define the directory where your tests are located
test_dir = os.path.join(project_root, "tests")

if not os.path.exists(test_dir):
    print(f"Error: Test directory not found at {test_dir}")
    # Exit with a non-zero status code to indicate failure
    sys.exit(1)

print(f"Discovering tests in {test_dir}")

# Use unittest's default test loader to discover tests
# It will look for files matching 'test_*.py' in the test_dir
suite = unittest.defaultTestLoader.discover(test_dir, pattern="test_*.py")


def parse_cli_args():
    parser = argparse.ArgumentParser(
        description="Run Blender Python unit tests. Script arguments must be passed after '--'."
    )
    parser.add_argument(
        "-v",
        "--verbosity",
        type=int,
        default=0,  # Default verbosity if not specified
        choices=[0, 1, 2],
        help="Verbosity level (0, 1, or 2). Default: 0",
    )
    # By default, buffering is True. This flag allows turning it OFF.
    parser.add_argument(
        "--no-buffer",
        action="store_false",  # Sets args.buffer to False if flag is present
        dest="buffer",
        help="Disable output buffering during tests. If this flag is present, buffering is OFF.",
    )
    parser.add_argument(
        "--coverage",
        action="store_true",
        help="Enable code coverage reporting.",
    )
    parser.add_argument(
        "--coverage-threshold",
        type=int,
        default=None,
        metavar="PERCENT",
        help="Minimum required coverage percentage. If coverage is below this, the script exits with a non-zero status.",
    )

    parser.set_defaults(buffer=True)  # Default behavior is to buffer output

    # Script arguments are expected after a '--' separator when run via Blender
    # e.g., blender --python script.py -- --verbosity 1
    # sys.argv for the script will start after '--'
    argv_for_script = []
    if "--" in sys.argv:
        try:
            separator_index = sys.argv.index("--")
            argv_for_script = sys.argv[separator_index + 1 :]
        except ValueError:
            # This case should ideally not be reached if '--' is in sys.argv
            pass  # argv_for_script remains empty, defaults will apply

    return parser.parse_args(argv_for_script)


cli_args = parse_cli_args()

# --- Coverage Setup ---
cov = None
if cli_args.coverage:
    cov = coverage.Coverage()
    cov.start()
    print("Coverage measurement started.")
# --- End Coverage Setup ---

runner = unittest.TextTestRunner(
    verbosity=cli_args.verbosity, buffer=cli_args.buffer
)

print("Running tests...")
result = runner.run(suite)
print("-" * 70)  # Separator for clarity

# --- Coverage Reporting ---
coverage_ok = True
if cov:
    cov.stop()
    cov.save()
    print("\nGenerating coverage report:")
    # Report to stdout. coverage.report() returns the total percentage.
    total_percentage = cov.report(file=sys.stdout)
    if (
        cli_args.coverage_threshold is not None
        and total_percentage < cli_args.coverage_threshold
    ):
        print(
            f"{Colors.RED}Coverage {total_percentage:.2f}% is below the required threshold of {cli_args.coverage_threshold}%.{Colors.RESET}"
        )
        coverage_ok = False
# --- End Coverage Reporting ---

if result.wasSuccessful() and coverage_ok:
    print(f"{Colors.GREEN}All tests passed!{Colors.RESET}")
    sys.exit(0)
else:
    print(f"{Colors.RED}Tests failed!{Colors.RESET}")
    sys.exit(1)
