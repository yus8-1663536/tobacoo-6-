library(dplyr)
library(ggplot2)
library(tidyr)
library(reshape2)
library(scales)

demo <- read.csv("data/demographic data.csv", stringsAsFactors = F)
tobacco <- read.csv("data/tobacco.csv", stringsAsFactors = F)