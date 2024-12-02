import random

# 후보 리스트 (예시: 연예인 이상형 월드컵)
candidates = [
    "아이유", "지민", "박보검", "송중기", "김태희", "수지", "전지현", "김연아",
    "정해인", "박서준", "이민호", "한효주", "유인나", "강다니엘", "류준열", "김고은"
]

# 후보 리스트 셔플 (순서 랜덤화)
random.shuffle(candidates)

# 이상형 월드컵 진행
def run_tournament(candidates):
    round_num = 1
    while len(candidates) > 1:
        print(f"\n---- {round_num}라운드 ----")
        next_round_candidates = []

        # 대진표 만들기 (1:1 비교)
        for i in range(0, len(candidates), 2):
            if i + 1 < len(candidates):  # 짝이 맞는 경우
                print(f"{candidates[i]} vs {candidates[i+1]}")
                choice = input("누구를 선택할까요? (1 또는 2): ")

                if choice == '1':
                    next_round_candidates.append(candidates[i])
                elif choice == '2':
                    next_round_candidates.append(candidates[i+1])
                else:
                    print("잘못된 입력입니다. 다시 선택하세요.")
                    continue
            else:  # 홀수일 경우 마지막 하나는 자동으로 승리
                next_round_candidates.append(candidates[i])

        # 다음 라운드 진출 후보
        candidates = next_round_candidates
        round_num += 1

    print(f"\n최종 승자는 {candidates[0]}입니다!")

# 게임 시작
print("이상형 월드컵을 시작합니다!")
run_tournament(candidates)