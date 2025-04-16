define e = Character('아이린', color="#c8ffc8")
default book = False

# 여기에서부터 게임이 시작합니다.
label start:

    e "새로운 렌파이 게임을 만들었군요."

    e "이야기와 그림, 음악을 더하면 여러분의 게임을 세상에 배포할 수 있어요!"
    e  "어디로 이동할까요?"
    menu:
        "1. 카페로 가자":
            e "카페 나도 좋아해요"
            jump cafe

        "2. 공원으로 가자":
            e "다리 아픈데"

            jump park



    label cafe:
        e "카페다!"
        $book = True
        jump airin
    
    label park:
        e "공원이다!"
        jump airin


    label airin:
        e "그래서 이제 뭐할까요?"
        if book:
            e "책을 읽을까요?"
    return

