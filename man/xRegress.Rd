% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xRegress.r
\name{xRegress}
\alias{xRegress}
\title{Function to regress data according to principle components (PCs)}
\usage{
xRegress(data, center = TRUE, scale = TRUE, which.PCs = NULL)
}
\arguments{
\item{data}{a data matrix/frame with, for exampe, genes in rows and
samples in columns}

\item{center}{logical to indicate whether the input data columns should
be shifted to be zero centered when calculating PCs}

\item{scale}{logical to indicate whether the input data columns should
have unit variance when calculating PCs}

\item{which.PCs}{a vector specifying which PCs are used for being
regressed out. If NULL (by default), no gression is done}
}
\value{
a list with three componets:
\itemize{
\item{\code{regressed}: the regressed data with the same dimension as
the input data}
\item{\code{PCs}: a data matrix of PCs X samples}
\item{\code{Ss}: a vector storing the square roots of the eigenvalues}
}
}
\description{
\code{xRegress} is supposed to regress data according to principle
components (PCs).
}
\note{
none
}
\examples{
\dontrun{
# Load the library
library(XGR)
}

\dontrun{
data(Fang)
ls_res <- xRegress(Fang, which.PCs=1)
gp <- xHeatmap(ls_res$PCs)
gp
}
}
\seealso{
\code{\link{xRegress}}
}
