\name{PlotGlobalSens}
\alias{PlotGlobalSens}
\title{Plot results of GlobalSens function}
\usage{
PlotGlobalSens(global.out = NULL, x.label = "Time",
  y.label = "Population", nam.leg = "Sensitivity range",
  mm.leg = "min - max", sd.leg = "mean +- sd   ")
}
\arguments{
  \item{global.out}{output from
  \code{\link{CalculateGlobalSens}} function.}

  \item{nam.leg}{string with name for the legend.}

  \item{x.label}{string with the name of x axis.}

  \item{y.label}{string with the name of y axis.}

  \item{mm.leg}{string with the name of the "envelope"
  calculated using the minimum and maximum ranges.}

  \item{sd.leg}{string with the name of the "envelope"
  calculated using the mean +- standard deviation ranges.}
}
\description{
Plot results of of \code{\link{CalculateGlobalSens}}
function.
}
\details{
Font size of saved plots is usually different to the font
size seen in graphic browsers. Before changing font sizes,
see the final result in saved (or preview) plots.

Other details of the plot can be modifyed using appropriate
functions from \code{ggplot2} package.
}
\examples{
#####################
## SolveIASA model ##
#####################

## Parameters and intial conditions.
pars.solve.iasa = c(
   b1 = 21870.897, b2 = 4374.179,
   df1 = 0.104, dm1 = 0.098, df2 = 0.1248, dm2 = 0.1176,
   sf1 = 0.069, sf2 = 0.05, sm1 = 0.028, sm2 = 0.05,
   k1 = 98050.49, k2 = 8055.456, h1 = 1, h2 = .5,
   ab = 0.054, ad = 0.1, v = 0.2, z = 0.1)

init.solve.iasa = c(
   f1 = 33425.19, fs1 = 10864.901,
   m1 = 38038.96, ms1 = 6807.759,
   f2 = 3342.519, fs2 = 108.64901,
   m2 = 3803.896, ms2 = 68.07759)


# Solve for point estimates.
solve.iasa.pt <- SolveIASA(pars = pars.solve.iasa,
                          init = init.solve.iasa,
                          time = 0:15, method = 'rk4')

## Set ranges 10 \% greater and lesser than the
## point estimates.
rg.solve.iasa <- SetRanges(pars = pars.solve.iasa)

## Calculate golobal sensitivity of combined parameters.
## To calculate global sensitivity to each parameter, set
## all as FALSE.
glob.all.solve.iasa <- CalculateGlobalSens(
  model.out = solve.iasa.pt,
  ranges = rg.solve.iasa,
  sensv = 'n2', all = TRUE)

### Plot the sensitivities of combined parameters.
PlotGlobalSens(glob.all.solve.iasa)
}
\references{
\url{http://oswaldosantos.github.io/capm}
}
\seealso{
\link[deSolve]{plot.deSolve}.
}
