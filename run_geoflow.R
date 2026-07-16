# run_geoflow.R
args <- commandArgs(trailingOnly = TRUE)
cat("Configuration file:", args[1], "\n")

# Configure libxml2 for memory stability
Sys.setenv(LIBXML_THREAD_ENABLED="0")
Sys.setenv(LIBXML_MEMORY_DEBUG="1")

# Force xmlParse to use safer options
options(
  xmlMaxSize = 100*1024*1024,  # 100MB max document size
  xmlNodeSize = 512            # Conservative node allocation
)

library(geoflow)
result <- executeWorkflow(file = args[1], dir = ".")
cat(result, "\n")
