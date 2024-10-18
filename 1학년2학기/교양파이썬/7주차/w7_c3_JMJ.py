'''
def calc_circle(r):     # 반지름이 r인 원의 넓이와 둘레를 동시에 반환하는 함수
    area = 3.14 * r * r
    circum = 2 * 3.14 * r
    return area, circum # 튜플을 반환

radius = float(input('원의 반지름을 입력하시오: '))
(a, c) = calc_circle(radius)
print('원의 넓이는{0:7.2f}이고 원의 둘레는{1:6.2f}이다.'.format(a, c))
'''

'''
a, b = 100, 200
a = b
b = a
print('a =', a, 'b = ', b)
'''

'''
a, b = 100, 200
temp = a
a = b
b = temp
print('a =', a, 'b = ', b)
'''

'''
a, b = 100, 200
a, b = b, a
print('a =', a, 'b = ', b)
'''

'''
name = ['서울', '부산', '광주']
population = ( 9765, 3441, 1501 )

city_info = list(zip(name, population))
print('city_info =', city_info)
'''

'''
name = ['서울', '부산', '광주']
population = ( 9765, 3441, 1501 )
area = ( 605.2, 770, 501.2 )

city_info = list(zip(name, population, area))
print('city_info =', city_info)
'''

'''
name = ['서울', '부산', '인천', '광주', '대전']
population = ( 9765, 3441, 2954, 1501, 1531 )

city_info = list(zip(name, population))
print('city_info =', city_info)
'''

'''
city_name, city_pop = zip(*city_info)
print('city_name =', city_name)
print('city_pop =', city_pop)
'''

'''
max_pop = max(city_pop)
print('max_pop =', max_pop)

n = city_pop.index(max_pop)
print('최대 인구 도시: {0}, 인구: {1}천명'.format(city_name[0], max_pop))
'''

'''
min_pop = min(city_pop)
print('min_pop =', min_pop)

n = city_pop.index(min_pop)

print('최소 인구 도시: {0}, 인구: {1}천명'.format(city_name[n], min_pop))
print('리스트 도시 평균 인구: {0}천명'.format(sum(city_pop) / len(city_pop)))
'''

'''
phone_book = {"홍길동" : "010-1234-5678"}
phone_book["강감찬"] = "010-1234-5679"
phone_book["이순신"] = "010-1234-5680"
print(phone_book)
'''