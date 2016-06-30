y = 1;
for x in range(1, 101):
    y = y * x

r = 0;
for c in str(y):
    r = r + int(c)
    
print(r)
