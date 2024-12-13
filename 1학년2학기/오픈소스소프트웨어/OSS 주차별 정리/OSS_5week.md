# # 13. 버전과 태그 활용

## 1. 버전과 태그 개요

- **버전(version): 프로그램을 수정하거나 개선할 때마다 코드를 구분하려고 부여된 식별자를 의미**
  - 보통 숫자로 사용, year, month 사용
- 보통 두 자리 또는 세 자리 형태로 작성
- Git SW 버전

**SemVer (Semantic Versioning) 방식**
- major minor.patch: 세 자리 형태로 표기하는 버전
  - 메이저 번호
  ▪️ 첫 자리가 0으로 시작하면 아직 초기 개발 중인 제품
  ▪️ 정식 버전은 1부터 시작하는데 이를 메이저 버전
  - 마이너 번호: 메이저 버전에서 기능을 추가하거나 변경 사항
  - 패치 번호: 버그 수정 등 미미한 변화
**태그: 특정 커밋에 버전 번호나 다른 이름을 부여**
**태그 2가지 종류**
  - 주석 태그 annotated tag: 태그 이름 + 정보 포함
  - 일반, 가벼운 태그 lightweight tag: 태그 이름만 포함

## 2. 주석 태그 생성

### 주석 태그: 정보가 있는 태그, 태그 버전 이름 중복 불가능

- $ git tag -a v1.0.0 -m 'first version'
  - 작성한 사람의 이메일, 날짜, 메세지 등 정보 포함
- $ git tag -a v1.0.0
  - 기본 설정된 편집기로 메세지 편집
  - $ git config --global core.editor 'code --wait'
- $ git tag -a v1.1.0 commitID
  - 특정 커밋에 태그 붙임
  - -a가 아니어도 가능
  - $ git tag -a v1.1.0 HEAD~

### 태그의 버전 정보만 관리

  - $ git tag v1.0.1
  - 태그 버전 이름 중복 불가능: -a -m 사용 불가능

### 태그 목록 보기

- $ git tag: 예전 태그부터 표시
- $ git log: 최신 커밋부터 표시
- $ git tag -d v.버전숫자: 태그 삭제

---

# # 14. 브랜치 개요와 관리

## 1. 브랜치 개요

### 깃 브랜치

- 파일 작성 작업을 하다보면 여러 파일을 관리하는 폴더를 통째로 복사해 활용하는 일이 자주 발생
- 버전 관리를 수행하던 일련의 파일 집합을 통째로 복사해 독립적으로 다시 개발을 진행하는 개념
  - 여러 개발자가 타인을 신경쓰지 않고 동시에 다양한 작업을 할 수 있게 만들어주는 기능
  - 브랜치를 통해 하나의 프로젝트를 여러 갈래로 나누어서 관리
- 브랜치 병합 merge: 독립된 브랜치에서 마음대로 소스 코드를 변경하여 작업한 후 원래 버전과 합침

**브랜치 사용 장점**
- 저장소에서 다른 브랜치에는 영향 없이
  - 새로운 기능 개발하거나 버그를 수정
  - 새로운 아이디어를 안전하게 실험 가능
**브랜치 병합: 브랜치와 브랜치를 합치는 수행**


### 기본 브랜치

- 기본 브랜치: 저장소 생성 시 처음 만들어지는 브랜치 main (예전에는 master)
- 기본 브랜치 이름 수정: $ git config --global init.defaultBranch main
- 이미 생성된 저장소의 브랜치 이름 수정: $ git branch -M newBname

### 브랜치와 HEAD

- 브랜치: 커밋 사이를 가볍게 이동할 수 있는 포인터
- HEAD: 작업 중인 브랜치의 최신 커밋을 가리키는 포인터(checkout, switch) 사용
- 결과 표시(HEAD->main): main은 마지막 커밋을 가리키고, HEAD는 현재 작업 중인 브랜치인 mainㅇ 의미
- 처음 커밋: main 브랜치는 생성된 커밋, main 브랜치는 자동으로 마지막 커밋

### 새로운 브랜치 생성

**생성**
- 단순히 생성하고 HEAD가 이동은 이동 안 함 ⚠️
  - $ git branch bname
- 생성하고 새 브랜치로 HEAD 이동도 수행
  - $ git switch -c bname
  - $ git checkout -b bname

### 브랜치 확인

- 명령 git branch로 현재 저장소의 브랜치 목록을 확인
||주요 명령|
|----|----|
|$ git branch|커밋이 발생한 브랜치 목록 보이기|
|$ git branch -v|브랜치마다 마지막 커밋ID와 메세지도 함께 표시|

### 분리된 detached HEAD

- HEAD가 현재 브랜치(마지막 커밋)이 아닌 그 이전 커밋을 가리키는 상태
- $ git checkout HEAD~
  - 현재 브랜치에서 마지막 커밋 이전 커밋으로 이동
- 커밋 이동: tilde, caret, 커밋 ID 사용

## 2. 브랜치 관리

### 최신 커밋 이전에서 두 브랜치 생성

- $ git switch main: HEAD를 main으로 이동
- $ git checkout HEAD~: HEAD를 하나 이전으로 이동
- $ git switch -c hotfix: 브랜치 hotfix를 생성하고 이동
- $ git checkout -b develop: 브랜치 develop를 생성하고 이동

### 최신 커밋 이전에서 두 브랜치 생성

- 명령 branch 에서 옵션 -D OR -d 사용
  - 아직 병합되지 않는 브랜치라면 강제로 삭제하기 위해 옵션 -D를 사용

||주요 명령|
|--|--|
|$ git branch [-d, --delete] [branchName]|지정한 branchName(이미 병합된)을 삭제|
|$ git branch -D [branchName]|지정한 branch(병합되지 않더라도) 강제 삭제|

- 브랜치 목록 보기
  - 브랜치의 병합 여부를 --merged와 --no-merged로 확인 가능
    -현재 작업 브랜치는 일반적으로 --merged 브랜치

||주요 명령|
|----|----|
|$ git branch --merged|현재 작업 브랜치를 기준으로 병합된 브랜치 목록 표시|
|$ git branch --no-merged|현재 작업 브랜치를 기준으로 아직 병합되지 않은 브랜치 목록 표시|
|$ git branch --merged branchName|인자인 branchName 브랜치를 기준으로 병합된 브랜치 목록 표시|
|$ git branch --no-merged branchName|인자인 branchName 브랜치를 기준으로 아직 병합되지 않은 브랜치 목록 표시|

### 브랜치 삭제 수행

- 현재 branch에서 다른 브랜치 삭제

### 브랜치 관려 명령 정리

- $ git checkout bname
  - 전환, 이동
- $ git switch bname
  - 전환, 이동
- $ git checkout -
  - 이전 브랜치로 전환, 이동
- $ git switch -
  - 이전 브랜치로 전환, 이동
- $ git branch -h
  - 도움말 보기

---

# # 15. [실습] 브랜치 개요와 관리

# 📚 Summary 📚

🔺 $ git branch 저장소 목록 보기
🔺 $ git branch <new-branch> 저장소 생성만, 이동은 안 함
🔺 $ git checkout -b <new-branch> 저장소 생성하고 이동도 같이
🔺 $ git switch -c <new-branch> 저장소 생성하고 이동도 같이
🔺 $ git branch -d branch-name 병합저장소 삭제
🔺 $ git branch -D branch-name 병합되지 않아도 강제 삭제

---