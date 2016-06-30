from sys import argv

def leap(y):
    if (y % 4 == 0):
        if (y % 100 == 0):
            if (y % 400 == 0):
                return True
            else:
                return False
        else:
            return True
    else:
        return False

def total_days(month, year):
    if (month == 2):
        if (leap(year)):
            return 29
        else:
            return 28
    
    if (month <= 7):
        if (month % 2 == 1):
            return 31
        else:
            return 30
    elif (month % 2 == 0):
        return 31
    else:
        return 30
    
def main(year):
    total_sundays = 0
    weekday = 2
    
    for y in range(1901, year+1):
        for m in range(1, 13):
            #print('%d %02d - %d' % (y, m, weekday))
            if (weekday == 0):
                total_sundays = total_sundays + 1
            
            days = total_days(m, y)
            weekday = (weekday + days) % 7            
    return total_sundays

if (__name__ == "__main__"):
    print(main(int(argv[1])))
