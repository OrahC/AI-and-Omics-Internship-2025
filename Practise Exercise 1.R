# -------------------------------
# Practise Exervise 1
# ------------------------------


# -------------------------------------------
# Checking cholesterol level with 'if'
# -------------------------------------------

cholesterol <- 230
if(cholesterol > 240){
  print("High Cholesterol")
}


# -------------------------------------------
# Blood Pressure Status using 'if....else'
# -------------------------------------------

systolic_bp <- 130
if(systolic_bp < 120){
  print("Blood Pressure is Normal")
} else{
  print("Blood pressure is High")
}



# -------------------------------------------
# Authomating data type conversion with 'for' loop
# -------------------------------------------

data_1 <- read.csv(file.choose())
View(data_1)
str(data_1)
factor_cols <- c("gender", "diagnosis", "smoker")

for (col in factor_cols) {
  data_1[[col]] <- as.factor(data_1[[col]])
  
}
str(data_1)

data_2 <- read.csv(file.choose())
View(data_2)
str(data_2)
factor_cols2 <- c("height", "gender")

for (col in factor_cols2){
  data_2[[col]] <- as.factor(data_2[[col]])
}
str(data_2)



# -------------------------------------------
# Converting 'Factors' to 'Numeric' codes
# -------------------------------------------

binary_cols <- c("smoker")

for (col in binary_cols) {
  data_1[[col]] <- ifelse (data_1$smoker == "Yes", 1, 0)
  
}

class(data_1$smoker)
str(data_1)



