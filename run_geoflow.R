# run_geoflow.R
args <- commandArgs(trailingOnly = TRUE)
cat("Configuration file:", args[1], "\n")
result <- geoflow::executeWorkflow(file = args[1])
cat(result, "\n")