install.packages("DataExplorer")
library(DataExplorer)

# EDA 
# missing values
library(ISwR)
data(juul)
introduce(juul)
plot_intro(juul)
plot_missing(juul)

# distributions 
# bar graphs
library(ggplot2)
data(diamonds)
plot_bar(diamonds, with = "price")

# histograms
plot_histogram(diamonds)

# correlation
house <- read.csv("MLR_houseprices.csv")
plot_correlation(house)

# PCA
plot_prcomp(diamonds, maxcat = 5L)

# slicing and dicing
# boxplots
plot_boxplot(diamonds, by = "cut")

# scatterplots
plot_scatterplot(split_columns(diamonds)$continuous, by = "price", sampled_rows = 1000L)

# FE
# replace missing values
echo = read.csv("Echocardiogram.data", header = F, na.strings = c("?"))
plot_missing(echo)
final_echo <- set_missing(echo, list(0L, "unknown"))
plot_missing(final_echo)

# group sparse categories
head(diamonds)
group_category(diamonds, "clarity", threshold = 0.25, update = T)

# dummify 
dummify(diamonds, select = "cut")

# drop columns
drop_columns(diamonds, "color")

# update columns 
update_columns(diamonds, "table", as.factor)

# create report
data(iris)
create_report(iris, y = "Species")

# configure report
config = configure_report(
  add_introduce = FALSE,
  add_plot_intro = TRUE,
  add_plot_str = FALSE,
  add_plot_missing = TRUE,
  add_plot_histogram = TRUE,
  add_plot_density = FALSE,
  add_plot_qq = FALSE,
  add_plot_bar = TRUE,
  add_plot_correlation = TRUE,
  add_plot_prcomp = FALSE,
  add_plot_boxplot = FALSE,
  add_plot_scatterplot = FALSE,
  introduce_args = list(),
  plot_intro_args = list(),
  plot_str_args = list(type = "diagonal", fontSize = 35, width = 1000, margin =
                         list(left = 350, right = 250)),
  plot_missing_args = list(),
  plot_histogram_args = list(),
  plot_density_args = list(),
  plot_qq_args = list(sampled_rows = 1000L),
  plot_bar_args = list(),
  plot_correlation_args = list(cor_args = list(use = "pairwise.complete.obs")),
  plot_prcomp_args = list(),
  plot_boxplot_args = list(),
  plot_scatterplot_args = list(sampled_rows = 1000L),
  global_ggtheme = quote(theme_gray()),
  global_theme_config = list()
)
create_report(iris, config = config)






