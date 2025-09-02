# -----------------------------------------------
# Module 1 Assignment II
# -----------------------------------------------

dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results or tasks")

# deffining input and output folders
input_dir <- "raw_data"
output_dir <- "results or tasks"

# files to process
files_to_process <- c("DEGs_Data_1.csv", "DEGs_Data_2.csv")

# list to store results
result_list <- list()

# processing each file
for (file_name in files_to_process) {
  cat("\nProcessing:", file_name, "\n")
  input_file_path <- file.path(input_dir, file_name)
  
  # import dataset
  data <- read.csv(input_file_path, header = TRUE)
  cat("File imported. Checking for missing values...\n")
  names(data)
  
  # handling missing values
  if("padj" %in% names(data)){
    missing_count <- sum(is.na(data$padj))
    cat("Missing values in 'padj':", missing_count, "\n")
    data$padj[is.na(data$padj)] <- 1
    }
  
  # defining classify_gene
  classify_gene <- function(logFC, padj) {
    if (padj < 0.05 & logFC > 1){
      return("Upregulated")
      }
    else if ( padj < 0.05 & logFC < -1){
      return("Downregulated")
      }
    else{
      return("Not_Significant")
    }
    cat("Done\n")
    }
  # status
  data$status <- mapply(classify_gene, data$logFC, data$padj)
  
  # storen reults in lists
  result_list[[file_name]] <- data
  
  # save processed result
  output_file_path <- file.path(output_dir, paste0("Processed_", file_name))
  write.csv(data, output_file_path, row.names = FALSE)
  cat("Results saved to:", output_file_path, "\n")
  
  # summary
  cat("summary for", file_name, ":\n")
  print(table(data$status))
}

# save workspace
save.image("OrahIfeanyi_Class_2_Assignment.RData")
