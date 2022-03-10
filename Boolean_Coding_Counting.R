#--------------------------------------------------------------#
#This is for '1' '0' for each codes in OnlineQ2#
#--------------------------------------------------------------#


#!!!!BEFORE USING THIS CODE, PLEASE MAKE SURE THE "Final Codes" are at the "E"(5th) column
#, and all codes in the first line starts from the "G"(7th) column
#, and name the "F"(6th) column header as "MissedCode"
##If you wanna generate code list for anything else, simply revise the document names


# Set working directory
#setwd("")

# Loading Package for finding missing codes
library(sjmisc) 
#For each file

for (Q in 1:3){
      # Load up data into a R data frame
      Love_Coding_Counting <- read.csv(paste('Love_FinalCodes_StudentQ', Q, '_done+columns_Yi_mx.csv', sep=""), header = TRUE, check.names = FALSE)
      
      #list all codes
      codes= colnames (Love_Coding_Counting)
      
      #Boolean coding
      #For each participant
      for (x in 1: nrow(Love_Coding_Counting)){
        #the final codes for a certain participant
        a_final_codes <- Love_Coding_Counting[x,5]
        #Seperate the list of codes to elements
        codes_sep <- unlist(strsplit(a_final_codes,", "))
        #How many codes are there for xth participant
        fcode_num <- length(codes_sep)
        
        ##Add 0 to all
        for (y in 7:ncol(Love_Coding_Counting)){
          #do Boolean code
          Love_Coding_Counting[x,y] <- '0'}
          
      
        #For each code in the tree
        for (n in 1: fcode_num){
          for (y in 7:ncol(Love_Coding_Counting)){
          #do Boolean code
      
          if (codes_sep[n] == codes[y]){
            Love_Coding_Counting[x,y] <- '1'
          }
          else{
            next
          }
          }
        }
        
      # Finding missing codes        
        for (n in 1: fcode_num){
          if (str_contains (codes, codes_sep[n]) == TRUE){
            next}
          else {if (is.na(Love_Coding_Counting$MissedCode[x]) == TRUE){
            Love_Coding_Counting$MissedCode[x] <- codes_sep[n]
          }
            else
            {Love_Coding_Counting$MissedCode[x] <-  paste(Love_Coding_Counting$MissedCode[x], codes_sep[n],sep = ", ")}
          }
          
        }
      }
      
      
      #write into csv
      write.csv(Love_Coding_Counting,paste("Love_Rcounting_StudentQ", Q, ".csv", sep = '' ))
}     
