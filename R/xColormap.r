#' Function to define a colormap
#'
#' \code{xColormap} is supposed to define a colormap. It returns a function, which will take an integer argument specifying how many colors interpolate the given colormap.
#'
#' @param colormap short name for the colormap. It can be one of "jet" (jet colormap), "bwr" (blue-white-red colormap), "gbr" (green-black-red colormap), "wyr" (white-yellow-red colormap), "br" (black-red colormap), "yr" (yellow-red colormap), "wb" (white-black colormap), "rainbow" (rainbow colormap, that is, red-yellow-green-cyan-blue-magenta), and "ggplot2" (emulating ggplot2 default color palette). Alternatively, any hyphen-separated HTML color names, e.g. "lightyellow-orange" (by default), "blue-black-yellow", "royalblue-white-sandybrown", "darkgreen-white-darkviolet". A list of standard color names can be found in \url{http://html-color-codes.info/color-names}. It can also be a function of 'colorRampPalette'
#' @param interpolate use spline or linear interpolation
#' @param data NULL or a numeric vector
#' @param zlim the minimum and maximum z/patttern values for which colors should be plotted, defaulting to the range of the finite values of z. Each of the given colors will be used to color an equispaced interval of this range. The midpoints of the intervals cover the range, so that values just outside the range will be plotted
#' @return 
#' palette.name (a function that takes an integer argument for generating that number of colors interpolating the given sequence) or mapped colors if data is provided.
#' @note The input colormap includes: 
#' \itemize{
#' \item{"jet": jet colormap}
#' \item{"bwr": blue-white-red}
#' \item{"gbr": green-black-red}
#' \item{"wyr": white-yellow-red}
#' \item{"br": black-red}
#' \item{"yr": yellow-red}
#' \item{"wb": white-black}
#' \item{"rainbow": rainbow colormap, that is, red-yellow-green-cyan-blue-magenta}
#' \item{"ggplot2": emulating ggplot2 default color palette}
#' \item{"spectral": emulating RColorBrewer spectral color palette}
#' \item{Alternatively, any hyphen-separated HTML color names, e.g. "blue-black-yellow", "royalblue-white-sandybrown", "darkblue-lightblue-lightyellow-darkorange", "darkgreen-white-darkviolet", "darkgreen-lightgreen-lightpink-darkred". A list of standard color names can be found in \url{http://html-color-codes.info/color-names}}
#' }
#' @export
#' @include xColormap.r
#' @examples
#' # 1) define "blue-white-red" colormap
#' palette.name <- xColormap(colormap="bwr")
#' # use the return function "palette.name" to generate 10 colors spanning "bwr"
#' palette.name(10)
#' 
#' # 2) define default colormap from ggplot2
#' palette.name <- xColormap(colormap="ggplot2")
#' # use the return function "palette.name" to generate 3 default colors used by ggplot2
#' palette.name(3)
#' 
#' # 3) define brewer colormap called "RdYlBu"
#' palette.name <- xColormap(colormap="RdYlBu")
#' # use the return function "palette.name" to generate 3 default colors used by ggplot2
#' palette.name(3)
#' 
#' # 4) return mapped colors
#' xColormap(colormap="RdYlBu", data=runif(5))

xColormap <- function(colormap=c("bwr","jet","gbr","wyr","br","yr","rainbow","wb","heat","terrain","topo","cm","ggplot2","jet.top","jet.bottom","jet.both","spectral","ggplot2.top","ggplot2.bottom","ggplot2.both","RdYlBu","rainbow_hcl"), interpolate=c("spline","linear"), data=NULL, zlim=NULL)
{

	interpolate <- match.arg(interpolate)
	
	if(class(colormap)=='function'){
		palette.name <- colormap
		
	}else{
	
		if(length(colormap)>1){
			colormap <- colormap[1]
		}
	
		## http://www.cbs.dtu.dk/~eklund/squash/
	
		if(colormap=='ggplot2'){
	
			my_hue_pal <- function (h = c(0, 360) + 15, c = 100, l = 65, h.start = 0, direction = 1){
				function(n) {
					if ((diff(h)%%360) < 1) {
						h[2] <- h[2] - 360/n
					}
					rotate <- function(x)(x + h.start)%%360 * direction
					hues <- rotate(seq(h[1], h[2], length.out = n))
					grDevices::hcl(hues, c, l)
				}
			}
			palette.name <- my_hue_pal(h=c(0,360)+15, c=100, l=65, h.start=0, direction=1)
		
		}else if(colormap == "jet.top"){
			palette.name <-colorRampPalette(c("#7FFF7F", "yellow", "#FF7F00", "red", "#7F0000")[-5], interpolate=interpolate)
		}else if(colormap == "jet.bottom"){
			palette.name <-colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan", "#7FFF7F")[-5], interpolate=interpolate)
		}else if(colormap == "jet.both"){
			palette.name <-colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan", "#7FFF7F", "yellow", "#FF7F00", "red", "#7F0000")[c(-1,-9)], interpolate=interpolate)
		
		}else if(colormap == "ggplot2.top"){
			palette.name <-colorRampPalette(c("#00C19F","#00B9E3","#619CFF","#DB72FB","#FF61C3"), interpolate=interpolate)
		}else if(colormap == "ggplot2.bottom"){
			palette.name <-colorRampPalette(c("#F8766D","#D39200","#93AA00","#00BA38","#00C19F"), interpolate=interpolate)
		}else if(colormap == "ggplot2.both"){
			palette.name <-colorRampPalette(c("#F8766D","#D39200","#93AA00","#00BA38","#00C19F","#00B9E3","#619CFF","#DB72FB","#FF61C3")[c(-1,-9)], interpolate=interpolate)
		
		}else if(colormap == "spectral"){
			palette.name <-colorRampPalette(rev(c('#D53E4F','#F46D43','#FDAE61','#FEE08B','#FFFFBF','#E6F598','#ABDDA4','#66C2A5','#3288BD')), interpolate=interpolate)

		}else if(colormap == "spectral.both"){
			palette.name <-colorRampPalette(rev(c('#D53E4F','#F46D43','#FDAE61','#FEE08B','#FFFFBF','#E6F598','#ABDDA4','#66C2A5','#3288BD'))[c(-1,-9)], interpolate=interpolate)
		}else if(colormap == "spectral.top"){
			palette.name <-colorRampPalette(rev(c('#D53E4F','#F46D43','#FDAE61','#FEE08B','#FFFFBF')), interpolate=interpolate)
		}else if(colormap == "spectral.bottom"){
			palette.name <-colorRampPalette(rev(c('#FFFFBF','#E6F598','#ABDDA4','#66C2A5','#3288BD')), interpolate=interpolate)
		
		}else if(colormap == "RdYlBu"){
			palette.name <-colorRampPalette(rev(c("#A50026","#D73027","#F46D43","#FDAE61","#FEE090","#FFFFBF","#E0F3F8","#ABD9E9","#74ADD1","#4575B4","#313695")), interpolate=interpolate)
			
		}else if(colormap == "rainbow_hcl"){
			#via: noquote(paste0(rainbow_hcl(7),collapse='","'))
			palette.name <-colorRampPalette(c("#E495A5","#CEA472","#9CB469","#56BD96","#46BAC8","#99A9E2","#D497D3"), interpolate=interpolate)
		
		}else if(colormap == "heat"){
			palette.name <- grDevices::heat.colors
		}else if(colormap == "terrain"){
			palette.name <- grDevices::terrain.colors
		}else if(colormap == "topo"){
			palette.name <- grDevices::topo.colors
		}else if(colormap == "cm"){
			palette.name <- grDevices::cm.colors
		
		}else{
			palette.name <- supraHex::visColormap(colormap=colormap)
		}
	}
	
	########################################
	## return mapped colors
	if(!is.null(data)){	
		if(is.numeric(data)){
			############################
			if(is.null(zlim)){
				vmin <- floor(stats::quantile(data, 0.05))
				vmax <- ceiling(stats::quantile(data, 0.95))
				if(vmin < 0 & vmax > 0){
					vsym <- abs(min(vmin, vmax))
					vmin <- -1*vsym
					vmax <- vsym
				}
				zlim <- c(vmin,vmax)
			}
			data[data<zlim[1]] <- zlim[1]
			data[data>zlim[2]] <- zlim[2]
			############################
			cut_index <- as.numeric(cut(data, breaks=min(data)+(max(data)-min(data))*seq(0, 1, len=64)))
			cut_index[is.na(cut_index)] <- 1
			res <- palette.name(64)[cut_index]
			return(res)
		}
	}
	########################################
		
    invisible(palette.name)
}
