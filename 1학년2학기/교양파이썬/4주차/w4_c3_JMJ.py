'''street = "서울시 종로구"
st = "아파트"
number_of_rooms = 3
price = 100000000

print("#######################")
print("#                     #")
print("# 부동산 매물 광고    #")
print("#                     #")
print("#######################")
print(f"\n{street}에 위치한 아주 좋은 {st}가 매물로 나왔습니다. 
      이 {st}는 {number_of_rooms}개의 방을 가지고 있으며 가격은 {price}입니다.")'''


fruits = []
fruits.append(input("좋아하는 과일 이름을 입력하시오: "))
fruits.append(input("좋아하는 과일 이름을 입력하시오: "))
fruits.append(input("좋아하는 과일 이름을 입력하시오: "))

if input("과일의 이름을 입력하세요: ") in fruits:
    print("이 과일은 당신이 좋아하는 과일입니다.")
else:
    print("이 과일은 당신이 좋아하는 과일이 아닙니다.")