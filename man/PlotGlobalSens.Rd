% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PlotGlobalSens.R
\name{PlotGlobalSens}
\alias{PlotGlobalSens}
\title{Plot results of GlobalSens function}
\usage{
PlotGlobalSens(global.out = NULL, x.label = "Time",
  y.label = "Population", legend.label = "Sensitivity range",
  qt.label = "Qt 0.05 - 0.95", sd.label = "mean +- sd   ",
  inner.color = "DarkRed", outer.color = "LightBlue")
}
\arguments{
\item{global.out}{output from \code{\link{CalculateGlobalSens}} function.}

\item{x.label}{string with the name for the x axis.}

\item{y.label}{string with the name for the y axis.}

\item{legend.label}{string with the name for the legend.}

\item{qt.label}{string with the name for the envelope calculated using the quantiles 0.05 and 0.95.}

\item{sd.label}{string with the name for the envelope calculated using the mean +- standard deviation ranges.}

\item{inner.color}{any valid specification of a color for the inner envelope.}

\item{outer.color}{any valid specification of a color for the outer envelope.}
}
\description{
Plot results of of \code{\link{CalculateGlobalSens}} function.
}
\details{
Font size of saved plots is usually different to the font size seen in graphic browsers. Before changing font sizes, see the final result in saved (or preview) plots.
 
Other details of the plot can be modifyed using appropriate functions from \code{ggplot2} package.
}
\examples{
## IASA model

## Parameters and intial conditions.
pars_solve_iasa = c(
   b1 = 21871, b2 = 4374,
   df1 = 0.104, dm1 = 0.098, df2 = 0.125, dm2 = 0.118,
   sf1 = 0.069, sf2 = 0.05, sm1 = 0.028, sm2 = 0.05,
   k1 = 98050, k2 = 8055, h1 = 1, h2 = 0.5,
   a = 0.054, alpha = 0.1, v = 0.2, z = 0.1)
   
init_solve_iasa = c(
   f1 = 33425, fs1 = 10865,
   m1 = 38039, ms1 = 6808,
   f2 = 3343, fs2 = 109,
   m2 = 3804, ms2 = 68)
   

# Solve for point estimates.
solve_iasa_pt <- SolveIASA(pars = pars_solve_iasa, 
                          init = init_solve_iasa, 
                          time = 0:15,
                          alpha.owned = TRUE,
                          method = 'rk4')

## Set ranges 10 \% greater and lesser than the
## point estimates.
rg_solve_iasa <- SetRanges(pars = pars_solve_iasa)

## Calculate golobal sensitivity of combined parameters.
## To calculate global sensitivity to each parameter, set
## all as FALSE.
glob_all_solve_iasa <- CalculateGlobalSens(
  model.out = solve_iasa_pt,
  ranges = rg_solve_iasa, 
  sensv = "n2", all = TRUE)

### Plot the sensitivities of combined parameters.
PlotGlobalSens(glob_all_solve_iasa)

}
\references{
\url{http://oswaldosantos.github.io/capm}
}
\seealso{
\link[deSolve]{plot.deSolve}.
}
