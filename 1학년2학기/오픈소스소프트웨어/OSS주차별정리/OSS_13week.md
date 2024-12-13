# # 28. 버전 되돌리기 reset

### 기능 reset 이해

- 커밋 이력에서 이전 특정 커밋으로 완전히 되돌아가는(roll back) 방법
  - 시계를 뒤로 맞추는 '타임머신'과도 같음
  - 이동되는 해당 커밋 이후의 이력은 모두 사라지므로 주의 필요, 새로운 커밋 생성 x
  - 깃 저장소는 이전 커밋 내용으로 수정
  (다만 reset 이전에 있던 작업 폴더와 스테이징 영역을 내용을 어떻게 유지할지가 관건)

### reset 옵션 --hard, --mixed, --soft

|주요 명령|옵션 --mixed는 옵션이 없는 것과 동일|
|---|---|
|$ git reset --hard HEAD~ / $ git reset --hard [commit_ID]|이동되는 커밋의 내용으로 작업 폴더와 스테이지 영역, 깃 저장소를 모두 복사 |
|$ git reset HEAD~ / $ git reset [commit_ID] / $ git reset --mixed HEAD~ / $ git reset --mixed [commit_ID]|이동되는 커밋의 내용으로 스테이지 영역, 깃 저장소를 모두 복사|
|$ git reset --soft HEAD~/ $ git reset --soft [commit_ID] |이동되는 커밋의 내용으로 깃 저장소에만 복사, 스테이징 영역과 작업 폴더는 이전 내용 그대로 남음|

### reset 3가지 방식

**--hard: 인자인 커밋 깃 저장소의 내용을 작업 폴더와 스테이지 영역, 그리고 깃 저장소 모두에 복사, 수정**

**--mixed: 기본 옵션으로 스테이징 영역과 깃 저장소 두 곳에 복사, 수정**

**--soft: 깃 저장소만 복사, 수정하므로 작업 폴더와 스테이지 영역은 이전 내용이 그대로 남음**

---

# # 29. [실습] 버전 되돌리기 reset

### >> HEAD~2의 내용으로 작업 디렉토리와 스테이징 영역, 깃 저장소에 복사
### - $ git reset --hard HEAD~2
### >>  HEAD~2의 내용으로 스테이징 영역과 깃 저장소에 복사
### - $ git reset --mixed HEAD~2
### >> HEAD~2의 내용으로 깃 저장소에 복사
### - $ git reset --soft HEAD~2
### >> 이전에 수행한 reset 바로 취소하는 명령
## - $ git reset --hard ORIG_HEAD

---

# # 30. 커밋 취소 revert

### 커밋 취소 revert

**undo와 비슷한 기능**
- 지정된 특정 커밋을 취소해 바로 이전상태로 되돌리는 방법
- reset과 다르게 커밋할 것이 없고, 작업 영역이 깨끗해야 수행 가능
  => Nothing to commit, working tree clean
  - 커밋해온 모든 변경 사항들을 rollback
  - 이전의 커밋 히스토리는 그대로 유지, 되돌리는 새로운 커밋이 그 이후에 추가

### >> 취소 revert 전체 조건
### - Nothing to commit, working tree clean 
### >> HEAD를 취소해 HEAD~ 상태가 가는 커밋을 생성
### - $ git revert HEAD
### - $ git revert HEAD --no -edit