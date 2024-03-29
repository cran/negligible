% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/neg.srmr.R
\name{neg.srmr}
\alias{neg.srmr}
\alias{print.neg.srmr}
\title{Equivalence Tests for SRMR}
\usage{
neg.srmr(
  mod,
  alpha = 0.05,
  eq.bound,
  modif.eq.bound = FALSE,
  ci.method = "MO",
  usrmr = TRUE,
  nboot = 250L,
  round = 3
)

\method{print}{neg.srmr}(x, ...)
}
\arguments{
\item{mod}{lavaan model object}

\item{alpha}{desired alpha level (default = .05)}

\item{eq.bound}{upper bound of equivalence interval for comparison; must be .05 or .10 if modif.eq.bound = TRUE}

\item{modif.eq.bound}{should the upper bound of the equivalence interval be modified? (default = FALSE)}

\item{ci.method}{method used to calculate confidence interval; options are "MO" or "yhy.boot"; "MO" corresponds to (1-2alpha) percent CI, "yhy.boot" corresponds to (1-2alpha) percent boot CI (default = "MO")}

\item{usrmr}{fit index around which equivalence test should be structured (usrmr = TRUE which is the default states that usrmr from Maydeu-Olivares, 2017 will be used, otherwise srmr from fitmeasures() output in lavaan will be used)}

\item{nboot}{number of bootstrap samples if "yhy.boot" is selected as ci.method (default = 250L)}

\item{round}{number of digits to round equivalence bound and confidence interval bounds (default = 3)}

\item{x}{object of class \code{neg.srmr}}

\item{...}{extra arguments}
}
\value{
returns a \code{list} including the following:
\itemize{
   \item \code{title1} The title of the SRMR equivalence test. The appropriate title of the test will be displayed depending on the ci.method chosen whether usrmr and modif.eq.bound are TRUE or FALSE.
   \item \code{srmr_index} The SRMR index.
   \item \code{ci.method} The method for confidence interval calculation (direct computation or bootstrap).
   \item \code{srmr_ci} The upper bound of the 1-2*alpha confidence interval for the RMSEA index.
   \item \code{eq.bound} The equivalence bound.
   \item \code{PD} Proportional distance (PD).
   \item \code{cilpd} Lower bound of the 1-alpha CI for the PD.
   \item \code{ciupd} Upper bound of the 1-alpha CI for the PD.
}
}
\description{
Function performs one of four equivalence tests for SRMR fit index.
}
\details{
The user specifies the lavaan fitted model object, the desired equivalence bound, the method of confidence interval computation, and whether unbiased SRMR or original SRMR should be used. By default, the function does not modify the equivalence bounds. The user can also choose to instead run an equivalence test using a modified equivalence bound of .05 or .10 multiplied by the average communality of the observed indicators. Alpha level can also be modified.

For information on unbiased SRMR and its confidence interval computation see Maydeu-Olivares, A. (2017). Maximum likelihood estimation of structural equation models for continuous data: Standard errors and goodness of fit. Structural Equation Modeling: A Multidisciplinary Journal, 24(3), 383-394. https://doi.org/10.1080/10705511.2016.1269606
}
\examples{
d <- lavaan::HolzingerSwineford1939
hs.mod <- 'visual =~ x1 + x2 + x3
textual =~ x4 + x5 + x6
speed =~ x7 + x8 + x9'
fit1 <- lavaan::cfa(hs.mod, data = d)
neg.srmr(mod=fit1,alpha=.05,eq.bound=.08,usrmr = TRUE)
}
\author{
Rob Cribbie \email{cribbie@yorku.ca} and
  Nataly Beribisky \email{natalyb1@yorku.ca}
}
