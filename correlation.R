# linear correlation

report001 <- read.delim("report001", header = TRUE, sep = " ")
cor(report001$tests, report001$category)
linearMod <- lm(tests ~ category, data=report001)  # build linear regression model on full data
print(linearMod)
summary(linearMod)

report002 <- read.delim("report002", header = TRUE, sep = " ")
cor(report002$tests, report002$category)
linearMod <- lm(tests ~ category, data=report002)  # build linear regression model on full data
print(linearMod)
summary(linearMod)

report004 <- read.delim("report004", header = TRUE, sep = " ")
cor(report004$tests, report004$category)
linearMod <- lm(tests ~ category, data=report004)  # build linear regression model on full data
print(linearMod)
summary(linearMod)

report008 <- read.delim("report008", header = TRUE, sep = " ")
cor(report008$tests, report008$category)
linearMod <- lm(tests ~ category, data=report008)  # build linear regression model on full data
print(linearMod)
summary(linearMod)

report016 <- read.delim("report016", header = TRUE, sep = " ")
cor(report016$tests, report016$category)
linearMod <- lm(tests ~ category, data=report016)  # build linear regression model on full data
print(linearMod)
summary(linearMod)

# report002 <- read.delim("report002", header = TRUE, sep = " ")
# report002$category <- as.factor(report002$category)
# p <- ggplot(report002, aes(x=category, y=tests)) + geom_boxplot() + scale_x_discrete(name ="%uncertainty") + scale_y_continuous(name ="#tests", breaks = seq(1000, 10000, by = 2000)) + expand_limits(y = c(500, 9000)) + theme(axis.text = element_text(size = 12))
# ggsave("plots/boxplot-dist-002.pdf", width = 3, height = 3)
#
