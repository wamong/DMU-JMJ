# # 19. 오픈소스 소프트웨어 

## 1. 오픈소스소프트웨어 개요

**OSS: open source software**
누구나 특별한 제한 없이 그 코드를 보고 사용할 수 있는 오픈소스 라이선스를 만족하는 SW
  - 소스코드를 공개, 공개 소스의 복제도 가능
  - 통상 간략하게 오픈소스, oss라 칭함

**Open Source Initiative(OSI)**
- opensource.org
- 공개 소스 정의(OSD)의 관리 및 촉진을 담당하는 비영리 조합
- OSI가 인증하는 공개 소스 소프트웨어 인증마크, 공개소스라는 것을 증명

### 자유 소프트웨어에서 출발한 OSS

- 자유 소프트웨어에서 출발한 OSS
  - 리처드 스톨먼, 자유 소프트웨어 재단 설립
  - GNU 프로젝트와 관련된 소프트웨어에서 자유를 중시
  - 카피레프트 copyleft, copyright와 반대되는 개념
  (제작자에게 저작권은 인정하며 어느 누구나 소프트웨어를 복제해
  사용할 수 있는 권리를 주어야 한다는 개념을 갖는 SW의미)
- 자유 소프트웨어 free software
  - 공개된 무료 유닉스 운영체제 free BSD Berkeley software distribution
  - 일반적으로 소스코드 변경하고 변경한 소프트웨어 공유하려면 원래 프로젝트에 다시 공유해야 함
- 오픈소스소프트웨어: 소스의 형태 자체를 중시하는 의미

### 오픈소스 방식의 의미

- 소스코드를 공개
- 커스터마이징과 혁신 지원
- 단점: 공개의무, 유지보수 보안 등 어려움

### 오픈소스 개발 모델

- 대부분의 웹을 지원하는 서비스 스택 모델: LAMP
  - Linux: 오픈소스 운영체제이자 세계 최대 규모의 오픈소스 프로젝트
  - Apache: 초기 웹에서 핵심 역할을 한 오픈소스 크로스 플랫폼 웹 서버
  - MySQL: 대부분의 데이터베이스 기반 웹 애플리케이션에서 사용하는 오픈소스 관계형 데이터베이스 관리시스템
  - PHP: 소프트웨어 개발에 사용되는 범용 스크립팅 언어 

### 다양한 오픈소스 소프트웨어와 개발 모델

- Python, Scikit-learn, Tensorflow, Pytorch
- 안드로이드 모바일 OS, Mozilla Firefox 웹 브라우저, Office 제품군인 openoffice 및 LibreOffice, Git

## 2. 오픈소스소프트웨어저작권

### 오픈소스 라이선스 저작권

- 오픈소스 SW 개발자가 만들어놓은 저작권의 범위에 따라 해당 소프트웨어를 사용
  => 위반할 경우, 라이선스 위반 및 저작권 침해로 이에 대한 법적 책임이 따름
**소스코드 반환 의무: GPL, AGPL, LGPL, MPL, EPL**
1. GPL GNU-general public license
- 자유소프트웨어재단 FSS에서 만든 라이선스
- 자유 소프트웨어재단 설립자인 리처드 스톨만에 의해 만들어졌음
- 프로그램을 이후 수정하고 배포하는 모든 경우에 무조건 GPL로 공개를 해야 함
2. AGPL GNU-affero GPL
- GPL을 기반으로 만든 라이선스
3. LGPL GNU-lesser GPL
- 보다 완화된 GPL 라이선스
4. Apaceh License
- 소스코드 공개에 대한 의무사항은 라이센스에 포함되어 있지 않음
5. MIT License
- MIT에서 학생들을 지원하기 위해 만든 라이선스
- 가장 느슨한 조건을 가지고 있어서 많은 사람들이 사용하기 용이

### 대표 라이선스 정리

#### 의무 강도에 따른 분류

|카테고리|소스코드 공개 의무|사례|
|---|---|---|
|Strong copy|2차 저작물 소스코드 공개 의무 있음|GPL|
|Weak copyleft|특정 조건에서 2차 저작물 소스코드 공개 의무 없음|LGPL|
|Non copyleft|2차 저작물 소스코드 공개의무 없음|Apache, BSD, MIT|

---

# # 20. 임시저장 stash

## 1. 깃4영역과 임지 저장 개요

### 깃 4영역

작업 디렉토리 working directory
add, restore
스테이징 영역 staging area
commit, restore --staged
깃(지역) 저장소 git local repository
------------------------------------
임시 저장 stash
**깃 영역의 가장 단순한 상태**
Nothing to commit, working tree is clean

### Git stash

- 사전적 의미 stash: 놓다, 남겨두다, 안전한 곳에 숨겨두다
- 커밋할 필요없이 파일의 변경사항을 숨기거나 비밀리에 저장할 수 있는 강력한 도구
- 현재 상태를 어딘가 저장했다가 필요할 때 다시 꺼내오는 기능

### Stash 저장구조

- 깃에서 임시저장소(스택구조)에 저장
  - stack of git stashes
   - 가장 최근의 내용이 가장 위에 저장되는 구조(Last In - First Out, Push(넣는), Pop(꺼내오는)

### Git stash 필요성

- 브랜치 이동 또는 이전 커밋으로 이동하려면
  - $ git switch bname
  - $ git checkout HEAD~ (커밋할 게 없고 작업 트리가 깨끗해야 함)
- 수정한 내용이 있거나 커밋할 게 있는 상황에서 다른 브랜치 이동 또는 이전 커밋으로 이동하려면
  현재 작업 공간의 수정내용을 나중에 다시 사용하기 위해 따로 보관할 필요가 있음
**Stash로 저장되는 내용**
- 작업 디렉토리 내용과 스테이징 영역 내용이 stash 로 저장되고 최신 커밋 자료로 남음

## 2. 임시 저장 명령 stash

### 임시저장 명령 stash

- 작업 폴더와 스테이징 영역을 숨김stash에 저장하고 작업 폴더를 정리
  - $ git stash
  - $ git stash -m '메시지'
  - $ git stash save
  - $ git stash save '메세지'
- --include-untracked, -u: untracked 파일도 포함해 저장

### 임시저장의 최신 저장 내용으로 다시 복원

- 최근 임시 저장 내용을 가져와 반영, stash 목록은 그대로
  - 기본으로 작업 디렉토리 내용만 다시 복사해 활용 $ git stash apply
  - 스테이징 영역도 함께 복사하기 위해서는 옵션 사용 $ git stash apply --index

### 주요 옵션

- 옵션 -k | --keep-index
  - 스테이징 영역은 저장하지 않고 그대로 놔둠, 그러므로 checkout X
- 옵션 -u | --include-untracked
- 옵션 -p | --patch
  - 변경된 모든 사항을 저장하는 것이 아니며 대화형 프롬포트를 통해
  자신이 stash에 저장할 것과 저장하지 않을 것을 지정 가능

### stash 목록 보기

- $ git stash list
  - stash@{0} 0,1,2 => 가장 최신 것이 0번

### 특정 stash 확인

- 해당 stash 항목이 생성되었을 때 커밋자료와 최신 stash 항목 간의 차이로 표시
  - $ git stash show => 가장 최근 stash, 변화된 파일과 변화된 수만 표시
  - $ git stash show -p => -p 파일의 내용의 차이까지 보이기
  - $ git stash show stash@{n} => 지정
  - $ git stash show stash@{n} -p => git diff

### 임시 저장된 stash 반영

- 최근 또는 지정된 임시 저장소 내용을 가져와 반영하고 삭제
  - $ git stash pop
  - $ git stash pop stash@{n}
- 최근 또는 지정된 임시 저장소 내용을 가져와 반영, 작업 디렉토리만 반영, stash 목록은 그대로
  - $ git stash apply
  - $ git stash apply stash@{n}
- 최근 또는 지정된 임시 저장소 내용을 가져와 반영, 작업디렉토리와 스테이징 영역도 반영, stash 목록은 그대로
  - $ git stash apply --index
  - $ git stash apply --indext stash@{n}

### 특정 stash 삭제와 모든 stash 삭제

- 최근 임시 저장 내용르 삭제
  - $ git stash drop
- 지정된 임시 저장 내용을 삭제
  - $ git stash drop stash@{n}
- 모든 stash 목록을 모두 제거
  - $ git stash apply --index

### Untracked 파일 삭제

- $ git clean
=> fatal 바로 삭제 되지 않음, error
- $ git clean -f 무조건 삭제

---

# # 21. [실습] 임시저장 stash

## 1. 임시 저장 기초

### 작업 디렉토리와 스테이징 영역을 숨김 처리 stash에 저장하고 작업 폴더를 정리

  - $ git stash
  - $ git stash -m '메시지'
  - $ git stash save
  - $ git stash save '메세지'

## 2. 임시 저장 관련 다양한 명령

### 최근 또는 지정된 임시 저장소 내용을 가져와 반영하고 삭제

- $ git stash pop
- $ git stash pop stash@{n}

### 최근 또는 지정된 임시 저장소 내용을 가져와 반영, 작업 디렉토리에 반영 stash 목록은 그대로

- $ git stash apply
- $ git stash apply stash@{n}

### 최근 또는 지정된 임시 저장소 내용을 가져와 반영, WD + SA 반영 stash 목록은 그대로

- $ git stash apply --index
- $ git stash apply --index stash@{n}

---