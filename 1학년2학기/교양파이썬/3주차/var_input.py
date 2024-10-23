'''
x=int(input("첫 번째 정수를 입력하세요 : "))
y=int(input("두 번째 정수를 입력하세요 : "))
print(x, "+", y, '=', x+y)
'''
'''
name = input("이름 입력하세요 : ")
print(name,"씨 안녕하세요")
'''
'''
print("당신의 BMI를 계산할 수 있습니다.\n----------------------------------")
height= float(input("키를 입력하세요 : "))
weight= float(input("몸무게를 입력하세요 : "))
bmi=weight / height ** 2
print(bmi)
print('bmi')
'''

stadium = input("경기장은 어디입니까? ")
win_team = input("이긴 팀은 어디입니까? ")
lose_team = input("진 팀은 어디입니까? ")
best_player = input("우수선수는 누구입니까? ")
score = input("스코어는 몇대몇입니까? ")

print(" ===================================\n 오늘",
      stadium, "에서 야구 경기가 열렸습니다.\n",
      win_team, "과", lose_team, "은 치열한 공방전을 펼쳤습니다.\n",
      best_player, "의 맹활약으로", win_team, "가", lose_team,"를", score,"로 이겼습니다.\n ===================================")
