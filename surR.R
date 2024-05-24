install.packages("ggplot2", "ggimage")


# 读取数据C:\MyProject\MIMIC-IPE\加了中介变量的数据集\用于统计的完整数据集.csv
# Set the file path
file_path <- "C:/MyProject/MIMIC-IPE/加了中介变量的数据集/用于统计的完整数据集.csv"

# Read the CSV file
data <- read.csv(file_path)

# Print the first few rows of the data
head(data)

# 画出Age列的直方图，使用ggplot
# Plot the histogram of the Age column using ggplot
library(ggplot2)
a=ggplot(data, aes(x = Age)) + geom_histogram(binwidth = 5, fill = "skyblue", color = "black") + labs(title = "Histogram of Age", x = "Age", y = "Frequency")
