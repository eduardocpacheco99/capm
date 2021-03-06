#' Dog population
#'
#' Hypothetical owned dog population.
#'
#' @format A data frame with 44233 observations and 15 variables:
#' \describe{
#'   \item{track_id}{Census track ID from Santos, Brazil.}
#'   \item{hh_id}{Household ID.}
#'   \item{name}{Dog's name.}
#'   \item{sex}{Dog's sex.}
#'   \item{age}{Dog's age. An age equal to 0 means that the dog had less than 1 year.}
#'   \item{sterilized}{Dog's reproductive status.}
#'   \item{sterilized_last_year}{For sterilized dogs, indicates if the dog was sterilized in the previous 12 months.}
#'   \item{free_roaming}{Indicates if the dog had access to the street without supervision.}
#'   \item{acquisition}{Way of acquisition}
#'   \item{acquired_last_year}{Indicates if the dog was acquired in the previous 12 months.}
#'   \item{acquired_sterilized}{Indicates if the dog was sterilized when acquired.}
#'   \item{acquisition_city}{City of acquisition.}
#'   \item{acquisition_state}{State of acquisition.}
#'   \item{turnover_last_year}{Indicates if the dog was acquired in the 12 months following the lost of another .}
#'   \item{litter_size_last_year}{Litter size if the bitch had the litter in the previous 12 months.}
#' }
"dogs"