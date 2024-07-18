library(shiny)
library(dplyr)
library(ggplot2)
library(bulkAnalyseR)

expression.matrix <- readRDS("expression.rds")
metadata <- readRDS("metadata.rds")
anno <- data.frame(rownames(expression.matrix),rownames(expression.matrix))
colnames(anno) <- c("ENSEMBL","NAME")

ui <- function(request){
navbarPage(
'T-cell Mediated Changes by PD-1 and BTLA RNAseq',
theme = shinythemes::shinytheme('flatly'),
header = tags$head(tags$style('body {overflow-y: scroll;}')),
footer = bookmarkButton(),
tabPanel(
title = 'RNA',
modalityPanelUI(
id = 'RNA',
metadata = metadata,
organism = 'NA',
panels.default = c('SampleSelect', 'QC', 'GRN', 'DE', 'DEplot', 'DEsummary', 'Enrichment', 'GRNenrichment', 'Cross', 'Patterns')
),
),
)
}
