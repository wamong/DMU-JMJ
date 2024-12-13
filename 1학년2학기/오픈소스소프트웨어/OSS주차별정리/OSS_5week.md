# # 10. 파일 비교 diff

# 1. 3영역의 파일 비교 diff

## 파일 비교

- 깃 3영역의 파일비교
- 커밋 간의 파일 비교
  - HEAD~ HEAD^
    - 하나 전 커밋
    - ~ => tilde, 틸드, 물결
    - ^ => caret, 커렛, 모자, 삿갓
- HEAD~~ HEAD~2 HEAD^^ HEAD^~
  - 두개 이전 커밋 ( HEAD^2 ⚠️error)
- 브랜치 간의 파일 비교

## 깃 3영역

- PC 탐색기 저장소 폴더에서 보이는 파일: 작업 디렉토리 파일
- 저장소 하부의 .git 폴더에 정보로 숨겨진 파일: 스테이징 영역, 깃(지역) 저장소
- 리눅스 명령어 ls로 보이는 파일: 작업 디렉토리의 파일
- 깃 명령 git ls-files로 보이는 파일: 스테이징 영역의 파일

# 2. 두 버전과의 파일 비교 diff

>>> $ git diff clD1 clD3 -> git diff HEAD~2 HEAD~
>>> $ git diff clD1 clD2 -> $ git diff HEAD~ HEA
/// $ git diff HEAD HEAD~ => 인자의 순서에 따라 결과 표시가 다름

---

# # 11. 파일 삭제 rm와 restore 

# 1. 파일 삭제 rm

## 리눅스 명령 파일 삭제
  - 작업 디렉토리에서 file 삭제

## 깃 명령 파일 삭제

- $ git rm [file]
  - 작업 디렉토리와 스테이징 영역에서 모두 파일 삭제
    => 다음 커밋에서 지정한 file을 삭제하겠다는 의미
    => Tracked 상태의 파일을 제거하여 Untracked 상태로 만듦
- $ git rm --cached [file]
  - 스테이징 영역에서 file 삭제 => 작업 디렉토리에서는 삭제되지 않음
  - $ git ls-files 결과에서 보이지 않음 => 기본적으로 스테이징 영역의 파일 목록을 표시

## 작업 디렉토리와 스테이징 영역에서 파일 삭제

- 현재 상태: 3영역(WD와 SA, GD) 모두에 파일 f,g가 있는 상태
- 작업 디렉토리와 스테이징 영역에서 파일 g 삭제 = $ git rm g
- 삭제된 이후 깃 배시
  - 녹색: 스테이징 영역의 표시이며 깃 저장소와 비교해 삭제됨을 의미

## $ git commit -m 'Delete g'

- 현재 상태: WD: f, SA: f, GD: f, g
- 파일 g가 삭제된 상태에서 커밋
  - 이전 커밋과 차이는 g가 삭제된 것, 커밋 이후 log show

---

# 2. 파일 복원 restore

## $ git restore [file]

- 현재 상태: 3영역은 파일 f가 모두 다른 상태
- 작업 디렉토리의 파일 f를 스테이징 영역의 파일 상태로 복주
  - 작업 디렉토리에 있던 f 내용이 사라지므로 유의
  - 3영역에서 파일 f가 작업 디렉토리와 스테이징 영역의 같은 상태가 됨 ($ git restore f)

## $ git restore --staged [file]

- 현재 상태: 3영역의 파일 f가 모두 다른 상태
- 깃 저장소의 최신 커밋 상태의  파일 f를 스테이징 영역에 복구
  - 스테이징 영역에 있던 f내용이 사라지므로 유의
  - 3영역에서 스테이징 영역의 파일 f가 깃 저장소와 같은 상태가 됨($ git restore --staged f)

## 깃 저장소 내용으로 한 번에 모두 복원

- 현재 상태: 3영역에서 파일 f가 모두 다른 상태
- 깃 저장소의 최신 커밋 상태의 파일 f를 작업 디렉토리와 스테이징 영역에 한 번에 복구
  - 파일 f가 현재 커밋 상태의 내용으로 작업 디렉토리와 스테이징 영역 모두 같은 상태가 됨
  - git restore --source=HEAD --staged --worktree f
  (--staged는 -S, --worktree는 -W 짧게 가능(둘 다 대문자))

## HEAD 내용으로 작업 디렉토리 복원

- 현재 상태: 3영역에서 파일 f가 모두 다른 상태
- 깃 저장소의 최신 커밋 상태의 파일 f를 작업 디렉토리에 복원
  - 파일 f가 현재 커밋 상태의 내용으로 작업 디렉토리에 복사되어 동일하게 됨
  - $ git restore --source=HEAD f

## $ git restore --source=HEAD^ --staged [file]

- 현재 상태: 3영역에서 파일 f가 모두 다른 상태
- 깃 저장소의 최신 커밋 상태의 파일 f를 스테이징 영역의 복구
  - 스테이징 영역에 있던 파일 f 내용이 사라지므로 유의
  - 3영역에서 스테이징 영역의 파일 f가 깃 저장소 영역과 같은 상태가 됨

## 복원 restoe 정리

작업 디렉토리 ==============>>> 스테이징 영역 ================>>> 깃(지역) 저장소
    WD             add                           commit
             <<<==============               <<<==============
                  restore                     restore --staged       
  
---

# # 12. [실습] 파일 diff rm restore

## 1. 파일 비교 diff 

### 파일 커밋 후 비교
- 3영역이 모두 동일? => $ git status nothing to commit, working

## 2. 파일 삭제 rm과 복구 restore

### 명령 별칭 git alias 생성

: 계속 사용하는 깃 명령을 짧게 다른 이름으로 만드는 방법
- $ git config --global alias.별칭이름'원명령어--긴 옵션-짧은 옵션'
  - 설정 이후에는 다음 명령으로 가능 => $ git 별칭이름
- $ git config --global alias.ss 'status -s'
=> --global은 모든 프로젝트에서 공통적으로 사용하고자 하는 설정,
사용자의 홈디렉토리의 .gitconfig 파일에 아래와 같이 추가
[alias] ss=status-s / s=status / co=checkout / br=branch / c=commit
- 다음은 동일한 명령어
  - $ git status -s, $ git ss
- $ git config --global alias.s 'status'
  - $ git s
- $ git config --global alias.co checkout
  - $ git co
- $ git config --global alias.br branch
  - $ git br
- $ git config --global alias.c commit
  - $ git c

---