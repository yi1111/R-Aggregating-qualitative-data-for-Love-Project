#--------------------------------------------------------------#
#This is for finding all codes (code list) used for each question#
#--------------------------------------------------------------#


# Set working directory
#!!Remember to add the path
#setwd("")

#!!!!BEFORE USING THIS CODE, PLEASE MAKE SURE THE "Final Codes" are at the "E"(5th) column
##If you wanna generate code list for other data, simply revise the document names

#lOOP FOR Student sample data Q1-Q7


for (Q in 1:7){
    # Load up data into a R data frame
    Love_Codes <- read.csv(paste('Love_FinalCodes_StudentQ', Q, '.csv', sep=""), header = TRUE, check.names = FALSE)
    CodeList <- c()
    
    
    #Reset all variables to 0
    for (x in 1: nrow(Love_Codes)){
      #the final codes for a certain participant
      a_final_codes <- Love_Codes[x,5]
      codes_sep <- unlist(strsplit(a_final_codes,", "))
      fcode_num <- length(codes_sep)
    
      # Listing codes that has been used
      # For nth code in the final codes for the xth participant
      
      if (fcode_num ==0){
      next}
      else
        {for (n in 1: fcode_num){
        if (codes_sep [n] %in% CodeList){
          next}
        else {
          CodeList <- c (CodeList, codes_sep [n])
      }
      }
        }
    }
    
      #write into txt
    write.csv(CodeList,paste('Love_Tree_CodesList_StudentQ', Q, '.csv', sep=""))
}
