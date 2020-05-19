# boxplots tests_by_distance
library(ggplot2)

report001 <- read.delim("report001", header = TRUE, sep = " ")
report001$category <- as.factor(report001$category)
p <- ggplot(report001, aes(x=category, y=tests)) + geom_boxplot() + scale_x_discrete(name ="%uncertainty") + scale_y_continuous(name ="#tests", breaks = seq(1000, 10000, by = 2000)) + expand_limits(y = c(500, 9000)) + theme(axis.text = element_text(size = 12))
ggsave("plots/boxplot-dist-001.pdf", width = 3, height = 3)

report002 <- read.delim("report002", header = TRUE, sep = " ")
report002$category <- as.factor(report002$category)
p <- ggplot(report002, aes(x=category, y=tests)) + geom_boxplot() + scale_x_discrete(name ="%uncertainty") + scale_y_continuous(name ="#tests", breaks = seq(1000, 10000, by = 2000)) + expand_limits(y = c(500, 9000)) + theme(axis.text = element_text(size = 12))
ggsave("plots/boxplot-dist-002.pdf", width = 3, height = 3)

report004 <- read.delim("report004", header = TRUE, sep = " ")
report004$category <- as.factor(report004$category)
p <- ggplot(report004, aes(x=category, y=tests)) + geom_boxplot() + scale_x_discrete(name ="%uncertainty") + scale_y_continuous(name ="#tests", breaks = seq(1000, 10000, by = 2000)) + expand_limits(y = c(500, 9000)) + theme(axis.text = element_text(size = 12))
ggsave("plots/boxplot-dist-004.pdf", width = 3, height = 3)

report008 <- read.delim("report008", header = TRUE, sep = " ")
report008$category <- as.factor(report008$category)
p <- ggplot(report008, aes(x=category, y=tests)) + geom_boxplot() + scale_x_discrete(name ="%uncertainty") + scale_y_continuous(name ="#tests", breaks = seq(1000, 10000, by = 2000)) + expand_limits(y = c(500, 9000)) + theme(axis.text = element_text(size = 12))
ggsave("plots/boxplot-dist-008.pdf", width = 3, height = 3)


# boxplot(tests ~ category, data = report002, col = "lightgray")
# report004 <- read.delim("report004", header = TRUE, sep = " ")
# boxplot(tests ~ category, data = report004, col = "lightgray")
# report008 <- read.delim("report008", header = TRUE, sep = " ")
# boxplot(tests ~ category, data = report008, col = "lightgray")
# report016 <- read.delim("report016", header = TRUE, sep = " ")
# boxplot(tests ~ category, data = report016, col = "lightgray")
