import unittest
from sys import argv


class SolverTest(unittest.TestCase):
    def test_total_letters(self):
        c = Solver()
        self.assertEqual(3, c.total_letters('one '))
        self.assertEqual(21, c.total_letters('one hundred and forty-six'))


class Solver:
    def __init__(self):
        self.blah = 1

    def some_function():
        print(1)


def main():
    print(1)

if (__name__ == "__main__"):
    if (len(argv) < 2):
        unittest.main()
    else:
        main(int(argv[1]))

