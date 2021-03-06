% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xHeatmapAdv.r
\name{xHeatmapAdv}
\alias{xHeatmapAdv}
\title{Function to draw heatmap together with sidebars on rows using ggplot2}
\usage{
xHeatmapAdv(data.main, data.meta, reorder = c("none", "row", "col",
"both"), colormap = "spectral", ncolors = 64, zlim = NULL,
barwidth = 0.3, barheight = 4, nbin = 64, legend.title = "Main",
x.rotate = 60, x.text.size = 6, x.text.hjust = 0.5,
y.text.size = 6, legend.text.size = 5, legend.title.size = 6,
shape = 19, size = 2, plot.margin = unit(c(5.5, 5.5, 5.5, 5.5),
"pt"), font.family = "sans", na.color = "grey80",
data.label = NULL, label.size = 1, label.color = "black",
meta.colormap = "spectral", meta.x.rotate = 75,
meta.shape.continuous = 15, meta.shape.discrete = 95,
meta.size = 2, meta.location = c("right", "left"),
meta.width = 0.5, gap.width = 0.5, legend.width = NULL,
legend.direction = c("vertical", "horizontal"), legend.nrow = NULL,
verbose = TRUE, ...)
}
\arguments{
\item{data.main}{a data frame/matrix for main heatmap. The coloring can
be continuous (numeric matrix) or discrete (factor matrix)}

\item{data.meta}{a data frame/matrix for metadata visualisation. The
per-column coloring can be continuous (numeric) or discrete (factor)}

\item{reorder}{how to reorder rows and columns. It can be "none" for no
reordering, "row" for reordering rows according to number of sharings
(by default), "col" for reordering columns, and "both" for reordering
rows and columns}

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

\item{meta.colormap}{the colormap for metadata}

\item{meta.x.rotate}{the angle to rotate the x tick labelings for the
metadata. By default, it is 90}

\item{meta.shape.continuous}{the number specifying the shape for
continuous metadata. By default, it is 15}

\item{meta.shape.discrete}{the number specifying the shape for discrete
metadata. By default, it is 95}

\item{meta.size}{the number specifying the shape size for metadata. By
default, it is 2}

\item{meta.location}{the location of metadata. It can be "right" or
"left"}

\item{meta.width}{the width for each column in metadata. By default, it
is 0.5 (relative to each column in main data)}

\item{gap.width}{the width for the gap between panels. By default, it
is 0.5 (relative to each column in main data)}

\item{legend.width}{the width for the legend. By default, it is NULL
automatically determined (which can be used as a reference to define
later for the better visualisation)}

\item{legend.direction}{the direction of the legend. It can be
"vertical" or "horizontal"}

\item{legend.nrow}{the row number for legends. By default, it is 3 for
the vertical direction of the legend; 6 for the horizontal direction of
the legend}

\item{verbose}{logical to indicate whether the messages will be
displayed in the screen. By default, it sets to true for display}

\item{...}{additional graphic parameters for
supraHex::visTreeBootstrap}
}
\value{
a gtable object
}
\description{
\code{xHeatmapAdv} is supposed to draw heatmap together with sidebars
on rows using ggplot2.
}
\note{
none
}
\examples{
\dontrun{
# Load the XGR package
library(XGR)
data(mtcars)
data.main <- mtcars[,1:6]
data.meta <- mtcars[,7:11]
gt <- xHeatmapAdv(data.main, data.meta, barwidth=0.3, barheight=2.5,
meta.location="right", legend.nrow=3, meta.width=0.4, gap.width=0.2,
legend.width=NULL)
gt <- xHeatmapAdv(data.main, data.meta, barwidth=0.3, barheight=4,
meta.location="right", legend.nrow=6, meta.width=0.4, gap.width=0.2,
legend.width=4)
dev.new(); grid::grid.draw(gt)
}
}
\seealso{
\code{\link{xHeatmap}}
}
