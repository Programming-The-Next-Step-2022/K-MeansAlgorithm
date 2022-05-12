### Project Programming: The Next Step
### Rolien van de Geer
### Master Brain and Cognitive Sciences
### University of Amsterdam

## This algorithm groups data points into disctinct non-overlappig groups.


#just an example function to test if I can export a function to namespace

#' @export
w = "apple"

#' @export
v = function(x){
  y <- strsplit(x, " ", )
  v <- 0
  for(z in unlist(y)){if(z == w){v = v +1}}
  if(v > 0) return(T)
}
v("i bought two bananas and an apple")


## Not forget this:

# if you use other packages you have to import them in the description

# more information: R packages





