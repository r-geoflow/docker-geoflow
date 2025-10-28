# run_geoflow.R
args <- commandArgs(trailingOnly = TRUE)
cat("Configuration file:", args[1], "\n")
library(geoflow)
result <- executeWorkflow(file = args[1], dir = ".")
cat(result, "\n")