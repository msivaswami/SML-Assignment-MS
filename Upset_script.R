#Correlation of Clinical Endpoints and how they compare to predictions made with predictive models trained on RNA Seq data.
#Author - Muthukumaraswami Sivaswami (1833616)

#loading the clinical endpoint dataset to look at the correlation between Death, High Risk, Progression to a Tumour and INSS stage.
#first, let's upload the tsv file
patient_info <- read.table("patientInfo_train.tsv", header = TRUE, sep = "\t")
#next, I'll do my sanity checks to make sure all the data is fine.
dim(patient_info)
head(patient_info)

#Renaming columns

colnames(patient_info) <- c("ID", "Sex", "Age","Death","High Risk","INSS","Progression")

#I also have to encode the INSS Staging as numeric values
#Replacing"4S" with "5" in the INSS column
patient_info$INSS[patient_info$INSS == "4S"] <- "5"

#Converting the INSS column to numeric
patient_info$INSS <- as.numeric(as.character(patient_info$INSS))

#Now that I know my data is fine, I'll plot a correlation between the clinical endpoints using UpSetR.
#loading the libraries
library(UpSetR)
library(ggplot2)


upset_plot <- upset(patient_info)

#that doesn't seem to work too well, let's exclude the INSS column from the plot
plot_data <- patient_info[, !(names(patient_info) %in% c("INSS"))]

upset_plot_no_INSS <- upset(plot_data)

#Let's also plot the predictions from the models trained on RNA Seq data.
#let's upload the tsv file
predictions <- read.table("patientInfo_test_predictions.tsv", header = TRUE, sep = "\t")
#next, I'll do my sanity checks to make sure all the data is fine.
dim(predictions)
head(predictions)

#Renaming columns
colnames(predictions) <- c("","ID", "Sex", "Age","Death","High Risk","Progression","INSS")

#removing the first column
predictions <- predictions[, -1]

#I also have to encode the INSS Staging as numeric values
#Replacing"4S" with "5" in the INSS column
predictions$INSS[patient_info$INSS == ("4C","4S"] <- "5"

#Converting the INSS column to numeric
predictions$INSS <- as.numeric(as.character(patient_info$INSS))

#Let's now plot our upset plot

#excluding the INSS column from the plot
predictions_plot_data <- predictions[, !(names(predictions) %in% c("INSS"))]

upset_plot_no_INSS_predictions <- upset(predictions_plot_data)