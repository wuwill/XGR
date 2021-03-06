% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xGRoverlap.r
\name{xGRoverlap}
\alias{xGRoverlap}
\title{Function to extract overlap-based scores given genomic regions}
\usage{
xGRoverlap(data, format = c("chr:start-end", "data.frame", "bed",
"GRanges"), build.conversion = c(NA, "hg38.to.hg19", "hg18.to.hg19"),
GR.score = c(NA, "RecombinationRate", "phastCons100way",
"phyloP100way", "GERP"), verbose = T,
RData.location = "http://galahad.well.ox.ac.uk/bigdata")
}
\arguments{
\item{data}{input genomic regions (GR). If formatted as "chr:start-end"
(see the next parameter 'format' below), GR should be provided as a
vector in the format of 'chrN:start-end', where N is either 1-22 or X,
start (or end) is genomic positional number; for example, 'chr1:13-20'.
If formatted as a 'data.frame', the first three columns correspond to
the chromosome (1st column), the starting chromosome position (2nd
column), and the ending chromosome position (3rd column). If the format
is indicated as 'bed' (browser extensible data), the same as
'data.frame' format but the position is 0-based offset from chromomose
position. If the genomic regions provided are not ranged but only the
single position, the ending chromosome position (3rd column) is allowed
not to be provided. The data could also be an object of 'GRanges' (in
this case, formatted as 'GRanges')}

\item{format}{the format of the input data. It can be one of
"data.frame", "chr:start-end", "bed" or "GRanges"}

\item{build.conversion}{the conversion from one genome build to
another. The conversions supported are "hg38.to.hg19" and
"hg18.to.hg19". By default it is NA (no need to do so)}

\item{GR.score}{the genomic regions together with score data. By
default, it is 'NA' to disable this option. Pre-built genomic score
data: 'RecombinationRate' (recombintion rate,
\url{http://www.ncbi.nlm.nih.gov/pubmed/17943122})), 'phastCons100way',
'phyloP100way', 'GERP'. Beyond pre-built data, the user can specify the
customised input: load your customised GR object directly (with the
first meta column for scores; if not provided, it will be valued at 1)}

\item{verbose}{logical to indicate whether the messages will be
displayed in the screen. By default, it sets to true for display}

\item{RData.location}{the characters to tell the location of built-in
RData files. See \code{\link{xRDataLoader}} for details}
}
\value{
a GenomicRanges object, appended with a meta-column 'GScore'. If input
data contains only a genomic region, then outputs are all overlapped
regions from GR.score; otherwise all overlapped regions from input data
will be output.
}
\description{
\code{xGRoverlap} is supposed to extract overlap-based scores given
genomic regions. Scores are extracted for overlapped sub-regions only,
valued at the mean per base; otherwise NA. It returns a GR object.
}
\examples{
\dontrun{
# Load the XGR package and specify the location of built-in data
library(XGR)
RData.location <- "http://galahad.well.ox.ac.uk/bigdata"

# a) provide the genomic regions
## load ImmunoBase
ImmunoBase <- xRDataLoader(RData.customised='ImmunoBase',
RData.location=RData.location)
## get lead SNPs reported in AS GWAS
data <- ImmunoBase$AS$variant

# b) extract recombination rate
gr <- xGRoverlap(data=data, format="GRanges",
GR.score="RecombinationRate", RData.location=RData.location)

############################################
# gene-centric genomic score (per base)
gr_Gene <- xRDataLoader('UCSC_knownGene',
RData.location=RData.location)
## recombination rate
gr_rr <- xGRoverlap(data=gr_Gene, format="GRanges",
GR.score="RecombinationRate", RData.location=RData.location)
## phastCons100way
gr_phast <- xGRoverlap(data=gr_Gene, format="GRanges",
GR.score="phastCons100way", RData.location=RData.location)
## phyloP100way
gr_phylo <- xGRoverlap(data=gr_Gene, format="GRanges",
GR.score="phyloP100way", RData.location=RData.location)
}
}
\seealso{
\code{\link{xRDataLoader}}
}
