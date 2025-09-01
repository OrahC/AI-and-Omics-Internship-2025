dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results or Tasks")
dir.create("plots etc")

data <- read.csv(file.choose())
str(data)
View(data)

as.factor(data$gender)
as.factor(data$diagnosis)
as.factor(data$smoker)
data$smoking_status <- ifelse(data$smoker == "Yes", 1, 0)
class(data$smoking_status)

write.csv(data, file = "clean_data/patient_info_clean.csv")

