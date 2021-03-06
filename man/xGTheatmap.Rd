% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xGTheatmap.r
\name{xGTheatmap}
\alias{xGTheatmap}
\title{Function to plot heatmap given associated data on tree tips}
\usage{
xGTheatmap(gp, data, reorder = c("none", "col"), colormap = "spectral",
ncolors = 64, zlim = NULL, barwidth = 0.3, barheight = 4,
nbin = 64, legend.title = "", x.rotate = 60, x.text.size = 6,
x.text.hjust = 0.5, y.text.size = 6, legend.text.size = 5,
legend.title.size = 6, shape = 19, size = 2,
plot.margin = unit(c(5.5, 5.5, 5.5, 5.5), "pt"),
font.family = "sans", na.color = "grey80", data.label = NULL,
label.size = 1, label.color = "black", ...)
}
\arguments{
\item{gp}{a ggplot object resulting from ggtree}

\item{data}{a data frame/matrix for coloring}

\item{reorder}{how to reorder rows and columns. It can be "none" for no
reordering, "col" for reordering columns}

\item{colormap}{short name for the colormap. It can be one of "jet"
(jet colormap), "bwr" (blue-white-red colormap), "gbr" (green-black-red
colormap), "wyr" (white-yellow-red colormap), "br" (black-red
colormap), "yr" (yellow-red colormap), "wb" (white-black colormap), and
"rainbow" (rainbow colormap, that is,
red-yellow-green-cyan-blue-magenta). Alternatively, any
hyphen-separated HTML color names, e.g. "blue-black-yellow",
"royalblue-white-sandybrown", "darkgreen-white-darkviolet". A list of
standard color names can be found in
\url{http://html-color-codes.info/color-names}}

\item{ncolors}{the number of colors specified over the colormap}

\item{zlim}{the minimum and maximum z values for which colors should be
plotted, defaulting to the range of the finite values of displayed
matrix}

\item{barwidth}{the width of the colorbar. Default value is
'legend.key.width' or 'legend.key.size' in 'theme' or theme}

\item{barheight}{the height of the colorbar. Default value is
'legend.key.height' or 'legend.key.size' in 'theme' or theme}

\item{nbin}{the number of bins for drawing colorbar}

\item{legend.title}{the title of the colorbar. By default, it is ''}

\item{x.rotate}{the angle to rotate the x tick labelings. By default,
it is 60}

\item{x.text.size}{the text size of the x tick labelings. By default,
it is 6}

\item{x.text.hjust}{the hjust of the x tick labelings. By default, it
is 0.5}

\item{y.text.size}{the text size of the y tick labelings. By default,
it is 6}

\item{legend.text.size}{the text size of the legend tick labelings. By
default, it is 5}

\item{legend.title.size}{the text size of the legend titles. By
default, it is 6}

\item{shape}{the number specifying the shape. By default, it is 19}

\item{size}{the number specifying the shape size. By default, it is 2}

\item{plot.margin}{the margin (t, r, b, l) around plot. By default, it
is unit(c(5.5,5.5,5.5,5.5),"pt")}

\item{font.family}{the font family for texts}

\item{na.color}{the color for NAs. By default, it is 'grey80'}

\item{data.label}{a data frame/matrix used for the labelling}

\item{label.size}{the label size}

\item{label.color}{the label color}

\item{...}{additional graphic parameters for xHeatmap}
}
\value{
a ggplot object
}
\description{
\code{xGTheatmap} is supposed to plot heatmap given associated data on
tree tips. It returns an object of class "ggplot".
}
\note{
none
}
\examples{
\dontrun{
# Load the XGR package
library(XGR)
set.seed(825)
tree <- ape::rtree(50)
gp <- xGT(tree) + ggtree::geom_tiplab(size=2)
# heatmap data
x <- matrix(rnorm(length(tree$tip.label)*5), ncol=5)
colnames(x) <- paste0('C',1:5)
rownames(x) <- tree$tip.label
gp_heatmap <- xGTheatmap(gp, x)
}
}
\seealso{
\code{\link{xGT}}
}
