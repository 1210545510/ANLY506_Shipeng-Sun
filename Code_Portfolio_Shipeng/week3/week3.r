## week3
## workspace management functions
ls()
rm(a, b, ..)
rm(list = ls())
getwd()
setwd(file = "dir")
list.files()
write.table(x, file = "mydata.txt", sep)
save(a, b, .., file = "myimage.RData")
save.image(file = "myimage.RData")
load(file = "myimage.RData")
read.table(file = "mydata.txt", sep, header)

## print current working directory
getwd()

## change working directory to the following path
setwd(dir = "/Users/nphillips/Dropbox/yarrr")

## print all the objects in my workspace
ls()

## create data frame
study1.df <- data.frame(id = 1:5, 
                        sex = c("m", "m", "f", "f", "m"), 
                        score = c(51, 20, 67, 52, 42))

## save objects as a new .RData file
save(study1.df, score.by.sex, study1.htest,
     file = "data/study1.RData")

## write data to a txt file
write.table(x = pirates,
            file = "pirates.txt",  # Save the file as pirates.txt
            sep = "\t")

## read data from .txt file into R
mydata <- read.table(file = 'data/mydata.txt',
                     sep = '\t',
                     header = TRUE,
                     stringsAsFactors = FALSE)

