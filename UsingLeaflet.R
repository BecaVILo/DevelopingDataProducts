## The largest beer producing countries in the world in 2018

library(leaflet)

# Looking fot the icons
China <- makeIcon(
  iconUrl = "https://www.flaticon.es/svg/static/icons/svg/323/323363.svg",
  iconWidth = 31*215/230, iconHeight = 31,
  iconAnchorX = 31*215/230/2, iconAnchorY = 16
)

UnitedStates <- makeIcon(
  iconUrl = "https://www.flaticon.es/svg/static/icons/svg/323/323310.svg",
  iconWidth = 31*215/230, iconHeight = 31,
  iconAnchorX = 31*215/230/2, iconAnchorY = 16
)

Brazil <- makeIcon(
  iconUrl = "https://www.flaticon.es/svg/static/icons/svg/3909/3909370.svg",
  iconWidth = 31*215/230, iconHeight = 31,
  iconAnchorX = 31*215/230/2, iconAnchorY = 16
)

Mexico <- makeIcon(
  iconUrl = "https://www.flaticon.es/svg/static/icons/svg/206/206600.svg",
  iconWidth = 31*215/230, iconHeight = 31,
  iconAnchorX = 31*215/230/2, iconAnchorY = 16
)

Germany <- makeIcon(
  iconUrl = "https://www.flaticon.es/svg/static/icons/svg/323/323332.svg",
  iconWidth = 31*215/230, iconHeight = 31,
  iconAnchorX = 31*215/230/2, iconAnchorY = 16
)

Russia <- makeIcon(
  iconUrl = "https://www.flaticon.es/svg/static/icons/svg/323/323300.svg",
  iconWidth = 31*215/230, iconHeight = 31,
  iconAnchorX = 31*215/230/2, iconAnchorY = 16
)

Japan <- makeIcon(
  iconUrl = "https://www.flaticon.es/svg/static/icons/svg/197/197604.svg",
  iconWidth = 31*215/230, iconHeight = 31,
  iconAnchorX = 31*215/230/2, iconAnchorY = 16
)

Vietnam <- makeIcon(
  iconUrl = "https://www.flaticon.es/svg/static/icons/svg/197/197473.svg",
  iconWidth = 31*215/230, iconHeight = 31,
  iconAnchorX = 31*215/230/2, iconAnchorY = 16
)

UnitedKigdom <- makeIcon(
  iconUrl = "https://www.flaticon.es/svg/static/icons/svg/323/323329.svg",
  iconWidth = 31*215/230, iconHeight = 31,
  iconAnchorX = 31*215/230/2, iconAnchorY = 16
)

Poland <- makeIcon(
  iconUrl = "https://www.flaticon.es/svg/static/icons/svg/197/197529.svg",
  iconWidth = 31*215/230, iconHeight = 31,
  iconAnchorX = 31*215/230/2, iconAnchorY = 16
)

# Set the icosn in a list
iconSet <- iconList(China= China,
                    UnitedStates = UnitedStates,
                    Brazil = Brazil,
                    Mexico = Mexico,
                    Germany = Germany,
                    Russia = Russia,
                    Japan = Japan,
                    Vietnam = Vietnam,
                    UnitedKigdom = UnitedKigdom,
                    Poland = Poland)

## Doing the data frame
TopCountries <- data.frame(country = c("China", "UnitedStates", "Brazil", "Mexico", 
                                       "Germany","Russia","Japan","Vietnam","UnitedKigdom",
                                       "Poland"),
                           lat = c(39.9075,38.89511,-23.5475,19.42847,52.52437,62.965840,35.35,14.058324,55.378051,	51.919438),
                           lng = c(116.39723,-77.03637,-46.63611,-99.12766,13.41053,95.522021,137.18333,108.277199,-3.435973,19.145136),
                           prod = c(381.2, 214.61, 141.38, 119.8, 93.65, 77.47, 52.64, 43, 41.53,40.93))

## Doing the map
TopCountries %>%
  leaflet() %>%
  addTiles() %>%
  addProviderTiles(providers$Esri.NatGeoWorldMap) %>%
  addMarkers(~lat, lng = ~lng, icon = ~iconSet[country],
             popup = paste(sep = "<br/>", TopCountries$country, TopCountries$prod))



# SecondGraphic -----------------------------------------------------------
library(ggplot2)

g <- ggplot(TopCountries, aes(x = reorder(country, +prod), y = prod)) +
  geom_bar(stat = "identity", fill=rgb(0.1,0.4,0.5,0.7)) +
  ggtitle("The largest beer producing countries in the world in 2018") +
  coord_flip() +
  xlab(" ") + ylab(" ")
g



# Table -------------------------------------------------------------------
library(knitr)

r <- cbind(TopCountries$country, TopCountries$prod)
kable(r, col.names = c("Country", "hectoliters (in millions)"),align = 'c')
