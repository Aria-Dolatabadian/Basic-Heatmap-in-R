#install d3heatmap

if (!require("devtools")) install.packages("devtools")
devtools::install_github("rstudio/d3heatmap")

# Libraries
library(tidyverse)
library(hrbrthemes)
library(viridis)
library(plotly)
library(d3heatmap)
library(heatmaply)

#install fonts 

hrbrthemes::import_roboto_condensed()

#instrall the fonts in the mentioned directory

#load data

Heatmap <- read.csv("Heat.csv")
Heatmap

# Select a few country
Heatmap  <- Heatmap %>% 
  filter(Country %in% c("France", "Sweden", "Italy", "Spain", "England", "Portugal", "Greece", "Peru", "Chile", "Brazil", "Argentina", "Bolivia", "Venezuela", "Australia", "New Zealand", "Fiji", "China", "India", "Thailand", "Afghanistan", "Bangladesh", "United States of America", "Canada", "Burundi", "Angola", "Kenya", "Togo")) %>%
  arrange(Country) %>%
  mutate(Country = factor(Country, Country))


# Matrix format
mat <- Heatmap
rownames(mat) <- mat[,1]
mat <- mat %>% dplyr::select(-Country, -Group, -Continent)
mat <- as.matrix(mat)

p <- heatmaply(mat, 
        dendrogram = "none",
        xlab = "", ylab = "", 
        main = "",
        scale = "column",
        margins = c(60,100,40,20),
        grid_color = "white",
        grid_width = 0.00001,
        titleX = FALSE,
        hide_colorbar = TRUE,
        branches_lwd = 0.1,
        label_names = c("Country", "Feature:", "Value"),
        fontsize_row = 5, fontsize_col = 5,
        labCol = colnames(mat),
        labRow = rownames(mat),
        heatmap_layers = theme(axis.line=element_blank())
        )

p


p <- heatmaply(mat, 
        #dendrogram = "row",
        xlab = "", ylab = "", 
        main = "",
        scale = "column",
        margins = c(60,100,40,20),
        grid_color = "white",
        grid_width = 0.00001,
        titleX = FALSE,
        hide_colorbar = TRUE,
        branches_lwd = 0.1,
        label_names = c("Country", "Feature:", "Value"),
        fontsize_row = 5, fontsize_col = 5,
        labCol = colnames(mat),
        labRow = rownames(mat),
        heatmap_layers = theme(axis.line=element_blank())
        )

p


