% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ClassMethod-XGR.r
\name{mSeed}
\alias{mSeed}
\alias{print.mSeed}
\title{Definition for S3 class \code{mSeed}}
\usage{
mSeed(GR, Gene, Link)

\method{print}{mSeed}(x, ...)
}
\arguments{
\item{GR}{a data frame}

\item{Gene}{a data frame}

\item{Link}{a data frame}

\item{x}{an object of class \code{mSeed}}

\item{...}{other parameters}
}
\value{
an object of S3 class \code{mSeed}
}
\description{
\code{cTarget} has 3 components: GR, Gene, Link.
}
\examples{
\dontrun{
# Load the library
library(XGR)
}
RData.location <- "http://galahad.well.ox.ac.uk/bigdata"
\dontrun{
mSeed(GR, Gene, Link)
}
}
\keyword{S3}
\keyword{classes}
