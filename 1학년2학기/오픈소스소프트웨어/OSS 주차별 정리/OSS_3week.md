# # 07. 깃 커밋과 로그

## 1. 버전관리를 위한 add, commit 명령
### 깃 3영역

- 작업 영역: 탐색기 상의 폴더 하부
- 스테이징 영역: 저장소의 .git 폴더의 파일 index
- 깃 저장소: 저장소의 .git 폴더의 여러 정보

- 복사 (ADD): 변경된 파일을 커밋에 포함하기 위해 준비하는 단계
- 저장 (COMMIT): 프로젝트의 변경사항을 저장하고 기록하는 작업

### 깃 상태 보는 git status

깃 저장소의 현재 상태를 확인하려면 git status 명령을 사용
1. git status --long 현재 상태를 표시, 기본값
2. git status -s | --short 현재 상태를 간단히 표시
3. git config --global --edit 도움말 표시

- 파일 처음 생성
  - Untracked 붉은 색 표시는 작업 디렉토리를 의미
- 처음 add한 파일
  - A new file 녹색 표시는 스테이징 영역을 의미
- 다시 수정한 파일
  - Modified file 붉은 색 표시는 작업 디렉토리를 의미
  - 스테이징 영역과 비교해서 작업 디렉토리의 파일이 수정된 것을 의미
- 수정한 파일을 add
  - Modified file
  - 최근 커밋과 비교해서 스테이징 영역의 파일이 수정된 것을 의미

### 파일 생성

리눅스 명령 echo와 수정 라디이렉션 > >> 사용
- Untracked file: 처음 만들어진 파일
  - 추적되지 않는 파일, 깃에 관리되지 않는 파일

### Add와 unstaging 

- $ git rm --cached <file>
  - 인덱스인 Changes to be commited 커밋할 수정 내용에서 삭제(이전 내용으로 수정)
- $ git add .txt

### 커밋 commit

- 버전 관리를 위해 현재 스테에지 영역의 내용에 대해 스냅샷을 찍는 명령
  즉 커밋으로 버전 관리를 위해 인덱스에 추가된 파일들의 현재 상태를 저장
- 커밋에는 버전 관리를 위해 반드시 커밋 메세지의 저장이 필요
$ git commit 커밋 메세지를 입력할 기본 편집기 실행됨
$ git commit -m 'message' 커밋 메세지를 직접 입력
$ git commit -a -m OR -am 추가와 커밋을 함께 실행
- Untracked file: 추가하고 한 이후에 커밋
  - 깃에서 추가와 커밋을 동시에 실행 불가능

### 커밋 성공 후 상태 보기

- 커밋할 것은 없고 작업 트리는 clean 상태
  nothing to commit, working tree clean (3영역이 동일)

## 2. 버전 로그 이력 확인

깃 프로젝트의 역사와 변경 이력 확인 & 검토
=> 프로젝트의 변화와 작업 내용 추척
- 프로젝트의 버전 관리와 협업과정에서 매우 중요
- 프로젝트의 진행상황 추적, 변경사항 검토, 특정 버전 돌아가기

$ git log 로그 이력 정보 표시
$ git log --oneline 로그 이력을 한 줄로 표시
$ git log --patch -p 로그 이력과 함께 파일의 변화(이전 커밋과의 차이)를 표시

### 옵션 --oneline

- 한 줄로 간단히 표시
  - 커밋 아이디는 40개 16진수 중에서 맨 앞 7개만 표시
  - 커밋 아이디 일곱 자리, 마지막 커밋 HEAD -> 브랜치 이름, 커밋 메세지 제목

### 옵션 --patch OR -p

커밋 정보 뿐 아니라 이전 커밋과 현재 파일의 차이가 표시
  - 첫 커밋일 경우 이전 커밋은 파일이 없음을 의미하는 /dev/null로 표시

### $ git show 

- 인자가 없으면 HEAD 가 생략
  - 가장 최근 커밋의 정보와 함께 이전 버전과의 차이 diff가 표시

---

# # 08. 로그 이력과 과거 여행

# 1. 여러 커밋과 로그 이력
## 로그의 옵션

- 명령 git log: 기본적으로 가장 최근의 커밋부터 표시
$ git log --graph 문자 그림으로 로그 이력 그리기
$ git log --reverse 오래된 커밋부터 표시 --graph와 함께 사용 X
S git log -n 최근 n개의 로그 이력 표시

- 초록색 M: 스테이징 영역에서 파일이 수정됨
- 빨간색 M: 작업 디렉토리 영역에서 파일이 수정됨

# 2. 과거로의 시간 여행
## 명령 checkout

- 현재 브랜치에서 과거 커밋 HEAD~로 이동
  - 그 상태에서 당시의 파일의 내용을 확인 가능
$ git checkout HEAD~ HEAD 이전 커밋으로 이동
(현재 상태가 깨끗해야 checkout 가능)
$ git checkout - 이전 checkout으로 이동

## 명령 checkout
|설명|git checkout|git switch|
|---------------------|-------|---------|
| 이전 커밋으로 이동 | $ git checkout[이전 커밋] | $ git switch -d[이전 커밋]|
| 다른 브랜치로 이동 | $ git checkout[branch] | $ git switch[branch] |
|새로운 브랜치를 생성하고 이동 | $ git checkout -b[new branch] | $ git switch -c[new branch] |

---

# # 09. [실습] 커밋과 로그 이력, 과거 여행

## 1. 커밋과 로그이력
### 3번의 커밋 후 다시 현재로의 과거 여행

| 이전 이전 버전 | 이전 버전 | 최신 버전 |
|:---:|:---:|:---:|
|$ git checkout HEAD~2|$ git checkout HEAD~|$ git checkout main|
|X|X|$ git checkout-|

## 2. 과거 이전 버전으로 이동

** $ git checkcout[이전 커밋]**
- 상태가 clean 해야 함
  - 3영역이 동일한 상태
** 현재 상태를 clean한 상태로 하는 방법**
- 임시 저장인 git stash
  - 작업 디렉토리와 스테이징 영역의 저장하고 3영역이 동일한 상태가 되도록
  (동일한 상태가 아닐 경우, $ git checkout HEAD~ => ⚠️error)
  ($ git stash = $ git restore --staged hello.txt
                 $ git restore hello.txt
  위는 다음 2개의 명령으로도 같은 기능을 수행)
** 과거 버전 이동 준비**
- 작업 영역은 깨끗 clean 하게
- 스테이징 영역은 커밋과 같게
**다시 최신 버전으로 돌아오기 $ git checkout main**
**다시 checkout 이전으로 돌아오기 $ git checkout-**

---