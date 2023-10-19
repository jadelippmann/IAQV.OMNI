
title: "OMNI Analysis"
output: 
  html_document:
  toc: yes
toc_float: yes
theme: paper
always_allow_html: yes

{r global_options, include=FALSE}
knitr::opts_chunk$set(fig.path = 'figures/',
                      warning = FALSE,
                      message = FALSE,
                      echo = FALSE,
                      cache = FALSE)

source("functions.R")


fldr <- "data"


files_omni <- list.files(path = fldr,
                          pattern = ".*_omni.rds",
                          recursive = TRUE,
                          full.names = TRUE)
files_inst <- list.files(path = fldr,
                         pattern = ".*_instlog.rds",
                         recursive = TRUE)


read_omni_rds <- function(f)
  read_rds(f) %>%
    mutate(id_site = str_sub(f, 6, 8))

data_omni <- map(files_omni, read_rds) %>%
  bind_rows()

install.packages('digest',dep=TRUE)
install.packages("knitr")

