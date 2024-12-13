# # 22. 다양한 브랜치 병합

## 1. 브랜치 병합 개요

### 브랜치 병합

- 병합(merge): 두 개의 브랜치를 하나로 모으는 과정
  - fast-forward (빨리 감기), 3-awy (새로운 커밋)

### 빨리 감기 fast-forward 병합의 이해

- fast-forward 병합 조건
  - 현재 브랜치 master가 병합할 대상 커밋의 직접적인 뿌리, 조상이 되는 경우
      - 간단히 두 브랜치가 일렬 상태

### 빨리 감기 fast-forward 병합 수행

- 앞의 브랜치는 단순히 이동, 기준 브랜치가 master이고 bugfix 브랜치로 이동한다 가정했을 때
  => $ git merge bugfix

### 3-way 상태: 두 분기가 갈라진 상태

- 두 브랜치의 조상이 같은 경우, master 브랜치 내의 변경 내용과 bugfix 브랜치 내의 변경 내용을 하나로 통합 필요
- 3-way 병합: 새로운 커밋을 사용하여 두 기록을 합침

### 3-way 병합 수행

- 새로운 커밋 생성, 두 브랜치의 변경을 가져온 'merge commit'(병합커밋) 생성
- 병합 완료 후, 통합 브랜치로 통합된 이력이 생성
- -m이 없으면 메세지 입력할 기본 편집기 실행
- $ git merge bugfix
- $ git merge bugfix -m 'ex)merge msg'

### 일렬 상태에서 기본이 fast forward 병합

- 병합할 브랜치의 조상이 기준 브랜치인 경우, (즉 일렬 상태에서) 병합 기본은 fast forward 병합

### 기본이 fast forward 상태에서 non fast forward 병합

![image](https://github.com/simsoohyeon/2023-OSS_simsoohyeon_study/assets/127268889/7e876c54-9bec-4125-ab54-f7d076584fce)

**마스터에서 dev1을 fast forward로 병합**
- $ git merge dev1

**마스터에서 dev1을 non fast forward로 병합(3-way) 병합**
- 옵션 --no-ff => $ git merge dev1 --no-ff

### 두 브랜치의 일렬 상태에서 2가지 병합

![image](https://github.com/simsoohyeon/2023-OSS_simsoohyeon_study/assets/127268889/ad67e524-7c6c-4acc-a980-1da896100dd2)

- 두 가지 병합 방법 존재, 옵션 없는 경우와 옵션 있는 경우
  - 옵션 없는 경우 fast-forward merge
  $ git merge _'뒤 브랜치 명'_
  - 옵션 --no-ff 있는 경우 3-way merge
  $ git merge --no-ff _'뒤 브랜치 명'_

## 2. 병합의 다양한 옵션

### non fast-forward 병합 옵션을 지정

- non fast-forward 병합: $ git merge --no-ff {병합할 브랜치 명}
- 병합 실행 시에 fast-forward 병합이 가능한 경우라도 3-way 병합 수행
=> **병합된 브랜치가 그대로 남기 때문에 그 브랜치로 실행한 작업 확인 및 브랜치 관리 면에서 더 유용**

### 병합의 다양한 옵션 종류

- $ git merge --ff-only {병합할 브랜치 명}
  - 상태가 fast-forward인 일렬상태에서만 병합 진행, 갈라지면 불가능
- $ git merge --squash {병합할 브랜치 명}
  - 현재 브랜치에 병합 대상과의 합치는 커밋을 하나 생성해 병합
    - 병합되는 브랜치는 사용하지 그대로 남음

### 옵션 --squash

- 강압적인 병합, 사전적 의미 짓뭉개다
- 커밋 이력과 병합되는 브랜치 이력도 남기지 않음
- 새로운 커밋에 상대 브랜치 내용을 모두 합해 새로운 커밋으로 병합 => 직접 메세지와 함께 커밋 해야 함

---

# # 23. [실습] 다양한 브랜치 병합

### >> 기준 브랜치에서 hotfix 브랜치 병합
### - $ git merge hotfix
### >> 무조건 3-way 병합 수행
### - $ git merge --no-f hotfix
### >> fast-forward인 경우에만 병합 진행
###  $ git merge --ff-only hotfix
### >> 현재 브랜치에서 커밋 하나만 생성해서 병합
### $ git merge --squash hotfix

---

# # 24. 병합 충돌과 해결

### >> 3-way 충돌 발생
### - $ git merge hotfix
### >> 충돌한 파일을 인지하고 파일 수정
### - $ code file
### >> 수정 후 다시 add, commit
### - $ git commit -am 'msg'
### >> 충돌 이후 병합 취소
### - $ git merge --abort

---
