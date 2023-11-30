SuffixArray <- function(DNA){
  suffixes <- c()
  l <- nchar(DNA)
  for (i in 1:l){
    suffix <- substring(DNA,i,l)
    suffixes <- append(suffixes, suffix)
  }
  sorted_suffixes <- sort(suffixes)
  suffix_array <- c()
  for (i in 1:l){
    pos <- which(suffixes == sorted_suffixes[i])
    suffix_array <- append(suffix_array,pos)
  }
  return(suffix_array)
}

SuffixArray('CARACAS$')

InverseSuffixArray <- function(suffix_array){
  l <- length(suffix_array)
  inverse_suffix_array <- c()
  for (i in 1:l){
    pos <- which(suffix_array == i)
    inverse_suffix_array <- append(inverse_suffix_array,pos)
  }
  return(inverse_suffix_array)
}

InverseSuffixArray(c(8,4,2,6,1,5,3,7))

LCPArray <- function(DNA,suffix_array,inverse_suffix_array){
  m <- nchar(DNA)
  LCP <- integer((m+1))
  LCP[1] <- -1
  LCP[(m+1)] <- -1
  l <- 0
  for (i in 1:m){
    j <- inverse_suffix_array[i]
    if (j > 1){
      k <- suffix_array[j-1]
      while (substring(DNA,(k+l),(k+l)) == substring(DNA,(i+l),(i+l))){
        l <- l+1
      }
      LCP[j] <- l
      l <- max((l-1),0)
    }
  }
  return(LCP)
}
s <- 'CARACAS$'
SA <- SuffixArray('CARACAS$')
ISA <- InverseSuffixArray(SA)  
LCPArray(s,SA,ISA)


BinarySearchSA <- function(suffix_array,pattern,DNA){
  minindex <- 1
  maxindex <- nchar(DNA)
  while (minindex < maxindex){
    midlindex <- floor(minindex+maxindex)/2
    if (pattern < substring(DNA,midlindex,maxindex) | startsWith(substring(DNA,midlindex,maxindex),pattern)) {
      maxindex <- midlindex
    }
    else {
      minindex <- midlindex+1
    }
  }
  first <- minindex
  maxindex <- nchar(DNA)
  while (maxindex > minindex){
    midlindex <- floor(minindex+maxindex)/2
    if (substring(DNA,midlindex,maxindex) < pattern | startsWith(substring(DNA,midlindex,maxindex),pattern)){
      minindex <- midlindex+1
    }
    else{
      maxind <-midlindex
    }
  }
  last <- maxindex-1
  if (last < first){
    return('Pattern does no appear in DNA string')
  }
  else{
    return(c(first,last))
  }
}

BinarySearchSA(SA,'CA',s)
