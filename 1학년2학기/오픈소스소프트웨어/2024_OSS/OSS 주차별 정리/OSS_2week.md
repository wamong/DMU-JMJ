# # 04. 깃 설치와 실행

---

## 1. 깃 설치와 편집기 설정
---

Visual Studio code로 설정
- 새 저장소의 기본 브랜치 이름 설정
$ git config --global init.defaultBranch main
- 깃 설치 폴더 확인
C:\Program Files\Git

## 2. 깃 실행
**CLI 인터페이스 : 명령 프롬포트와 같은 인터페이스**

- $ pwd: 현재 작업중인 경로
- $ ls-al: 디렉토리에 있는 파일 목록 + 세부 정보
  (프롬포트 첫 줄: 현재 디렉토리 표시)
- $ git --version: 버전 확인
- $ git config --list: 설정 확인
- $ git --help: 도움

# # 05. 깃 설정과 저장소 생성

---

## 1. 깃 설정 범위와 명령

**설정 범위**
System: 모든 사용자
Global: 현재 사용자의 모든 저장소
Local: 현재 사용자의 현재 저장소

- 사용자 이름
$ git config --global user.name ai7dnn
- 사용자 전자메일
$ git config --global user.email sshyun0604@gmail.com
- 줄바꿈 자동 변환
$ git config --global core.autocrlf true
- 줄바꿈 안전 설정
$ git config --global core.safecrlf false
- 기본 편집기 설정
$ git config --global core.editor 'code --wait'
✓기본 브랜치 이름
$ git config --global init.defaultBranch main

---

## 2. 저장소 생성

- git init: 디렉토리를 git repository로 만들어야 git으로 버전 관리가 가능
- 2가지 방식 $ git init OR $ git init.
For using 현재 디렉토리를 git repository로 만들기
- git init basic: 현재 폴더 하부에 basic을 생성하고 git repository로 만들기 위해서 사용
  (기준 폴더 하부에 basic 저장소 생성)
- cd basic: change directory
(저장소에 들어가면 브랜치가 main으로 자동변경)
- $ ls -al: 모든 접속 기록

- 깃 저장소 하부 .git 폴더
 1) 깃 저장소에는 반드시 .git 폴더가 포함
 2) 여러  폴더와 파일이 저장
 3) 커밋된 모든 파일의 모든 버전 기록이 저장
- 폴더 .git 삭제 -> 깃 저장소로서의 기능 상실

---

# # 06. 비주얼 스튜디오와 리눅스 명령어

---

### 비주얼 스튜디오 코드

- Visual Studio Code: MS사가 개발하는 오픈 소스 에디터 소프트웨어, 가볍지만 강력한 소스 코드 편집기
- java Script, Type Script, Node.js를 기본적으로 지원
- 파일 편집과 버전 관리도 지원

## 2. 깃 실습을 하기 위한 리눅스 명령어 준비
### 폴더 관련 명령

- $ pwd
  - Print Working Directory 
  - 현재 폴더 표시
- $ cd
  - Change Directory
- $ mkdir dname
    - Make Directory
- $ ls
  - File of folder list
  - 다양한 옵션
      - -l: 파일의 상세정보
      - -a: 숨김 파일 표시
      - -al: 위 두 개를 조합

### 파일 관련 명령: 생성

- $ touch fname
  - 빈 파일 fname 생성

### 표준 출력으로 결과 표시 echo

- $ echo git bash
- $ echo 'print()'
  - 이후 문자열을 컴퓨터 터미널에 출력(disply)하는 명령
  - 단순한 문자열은 가능하나 괄호 등이 있는 경우, 작은 또는 큰 따옴표 사용

### 파일 관련 명령: 내용 보이기, 복사, 이름 바꾸기

- $ cat fname
  - 파일 내용 보이기(txt만)
  - ex) cat A B C -> A B C  순서대로
- $ cp a b
  - 파일 a를 b로 복사
- $ mv f1 f2
  - 파일 f1을 f2로 이름 수정

### 파일 및 폴더 삭제

- $ rm fname
  - 파일 fname 삭제
- $ rm -rf dname
  - 하부에 서브폴더와 파일이 있어도 폴더 삭제, 옵션 사용
  - -f: 강제로 파일이나 디렉토리를 삭제
  - -r: 디렉토리 내부의 모든 내용을 삭제

### 현재 위치의 파일 목록 조회

  - ls-l 파일의 상제 정보
  - ls-a 숨김 파일 표시
  - ls-t 파일들을 생성 시간 순으로 표시
  - ls-rt 파일들을 생성 시간 순으로 표시
  - ls-f 파일 표시 시 마지막 유형에 나타나는 파일명을 끝에 표시
    - '/' 디렉터리
    - '*' 실행 파일
    - '@' 링크 등등

### cat (concatenate)

  - 파일의 내용을 화면에 출력
  - cat file1 file1의 내용을 출력
  - cat file1 file 2 file1과 file2의 내용을 출력
  - cat file1 file 2 | more file1과 file2의 내용을 페이지별로 출력
  - cat file1 file 2 | head file1과 file2의 내용을 처음부터 10번째 줄까지만 출력
  - cat file1 file2 | tail file1과 file2의 내용을 끝에서부터 10번째 줄까지만 출력

###  Redirection 명령어 연산 > >> < : 화면의 출력 결과를 파일로 저장  

- > 기호: 기존에 있던 파일을 지우고 저장
- >> 기호: 기존 파일 내용 뒤에 덧붙여서 저장
- < 기호: 파일의 데이터를 명령어 입력

### 전체 폴더를 삭제하거나 하부 폴더 .git 삭제

- $ rm -rf.git
  -f: 강제로 파일이나 디렉토리를 삭제
  -r: 디렉토리 내부의 모든 내용을 삭제

---