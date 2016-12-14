import numpy as np
import unittest


class Test(unittest.TestCase):
    def test(self):
        self.assertEqual(28, sum_proper_divisors(28))
        self.assertEqual(16, sum_proper_divisors(12))
        self.assertEqual(0, sum_proper_divisors(1))
        self.assertEqual(1, sum_proper_divisors(2))
        self.assertEqual(1, sum_proper_divisors(3))


def sum_proper_divisors(n):
    result = 0
    for i in range(1, int(n / 2) + 1):
        if n % i == 0:
            result = result + i
    return result


def generate_abundant_numbers(n):
    result = []
    for i in range(0, n + 1):
        if sum_proper_divisors(i) > i:
            result.append(i)
    return result


def main():
    abundant_numbers = generate_abundant_numbers(28123)
    cache = np.zeros(28123, dtype=np.bool)
    for i in abundant_numbers:
        for j in abundant_numbers:
            if i + j < 28123:
                cache[i + j] = True
    print np.sum([k for k in range(0, 28123) if not cache[k]])


if (__name__ == "__main__"):
    # unittest.main()
    main()
