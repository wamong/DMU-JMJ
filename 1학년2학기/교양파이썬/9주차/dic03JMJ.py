'''
person_dic = {'Name': '홍길동', 'Age': 27, 'Class': '초급'}
print(person_dic['Name'])
print(person_dic['Age'])


phone_book = {"홍길동": "010-1234-5678", "강감찬": "010-1234-5679", "이순신": "010-1234-5680"}
print(phone_book["강감찬"])
phone_book.keys()

phone_book.values()

phone_book.items()


for name, phone_num in phone_book.items():
    print(name,':',phone_num)

    
# lab8-1
stores = { "커피음료": 7, "펜": 3, "종이컵": 2, "우유": 8, "콜라": 4, "책": 5}
print("재고 :",stores[input("물건의 이름을 입력하시오: ")])

numbers = {2,1,3}
numbers

set([1, 2, 3, 1, 2])

set("abcdefa")

n_list = [1, 2] + [1, 2, 3]
print('n_list =', n_list)

n_set = {1, 2} + {1, 2, 3}

numbers = {2, 1, 3}
if 1 in numbers:
    print("집합 안에 1이 있습니다.")
else:
    print("집합 안에 1이 없습니다.")

    
numbers = {2, 1, 3}
for x in numbers:
    print(x, end=" ")

a = set("uwyetrjahsgdfmzbxcnv")
for x in sorted(a):
    print(x, end=" ")  

numbers = {1, 2, 3}
numbers.add(4)
numbers

numbers.remove(4)
numbers

a_list = ['hello', 'world', 'welcome', 'to', 'python']
'python' in a_list

'''
