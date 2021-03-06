% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DesignSurvey.R
\name{DesignSurvey}
\alias{DesignSurvey}
\title{Survey design}
\usage{
DesignSurvey(sample = NULL, psu.ssu = NULL, psu.col = NULL,
  ssu.col = NULL, cal.col = NULL, N = NULL, strata = NULL,
  cal.N = NULL, ...)
}
\arguments{
\item{sample}{\code{\link{data.frame}} with sample observations. for two-stage cluster designs, one of the columns must contain unique identifiers for PSU and another column must contain unique identifiers for Secondary Sampling Units (SSU).}

\item{psu.ssu}{\code{\link{data.frame}} with all Primary Sampling Units (PSU). First column contains PSU unique identifiers. Second column contains \code{\link{numeric}} PSU sizes. It is used only for two-stage cluster designs.}

\item{psu.col}{the column of \code{sample} containing the psu identifiers (for two-stage cluster designs). It is used only for two-stage cluster designs.}

\item{ssu.col}{the column of \code{sample} containing the ssu identifiers (for two-stage cluster designs). It is used only for two-stage cluster designs.}

\item{cal.col}{the column of \code{sample} with the variable to calibrate estimates. It must be used together with \code{cal.N}.}

\item{N}{for simple designs, a \code{\link{numeric}} value representing the total of sampling units in the population. for a stratified design, it is a column of \code{sample} indicating, for each observation, the total of sampling units in its respective strata. \code{N} is ignored in two-stage cluster designs.}

\item{strata}{for stratified designs, a column of \code{sample} indicating the strata memebership of each observation.}

\item{cal.N}{population total for the variable to calibrate the estimates. It must be used togheter with \code{cal.col}.}

\item{...}{further arguments passed to \code{\link{svydesign}} function.}
}
\value{
An object of class survey.design.
}
\description{
A wraper for \code{\link{svydesign}} function from the survey package, to define one of the following survey designs: two-stage cluster, simple (systematic) or stratified. In the first case, weights are calculated considering a sample with probability proportional to size and with replacement for the first stage and a simple random sampling for the second stage. Finite population correction is specified as the population size for each level of sampling.
}
\details{
For two-stage cluster designs, a PSU appearing in both \code{psu.ssu} and in \code{sample} must have the same identifier. SSU identifiers must be unique but can appear more than once if there is more than one observation per SSU. \code{sample} argument must have just the varibles to be estimated plus the variables required to define the design (two-stage cluster or stratified). \code{cal.col} and \code{cal.N} are needed only if estimates will be calibrated. The calibration is based on a population total.
}
\examples{
data(city)
data(hh)
## Two-stage cluster design that included 65 PSU.
data(cluster_sample)
cluster_sample2 <- cluster_sample[complete.cases(cluster_sample), c(1:2, 8:10)]
DesignSurvey(sample = cluster_sample2,
             psu.ssu = city[, c("track_id", "hh")],
             psu.col = 1, ssu.col = 2,
             cal.col = 3, cal.N = sum(hh$persons))
#'
## Simple design.
data(sys_sample)
sys_sample2 <- sys_sample[complete.cases(sys_sample), 7:9]
DesignSurvey(sample = sys_sample[, -c(1:2)], N = sum(city$hh))

## Assuming that systematic_sample is a stratified design.
# Hypothetical strata
strat <- sys_sample2
strat$strat <- sample(c("urban", "rural"), nrow(strat), prob = c(.95, .05),
                      replace = TRUE)
strat$strat_size <- round(sum(city$hh) * .95)
strat$strat_size[strat$strat == "rural"] <- round(sum(city$hh) * .05)
DesignSurvey(strat, N = "strat_size", strata = "strat")

}
\references{
Lumley, T. (2011). Complex surveys: A guide to analysis using R (Vol. 565). Wiley.

\url{http://oswaldosantos.github.io/capm}
}
