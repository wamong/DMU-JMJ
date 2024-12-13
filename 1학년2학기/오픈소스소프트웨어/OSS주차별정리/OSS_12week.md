# # 25. 브랜치 리베이스 rebase

## 1. 병합 rebase

### 3-way 상태에서 base의 이해

- 'master' 브랜치 커밋 B에서 분기되는 'bugfix'

![image](https://github.com/simsoohyeon/2023-OSS_simsoohyeon_study/assets/127268889/2c8373bc-fde9-4c48-bb50-9f8e7678a0d4)

### 선형적 통합 rebase 이해

- 브랜치 bugfix에서 base를 바꾸는 재배치하기 이전
- 재배치 rebase 병합 수행

![image](https://github.com/simsoohyeon/2023-OSS_simsoohyeon_study/assets/127268889/dbc103da-ee05-47c2-abd5-6bbf27b5516f)

### rebase를 이용한 브랜치 병합 과정

- 'fast-forward 병합' 방식
  - master 브랜치 뒤로 bugfix 브랜치의 이력이 이동(이력이 하나의 줄기로 이어짐, 충돌 발생 가능)

![image](https://github.com/simsoohyeon/2023-OSS_simsoohyeon_study/assets/127268889/df53c663-84bf-4ce1-b306-698b5db9d9c4)

## Rebase에서의 충돌

- 충돌 발생 가능
  - 이동되는 x와 y의 내용이 'master'의 C,D 커밋들과 충돌하는 부분이 생길 수 있음
  각각의 커밋에서 발생한 충돌 내용을 수정 후, 추가, 계속 수행 필요

![image](https://github.com/simsoohyeon/2023-OSS_simsoohyeon_study/assets/127268889/61377606-3741-463c-8ae4-b3021c4a5123)

## 2. 3-way, fast-forward와 rebase비교

### 3-way와 merge와 rebase비교

**merge**
- 여러 분기가 생긴 변경 내용의 이력이 모두 그대로 남아있기 때문에 이력이 복잡해짐
**rebase**
- 히스토리가 선형으로 단순해지고 좀 더 깨끗한 이력을 남김
- 원래의 커밋 이력이 변경됨
(정확환 이력을 남겨야 할 필요가 있을 경우에는 사용하면 안 됨)

![image](https://github.com/simsoohyeon/2023-OSS_simsoohyeon_study/assets/127268889/ca9963c0-62d0-4087-9f4d-f9d8a3fc95ff)

**fast-forward merge**
- 조상에 위치한 브랜치에서 선형 브랜치의 마지막으로 이동하는 병합
**rebase**
- 두 갈래의 브랜치에서 기존의 베이스를 수정, 병합할 브랜치 마지막 커밋을 새로운 베이스로 수정하는 병합

![image](https://github.com/simsoohyeon/2023-OSS_simsoohyeon_study/assets/127268889/74ebbe88-88be-4dd7-a0b6-8276ed5db004)
### 두 브랜치
![image](https://github.com/simsoohyeon/2023-OSS_simsoohyeon_study/assets/127268889/509c9b94-b344-4366-b1c2-12a4c4c3068c)
### 3-way 병합
![image](https://github.com/simsoohyeon/2023-OSS_simsoohyeon_study/assets/127268889/39d7f5fd-1114-4560-87da-4ac9d96af9da)
### Rebase 병합
![image](https://github.com/simsoohyeon/2023-OSS_simsoohyeon_study/assets/127268889/b5d37cd9-b71e-40d4-ad82-837bd25028c6)
### $ git rebase <newparent><branch>

**일반적 rebase 방법**
: topic에서 main을 rebase한 이후, 다시 main으로 이동 fast-forward 병합 수행
- $ git checkout topic
- $ git rebase main
- $ git checkout main
- $ git merge topic

**다른 rebase 방법: 어느 브랜치든 main topic 순서로 재배치 방법**
- $ git rebase main topic
- $ git checkout main
- $ git merge topic

---

# # 26. 커밋 이력 수정

>> 최신 커밋 메세지 수정
- $ git commit -amend -m 'new message'
>> 편집기로 최신 커밋 메세지 수정
- $ git commit --amend
>> 파일 수정 후 추가, 메세지 수정없이 최신 커밋으로 수정
- $ git commit --amend --no -edit
>> 이전 커밋 HEAD~2..HEAD까지의 각각의 커밋을 수정
- $ git rebase --interactive HEAD~3

>> 주요 rebase -i 대화형 명령어
  - p(ick): 해당 커밋을 수정하고 않고 그대로 사용
  - r(eword): 개별 커밋 메세지를 다시 작성
  - s(quash): 계속된 이후 커밋을 이전 커밋에 결합
  - d(rop): 커밋 자체를 삭제

---

# # 27. 비주얼스튜디오 코드의 깃 활용

>> 비주얼스튜디오코드에서 깃 저장소를 생성하고 파일 생성
- 탐색기 활동바, 버전 콘트롤 활동바
>> 비주얼스튜디오코드에서 파일을 추가, 커밋
- Changes, Stages Changes
>> Changes, Stages Changes
- 확장 Git Graph 설치와 활용
>> 비주얼스튜디오코드에서 파일 비교 기능 수행
- Changes, Stages Changes
- Git Graph
  - 다음 하부의 파일을 클릭 - Uncommitted changes - 각 커밋

---