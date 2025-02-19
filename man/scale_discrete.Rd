% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scale-discrete-.r
\name{scale_x_discrete}
\alias{scale_x_discrete}
\alias{scale_y_discrete}
\title{Position scales for discrete data}
\usage{
scale_x_discrete(..., expand = waiver(), guide = waiver(), position = "bottom")

scale_y_discrete(..., expand = waiver(), guide = waiver(), position = "left")
}
\arguments{
\item{...}{
  Arguments passed on to \code{\link[=discrete_scale]{discrete_scale}}
  \describe{
    \item{\code{palette}}{A palette function that when called with a single integer
argument (the number of levels in the scale) returns the values that
they should take (e.g., \code{\link[scales:hue_pal]{scales::hue_pal()}}).}
    \item{\code{breaks}}{One of:
\itemize{
\item \code{NULL} for no breaks
\item \code{waiver()} for the default breaks (the scale limits)
\item A character vector of breaks
\item A function that takes the limits as input and returns breaks
as output. Also accepts rlang \link[rlang:as_function]{lambda} function
notation.
}}
    \item{\code{limits}}{One of:
\itemize{
\item \code{NULL} to use the default scale values
\item A character vector that defines possible values of the scale and their
order
\item A function that accepts the existing (automatic) values and returns
new ones. Also accepts rlang \link[rlang:as_function]{lambda} function
notation.
}}
    \item{\code{drop}}{Should unused factor levels be omitted from the scale?
The default, \code{TRUE}, uses the levels that appear in the data;
\code{FALSE} uses all the levels in the factor.}
    \item{\code{na.translate}}{Unlike continuous scales, discrete scales can easily show
missing values, and do so by default. If you want to remove missing values
from a discrete scale, specify \code{na.translate = FALSE}.}
    \item{\code{na.value}}{If \code{na.translate = TRUE}, what aesthetic value should the
missing values be displayed as? Does not apply to position scales
where \code{NA} is always placed at the far right.}
    \item{\code{aesthetics}}{The names of the aesthetics that this scale works with.}
    \item{\code{scale_name}}{The name of the scale that should be used for error messages
associated with this scale.}
    \item{\code{name}}{The name of the scale. Used as the axis or legend title. If
\code{waiver()}, the default, the name of the scale is taken from the first
mapping used for that aesthetic. If \code{NULL}, the legend title will be
omitted.}
    \item{\code{labels}}{One of:
\itemize{
\item \code{NULL} for no labels
\item \code{waiver()} for the default labels computed by the
transformation object
\item A character vector giving labels (must be same length as \code{breaks})
\item An expression vector (must be the same length as breaks). See ?plotmath for details.
\item A function that takes the breaks as input and returns labels
as output. Also accepts rlang \link[rlang:as_function]{lambda} function
notation.
}}
    \item{\code{super}}{The super class to use for the constructed scale}
  }}

\item{expand}{For position scales, a vector of range expansion constants used to add some
padding around the data to ensure that they are placed some distance
away from the axes. Use the convenience function \code{\link[=expansion]{expansion()}}
to generate the values for the \code{expand} argument. The defaults are to
expand the scale by 5\% on each side for continuous variables, and by
0.6 units on each side for discrete variables.}

\item{guide}{A function used to create a guide or its name. See
\code{\link[=guides]{guides()}} for more information.}

\item{position}{For position scales, The position of the axis.
\code{left} or \code{right} for y axes, \code{top} or \code{bottom} for x axes.}
}
\description{
\code{scale_x_discrete()} and \code{scale_y_discrete()} are used to set the values for
discrete x and y scale aesthetics. For simple manipulation of scale labels
and limits, you may wish to use \code{\link[=labs]{labs()}} and \code{\link[=lims]{lims()}} instead.
}
\details{
You can use continuous positions even with a discrete position scale -
this allows you (e.g.) to place labels between bars in a bar chart.
Continuous positions are numeric values starting at one for the first
level, and increasing by one for each level (i.e. the labels are placed
at integer positions).  This is what allows jittering to work.
}
\examples{
ggplot(diamonds, aes(cut)) + geom_bar()

\donttest{
# The discrete position scale is added automatically whenever you
# have a discrete position.

(d <- ggplot(subset(diamonds, carat > 1), aes(cut, clarity)) +
      geom_jitter())

d + scale_x_discrete("Cut")
d +
  scale_x_discrete(
    "Cut",
    labels = c(
      "Fair" = "F",
      "Good" = "G",
      "Very Good" = "VG",
      "Perfect" = "P",
      "Ideal" = "I"
    )
  )

# Use limits to adjust the which levels (and in what order)
# are displayed
d + scale_x_discrete(limits = c("Fair","Ideal"))

# you can also use the short hand functions xlim and ylim
d + xlim("Fair","Ideal", "Good")
d + ylim("I1", "IF")

# See ?reorder to reorder based on the values of another variable
ggplot(mpg, aes(manufacturer, cty)) +
  geom_point()
ggplot(mpg, aes(reorder(manufacturer, cty), cty)) +
  geom_point()
ggplot(mpg, aes(reorder(manufacturer, displ), cty)) +
  geom_point()

# Use abbreviate as a formatter to reduce long names
ggplot(mpg, aes(reorder(manufacturer, displ), cty)) +
  geom_point() +
  scale_x_discrete(labels = abbreviate)
}
}
\seealso{
Other position scales: 
\code{\link{scale_x_binned}()},
\code{\link{scale_x_continuous}()},
\code{\link{scale_x_date}()}
}
\concept{position scales}
