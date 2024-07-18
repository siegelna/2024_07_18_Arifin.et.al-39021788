library(shiny)
library(dplyr)
library(ggplot2)
library(bulkAnalyseR)

expression.matrix <- readRDS("expression.rds")
metadata <- readRDS("metadata.rds")
anno <- data.frame(rownames(expression.matrix),rownames(expression.matrix))
colnames(anno) <- c("ENSEMBL","NAME")

server <- function(input, output, session){
modalityPanelServer(
id = 'RNA',
expression.matrix = expression.matrix,
metadata = metadata,
anno = anno,
organism = 'NA',
panels.default = c('SampleSelect', 'QC', 'GRN', 'DE', 'DEplot', 'DEsummary', 'Enrichment', 'GRNenrichment', 'Cross', 'Patterns')
)
}