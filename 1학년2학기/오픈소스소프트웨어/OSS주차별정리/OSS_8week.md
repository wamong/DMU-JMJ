# # 16. 원격 저장소 복제 Clone

## 1. 지역에서 깃허브 원격 저장소 복제 clone

### 클론 개념

- 원격 저장소: 깃헙, 비트버킷
- 원격 저장소를 지역 저장소에 복제(clone)
  - 공개된 저장소는 소유와 관계없이 누구나 가능

### 원격 저장소 생성과 복제

- 깃허브 원격저장소 생성
  - 저장소 이름 ex) git-clone
  - https 주소 복사
- PC 깃에서 원격저장소 복제(git clone)
  - $ git clone [복사된-주소]: 원격저장소와 동일한 이름으로 복제
  - $ git clone [복사된-주소][새로운-폴더명]: 하부 폴더 [새로운-폴더명] 이름으로 복제
  - $ git clone [복사된-주소].: 현재 폴더에 바로 복제

### 원격 저장소 별칭 이름

- 원격 저장소 별칭 이름 점검
  - $ git remote: 원격 저장소 목록
  => 기본 이름 origin 점검
  => 위에서 clone을 했기 때문에 별칭 origin이 위의 주소가 설정
- $ git remote -v
  - 저장소 주소 등 원격 저장소 정보 목록 표시(세부정보)

### 원격 저장소 별칭 관리

- $ git remote add origin URL: 원격 저장소 별칭 저장
- $ git remote show origin: 자세한 정보
- $ git remote rename origin org: 이름 수정
- $ git remote rm org: 삭제

## 2. 유명 오픈소스소프트웨어 복제

### 유명 OSS

- 편집기 vscode
- 편집기 atom
- VCS 깃
- 구글 인공지능라이브러리

---

# # 17. 지역과 원격 저장소 연동 push pull

## 1. 개인 접근 토근(Personal Access Token) 생성

### 개인 접근 토근 인증 개요

- 개인 프로젝트를 진행하던 중 에러 메세지 발생
- 비밀번호 인증 대신 사용하는 강화된 인증법
- 깃허브 계정마다 토큰 생성 필요

## 2. 깃허브 원격 저장소 수정 후 pull

### 깃 깃허브 push pull

- 깃허브: 올리기-push, 내리기-pull(원격 저장소: local reop, 지역 저장소: remote repo)
- 윈도 push 중 오류: pull 권한: 자유로움 but push 권한: 조건 O ex) 로그인 X

### 인증오류 해결방법

- $ git push -u http://{token}@github.com/{username}/{repo_name}.git
- ex ) $ git push -u http://~~~~~~~~~~~~~~~~~~~~~~~~~@github.com/simsoohyeon/git-clone.git

## 3. 지역에서 원격 저장소로 push

### 명령 push에서 인자 생략하기

- 옵션 -u 사용
  - 최초에 한 번만 저장소명과 브랜치명을 입력하고 그 이후에 모든 인자를 생략 가능
- 대부분의 경우 로컬 저장소와 원격 저장소에서
  동일한 브랜치 이름을 사용하기 때문에 항상 현재 브랜치를 기준으로
  git push 명령어가 작동한다면 매우 편리

---