#Plotting the Clinical Endpoint Data from PatientInfo_train.csv for data exploration

#Author - Muthukumaraswami Sivaswami (1833616)

#loading in a modified version of the training patient endpoint data that includes age in years and better labels.
clinend <- read.csv("C:/Users/Muthu/Desktop/clinend.csv")
View(clinend)

#Loading the ggplot2 package
library(ggplot2)

#Plotting distribution of Sexes
sexplot <- ggplot(clinend, aes(x = Sex)) +
  geom_bar(fill = "dodgerblue", color = "black") +
  geom_text(stat='count', aes(label=..count..), vjust=-0.5) +
  labs(title = "Distribution of Sexes", x = "Sex", y = "Count")

#Plotting the age of diagnosis distribution in years
ageplot <- ggplot(clinend, aes(x = 1, y = Age.in.Years)) +
  geom_jitter(width = 0.1, height = 0, color = "dodgerblue") +
  labs(title = "Distribution of Ages", x = "", y = "Age (years)") +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank()) 

#Plotting the Death endpoint
deathplot <- ggplot(clinend, aes(x = Death, fill = factor(Death))) +
  geom_bar(stat = "count") +
  scale_fill_manual(values = c("dodgerblue", "dodgerblue3"), labels = c("No", "Yes")) +
  geom_text(stat = 'count', aes(label=..count..), vjust=-0.5, color = "black") +
  labs(title = "Distribution of Death", x = "", y = "Count") +
  theme(axis.text.x = element_blank(),  
        axis.ticks.x = element_blank()) + 
  guides(fill = guide_legend(title = "Death")) 

#Plotting High Risk endpoint
highriskplot <- ggplot(clinend, aes(x = High.Risk, fill = factor(High.Risk))) +
  geom_bar(stat = "count") +
  scale_fill_manual(values = c("dodgerblue", "dodgerblue3"), labels = c("No", "Yes")) +
  geom_text(stat = 'count', aes(label=..count..), vjust=-0.5, color = "black") +
  labs(title = "Distribution of High Risk", x = "", y = "Count") +
  theme(axis.text.x = element_blank(),  
        axis.ticks.x = element_blank()) + 
  guides(fill = guide_legend(title = "High Risk"))

#Plotting the Progression endpoint
progressionplot <- ggplot(clinend, aes(x = Progression, fill = factor(Progression))) +
  geom_bar(stat = "count") +
  scale_fill_manual(values = c("dodgerblue", "dodgerblue3"), labels = c("No", "Yes")) +
  geom_text(stat = 'count', aes(label=..count..), vjust=-0.5, color = "black") +
  labs(title = "Distribution of Progression", x = "", y = "Count") +
  theme(axis.text.x = element_blank(),  
        axis.ticks.x = element_blank()) + 
  guides(fill = guide_legend(title = "Progression")) 

#Plotting INSS Staging distribution
inss_pie <- ggplot(clinend, aes(x = "", fill = factor(INSS))) +
  geom_bar(width = 1, color = "white") +
  coord_polar("y", start = 0) +
  scale_fill_manual(values = c("dodgerblue", "dodgerblue3", "darkblue", "blue", "powderblue"),
                    labels = c("1", "2", "3", "4", "5")) +
  labs(title = "Distribution of INSS") +
  theme_void() +
  theme(legend.position = "right")


# Load the gridExtra package
library(gridExtra)


#Arrange the plots in a grid
grid.arrange(
  deathplot + labs(title = NULL) + theme(plot.title = element_text(hjust = 0.5)),
  sexplot + labs(title = NULL) + theme(plot.title = element_text(hjust = 0.5)),
  ageplot + labs(title = NULL) + theme(plot.title = element_text(hjust = 0.5)),
  highriskplot + labs(title = NULL) + theme(plot.title = element_text(hjust = 0.5)),
  inss_pie + labs(title = NULL) + theme(plot.title = element_text(hjust = 0.5)),
  progressionplot + labs(title = NULL) + theme(plot.title = element_text(hjust = 0.5)),
  layout_matrix = rbind(c(1, 2, 3), c(4, 5, 6)),
  top = "Analysis of Clinical Endpoint Data in Training",
  padding = unit(0.5, "lines")
)



