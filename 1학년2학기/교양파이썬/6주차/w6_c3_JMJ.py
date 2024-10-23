'''heights = [178, 173, 166, 164, 176]

smallest = heights[0]
for item in heights:
    if item < smallest:
        smallest = item

print('리스트 원소들 :', heights)
print('이 중에서 가장 작은 값은:', smallest)
'''

'''
heights = [178, 173, 166, 164, 176]

largest = heights[0]
for item in heights:
    if item > largest:
        largest = item

print('리스트 원소들 :', heights)
print('이 중에서 가장 작은 값은:', largest)
'''

'''
heights = [178, 173, 166, 164, 176]
print('이 중에서 가장 작은 값은:',min(heights))
print('이 중에서 가장 큰 값은:', max(heights))
'''

'''
heights = [178, 173, 166, 164, 176]
heights.sort()

print('이 중에서 가장 작은 값은:',(heights[0]))
print('이 중에서 가장 큰 값은:',(heights[-1]))
'''

'''
[ x**2 for x in [1, 2, 3, 4, 5] ]

s = []
for x in [1, 2, 3, 4, 5]:
    s.append(x**2)

[x for x in range(10)]

[x * x for x in range(10)]

st = 'Hello World'
[x.upper() for x in st]
'''

'''
a = ['welcome', 'to', 'the', 'python', 'world']
first_a = [s[0].upper() for s in a]
print(first_a)

[x for x in range(10) if x % 2 == 0]

[x**2 for x in range(10) if x % 2 == 0]
'''

'''
s = ['Hello', '12345', 'World', '67890']
numbers = [x for x in s if x.isdigit()]
print(numbers)

[int(x) for x in input ('정수를 여러 개 입력하세요 : ').split()]
'''


'''
[int(x) for x in input ('정수를 여러 개 입력하세요 : ').split() if x.isdigit()]

[(x, y) for x in [1, 2, 3] for y in [3, 1, 4]]
'''

'''
[(x, y) for x in [1, 2, 3] for y in [3, 1, 4] if x != y]
'''

'''
t1 = (1, 2, 3, 4, 5)
print(t1[0])
print(t1[1:4])
t2 = t1 + t1
t2
'''

'''
def calc_circle(r):
    area = 3.14 * r * r
    circum = 2* 3.14 * r
    return area, circum

radius = float(input('원의 반지름을 입력하시오: '))
(a, c) = calc_circle(radius)
print('원의 넓이는{0:7.2f}이고 원의 둘레는{1:6.2f}이다.'.format(a, c))

'''