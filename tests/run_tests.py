import argparse
import os
import pathlib
import sys
import unittest

# Parse args
parser = argparse.ArgumentParser()
parser.add_argument("--testcase", type=str)
parser.add_argument("--verbosity", type=int, default=2)
parser.add_argument("--coverage", action="store_true")
parser.add_argument("--print", action="store_true")
remainder = []
if "--" in sys.argv:
    remainder = sys.argv[sys.argv.index("--") + 1 :]
args, _ = parser.parse_known_args(remainder)
print(args)

# Identify src and test paths
path = pathlib.Path(__file__)
while path.name and not path.name == "tests":
    path = path.parent
test_dir = str(path)
system_under_test_dir = str(path.parent)
sys.path.append(system_under_test_dir)

# Specify or discover tests
if args.testcase:
    loader = unittest.TestLoader()
    suite = loader.loadTestsFromName(args.testcase)
else:
    suite = unittest.defaultTestLoader.discover(test_dir, pattern="test_*.py")

# Run the tests
if args.coverage:
    flags = "--upgrade --root-user-action=ignore --quiet"
    os.system(f"{sys.executable} -m pip install {flags} pip coverage")
    import coverage  # noqa: E402

    cov = coverage.Coverage()
    cov.start()
runner = unittest.TextTestRunner(verbosity=args.verbosity, buffer=args.print)
result = runner.run(suite)
if args.coverage:
    cov.stop()  # type: ignore
    cov.save()  # type: ignore
    cov.report(file=sys.stdout, show_missing=True)  # type: ignore

if result.wasSuccessful():
    print("\033[92m" + "#" * 32 + " PASS " + "#" * 32 + "\033[0m")
else:
    print("\033[91m" + "#" * 32 + " FAIL " + "#" * 32 + "\033[0m")
    sys.exit(1)
