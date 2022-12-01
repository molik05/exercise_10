# Suffix trees

### Task 1: Implement `SuffixArray()` function
Input: string

Output: suffix array

### Task 2: Implement `InverseSuffixArray()` function
Input: suffix array

Output: inverse suffix array

### Task 3: Implement `LCPArray()` function
Input: text, suffix array, inverse suffix array

Output: longest common prefix array

```
LCPArray(text, SA, ISA)
  LCP[1] <- -1
  LCP[n + 1] <- -1
  l <- 0
  for i <- 1 to n do
    j <- ISA[i]
    if j > 1 then
      k <- SA[j - 1]
      while text[k + l] = text[i + l] do
        l <- l + 1
      LCP[j] <- l
      l <- max{l - 1, 0}
```

Hint: 
The text will be indexed at *n* + 1 position, that does not exist. Add one character at the end of the text (in general use `$`, for `DNAString` in R use `+`).


### Task 4: Implement `BinarySearchSA()` function
Input: pattern, text, SA

Output: SA indexes of the first and the last match of the pattern in the text

```
BinarySearchSA(Pattern, Text, SuffixArray)
  minIndex <- 1
  maxIndex <- length (Text)
  while minIndex < maxIndex
    midlIndex <- floor(minIndex + maxIndex) / 2
    if Pattern <= suffix of Text starting at position SuffixArray(midlIndex)
      maxIndex <- midlIndex
    else
      minIndex <- midlIndex + 1
  First <- minIndex
  maxIndex <- length(Text)
  while maxIndex > minIndex
    midlIndex <- floor(minIndex + maxIndex) / 2
    if suffix of Text starting at position SuffixArray(midlIndex) <= Pattern
      minIndex <- midlIndex + 1
    else
      maxInd <- midlIndex
  Last <- maxIndex - 1
  if Last < First
    return('Pattern does not appear in Text')
  else
    return(First, Last)
```


<details>
<summary>Download files from GitHub</summary>
<details>
<summary>Git settings</summary>

> * Configure the Git editor
> ```bash
> git config --global core.editor notepad
> ```
> * Configure your name and email address
> ```bash
> git config --global user.name "Zuzana Nova"
> git config --global user.email z.nova@vut.cz
> ```
> * Check current settings
> ```bash
> git config --global --list
> ```
>
</details>

* Create a fork on your GitHub account. 
  On the GitHub page of this repository find a <kbd>Fork</kbd> button in the upper right corner.
  
* Cloned forked repository from your GitHub page to a folder in your computer:
```bash
git clone <fork repository address>
```
* In a local repository, set new remote for project repository:
```bash
git remote add upstream https://github.com/mpa-prg/exercise_08.git
```

### Send files to GitHub
Create a new commit and send new changes to your remote repository.
* Add file to a new commit.
```bash
git add <file_name>
```
* Create commit, enter commit message, save the file and close it.
```bash
git commit
```
* Send new commit to your GitHub repository.
```bash
git push origin master
```
</details>
