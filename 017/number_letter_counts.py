import unittest
from sys import argv

class ConverterTest(unittest.TestCase):
    def test_total_letters(self):
        c = Converter()
        self.assertEqual(3, c.total_letters('one '))
        self.assertEqual(21, c.total_letters('one hundred and forty-six'))

    def test_convert(self):
        c = Converter()
        self.assertEqual('one hundred and forty-six', c.convert(146))
        self.assertEqual('sixty-nine', c.convert(69))
        self.assertEqual('one hundred', c.convert(100))

    def test_size_convert(self):
        c = Converter()
        self.assertEqual(3, c.size_convert(1))
        self.assertEqual(3, c.size_convert(2))
        self.assertEqual(21, c.size_convert(146))
        self.assertEqual(9, c.size_convert(69))

class Converter:
    def __init__(self):
        self.data = self.init()

    def total_letters(self, s):
        t = 0
        for c in s:
            if (c != ' ' and c != '-'):
                t = t + 1
                
        return t

    def size_convert(self, x):
        return self.total_letters(self.convert(x))
                
    def convert(self, x):
        if (x == 1000):
            return 'one thousand'

        result = ''

        if (x >= 100):
            c = int(x/100)
            result = self.data[c] + ' hundred'
            x = x % 100
            if (x == 0):
                return result
            else:
                result = result + ' and '
                
        if (x <= 20):
            result = result + self.data[x]
        else:
            c = int(x/10)
            result = result + self.data[c*10]
            x = x % 10
            if (x != 0):
                result = result + '-' + self.data[x]

        return result

    def init(self):
        data = dict()
        data[1] = 'one'
        data[2] = 'two'
        data[3] = 'three'
        data[4] = 'four'
        data[5] = 'five'
        data[6] = 'six'
        data[7] = 'seven'
        data[8] = 'eight'
        data[9] = 'nine'
        data[10] = 'ten'
        data[11] = 'eleven'
        data[12] = 'twelve'
        data[13] = 'thirteen'
        data[14] = 'fourteen'
        data[15] = 'fifteen'
        data[16] = 'sixteen'
        data[17] = 'seventeen'
        data[18] = 'eighteen'
        data[19] = 'nineteen'
        data[20] = 'twenty'
        data[30] = 'thirty'
        data[40] = 'forty'
        data[50] = 'fifty'
        data[60] = 'sixty'
        data[70] = 'seventy'
        data[80] = 'eighty'
        data[90] = 'ninety'
        data[100] = 'hundred'
        
        return data

def main(x):
    if (x < 1 or x > 1000):
        print('Invalid value %d' % x)
        exit()

    converter = Converter()

    total = 0
    for i in range(1, x+1):        
        total = total + (converter.size_convert(i))
        
    print('total %d' % total)

        
    
if (__name__ == "__main__"):
    if (len(argv) < 2):
        unittest.main()
    else:
        main(int(argv[1]))
