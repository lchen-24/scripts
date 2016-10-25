---
title: "Pb and As"
author: "Luke Chen"
date: "October 24,2016"
output: pdf_document:
---

<style type="text/css">

body, td {
   font-size: 18px;
}
code.r{
  font-size: 14px;
}
pre {
  font-size: 14px
}
</style>




First find confidence interval at 95% confidence level, then check if values fall outside of range



```r
# install.packages('xlsx')

# load xlsx library to read xls file
library(xlsx)

# read data
lincoln <- read.xlsx("Wenatchee SD.xls", sheetName = "Lincoln", header = T, 
    startRow = 2, endRow = 25)
washington <- read.xlsx("Wenatchee SD.xls", sheetName = "Washington", header = T, 
    startRow = 2, endRow = 24)

# remove asterix
lincoln[, 2] <- gsub("[*].*$", "", lincoln[, 2])
lincoln[, 3] <- gsub("[*].*$", "", lincoln[, 3])
washington[, 2] <- gsub("[*].*$", "", washington[, 2])
washington[, 3] <- gsub("[*].*$", "", washington[, 3])

# change to numeric
lincoln[, 2] <- as.numeric(lincoln[, 2])
lincoln[, 3] <- as.numeric(lincoln[, 3])
washington[, 2] <- as.numeric(washington[, 2])
washington[, 3] <- as.numeric(washington[, 3])

####### Lincoln##############################

# find confidence interval
t.test(lincoln[, 2], alternative = c("two.sided"), conf.level = 0.95)$conf.int
```

```
## [1] 207.1 674.6
## attr(,"conf.level")
## [1] 0.95
```

```r
range <- as.numeric(t.test(lincoln[, 2], alternative = c("two.sided"), conf.level = 0.95)$conf.int)

# Sample IDs higher than normal range are
lincoln[lincoln[, 2] > range[2], ]$Sample.ID
```

```
## [1] 553 554 556 558 560 594 596
```

```r

###### Washington###########################

# find confidence interval
t.test(washington[, 2], alternative = c("two.sided"))$conf.int
```

```
## [1] 228.4 611.9
## attr(,"conf.level")
## [1] 0.95
```

```r
range <- as.numeric(t.test(washington[, 2], alternative = c("two.sided"))$conf.int)

# Sample IDs higher than normal range are
washington[washington[, 2] > range[2], ]$Sample.ID
```

```
## [1] 471 476 478 480 481 483 485
```


You can plot Pb and As to check if there is correlation


```r
plot(lincoln[, 2], lincoln[, 3], xlab = "Pb", ylab = "As", main = "Lincoln")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 



```r
plot(washington[, 2], washington[, 3], xlab = "Pb", ylab = "As", main = "Washington")
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


Or simply check if they are correlated


```r
cor(lincoln[, 2], lincoln[, 3])
```

```
## [1] 0.9756
```

```r
cor(washington[, 2], washington[, 3])
```

```
## [1] 0.9302
```


Seems like they are very positively correlated (close to 1)
