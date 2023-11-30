# Suffix Trees

### Task 1
 * In R, implement a function `SuffixArray()` to create a suffix array from a string.

 * Input:
   * a DNAString 

 * Output:
   * a vector of integers

### Task 2
 * In R, implement a function `InverseSuffixArray()` to create an inverse suffix array from a suffix array.

 * Input:
   * a vector of integers representing suffix array

 * Output:
   * a vector of integers

### Task 3
 * In R, implement a function `LCPArray()` according to pseudocode.

 * Input:
   * a DNAString representing analyzed string
   * a vector of integers representing a suffix array
   * a vector of integers representing an inverse suffix array

 * Output:
   * a vector of integers

```
LCPArray(text, SA, ISA)
  LCP[1] <- -1
  LCP[m + 1] <- -1
  l <- 0
  for i <- 1 to m
    j <- ISA[i]
    if j > 1 then
      k <- SA[j - 1]
      while text[k + l] = text[i + l] do
        l <- l + 1
      LCP[j] <- l
      l <- max{l - 1, 0}
  return LCP
```

**Hint:** 
The text will be indexed at *m* + 1 position, that does not exist. Add one character at the end of the text (in general use `$`, for `DNAString` in R use `+`).

### Task 4
 * In R, implement a function `BinarySearchSA()` according to the following pseudocode.

 * Input:
   * a vector of integers representing a suffix array
   * a DNAString representing a pattern to be found
   * a DNAString representing a text to be searched

* Output:
 * a vector of two integers (start and end indexes of suffix array, where the pattern was found)

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
<summary>Basic Git settings</summary>

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
  
* Clone forked repository from your GitHub page to your computer:
```bash
git clone <fork repository address>
```
* In a local repository, set new remote for a project repository:
```bash
git remote add upstream https://github.com/mpa-prg/exercise_10.git
```

#### Send files to GitHub
Create a new commit and send new changes to your remote repository.
* Add file to a new commit.
```bash
git add <file_name>
```
* Create a new commit, enter commit message, save the file and close it.
```bash
git commit
```
* Send a new commit to your GitHub repository.
```bash
git push origin main
```

</details>
