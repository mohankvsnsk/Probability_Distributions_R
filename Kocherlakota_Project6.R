#Venkata Satya Nagendra Sai Krishna Mohan Kocherlakota 10/26/2023 ALY6000: -Project-6
cat("\014") # clears console
rm(list = ls()) # clears global environment
try(dev.off(dev.list()["RStudioGD"]), silent = TRUE) # clears plots
try(p_unload(p_loaded(), character.only = TRUE), silent = TRUE) # clears packages
options(scipen = 100) # disables scientific notion for entire R session

#Analyzing a baseball probability distribution

win <- 0.65
loss <- 1 - win

#1
prob1_result <- dbinom(5, 7, win)

#2
wins <- c(0:7)
probability <- dbinom(0:7, 7, win)
prob2_result <- data.frame(wins, probability)

#3
prob3_result <- 1 - sum(prob2_result$probability[6:8])

#4
prob4_result <- sum(prob2_result$probability[4:6])

#5
prob5_result <- sum(prob2_result$probability[6:8])

#6
prob6_result <- 7*win

#7
prob7_result <- 7*win*loss

#8
set.seed(10)
samples <- rbinom(1000, 7, win)

#9
prob9_result <- mean(samples)

#10
prob10_result <- var(samples)

#Analyzing calls in a call center
lambda <- 7
hours <- 8
#11
prob11_result <- dpois(x = 6, lambda)

#12
prob12_result <- ppois(40, lambda * hours)

#13
prob13_result <- 1 - ppois(274, lambda * hours * 5)

#14
prob14_result <- 1 - ppois(274, lambda * hours * 4)

#15
prob15_result <- qpois(0.9, lambda*hours)

#16
set.seed(15)
rand_pois <- rpois(1000, lambda*hours)

#17
prob17_result <- mean(rand_pois)

#18
prob18_result <- var(rand_pois)

#Analyzing the lifespans of light bulbs
mean_life_span <- 2000
sd_life_span <- 100

#19
z_upper <- (2200 - mean_life_span)/sd_life_span
z_lower <- (1800 - mean_life_span)/sd_life_span

prob19_result <- pnorm(z_upper) - pnorm(z_lower)

#20
prob20_result <- 1 - pnorm((2500 - mean_life_span)/sd_life_span)

#21
prob21_result <- round(qnorm(0.1, mean_life_span, sd_life_span))

#22
set.seed(25)
rand_norm <- rnorm(10000, mean_life_span, sd_life_span)

#23
prob23_result <- mean(rand_norm)

#24
prob24_result <- sd(rand_norm)

#25
set.seed(1)

num_samples <- 1000  
sample_size <- 100   

prob25_result <- c()

for (i in 1:num_samples) {
  
  sample_data <- rnorm(sample_size, mean_life_span, sd_life_span)
  prob25_result[i] <- mean(sample_data)
}

#26
hist(prob25_result, main = "Histogram of Sample Means",
     xlab = "Sample Means", ylab = "Frequency",
     col = "cyan", border = "black")

#27
prob27_result <- mean(prob25_result)

#Analyzing the flipper length of penguins

library(palmerpenguins)
#head(penguins)
#summary(penguins)

adelie <- filter(penguins, species == 'Adelie')
summary(adelie)

#scale <- 100/ max(adelie$flipper_length_mm)

#Qplot
qqnorm(adelie$flipper_length_mm)
qqline(adelie$flipper_length_mm, col='red')

#Histogram
ggplot(data = adelie, aes(x = flipper_length_mm)) +
  geom_histogram(binwidth = 5, fill='green', color = 'black') + 
  #geom_density(color = "green")+
  #scale_y_continuous(sec.axis = sec_axis(~.*scale)) +
  labs(title = "Distribution of Flipper Length",
       x = "Flipper Length (mm)",
       y = "Frequency")


#29
gentoo <- filter(penguins, species == 'Gentoo')
ggplot(gentoo, aes(x = flipper_length_mm, y = bill_depth_mm))+
  geom_point(fill = "blue")+
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Scatter plot between flipper length and bill depth",
       x = "Flipper Length (mm)",
       y = "Bill Depth (mm)") + theme_excel_new()