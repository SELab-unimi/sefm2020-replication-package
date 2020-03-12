# boxplots tests_by_uncertainty
library(ggplot2)
library(plyr)

report25 <- read.delim("report25", header = TRUE, sep = " ")
report25$distance <- as.factor(report25$distance)
p <- ggplot(report25, aes(x=reorder(distance, desc(distance)), y=tests)) + geom_boxplot() + scale_x_discrete(name ="distance", limits=c("8", "4", "2", "1"), labels=c("8" = "0.08", "4" = "0.04", "2" = "0.02", "1" = "0.01")) + scale_y_continuous(name ="#tests", breaks = seq(1000, 10000, by = 2000)) + expand_limits(y = c(500, 9000)) + theme(axis.text = element_text(size = 12))
ggsave("plots/boxplot-u-25.pdf", width = 3, height = 3)

report50 <- read.delim("report50", header = TRUE, sep = " ")
report50$distance <- as.factor(report50$distance)
p <- ggplot(report50, aes(x=reorder(distance, desc(distance)), y=tests)) + geom_boxplot() + scale_x_discrete(name ="distance", limits=c("8", "4", "2", "1"), labels=c("8" = "0.08", "4" = "0.04", "2" = "0.02", "1" = "0.01")) + scale_y_continuous(name ="#tests", breaks = seq(1000, 10000, by = 2000)) + expand_limits(y = c(500, 9000)) + theme(axis.text = element_text(size = 12))
ggsave("plots/boxplot-u-50.pdf", width = 3, height = 3)

report75 <- read.delim("report75", header = TRUE, sep = " ")
report75$distance <- as.factor(report75$distance)
p <- ggplot(report75, aes(x=reorder(distance, desc(distance)), y=tests)) + geom_boxplot() + scale_x_discrete(name ="distance", limits=c("8", "4", "2", "1"), labels=c("8" = "0.08", "4" = "0.04", "2" = "0.02", "1" = "0.01")) + scale_y_continuous(name ="#tests", breaks = seq(1000, 10000, by = 2000)) + expand_limits(y = c(500, 9000)) + theme(axis.text = element_text(size = 12))
ggsave("plots/boxplot-u-75.pdf", width = 3, height = 3)

report100 <- read.delim("report100", header = TRUE, sep = " ")
report100$distance <- as.factor(report100$distance)
p <- ggplot(report100, aes(x=reorder(distance, desc(distance)), y=tests)) + geom_boxplot() + scale_x_discrete(name ="distance", limits=c("8", "4", "2", "1"), labels=c("8" = "0.08", "4" = "0.04", "2" = "0.02", "1" = "0.01")) + scale_y_continuous(name ="#tests", breaks = seq(1000, 10000, by = 2000)) + expand_limits(y = c(500, 9000)) + theme(axis.text = element_text(size = 12))
ggsave("plots/boxplot-u-100.pdf", width = 3, height = 3)

# report25 <- read.delim("report25", header = TRUE, sep = " ")
# boxplot(tests ~ distance, data = report25, col = "lightgray")
# report50 <- read.delim("report50", header = TRUE, sep = " ")
# boxplot(tests ~ distance, data = report50, col = "lightgray")
# report75 <- read.delim("report75", header = TRUE, sep = " ")
# boxplot(tests ~ distance, data = report75, col = "lightgray")
# report100 <- read.delim("report100", header = TRUE, sep = " ")
# boxplot(tests ~ distance, data = report100, col = "lightgray")
