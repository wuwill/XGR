% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xEnrichRadial.r
\name{xEnrichRadial}
\alias{xEnrichRadial}
\title{Function to visualise enrichment results using radial-like plot}
\usage{
xEnrichRadial(eTerm, ig = NULL, fixed = T, node.color = c("or",
"adjp", "zscore"), colormap = "grey-orange-darkred", zlim = NULL,
node.size = c("adjp", "or", "zscore"), slim = NULL,
node.size.range = c(0.5, 3.5), edge.color = "skyblue",
edge.color.alpha = 0.5, edge.curve = 0.1, edge.arrow.gap = 0.02,
...)
}
\arguments{
\item{eTerm}{an object of class "eTerm" or "ls_eTerm". Alterntively, it
can be a data frame having all these columns
('name','adjp','or','zscore'; 'group' optionally). Be aware that
multiple ontologies are not supported here}

\item{ig}{the igraph object. If provided, only those terms within it
will be visualised. By default, it is NULL meaning no surch
restriction}

\item{fixed}{logical to indicate whether all terms in ig will be
visualised. By default, it is TURE; otherwise only overlapped terms
from eTerm will be visualised}

\item{node.color}{which statistics will be used for node coloring. It
can be "or" for the odds ratio, "adjp" for adjusted p value (FDR) and
"zscore" for enrichment z-score}

\item{colormap}{short name for the colormap. It can be one of "jet"
(jet colormap), "bwr" (blue-white-red colormap), "gbr" (green-black-red
colormap), "wyr" (white-yellow-red colormap), "br" (black-red
colormap), "yr" (yellow-red colormap), "wb" (white-black colormap),
"rainbow" (rainbow colormap, that is,
red-yellow-green-cyan-blue-magenta), and "ggplot2" (emulating ggplot2
default color palette). Alternatively, any hyphen-separated HTML color
names, e.g. "lightyellow-orange" (by default), "blue-black-yellow",
"royalblue-white-sandybrown", "darkgreen-white-darkviolet". A list of
standard color names can be found in
\url{http://html-color-codes.info/color-names}}

\item{zlim}{the minimum and maximum values for which colors should be
plotted}

\item{node.size}{which statistics will be used for node size. It can be
"or" for the odds ratio, "adjp" for adjusted p value (FDR) and "zscore"
for enrichment z-score}

\item{slim}{the minimum and maximum values for which sizes should be
plotted}

\item{node.size.range}{the range of actual node size}

\item{edge.color}{a character specifying which edge attribute defining
the the edge colors}

\item{edge.color.alpha}{the 0-1 value specifying transparency of edge
colors}

\item{edge.curve}{a numeric value specifying the edge curve. 0 for the
straight line}

\item{edge.arrow.gap}{a gap between the arrow and the node}

\item{...}{additional graphic parameters used in xGGnetwork}
}
\value{
a list with 3 components, three ggplot objects (code, table, data) and
an igraph object (ig appended with node attributes 'zscore', 'adjp' and
'or')
}
\description{
\code{xEnrichRadial} is supposed to visualise enrichment results using
radial-like plot. It returns three ggplot2 objects, the first for
visualing the network with nodes lablelled by codes, the second for
listing code meaning in a table, and the third for the network with
nodes colored/sized with enrichment results.
}
\note{
none
}
\examples{
\dontrun{
# Load the XGR package and specify the location of built-in data
library(XGR)
RData.location <- "http://galahad.well.ox.ac.uk/bigdata/"

ls_res <- xEnrichRadial(eTerm, ig, fixed=T, node.color="or",
colormap="grey-orange-darkred", zlim=c(0,7), node.size="adjp",
slim=c(0,30), node.size.range=c(1,3))
pdf("xEnrichRadial.pdf", width=6.5, height=6.5)
print(ls_res$data + coord_equal(ratio=1.3))
print(ls_res$code + coord_equal(ratio=1.3))
print(ls_res$table)
dev.off()

# advanced use: customise layout
ig.PhasedTargets <- xRDataLoader('ig.PhasedTargets',
RData.location=RData.location)
ig <- xLayout(ig.PhasedTargets,
layout="gplot.layout.fruchtermanreingold")
ls_res <- xEnrichRadial(df, ig=ig, fixed=F, node.color="or",
node.size="adjp", node.xcoord="xcoord", node.ycoord="ycoord")
pdf("xEnrichRadial.pdf", width=6.5, height=6.5)
print(ls_res$data + coord_equal())
gridExtra::grid.arrange(grobs=c(list(ls_res$code+coord_equal()),ls_res$table),
ncol=2)
dev.off()
}
}
\seealso{
\code{\link{xEnrichViewer}}, \code{\link{xOBOcode}},
\code{\link{xGGnetwork}}
}
