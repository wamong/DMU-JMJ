'''
# LAB 7-3 도시의 인구
population = ['Seoul', 9765, 'Busan', 3441, 'Incheon', 2954]
p = print
p('서울 인구: ', population[1])
p('인천 인구: ', population[-1])
p('도시 리스트: ', population[::2])
p('인구의 합: ', sum(population[1::2]))
'''

# LAB 7-4
import random
p = print

quotes = []
quotes.append('꿈을 지녀라. 그러면 어려운 현실을 이길 수 있다.')
quotes.append('언제나 현재에 집중할 수 있다면 행복할 것이다.')
quotes.append('고생없이 얻을 수 있는 진실로 귀중한 것은 하나도 없다.')
quotes.append('사람은 사랑할 때 누구나 시인이 된다.')
quotes.append('시작이 반이다.')

p("##################################\n#           오늘의 명언          #\n##################################\n\n")
p(random.choice(quotes))