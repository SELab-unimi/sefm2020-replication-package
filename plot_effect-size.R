library(ggplot2)

log <- read.delim("effect-size_hdaware-vs-rand1-flat2.log", header = TRUE, sep = " ")

mNames <- list(
  '1'="HDR-aware vs Random",
  '2'="HDR-aware vs Flat"
)
mLabeller <- function(variable,value){
  return(mNames[value])
}

pdf("effect-size_tmp.pdf")

gplot <- ggplot(data = log, aes(x=as.factor(uncertainty), y=as.factor(distance), fill=effect)) +
  geom_tile() +
  facet_wrap(~target, nrow = 1, labeller = mLabeller) +
  scale_fill_gradient(low = "black", high = "white") +
  xlab("uncertainty %") +
  ylab("distance") +
  theme(aspect.ratio = 1.2, plot.margin = margin(0, 0, 0, 0, "cm"), text = element_text(size=18))

print(gplot)
dev.off()
system("pdfcrop --margins '0 0 0 0' effect-size_tmp.pdf plots/effect-size.pdf")
system("rm *_tmp.pdf")
