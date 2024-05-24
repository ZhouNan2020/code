# 加载必要的库
library(MatchIt)

# 读取数据C:\MyProject\MIMIC-IPE\加了中介变量的数据集\用于统计的完整数据集.csv
data <- read.csv("C:\\MyProject\\MIMIC-IPE\\加了中介变量的数据集\\用于统计的完整数据集.csv")
# 删除data中包含空值的列（注意是包含空值的列，而不是包含0值的列）
data <- data[, colSums(is.na(data)) == 0]

# 删除data中的New.group.label列
data <- data[, -which(names(data) == "New.group.label")]
# 将data中Group.Label列的值更换为1和0，其中DVT-PE为1，IPE为0
data$Group_Label <- ifelse(data$Group.Label == "DVT-PE", 1, 0)



# 定义处理组和对照组
treatment <- data$Group_Label == 1
control <- data$Group_Label == 0

# 进行倾向性匹配
matched_data <- matchit(treatment ~ control, data = data, method = "genetic")

# 查看匹配后的数据集
matched_data <- match.data(matched_data)

write.csv(matched_data, "C:\\MyProject\\MIMIC-IPE\\加了中介变量的数据集\\PSM数据集.csv")