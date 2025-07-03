

# 💼 500 Git Interview Scenarios: From Basics to Real-World Challenges 


1. **Git Basics**
2. **Branching & Merging**
3. **Rebase, Reset, Revert**
4. **Git Internals**
5. **Remote Repositories & GitHub**
6. **Conflicts & Troubleshooting**
7. **Git Workflows (GitFlow, Trunk-based, etc.)**
8. **CI/CD Integration**
9. **Large-Scale Git Projects (Monorepos, Submodules)**
10. **Interview-Specific Real-Life Scenarios**

---

# 🎁 Understanding Git Stages & Transitions

---

### Git Stages Overview

```
Working Directory   --->  Staging Area (Index)   --->  Git Repository (Committed)
    [edit files]          [git add <file>]           [git commit -m "msg"]
         ^                       |                             |
         |                       |                             |
         |                git reset <file>              git checkout -- <file>
         |                       |                             |
         +-----------------------+-----------------------------+
```

---

### What are the stages?

1. **Working Directory**

   * Files you currently edit.
   * Changes are untracked or modified.

2. **Staging Area (Index)**

   * Files prepared for commit.
   * Snapshot of changes to be included.

3. **Git Repository (Commit History)**

   * Permanent commit snapshots.
   * Version history.

---

### Moving between stages

| Transition                          | Command                   | What happens?                                         |
| ----------------------------------- | ------------------------- | ----------------------------------------------------- |
| Working Directory → Staging Area    | `git add <file>`          | Stages changes to be included in next commit          |
| Staging Area → Repository           | `git commit -m "message"` | Creates a commit with staged changes                  |
| Staging Area → Working Directory    | `git reset <file>`        | Unstages the file, moves it back to working directory |
| Working Directory → Repository      | `git commit -a -m "msg"`  | Stages and commits tracked files in one step          |
| Working Directory → Discard changes | `git checkout -- <file>`  | Reverts file to last committed version                |

---

### Example workflow commands

```bash
# Check current status
git status

# Stage a file
git add file.txt

# Commit staged changes
git commit -m "Add updates to file.txt"

# Unstage a file
git reset file.txt

# Discard local changes (unstaged)
git checkout -- file.txt
```

---

### Why understanding stages matters?

* You control what goes into each commit (clean, meaningful history).
* You can prepare partial changes for commits (`git add -p`).
* It helps avoid accidental commits of unfinished work.

---


### **Git Basics – Questions 1 to 50**

---

#### **1. What is Git and how is it different from other version control systems like SVN?**

**Answer:**
Git is a **distributed version control system** where every developer has a full copy of the repository. SVN is centralized. This means Git enables faster operations, offline commits, and better branching/merging.

---

#### **2. How do you initialize a new Git repository?**

**Answer:**
Use `git init` to create a new Git repository in the current directory.

**Command:**

```bash
git init
```

---

#### **3. How do you check the current status of your Git repository?**

**Answer:**
Use `git status` to view modified files, staged files, and untracked files.

**Command:**

```bash
git status
```

---

#### **4. What is the difference between `git add` and `git commit`?**

**Answer:**

* `git add` stages changes to be committed.
* `git commit` saves those changes to the repository with a message.

---

#### **5. How do you add all files in a directory to staging?**

**Command:**

```bash
git add .
```

---

#### **6. How can you commit with a message?**

**Command:**

```bash
git commit -m "Your commit message"
```

---

#### **7. How do you view the commit history?**

**Command:**

```bash
git log
```

---

#### **8. How do you clone a remote repository?**

**Command:**

```bash
git clone https://github.com/user/repo.git
```

---

#### **9. How do you configure Git with your name and email?**

**Commands:**

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

---

#### **10. How do you view your Git configuration?**

**Command:**

```bash
git config --list
```

---

#### **11. How do you check which branch you are on?**

**Command:**

```bash
git branch
```

---

#### **12. How do you create a new branch?**

**Command:**

```bash
git branch new-branch
```

---

#### **13. How do you switch to another branch?**

**Command:**

```bash
git checkout new-branch
```

---

#### **14. How do you create and switch to a new branch in one command?**

**Command:**

```bash
git checkout -b new-branch
```

---

#### **15. How do you delete a local Git branch?**

**Command:**

```bash
git branch -d branch-name
```

---

#### **16. What is the difference between `git fetch` and `git pull`?**

**Answer:**

* `git fetch` gets remote changes but doesn’t merge.
* `git pull` fetches and merges in one step.

---

#### **17. How do you see the differences between your working directory and the last commit?**

**Command:**

```bash
git diff
```

---

#### **18. How do you unstage a file that you staged with `git add`?**

**Command:**

```bash
git reset HEAD filename
```

---

#### **19. How do you remove a file from the working directory and staging area?**

**Command:**

```bash
git rm filename
```

---

#### **20. What does `.gitignore` do?**

**Answer:**
It tells Git to ignore files/folders you don’t want to track (e.g., `node_modules/`, `.env`).

---

#### **21. How do you view the content of `.gitignore` rules in action?**

**Command:**

```bash
git check-ignore -v filename
```

---

#### **22. How do you rename a file in Git?**

**Command:**

```bash
git mv oldname newname
```

---

#### **23. What’s a commit hash?**

**Answer:**
A unique SHA-1 identifier for each commit used to reference it.

---

#### **24. How do you revert to a previous commit without deleting newer ones?**

**Command:**

```bash
git revert <commit_hash>
```

---

#### **25. How do you permanently go back to an older commit and discard everything after?**

**Command:**

```bash
git reset --hard <commit_hash>
```

---

#### **26. How do you undo your last commit (but keep the changes)?**

**Command:**

```bash
git reset --soft HEAD~1
```

---

#### **27. How do you stage only part of a file?**

**Command:**

```bash
git add -p filename
```

---

#### **28. How do you stash uncommitted changes?**

**Command:**

```bash
git stash
```

---

#### **29. How do you apply the most recent stash?**

**Command:**

```bash
git stash apply
```

---

#### **30. How do you delete all stashes?**

**Command:**

```bash
git stash clear
```

---

#### **31. How do you see remote repositories configured in your project?**

**Command:**

```bash
git remote -v
```

---

#### **32. How do you add a new remote repository?**

**Command:**

```bash
git remote add origin https://github.com/user/repo.git
```

---

#### **33. How do you push your changes to the remote repo?**

**Command:**

```bash
git push origin branch-name
```

---

#### **34. How do you pull changes from the remote?**

**Command:**

```bash
git pull origin branch-name
```

---

#### **35. How do you see which files are staged, modified, or untracked?**

**Command:**

```bash
git status
```

---

#### **36. How do you amend the last commit message?**

**Command:**

```bash
git commit --amend -m "New commit message"
```

---

#### **37. How do you remove a file only from Git (not from disk)?**

**Command:**

```bash
git rm --cached filename
```

---

#### **38. How do you track a new file in Git?**

**Command:**

```bash
git add newfile.txt
```

---

#### **39. What’s the difference between `HEAD`, `HEAD~1`, and `HEAD^`?**

**Answer:**

* `HEAD`: Latest commit
* `HEAD~1`: One commit before HEAD
* `HEAD^`: Also one commit before HEAD (used in merges too)

---

#### **40. What happens when you clone a repo?**

**Answer:**

* Git copies all data (history, branches, files)
* Sets up `origin` as the default remote

---

#### **41. How do you list all branches (local and remote)?**

**Command:**

```bash
git branch -a
```

---

#### **42. How do you clean all untracked files?**

**Command:**

```bash
git clean -fd
```

---

#### **43. How do you configure an alias for a Git command?**

**Command:**

```bash
git config --global alias.co checkout
```

---

#### **44. What’s the difference between a tracked and untracked file?**

**Answer:**

* **Tracked**: Git knows about it
* **Untracked**: New file not added to Git yet

---

#### **45. How do you tag a release in Git?**

**Command:**

```bash
git tag v1.0.0
```

---

#### **46. How do you push tags to remote?**

**Command:**

```bash
git push origin --tags
```

---

#### **47. How do you list all Git tags?**

**Command:**

```bash
git tag
```

---

#### **48. How do you create a bare Git repository (used for remotes)?**

**Command:**

```bash
git init --bare
```

---

#### **49. How do you find out who made a change to a specific line of a file?**

**Command:**

```bash
git blame filename
```

---

#### **50. How do you generate a short summary of commit logs?**

**Command:**

```bash
git log --oneline
```

---



### **Git Branching & Merging – Questions 51 to 100**

---

#### **51. How do you create a new branch and switch to it immediately?**

**Command:**

```bash
git checkout -b feature-branch
```

---

#### **52. What is the difference between a fast-forward and a three-way merge?**

**Answer:**

* **Fast-forward merge**: No diverging changes; just moves the pointer.
* **Three-way merge**: History has diverged; Git creates a new merge commit.

---

#### **53. How do you merge a branch into the current branch?**

**Command:**

```bash
git merge feature-branch
```

---

#### **54. How do you see the merge history graphically?**

**Command:**

```bash
git log --oneline --graph --all
```

---

#### **55. What is a merge conflict and how do you resolve it?**

**Answer:**
A **merge conflict** occurs when changes in two branches affect the same line of a file. Git marks conflict areas; you must manually edit and resolve them.

**Steps:**

1. Edit the file to resolve conflicts
2. Stage it: `git add filename`
3. Commit the merge: `git commit`

---

#### **56. How do you abort a merge in progress?**

**Command:**

```bash
git merge --abort
```

---

#### **57. What is a detached HEAD state and how do you fix it?**

**Answer:**
Detached HEAD means you're not on a branch, just a specific commit.
Fix it by switching back to a branch:

```bash
git checkout main
```

---

#### **58. How do you delete a remote branch?**

**Command:**

```bash
git push origin --delete branch-name
```

---

#### **59. How do you rename a branch locally?**

**Command:**

```bash
git branch -m old-name new-name
```

---

#### **60. How do you rename a remote branch?**

**Steps:**

```bash
# Rename locally
git branch -m old-name new-name

# Delete old remote branch
git push origin --delete old-name

# Push new branch
git push origin new-name

# Reset upstream tracking
git push --set-upstream origin new-name
```

---

#### **61. How do you compare branches to see differences?**

**Command:**

```bash
git diff branch1..branch2
```

---

#### **62. How do you make your local branch track a remote one?**

**Command:**

```bash
git branch --set-upstream-to=origin/branch-name
```

---

#### **63. What is the difference between local and remote branches?**

**Answer:**

* **Local**: Exists on your machine
* **Remote**: Tracked versions of branches on a remote repo (like GitHub)

---

#### **64. How do you list all local branches?**

**Command:**

```bash
git branch
```

---

#### **65. How do you list remote branches?**

**Command:**

```bash
git branch -r
```

---

#### **66. How do you see the latest commits on all branches?**

**Command:**

```bash
git branch -v
```

---

#### **67. How do you track an upstream branch when pushing for the first time?**

**Command:**

```bash
git push -u origin branch-name
```

---

#### **68. What’s the best way to keep your feature branch up-to-date with `main`?**

**Option 1: Merge**

```bash
git checkout feature
git merge main
```

**Option 2: Rebase (cleaner history)**

```bash
git checkout feature
git rebase main
```

---

#### **69. How do you find out which branch contains a commit?**

**Command:**

```bash
git branch --contains <commit-hash>
```

---

#### **70. How do you delete a branch that hasn’t been merged yet?**

**Command:**

```bash
git branch -D branch-name
```

---

#### **71. How do you pull changes from one branch into another without switching branches?**

**Command:**

```bash
git fetch origin
git merge origin/other-branch-name
```

---

#### **72. How do you see which files changed in a branch compared to another?**

**Command:**

```bash
git diff main..feature
```

---

#### **73. How do you squash commits during merge?**

**Command:**

```bash
git merge --squash feature-branch
```

---

#### **74. What’s the purpose of `git cherry-pick`?**

**Answer:**
It lets you apply a specific commit from one branch onto another.

**Command:**

```bash
git cherry-pick <commit-hash>
```

---

#### **75. How do you find and remove a branch that was deleted remotely but still exists locally?**

**Command:**

```bash
git fetch -p
```

---

#### **76. How do you restore a deleted branch (if commit is known)?**

**Command:**

```bash
git checkout -b branch-name <commit-hash>
```

---

#### **77. How do you get back to the last branch you were working on?**

**Command:**

```bash
git checkout -
```

---

#### **78. How do you merge only specific commits from another branch?**

**Answer:**
Use `git cherry-pick` for selective merging.

---

#### **79. What is a tracking branch in Git?**

**Answer:**
A local branch that tracks a remote branch, allowing Git to sync changes.

---

#### **80. What is a fork in Git and how is it different from a branch?**

**Answer:**

* **Fork**: Copy of a repository, typically under a different user/org
* **Branch**: Divergent version of the code **within the same repo**

---

#### **81. How do you undo a merge before committing?**

**Command:**

```bash
git merge --abort
```

---

#### **82. What is the HEAD in Git?**

**Answer:**
A reference to the current branch or commit you are working on.

---

#### **83. How do you merge changes from main to a long-lived feature branch periodically?**

**Command:**

```bash
git checkout feature
git merge main
```

---

#### **84. How do you rebase a feature branch with `main`?**

**Command:**

```bash
git checkout feature
git rebase main
```

---

#### **85. How do you resolve rebase conflicts?**

**Steps:**

1. Fix the file(s)
2. `git add file`
3. Continue rebase: `git rebase --continue`

---

#### **86. What’s the difference between merge and rebase?**

**Answer:**

* **Merge**: Creates a new commit to join branches
* **Rebase**: Rewrites commit history to apply changes on top of another branch

---

#### **87. How do you force push after a rebase?**

**Command:**

```bash
git push --force
```

---

#### **88. How do you stop a rebase in progress?**

**Command:**

```bash
git rebase --abort
```

---

#### **89. What is the `--no-ff` option in `git merge`?**

**Answer:**
Forces Git to create a merge commit even if a fast-forward is possible.

**Command:**

```bash
git merge --no-ff feature-branch
```

---

#### **90. How do you see the list of files that were merged during a merge commit?**

**Command:**

```bash
git show --stat <merge-commit-hash>
```

---

#### **91. How do you rename the current branch you're on?**

**Command:**

```bash
git branch -m new-name
```

---

#### **92. How do you merge a branch but not commit the merge?**

**Command:**

```bash
git merge --no-commit feature-branch
```

---

#### **93. How do you know if a branch has been fully merged?**

**Command:**

```bash
git branch --merged
```

---

#### **94. How do you check which files were changed in a specific branch?**

**Command:**

```bash
git diff --name-only main..feature
```

---

#### **95. How do you view a specific merge commit’s parents?**

**Command:**

```bash
git show <merge-commit-hash>
```

---

#### **96. How do you track progress of a merge conflict resolution?**

**Command:**

```bash
git status
```

---

#### **97. How do you continue after resolving merge conflicts?**

**Command:**

```bash
git add .
git commit
```

---

#### **98. How do you see all unmerged branches?**

**Command:**

```bash
git branch --no-merged
```

---

#### **99. What is a divergent branch and how do you fix it?**

**Answer:**
When both local and remote branches have diverging commits. Use:

```bash
git pull --rebase
# or
git merge
```

---

#### **100. How do you create a patch from a commit and apply it to another branch?**

**Commands:**

```bash
git format-patch -1 <commit>
git apply <patch-file>
```

---

### **Git Rebase, Reset, Revert – Questions 101 to 150**

---

#### **101. What does `git rebase` do?**

**Answer:**
It **moves or reapplies commits** from one branch onto another base, rewriting history.

---

#### **102. How do you rebase a feature branch onto main?**

**Command:**

```bash
git checkout feature
git rebase main
```

---

#### **103. What’s the difference between `git merge` and `git rebase`?**

**Answer:**

* `merge`: Preserves history with a merge commit
* `rebase`: Rewrites history for a linear timeline (cleaner logs)

---

#### **104. How do you squash commits using interactive rebase?**

**Command:**

```bash
git rebase -i HEAD~n
```

In the editor, change all but the first commit to `squash` or `s`.

---

#### **105. How do you cancel an interactive rebase?**

**Command:**

```bash
git rebase --abort
```

---

#### **106. How do you skip a commit during a rebase?**

**Command:**

```bash
git rebase --skip
```

---

#### **107. How do you edit an old commit message during rebase?**

**Steps:**

```bash
git rebase -i HEAD~n
# change `pick` to `reword`
```

---

#### **108. What is `git reset` used for?**

**Answer:**
It **moves HEAD and optionally updates the index and working directory**, allowing you to undo commits.

---

#### **109. What’s the difference between `--soft`, `--mixed`, and `--hard` in `git reset`?**

| Option    | Effect                       |
| --------- | ---------------------------- |
| `--soft`  | Keeps index and working dir  |
| `--mixed` | Resets index only (default)  |
| `--hard`  | Resets index and working dir |

---

#### **110. How do you undo the last commit but keep the changes?**

**Command:**

```bash
git reset --soft HEAD~1
```

---

#### **111. How do you undo the last commit and unstage the files?**

**Command:**

```bash
git reset --mixed HEAD~1
```

---

#### **112. How do you undo the last commit and delete changes permanently?**

**Command:**

```bash
git reset --hard HEAD~1
```

---

#### **113. How do you revert a single commit without modifying history?**

**Command:**

```bash
git revert <commit-hash>
```

---

#### **114. When should you use `git revert` instead of `reset`?**

**Answer:**
Use **`revert`** when you’ve already pushed commits and want to undo them **without rewriting history**.

---

#### **115. How do you revert multiple commits?**

**Command:**

```bash
git revert <oldest-commit>^..<newest-commit>
```

---

#### **116. How do you view the reflog (recent changes to HEAD)?**

**Command:**

```bash
git reflog
```

---

#### **117. How do you recover a deleted commit using reflog?**

**Command:**

```bash
git checkout <commit-from-reflog>
```

---

#### **118. What happens to your working directory when you use `git reset --hard`?**

**Answer:**
It **discards all local changes**, including staged and unstaged ones. Irreversible if not backed up.

---

#### **119. How do you reset only a specific file to a previous commit?**

**Command:**

```bash
git checkout <commit-hash> -- path/to/file
```

---

#### **120. How do you remove a file from staging but keep the changes?**

**Command:**

```bash
git reset filename
```

---

#### **121. What’s the difference between `HEAD`, `ORIG_HEAD`, and `FETCH_HEAD`?**

* `HEAD`: Current commit
* `ORIG_HEAD`: Previous HEAD (before last dangerous op)
* `FETCH_HEAD`: Tip of last fetched branch

---

#### **122. How do you revert a merge commit?**

**Command:**

```bash
git revert -m 1 <merge-commit>
```

Use `-m` to specify the parent to keep.

---

#### **123. Can you rebase a public branch?**

**Answer:**
Technically yes, **but it’s discouraged** because it rewrites history others may depend on.

---

#### **124. How do you cancel a `git reset` after doing it?**

**Answer:**
Use `git reflog` to find the previous HEAD and restore it:

```bash
git reset --hard <old-head>
```

---

#### **125. What is an orphan branch and how do you create one?**

**Command:**

```bash
git checkout --orphan new-branch
```

This branch starts with **no history**.

---

#### **126. How do you squash all commits into one in a branch?**

**Command:**

```bash
git reset --soft $(git merge-base main HEAD)
git commit -m "Squashed commit"
```

---

#### **127. How do you reapply a stash after a rebase?**

**Command:**

```bash
git stash pop
```

---

#### **128. What does `git cherry` do?**

**Answer:**
Shows which commits from one branch are not in another.

**Command:**

```bash
git cherry main feature
```

---

#### **129. What is the difference between `git reset HEAD` and `git restore --staged`?**

**Answer:**
Both unstage changes, but `restore` is newer and more specific to files. `reset` is older and broader.

---

#### **130. What happens if you rebase onto the same branch?**

**Answer:**
Nothing changes unless commits diverged. It’s usually a no-op.

---

#### **131. How do you undo a `git revert`?**

**Answer:**
You must **revert the revert** using the revert commit hash.

---

#### **132. How do you drop a commit in interactive rebase?**

**Steps:**

```bash
git rebase -i HEAD~n
# Change `pick` to `drop`
```

---

#### **133. How do you split a commit into two?**

**Steps:**

1. `git rebase -i HEAD~n` → mark commit as `edit`
2. `git reset HEAD^` to unstage
3. Stage and commit in parts

---

#### **134. How do you preserve merge commits during a rebase?**

**Command:**

```bash
git rebase --preserve-merges
```

---

#### **135. How do you apply changes from one commit without metadata?**

**Command:**

```bash
git show <commit> | git apply -
```

---

#### **136. How do you preview changes from a rebase before applying them?**

**Command:**

```bash
git rebase --interactive --exec "git diff"
```

---

#### **137. How do you rebase only specific commits (not the whole branch)?**

**Answer:**
Use `rebase -i` and `drop` or `pick` selectively.

---

#### **138. What is the role of `GIT_EDITOR` in interactive rebase?**

**Answer:**
Defines which editor Git uses to open the rebase todo list (default: Vim).

---

#### **139. How do you avoid rebase conflicts for frequently changing files?**

**Answer:**

* Rebase often
* Use `.gitattributes` with merge strategies like `ours`, `theirs`

---

#### **140. How do you create a backup before a risky reset or rebase?**

**Command:**

```bash
git branch backup-branch
```

---

#### **141. How do you forcefully reset a branch to remote?**

**Command:**

```bash
git reset --hard origin/branch-name
```

---

#### **142. What is the difference between `reset` and `checkout` for files?**

* `reset`: unstages files
* `checkout`: restores files from a commit or branch

---

#### **143. How do you remove staged changes but leave working dir untouched?**

**Command:**

```bash
git reset
```

---

#### **144. How do you reset a file to match the latest commit?**

**Command:**

```bash
git checkout HEAD -- filename
```

---

#### **145. How do you commit part of a file?**

**Command:**

```bash
git add -p filename
```

---

#### **146. How do you ignore whitespace when rebasing?**

**Command:**

```bash
git rebase --ignore-whitespace
```

---

#### **147. How do you cancel a cherry-pick in progress?**

**Command:**

```bash
git cherry-pick --abort
```

---

#### **148. How do you stop mid-rebase and resume later?**

**Command:**

```bash
git rebase --quit  # to end
git rebase --continue  # to resume
```

---

#### **149. How do you reapply a commit that was reset?**

**Answer:**
Use `git reflog` to find the commit, then:

```bash
git cherry-pick <commit>
```

---

#### **150. How do you fix accidental rebase before push?**

**Answer:**

* If not pushed: reset or fix manually
* If pushed: coordinate with team, or use `revert`

---

### **Git Internals – Questions 151 to 200**

---

#### **151. What is the `.git` directory?**

**Answer:**
It’s the **internal database** of your repository, containing all objects, refs, configuration, and history. Deleting it = deleting your Git repo.

---

#### **152. What are Git objects?**

**Answer:**
Git uses four object types:

* **Blob**: File data
* **Tree**: Directory structure
* **Commit**: Snapshot with metadata
* **Tag**: Reference to commits

---

#### **153. What is a Git blob?**

**Answer:**
A **blob** (binary large object) stores the contents of a file — but not its name or metadata.

---

#### **154. What does a tree object represent in Git?**

**Answer:**
A **tree** maps filenames to blobs (files) and other trees (directories), forming the full project structure.

---

#### **155. What does a commit object contain?**

**Answer:**

* SHA-1 hash
* Author/committer
* Message
* Tree object pointer
* Parent commit(s)

---

#### **156. What command shows the internal Git object structure?**

**Command:**

```bash
git cat-file -p <object_hash>
```

---

#### **157. How does Git store data differently than SVN or Mercurial?**

**Answer:**
Git stores **snapshots** (entire file versions), not diffs. It's optimized for immutability and fast lookups using content hashing.

---

#### **158. What is a SHA-1 in Git?**

**Answer:**
It’s a **40-character checksum** that uniquely identifies commits, blobs, trees, and tags.

---

#### **159. How can you find the hash of a file in Git?**

**Command:**

```bash
git hash-object filename
```

---

#### **160. What is the Git index (staging area)?**

**Answer:**
A middle layer where you stage changes before committing. It tracks what will go into your next commit.

---

#### **161. How can you inspect the Git index?**

**Command:**

```bash
git ls-files --stage
```

---

#### **162. What is the role of HEAD in Git?**

**Answer:**
`HEAD` points to the **current commit** or branch ref you have checked out.

---

#### **163. How do refs work in Git?**

**Answer:**
Refs are pointers to commits: branches (`refs/heads`), remotes (`refs/remotes`), tags (`refs/tags`).

---

#### **164. What’s the difference between a reference and an object in Git?**

**Answer:**

* **Reference (ref)**: Points to a commit
* **Object**: Actual stored data (commit, blob, etc.)

---

#### **165. How does Git detect file changes?**

**Answer:**
By comparing **SHA-1 hashes**, **timestamps**, and **file size** — not just content diffs.

---

#### **166. What is a packfile in Git?**

**Answer:**
A compressed binary file that contains many Git objects to save space and speed up operations.

---

#### **167. How do you see what's inside a packfile?**

**Command:**

```bash
git verify-pack -v .git/objects/pack/*.idx
```

---

#### **168. What is `git gc` and when should you use it?**

**Answer:**
Runs **garbage collection**: compresses files, cleans unused objects.

**Command:**

```bash
git gc
```

---

#### **169. What are loose objects in Git?**

**Answer:**
Individual object files stored under `.git/objects/` as separate files.

---

#### **170. What triggers object compression into packfiles?**

**Answer:**

* Running `git gc`
* Pushing/pulling large histories
* Hitting object count thresholds

---

#### **171. What is a reflog in Git and where is it stored?**

**Answer:**
Git **reflog** records changes to HEAD and branches. Stored in `.git/logs/`.

---

#### **172. How long does Git keep reflog entries?**

**Answer:**
Default: **90 days** for unreachable commits.

---

#### **173. What is the difference between `HEAD` and `HEAD^`?**

**Answer:**

* `HEAD`: Current commit
* `HEAD^`: Parent of current commit (for merges: first parent)

---

#### **174. How many parents can a commit have?**

**Answer:**
Typically 1, but a **merge commit** can have **2 or more**.

---

#### **175. How do you find the parent commits of a merge?**

**Command:**

```bash
git show --pretty=raw <merge-commit>
```

---

#### **176. What is the difference between `git show` and `git log`?**

* `git show`: Details of a specific commit (diffs, metadata)
* `git log`: History of commits

---

#### **177. How do tags differ from branches internally?**

**Answer:**

* **Branch**: Movable pointer to latest commit
* **Tag**: Fixed pointer (ref) to a specific commit

---

#### **178. What is an annotated vs lightweight tag?**

**Answer:**

* **Annotated**: Has metadata, stored as an object
* **Lightweight**: Just a name pointing to a commit

---

#### **179. How do you create an annotated tag?**

**Command:**

```bash
git tag -a v1.0 -m "Release v1.0"
```

---

#### **180. How does Git use delta encoding in storage?**

**Answer:**
Git uses **deltas** in packfiles to store differences between similar objects.

---

#### **181. What is the Git object model and how does it enable speed?**

**Answer:**
It’s based on content-addressable storage and DAG (Directed Acyclic Graph), enabling:

* Quick diffing
* Instant snapshots
* Immutable history

---

#### **182. How do you inspect Git’s object database?**

**Command:**

```bash
git rev-list --objects HEAD
```

---

#### **183. What are dangling commits?**

**Answer:**
Commits that are not reachable from any branch or tag, but exist in `.git` until GC.

---

#### **184. How do you manually remove unreachable objects?**

**Command:**

```bash
git prune
```

---

#### **185. How do you see how a file evolved over time?**

**Command:**

```bash
git log -p filename
```

---

#### **186. How do you visualize Git’s commit DAG structure?**

**Command:**

```bash
git log --graph --oneline
```

---

#### **187. What is a shallow clone?**

**Answer:**
A clone with limited history to reduce size.

**Command:**

```bash
git clone --depth=1 <repo>
```

---

#### **188. What’s the `.git/info/exclude` file?**

**Answer:**
A local-only `.gitignore` for untracked files not intended for version control.

---

#### **189. What is a commit tree in Git?**

**Answer:**
A **hierarchical directory structure** (trees/blobs) referenced by each commit.

---

#### **190. What is a Git hook and where is it stored?**

**Answer:**
Hooks are **custom scripts** triggered during Git actions, stored in `.git/hooks/`.

---

#### **191. How do you write a pre-commit hook?**

**Steps:**

1. Create `.git/hooks/pre-commit`
2. Add executable shell script
3. Make it executable: `chmod +x pre-commit`

---

#### **192. What is a symbolic ref?**

**Answer:**
A ref that points to another ref. `HEAD` is typically a symbolic ref to `refs/heads/main`.

---

#### **193. What is the default branch in Git and how do you change it?**

**Command:**

```bash
git symbolic-ref HEAD refs/heads/new-default
```

---

#### **194. How does Git’s staging area improve performance?**

**Answer:**
It avoids writing full objects until commit, allowing partial commits and fast diffs.

---

#### **195. How do you detect corruption in Git?**

**Command:**

```bash
git fsck
```

---

#### **196. What happens during `git commit` internally?**

**Steps:**

1. Create tree object
2. Write commit object (with parent)
3. Update branch ref to new commit

---

#### **197. How do you debug Git plumbing operations?**

**Answer:**
Use low-level commands like:

```bash
git rev-parse, git cat-file, git hash-object
```

---

#### **198. What does `git update-ref` do?**

**Answer:**
Manually sets a ref (branch, tag) to a given commit.

---

#### **199. What is a Git pseudoref?**

**Answer:**
Temporary refs like `MERGE_HEAD`, `ORIG_HEAD` used during rebases, merges, etc.

---

#### **200. Can Git be used without a working directory?**

**Answer:**
Yes — in **bare repositories**, Git has no working tree, used for remotes (e.g. server-side repos).

---


### **Remote Repositories & GitHub – Questions 201 to 250**

---

#### **201. How do you add a remote repository to your local Git repo?**

**Command:**

```bash
git remote add origin https://github.com/user/repo.git
```

---

#### **202. How do you see all remotes and their URLs?**

**Command:**

```bash
git remote -v
```

---

#### **203. How do you rename a Git remote?**

**Command:**

```bash
git remote rename oldname newname
```

---

#### **204. How do you remove a Git remote?**

**Command:**

```bash
git remote remove origin
```

---

#### **205. What does `git push origin main` do?**

**Answer:**
Pushes your **local main branch** to the **remote named `origin`**.

---

#### **206. What is `origin` in Git?**

**Answer:**
The **default name for the remote** when you clone or add a repo.

---

#### **207. How do you fetch changes from a remote without merging?**

**Command:**

```bash
git fetch origin
```

---

#### **208. What’s the difference between `git fetch` and `git pull`?**

| Command     | Description                                  |
| ----------- | -------------------------------------------- |
| `git fetch` | Downloads changes (does not merge)           |
| `git pull`  | Fetches + merges changes into current branch |

---

#### **209. How do you force-push a local branch to remote?**

**Command:**

```bash
git push --force origin my-branch
```

---

#### **210. How do you see remote-tracking branches?**

**Command:**

```bash
git branch -r
```

---

#### **211. What is a remote-tracking branch in Git?**

**Answer:**
A reference to the **last known state** of a branch in a remote repo (e.g., `origin/main`).

---

#### **212. How do you delete a branch on the remote repository?**

**Command:**

```bash
git push origin --delete feature-branch
```

---

#### **213. How do you clone a repository?**

**Command:**

```bash
git clone https://github.com/user/repo.git
```

---

#### **214. How do you clone a repo with a different directory name?**

**Command:**

```bash
git clone https://github.com/user/repo.git my-folder
```

---

#### **215. What is the `upstream` remote in a forked repo?**

**Answer:**
Refers to the **original repo** that your fork was created from.

---

#### **216. How do you add an upstream remote to your forked repo?**

**Command:**

```bash
git remote add upstream https://github.com/original-owner/repo.git
```

---

#### **217. How do you sync your fork with the upstream repo?**

**Commands:**

```bash
git fetch upstream
git checkout main
git merge upstream/main
```

---

#### **218. What is `git remote show origin` used for?**

**Answer:**
Displays detailed info about a remote: fetch/push URLs, branches tracked, etc.

---

#### **219. How do you see which branch tracks which remote?**

**Command:**

```bash
git branch -vv
```

---

#### **220. How do you change the remote URL?**

**Command:**

```bash
git remote set-url origin https://new.url.git
```

---

#### **221. What is a mirror clone in Git?**

**Command:**

```bash
git clone --mirror https://github.com/user/repo.git
```

**Answer:**
Clones **all refs and remote data**, including branches and tags.

---

#### **222. How do you push all branches to remote at once?**

**Command:**

```bash
git push --all
```

---

#### **223. How do you push all tags to remote?**

**Command:**

```bash
git push --tags
```

---

#### **224. What is a bare Git repository?**

**Answer:**
A repo without a working directory — used for servers/remotes only.

---

#### **225. How do you create a bare repo?**

**Command:**

```bash
git init --bare
```

---

#### **226. How does `git pull --rebase` differ from a regular pull?**

**Answer:**
Instead of a merge commit, it **rebases your changes** on top of the fetched ones — for cleaner history.

---

#### **227. What happens if you clone a private GitHub repo without authentication?**

**Answer:**
You’ll get a **permission denied** error. Authentication (SSH or PAT) is required.

---

#### **228. How do you set up SSH for GitHub?**

**Steps:**

```bash
# Generate key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Add to SSH agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Add the public key to GitHub
```

---

#### **229. How do you use a GitHub Personal Access Token (PAT) for HTTPS push?**

**Answer:**
Use your **username** and the **PAT as your password** when prompted.

---

#### **230. How do you fork a GitHub repo and contribute changes?**

**Steps:**

1. Fork the repo
2. Clone your fork
3. Create a branch
4. Make changes
5. Push and open a Pull Request

---

#### **231. How do you list all branches on a remote repo?**

**Command:**

```bash
git ls-remote --heads origin
```

---

#### **232. What is `origin/HEAD -> origin/main` used for?**

**Answer:**
A **symbolic reference** showing the default branch of the remote (`main` in this case).

---

#### **233. How do you fetch just one branch from remote?**

**Command:**

```bash
git fetch origin branch-name
```

---

#### **234. What is the difference between `fetch` and `clone`?**

| Action | Description                                     |
| ------ | ----------------------------------------------- |
| Clone  | Downloads **entire repo and history**           |
| Fetch  | Gets **latest changes only** for existing clone |

---

#### **235. What does `git push -u origin branch` do?**

**Answer:**
Pushes the branch and **sets upstream tracking**, so future pushes can be just `git push`.

---

#### **236. How do you remove an upstream branch from tracking locally?**

**Command:**

```bash
git branch --unset-upstream
```

---

#### **237. How do you track a specific remote branch?**

**Command:**

```bash
git checkout --track origin/branch-name
```

---

#### **238. What happens when you pull changes from a deleted remote branch?**

**Answer:**
You’ll get an error. You may also see it as stale. Use `git remote prune origin` to clean up.

---

#### **239. How do you prevent pushing to main accidentally?**

**Answer:**
Set it as **protected branch** in GitHub/GitLab, or locally:

```bash
git config branch.main.pushRemote no_push
```

---

#### **240. How do you create a GitHub pull request from command line?**

**Tool:** GitHub CLI

```bash
gh pr create --base main --head feature --title "My PR" --body "Details"
```

---

#### **241. How do you check if your branch is ahead or behind remote?**

**Command:**

```bash
git status
```

Or:

```bash
git fetch
git log --oneline origin/main..HEAD
```

---

#### **242. What is a GitHub Action and how is it triggered?**

**Answer:**
A **CI/CD workflow** defined in `.github/workflows/`, triggered by events (push, PR, schedule, etc.)

---

#### **243. How do you avoid pushing secrets to GitHub?**

**Best Practices:**

* Use `.gitignore`
* Set up `pre-push` hooks
* Use tools like [`git-secrets`](https://github.com/awslabs/git-secrets)

---

#### **244. How do you make a GitHub repo private?**

**Steps:**
Go to **Settings → Danger Zone → Change visibility**

---

#### **245. What is a GitHub deploy key?**

**Answer:**
An SSH key attached to a single repo with read/write access — used for deployments or CI/CD.

---

#### **246. What is the `.gitmodules` file for?**

**Answer:**
Used when a repo has **submodules** — it lists their URLs and paths.

---

#### **247. How do you push to multiple remotes?**

**Steps:**

```bash
git remote add upstream2 <url>
git push origin
git push upstream2
```

---

#### **248. How do you clone a repo with all submodules?**

**Command:**

```bash
git clone --recurse-submodules <url>
```

---

#### **249. How do you sync a submodule to latest commit?**

**Command:**

```bash
git submodule update --remote
```

---

#### **250. How do you remove a submodule cleanly?**

**Steps:**

```bash
git submodule deinit -f path/to/submodule
git rm -f path/to/submodule
rm -rf .git/modules/path/to/submodule
```

---


### **Git Conflicts & Troubleshooting – Questions 251 to 300**

---

#### **251. What is a merge conflict in Git?**

**Answer:**
A conflict occurs when **two branches change the same lines in a file differently**, and Git can't auto-resolve it.

---

#### **252. How do you identify a merge conflict?**

**Answer:**
Git will stop the merge and show:

```
CONFLICT (content): Merge conflict in file.txt
```

The conflicting file will have conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`).

---

#### **253. How do you resolve a merge conflict?**

**Steps:**

1. Open the conflicted file
2. Manually choose/fix content
3. Stage the file:

```bash
git add file.txt
```

4. Continue the merge:

```bash
git commit
```

---

#### **254. What does `<<<<<<<`, `=======`, `>>>>>>>` mean in a file?**

**Answer:**
These are **conflict markers**:

* `<<<<<<< HEAD`: Your branch
* `=======`: Separation
* `>>>>>>> other-branch`: Incoming changes

---

#### **255. How do you abort a merge?**

**Command:**

```bash
git merge --abort
```

---

#### **256. How do you resolve a rebase conflict?**

**Command:**

```bash
# Fix file
git add file.txt
git rebase --continue
```

---

#### **257. How do you abort a rebase?**

**Command:**

```bash
git rebase --abort
```

---

#### **258. What’s the difference between `merge --abort` and `reset --hard`?**

| Command         | Effect                                        |
| --------------- | --------------------------------------------- |
| `merge --abort` | Cleanly stops ongoing merge                   |
| `reset --hard`  | Resets entire repo state to a specific commit |

---

#### **259. How do you recover from accidental `git reset --hard`?**

**Answer:**
Use `git reflog` to find the lost commit:

```bash
git reflog
git reset --hard <old-commit>
```

---

#### **260. What is the most common reason for “fatal: refusing to merge unrelated histories”?**

**Answer:**
It happens when Git detects **no common ancestor**, often in newly initialized repos or force-pushed ones.

**Fix:**

```bash
git pull origin main --allow-unrelated-histories
```

---

#### **261. What does “You are in 'detached HEAD' state” mean?**

**Answer:**
You’ve checked out a commit or tag — **not a branch** — so any new commits won't belong to a branch unless you explicitly create one.

---

#### **262. How do you fix a detached HEAD?**

**Command:**

```bash
git switch -c new-branch
```

---

#### **263. How do you find which commit introduced a bug?**

**Command:**

```bash
git bisect start
```

---

#### **264. What is `git bisect`?**

**Answer:**
A **binary search tool** that helps identify which commit introduced a bug.

---

#### **265. How do you undo a bad commit that’s already pushed?**

**Answer:**
Use:

```bash
git revert <bad-commit>
```

Then push.

---

#### **266. What causes “Your branch is ahead of origin by N commits”?**

**Answer:**
You’ve made local commits not yet pushed to remote.

---

#### **267. How do you fix “fatal: not a git repository”?**

**Answer:**
Initialize the repo:

```bash
git init
```

Or check that you’re in the right directory.

---

#### **268. What’s the solution to “error: failed to push some refs”?**

**Common Fixes:**

* Pull first: `git pull --rebase`
* Or force push: `git push --force`

---

#### **269. How do you fix “Permission denied (publickey)” error when pushing?**

**Fix:**

* Add your SSH key to GitHub
* Use the correct repo URL (SSH, not HTTPS)

---

#### **270. How do you fix merge conflicts in binary files?**

**Answer:**
Git cannot auto-merge binary files. You must:

* Choose one version
* Replace the file manually
* Add and commit

---

#### **271. How do you resolve file permission conflicts (e.g., chmod)?**

**Answer:**
Use this to ignore file mode changes:

```bash
git config core.fileMode false
```

---

#### **272. How do you deal with ignored files showing up in `git status`?**

**Fix:**
Make sure the file isn’t staged. Remove from index:

```bash
git rm --cached filename
```

---

#### **273. How do you ignore merge conflicts in a specific file?**

**Answer:**
Use `.gitattributes`:

```
filename merge=ours
```

---

#### **274. What is the difference between `ours` and `theirs` in merge conflicts?**

* `ours`: Keeps **your changes**
* `theirs`: Uses **incoming branch** changes

---

#### **275. How do you resolve “fatal: cannot do a partial commit during a merge”?**

**Fix:**
You must either:

* Resolve and commit all merged files
* Use `git commit -a` to commit all

---

#### **276. How do you clean untracked files?**

**Command:**

```bash
git clean -f
```

---

#### **277. How do you clean untracked directories?**

**Command:**

```bash
git clean -fd
```

---

#### **278. How do you undo a staged file without losing changes?**

**Command:**

```bash
git reset filename
```

---

#### **279. How do you fix “overwritten local changes” after `git pull`?**

**Answer:**
Use `git stash` before pulling:

```bash
git stash
git pull
git stash pop
```

---

#### **280. What is `git fsck` used for?**

**Answer:**
Checks for **repository corruption or dangling objects**.

---

#### **281. How do you fix a corrupted `.git/index` file?**

**Fix:**

```bash
rm .git/index
git reset
```

---

#### **282. What causes “error: Your local changes to the following files would be overwritten”?**

**Answer:**
You have **unsaved local changes** that conflict with incoming changes from pull/checkout.

---

#### **283. How to discard all local changes (dangerous)?**

```bash
git reset --hard
git clean -fd
```

---

#### **284. How do you check if your repo has conflicts before merging?**

**Command:**

```bash
git merge --no-commit --no-ff other-branch
```

Then inspect and abort if needed.

---

#### **285. How to handle a stuck rebase/merge loop?**

**Answer:**

* Use `git status` to check next steps
* Use `git rebase --abort` or `git merge --abort`

---

#### **286. What’s the best way to prevent future merge conflicts?**

**Tips:**

* Pull often
* Rebase before push
* Keep PRs small

---

#### **287. What does `git rerere` do?**

**Answer:**
**Reuse Recorded Resolution** — Git remembers how you resolved conflicts and reuses that resolution.

---

#### **288. How to enable `git rerere`?**

```bash
git config --global rerere.enabled true
```

---

#### **289. How do you recover lost files after `git stash drop`?**

**Answer:**
Check:

```bash
git fsck --lost-found
```

---

#### **290. How do you find what changed in a file over time?**

**Command:**

```bash
git log -p file.txt
```

---

#### **291. How do you blame a line of code?**

**Command:**

```bash
git blame file.txt
```

---

#### **292. How do you check who merged a pull request in GitHub?**

**Answer:**
Check the **PR conversation tab** or the merge commit in Git log:

```bash
git log --merges
```

---

#### **293. How do you fix “fatal: Authentication failed”?**

**Fix Options:**

* Use PAT instead of password
* Set up SSH keys
* Use correct Git remote URL

---

#### **294. What is the safest way to fix conflicts on a CI/CD pipeline?**

**Answer:**

* Avoid force pushes
* Always rebase on the latest `main`
* Automate conflict detection in CI pipeline

---

#### **295. How do you skip a bad commit during cherry-pick?**

**Command:**

```bash
git cherry-pick --skip
```

---

#### **296. How do you continue after resolving conflicts during cherry-pick?**

**Command:**

```bash
git cherry-pick --continue
```

---

#### **297. What causes “fatal: ref HEAD is not a symbolic ref”?**

**Answer:**
Usually seen in **bare repositories** or broken HEAD files.

---

#### **298. How do you resolve “refusing to merge unrelated histories” in CI/CD clones?**

**Command:**

```bash
git pull origin main --allow-unrelated-histories
```

---

#### **299. What is `git fsmonitor` and how does it help?**

**Answer:**
A feature that improves performance by reducing file scan time.

---

#### **300. How do you recover a deleted branch?**

**Command:**

```bash
git reflog
git checkout -b mybranch <commit>
```

---

### **Git Workflows – Questions 301 to 350**

---

#### **301. What is GitFlow?**

**Answer:**
A branching model that uses **main**, **develop**, **feature**, **release**, and **hotfix** branches for organized release cycles.

---

#### **302. What are the main branches in GitFlow?**

* `main` (production-ready code)
* `develop` (integration branch for features)

---

#### **303. What is a feature branch?**

**Answer:**
A short-lived branch created off `develop` to develop a new feature independently.

---

#### **304. How do you create a feature branch in GitFlow?**

**Command:**

```bash
git checkout develop
git checkout -b feature/my-feature
```

---

#### **305. How does a release branch work in GitFlow?**

**Answer:**
It prepares the release by allowing last-minute fixes, then merges into `main` and `develop`.

---

#### **306. What is a hotfix branch in GitFlow?**

**Answer:**
A branch off `main` to quickly patch production bugs.

---

#### **307. How does GitFlow handle merging?**

**Answer:**
Feature branches merge into `develop`, release and hotfix branches merge into both `main` and `develop`.

---

#### **308. What is trunk-based development?**

**Answer:**
A workflow where developers commit directly to a single main branch frequently to avoid long-lived branches.

---

#### **309. What are feature toggles?**

**Answer:**
Code flags to enable/disable features without branching.

---

#### **310. What are the advantages of trunk-based development?**

* Simplifies integration
* Encourages frequent commits
* Reduces merge conflicts

---

#### **311. How do you implement feature branching?**

**Answer:**
Create a new branch per feature off main or develop, then merge when done.

---

#### **312. What is GitHub Flow?**

**Answer:**
A simplified workflow where every change is made in a branch and merged via Pull Request directly into main.

---

#### **313. How does GitHub Flow differ from GitFlow?**

| GitHub Flow         | GitFlow                    |
| ------------------- | -------------------------- |
| Single main branch  | Main + develop branches    |
| No release branches | Uses release branches      |
| Lightweight         | Structured and heavyweight |

---

#### **314. How do you handle code reviews in Git workflows?**

**Answer:**
Via Pull Requests or Merge Requests on platforms like GitHub/GitLab.

---

#### **315. What is a Pull Request (PR)?**

**Answer:**
A request to merge changes from one branch to another, typically reviewed by peers.

---

#### **316. How do you protect a branch on GitHub?**

**Answer:**
Use branch protection rules to enforce reviews, status checks, and prevent force pushes.

---

#### **317. What is continuous integration (CI) in Git workflows?**

**Answer:**
Automated testing and building of branches to ensure quality before merging.

---

#### **318. How does GitLab Flow differ from GitFlow?**

**Answer:**
GitLab Flow combines feature-driven and environment-driven workflows for easier deployment.

---

#### **319. What is the difference between merge commits and squash merges?**

| Merge Commit           | Squash Merge              |
| ---------------------- | ------------------------- |
| Preserves history      | Combines commits into one |
| Shows branch structure | Cleaner single commit     |

---

#### **320. How do you squash commits?**

**Command:**

```bash
git rebase -i HEAD~n
```

---

#### **321. What is a fork-and-branch workflow?**

**Answer:**
Fork a repo, create branches in your fork, then submit PRs to original repo.

---

#### **322. Why do teams use feature flags with Git?**

**Answer:**
To merge incomplete features safely without affecting production behavior.

---

#### **323. What is a long-lived branch?**

**Answer:**
Branches that exist for extended periods, like `develop` in GitFlow.

---

#### **324. What are the drawbacks of long-lived branches?**

* Increased merge conflicts
* Integration delays

---

#### **325. How do you decide between GitFlow and trunk-based development?**

**Answer:**
Depends on team size, release cadence, and project complexity.

---

#### **326. How do you handle releases in Git workflows?**

**Answer:**
Via dedicated release branches or tags.

---

#### **327. What is semantic versioning?**

**Answer:**
Versioning scheme: MAJOR.MINOR.PATCH, reflecting backward compatibility.

---

#### **328. How do you tag releases?**

**Command:**

```bash
git tag -a v1.0 -m "Release v1.0"
git push origin v1.0
```

---

#### **329. What are some common branch naming conventions?**

* `feature/xyz`
* `bugfix/abc`
* `hotfix/urgent`
* `release/v1.0`

---

#### **330. What is a detached HEAD in workflow context?**

**Answer:**
Checking out a commit or tag outside branches — generally avoid for ongoing work.

---

#### **331. How do you rebase a feature branch onto develop?**

**Command:**

```bash
git checkout feature/branch
git rebase develop
```

---

#### **332. What are the risks of rebasing?**

* Rewriting history
* Confusing teammates if pushed shared branches

---

#### **333. When should you merge vs rebase?**

| Merge                    | Rebase              |
| ------------------------ | ------------------- |
| Preserve branch history  | Linearize history   |
| When multiple developers | Personal/local work |

---

#### **334. What is cherry-picking in Git workflows?**

**Answer:**
Applying specific commits from one branch onto another.

---

#### **335. How do you cherry-pick a commit?**

**Command:**

```bash
git cherry-pick <commit-hash>
```

---

#### **336. How do you handle large monorepos in workflows?**

**Answer:**
Use submodules, sparse checkouts, or monorepo tooling.

---

#### **337. What is Git submodule workflow?**

**Answer:**
Repos within repos, treated as dependencies.

---

#### **338. How do you update submodules?**

**Command:**

```bash
git submodule update --remote
```

---

#### **339. How do you avoid conflicts in large teams?**

* Communicate often
* Use feature toggles
* Automate merges/tests

---

#### **340. How do you roll back a release in Git?**

**Answer:**
Revert the release commit or deploy previous tag.

---

#### **341. What is Continuous Delivery (CD)?**

**Answer:**
Automated deployment pipelines to deliver code changes safely and quickly.

---

#### **342. How does branching affect CI/CD?**

**Answer:**
Different branches trigger different pipelines, e.g., feature builds vs release deploys.

---

#### **343. What is the role of Git hooks in workflows?**

**Answer:**
Automate tasks like linting, tests before commit/push.

---

#### **344. How do you enforce commit message standards?**

**Answer:**
Use commit hooks or tools like Commitlint.

---

#### **345. How do you handle dependencies between branches?**

**Answer:**
Coordinate merges, rebase, or feature toggles to manage dependencies.

---

#### **346. What is a “fast-forward” merge?**

**Answer:**
Merging without creating a new commit when the branch can be directly advanced.

---

#### **347. How do you prevent fast-forward merges?**

**Command:**

```bash
git merge --no-ff feature-branch
```

---

#### **348. How do you delete merged branches safely?**

**Command:**

```bash
git branch -d feature/branch
```

---

#### **349. How do you delete unmerged branches?**

**Command:**

```bash
git branch -D feature/branch
```

---

#### **350. How do you keep your fork up to date?**

**Answer:**

```bash
git fetch upstream
git merge upstream/main
```

---

### **CI/CD Integration – Questions 351 to 400**

---

#### **351. What is Continuous Integration (CI)?**

**Answer:**
CI is the practice of automatically building and testing code changes frequently to detect integration issues early.

---

#### **352. What is Continuous Deployment (CD)?**

**Answer:**
CD is automatically deploying every successful build to production or staging environments.

---

#### **353. How does Git integrate with CI/CD pipelines?**

**Answer:**
CI/CD tools trigger builds/tests/deployments on Git events like push, pull request, or tag.

---

#### **354. What are Git hooks?**

**Answer:**
Scripts run automatically before or after Git commands (e.g., pre-commit, post-merge).

---

#### **355. How do you create a Git hook?**

**Answer:**
Add executable scripts inside `.git/hooks/` directory.

---

#### **356. What is a pre-commit hook?**

**Answer:**
Runs before a commit is finalized; often used for linting or tests.

---

#### **357. What is a post-commit hook?**

**Answer:**
Runs after a commit; used for notifications or updates.

---

#### **358. How do you use Git in Jenkins pipelines?**

**Answer:**
Use Jenkins Git plugins to clone repos and trigger jobs on Git events.

---

#### **359. How does GitLab CI integrate with Git?**

**Answer:**
GitLab CI runs `.gitlab-ci.yml` pipelines automatically on Git pushes and merge requests.

---

#### **360. How do you trigger a pipeline on pull request creation?**

**Answer:**
Configure the CI tool to listen to PR or merge request events.

---

#### **361. How do you secure secrets in Git-based CI/CD?**

**Answer:**
Use secret managers or environment variables; never commit secrets to Git.

---

#### **362. What is a deployment pipeline?**

**Answer:**
Automated steps from build to deployment ensuring code quality and safe releases.

---

#### **363. How can Git commit messages trigger CI jobs?**

**Answer:**
Use commit message patterns or tags to conditionally trigger pipelines.

---

#### **364. What is the purpose of a `.gitlab-ci.yml` file?**

**Answer:**
Defines the pipeline stages, jobs, and scripts for GitLab CI.

---

#### **365. How do you rollback deployments with Git in CI/CD?**

**Answer:**
Deploy previous tagged commit or revert specific commits.

---

#### **366. How do you avoid merge conflicts in CI pipelines?**

**Answer:**
Use automated rebases, frequent pulls, and branch protection.

---

#### **367. How do you implement automated testing with Git?**

**Answer:**
Trigger test suites on pushes or PRs using CI tools.

---

#### **368. How do you use Git tags for deployment?**

**Answer:**
Tag stable commits and configure CI to deploy tagged versions.

---

#### **369. What is a canary deployment?**

**Answer:**
Deploying to a small subset of users before full rollout.

---

#### **370. How do you configure branch-specific CI pipelines?**

**Answer:**
Set pipeline rules based on branch names or patterns.

---

#### **371. How do you prevent unauthorized code from deploying?**

**Answer:**
Use protected branches and require reviews before deployment.

---

#### **372. How do you automate changelog generation with Git?**

**Answer:**
Use commit message conventions and tools like `semantic-release`.

---

#### **373. How do you integrate Git with Docker in CI/CD?**

**Answer:**
Build Docker images from Git commits and push to registries.

---

#### **374. How do you handle merge conflicts in CI?**

**Answer:**
Fail the build and notify developers to resolve conflicts manually.

---

#### **375. What is a monorepo and how does it affect CI?**

**Answer:**
Single repo with multiple projects; CI may require selective builds.

---

#### **376. How do you optimize CI builds for large Git repos?**

**Answer:**
Use shallow clones, caching, and parallel jobs.

---

#### **377. How do you test pull requests automatically?**

**Answer:**
Configure CI to run tests on PR branches.

---

#### **378. How do you notify teams of Git CI results?**

**Answer:**
Integrate with Slack, email, or dashboards.

---

#### **379. How do you trigger manual approval in Git pipelines?**

**Answer:**
Use pipeline jobs with manual triggers or approval gates.

---

#### **380. How do you enforce code quality with Git and CI?**

**Answer:**
Run linters, static analysis, and tests in CI before merging.

---

#### **381. How do you manage Git branches in CI/CD?**

**Answer:**
Clean up stale branches and configure pipeline triggers accordingly.

---

#### **382. How do you handle environment-specific configs in Git CI?**

**Answer:**
Use environment variables or separate config files.

---

#### **383. How do you secure Git credentials in CI?**

**Answer:**
Use credential managers or secrets storage solutions.

---

#### **384. How do you integrate GitHub Actions with Git?**

**Answer:**
Define workflows triggered by GitHub events in `.github/workflows`.

---

#### **385. How do you cache dependencies in Git CI pipelines?**

**Answer:**
Use CI caching mechanisms to speed up builds.

---

#### **386. How do you perform database migrations with Git CI?**

**Answer:**
Run migration scripts as part of deployment jobs.

---

#### **387. How do you roll back failed CI/CD deployments?**

**Answer:**
Use automated rollback scripts or manual redeployment.

---

#### **388. What is trunk-based CI/CD?**

**Answer:**
Automating builds and deployments directly from the main/trunk branch.

---

#### **389. How do you automate semantic versioning in Git CI?**

**Answer:**
Use commit message conventions with automation tools.

---

#### **390. How do you use Git tags in CI/CD for versioning?**

**Answer:**
Trigger pipelines based on tags and use tags to mark releases.

---

#### **391. How do you test Git hooks locally before pushing?**

**Answer:**
Run hooks manually or use tools like `pre-commit`.

---

#### **392. How do you handle flaky tests in Git CI?**

**Answer:**
Isolate, quarantine, or rerun tests selectively.

---

#### **393. How do you configure multi-branch pipelines?**

**Answer:**
Define pipeline triggers per branch pattern in CI config.

---

#### **394. How do you automate release notes generation?**

**Answer:**
Use commit history and tools like `release-drafter`.

---

#### **395. How do you integrate security scans in Git CI?**

**Answer:**
Run static/dynamic analysis tools as pipeline stages.

---

#### **396. How do you set up GitHub Actions secrets?**

**Answer:**
Add secrets via repo Settings → Secrets → Actions.

---

#### **397. How do you handle dependency updates in Git CI?**

**Answer:**
Automate dependency checking and PR creation.

---

#### **398. How do you do blue-green deployments with Git CI/CD?**

**Answer:**
Deploy to alternate environments and switch traffic after validation.

---

#### **399. How do you trigger workflows on tag push in GitHub Actions?**

**Answer:**
Use `on: push: tags:` in workflow YAML.

---

#### **400. How do you test rollback strategies in CI/CD?**

**Answer:**
Simulate failures and verify rollback automation.

---

### **Large-Scale Git Projects – Questions 401 to 450**

---

#### **401. What is a monorepo?**

**Answer:**
A monorepo is a single Git repository that contains multiple projects or components.

---

#### **402. What are the benefits of using a monorepo?**

* Simplifies dependency management
* Easier code sharing
* Unified CI/CD pipelines

---

#### **403. What challenges come with monorepos?**

* Large repo size
* Longer clone and build times
* Complex access control

---

#### **404. How do you handle large Git repositories efficiently?**

* Use shallow clones (`--depth`)
* Use partial checkouts (`sparse-checkout`)
* Use Git LFS for large files

---

#### **405. What is Git Large File Storage (LFS)?**

**Answer:**
Git LFS stores large binary files outside the repo and replaces them with pointers.

---

#### **406. How do you install Git LFS?**

```bash
git lfs install
```

---

#### **407. How do you track files with Git LFS?**

```bash
git lfs track "*.psd"
```

---

#### **408. What is sparse checkout in Git?**

**Answer:**
A way to checkout only a subset of files/folders from a repo.

---

#### **409. How do you enable sparse checkout?**

```bash
git sparse-checkout init --cone
git sparse-checkout set folder1 folder2
```

---

#### **410. What is a Git submodule?**

**Answer:**
A Git repo embedded within another Git repo.

---

#### **411. How do you add a submodule?**

```bash
git submodule add https://github.com/user/repo.git path/to/submodule
```

---

#### **412. How do you initialize submodules after cloning?**

```bash
git submodule update --init --recursive
```

---

#### **413. How do you update submodules to latest commits?**

```bash
git submodule update --remote
```

---

#### **414. How do you remove a submodule cleanly?**

1. Remove entry from `.gitmodules`
2. Remove submodule directory
3. Remove submodule entry in `.git/config`
4. Commit changes

---

#### **415. What is Git subtree?**

**Answer:**
An alternative to submodules that embeds external repositories into a subdirectory.

---

#### **416. How do you add a remote subtree?**

```bash
git remote add -f repo-name https://github.com/user/repo.git
git subtree add --prefix=folder repo-name main --squash
```

---

#### **417. How do you pull updates to a subtree?**

```bash
git subtree pull --prefix=folder repo-name main --squash
```

---

#### **418. How does subtree differ from submodule?**

| Feature     | Submodule                     | Subtree                     |
| ----------- | ----------------------------- | --------------------------- |
| Repo status | Separate repo                 | Part of main repo           |
| Cloning     | Needs extra init/update steps | Clones as part of main repo |
| Complexity  | More complex                  | Easier to use               |

---

#### **419. How do you track large binary files in Git?**

* Use Git LFS
* Avoid committing binaries directly

---

#### **420. How do you optimize clone times in large repos?**

* Use shallow clones
* Use sparse checkout
* Use Git alternates

---

#### **421. What is Git alternates?**

**Answer:**
A mechanism to share objects between multiple repos on the same machine to save space.

---

#### **422. How do you split a large repo into smaller ones?**

* Use `git filter-repo` or `git subtree split`

---

#### **423. How do you use `git filter-repo` to split history?**

Example:

```bash
git filter-repo --subdirectory-filter path/to/folder
```

---

#### **424. What is the impact of large histories on Git performance?**

* Slower operations like status, checkout
* Increased disk space usage

---

#### **425. How do you compress Git repositories?**

```bash
git gc --aggressive --prune=now
```

---

#### **426. What is reflog expiration?**

**Answer:**
Automatically cleans up old reflog entries to save space.

---

#### **427. How do you set reflog expiry time?**

```bash
git config --global gc.reflogExpire "30 days"
```

---

#### **428. How do you handle permissions in monorepos?**

* Use Git hooks
* Use repository managers with access control

---

#### **429. What is a Git bundle?**

**Answer:**
A pack of objects and refs in a file that can be shared without network access.

---

#### **430. How do you create a Git bundle?**

```bash
git bundle create repo.bundle --all
```

---

#### **431. How do you clone from a Git bundle?**

```bash
git clone repo.bundle repo
```

---

#### **432. What is Git's partial clone?**

**Answer:**
A way to clone with partial object download to save bandwidth.

---

#### **433. How do you perform a partial clone?**

```bash
git clone --filter=blob:none https://github.com/user/repo.git
```

---

#### **434. What is a packed Git repository?**

**Answer:**
A repo where objects are stored in pack files for efficiency.

---

#### **435. How do you inspect pack files?**

```bash
git verify-pack -v .git/objects/pack/pack-*.idx
```

---

#### **436. How do you handle large commit histories in Git?**

* Use shallow clones
* Archive old branches

---

#### **437. What is a shallow clone?**

**Answer:**
A clone with limited commit history depth.

---

#### **438. How do you perform a shallow clone?**

```bash
git clone --depth=1 https://github.com/user/repo.git
```

---

#### **439. How do you deepen a shallow clone?**

```bash
git fetch --deepen=10
```

---

#### **440. How do you convert a shallow clone to a full clone?**

```bash
git fetch --unshallow
```

---

#### **441. How do you find the largest files in a Git repo?**

```bash
git rev-list --objects --all | \
git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' | \
grep blob | sort -k3nr | head -10
```

---

#### **442. How do you remove large files from Git history?**

* Use `git filter-repo` or `BFG Repo-Cleaner`

---

#### **443. How do you use BFG Repo-Cleaner?**

```bash
bfg --delete-files '*.mp4'
```

---

#### **444. How do you improve Git push performance in large repos?**

* Push smaller changes
* Use partial pushes
* Compress objects

---

#### **445. How do you enable parallel fetch in Git?**

```bash
git config --global fetch.parallel 5
```

---

#### **446. How do you use Git worktrees for large projects?**

**Answer:**
Multiple working directories for different branches without full clones.

---

#### **447. How do you create a worktree?**

```bash
git worktree add ../branch-folder branch-name
```

---

#### **448. How do you remove a worktree?**

```bash
git worktree remove ../branch-folder
```

---

#### **449. How do you handle multiple remotes in large projects?**

* Name remotes clearly
* Keep remotes updated
* Use fetch and push rules

---

#### **450. What is Git’s pack-refs optimization?**

**Answer:**
Stores refs in a single file to improve performance.

---

### **Interview-Specific Real-Life Scenarios – Questions 451 to 500**

---

#### **451. You accidentally committed sensitive data (like passwords). What do you do?**

**Answer:**

* Remove data using `git filter-repo` or BFG Repo-Cleaner
* Change the passwords immediately
* Force push the cleaned history
* Inform your team

---

#### **452. How do you revert a faulty production deployment done via Git?**

* Identify the last good commit or tag
* Roll back by checking out or reverting to it
* Deploy rollback version

---

#### **453. A teammate force-pushed breaking changes. How do you recover?**

* Use `git reflog` to find previous commit
* Reset branch to safe commit
* Communicate with the team to avoid future force pushes

---

#### **454. You need to merge a feature branch but the base branch has advanced a lot. What do you do?**

* Rebase your feature branch on the updated base
* Resolve any conflicts during rebase
* Merge or create PR after successful rebase

---

#### **455. How do you recover files deleted accidentally in a commit?**

* Use `git checkout <commit> -- <file>` to restore from previous commit
* Or revert the commit that deleted the files

---

#### **456. You want to test a patch from a colleague without merging it. How?**

* Use `git fetch` to get their branch
* Checkout the branch or cherry-pick specific commits
* Test locally

---

#### **457. How do you handle multiple pull requests changing the same file?**

* Coordinate merges to avoid conflicts
* Use feature toggles if possible
* Communicate to resolve conflicts early

---

#### **458. Your repo is slow, and cloning takes forever. How do you improve?**

* Suggest shallow clones for contributors
* Use sparse checkout for large repos
* Review large file storage usage

---

#### **459. How do you safely delete a remote branch?**

```bash
git push origin --delete branch-name
```

---

#### **460. How to ensure no sensitive files are committed in the future?**

* Add entries to `.gitignore`
* Use pre-commit hooks for scanning secrets
* Train the team on security best practices

---

#### **461. How do you handle cherry-picking a commit with conflicts?**

* Resolve conflicts manually
* Stage resolved files
* Run `git cherry-pick --continue`

---

#### **462. You want to clean up your commit history before merging a feature branch. How?**

* Use interactive rebase (`git rebase -i`)
* Squash or reorder commits
* Fix commit messages

---

#### **463. How do you split a large commit into smaller commits?**

* Use interactive rebase with `edit`
* Use `git reset` and stage changes selectively

---

#### **464. How do you create a patch file to share?**

```bash
git format-patch -1 <commit>
```

---

#### **465. How do you apply a patch file?**

```bash
git apply patchfile.patch
```

---

#### **466. How do you find out which branch contains a specific commit?**

```bash
git branch --contains <commit>
```

---

#### **467. How to handle merge conflicts in binary files during a release?**

* Choose one version manually
* Communicate with the team to avoid repeated conflicts
* Consider locking files if necessary

---

#### **468. How do you rollback a merge commit?**

```bash
git revert -m 1 <merge-commit>
```

---

#### **469. How do you sync your fork with the upstream repository?**

```bash
git fetch upstream
git checkout main
git merge upstream/main
git push origin main
```

---

#### **470. How do you resolve “non-fast-forward” error when pushing?**

* Pull latest changes with rebase:

```bash
git pull --rebase
```

* Then push again

---

#### **471. How do you check the difference between two branches?**

```bash
git diff branch1..branch2
```

---

#### **472. How do you temporarily save changes without committing?**

```bash
git stash
```

---

#### **473. How do you apply stashed changes?**

```bash
git stash pop
```

---

#### **474. How to list all stashes?**

```bash
git stash list
```

---

#### **475. How do you delete a stash?**

```bash
git stash drop stash@{0}
```

---

#### **476. How do you recover a deleted branch?**

* Use `git reflog` to find the last commit of the branch
* Recreate branch pointing to it

---

#### **477. What to do if your local branch is behind remote?**

```bash
git pull --rebase
```

---

#### **478. How do you check commit logs with graphical view?**

```bash
git log --graph --oneline --all --decorate
```

---

#### **479. How do you change the last commit message?**

```bash
git commit --amend -m "New message"
```

---

#### **480. How do you add files to the last commit?**

```bash
git add file.txt
git commit --amend --no-edit
```

---

#### **481. How do you ignore whitespace changes when comparing?**

```bash
git diff -w
```

---

#### **482. How do you squash multiple commits into one?**

Use interactive rebase and squash commits during rebase.

---

#### **483. How do you reset the last commit but keep changes unstaged?**

```bash
git reset --soft HEAD~1
```

---

#### **484. How do you reset the last commit and discard changes?**

```bash
git reset --hard HEAD~1
```

---

#### **485. How do you configure Git to automatically rebase on pull?**

```bash
git config --global pull.rebase true
```

---

#### **486. How do you create a lightweight tag?**

```bash
git tag tagname
```

---

#### **487. How do you create an annotated tag?**

```bash
git tag -a tagname -m "Message"
```

---

#### **488. How do you push tags to remote?**

```bash
git push origin tagname
```

---

#### **489. How do you delete a remote tag?**

```bash
git push origin --delete tagname
```

---

#### **490. How do you check remote URLs?**

```bash
git remote -v
```

---

#### **491. How do you rename a remote?**

```bash
git remote rename oldname newname
```

---

#### **492. How do you add a new remote?**

```bash
git remote add name url
```

---

#### **493. How do you fetch changes from remote without merging?**

```bash
git fetch
```

---

#### **494. How do you list remote branches?**

```bash
git branch -r
```

---

#### **495. How do you check the status of files in the working directory?**

```bash
git status
```

---

#### **496. How do you discard local changes to a file?**

```bash
git checkout -- filename
```

---

#### **497. How do you stash changes including untracked files?**

```bash
git stash -u
```

---

#### **498. How do you configure a global `.gitignore` file?**

```bash
git config --global core.excludesfile ~/.gitignore_global
```

---

#### **499. How do you see a summary of changes between commits?**

```bash
git diff --stat commit1 commit2
```

---

#### **500. How do you fix “detached HEAD” and create a new branch?**

```bash
git checkout -b new-branch
```

---
