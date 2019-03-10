library(readr)
data_plotly <- read_csv("data_plotly.csv")
View(data_plotly)
library(rbokeh)
library(dplyr)
data_plotly_2<-data_plotly %>% filter (Year == "2015" & Continent %in% c("Europe","Africa","N.America","S.America","Oceania"))


tools <- c("pan", "wheel_zoom", "box_zoom", "box_select", "reset")


dp1 <- figure(tools = tools, width = 500, height = 500, title="Population VS HDI") %>%
  ly_points(Population, HDI, data = data_plotly_2, color = Continent,
            hover = list(Country, Continent, HDI, Life_Expectancy, Population)) %>% x_axis(number_formatter = "numeral", format = "0,000")

dp1

dp2<- figure (tools = tools, width = 500, height = 500, title = "Population VS Life Expectancy") %>%
  ly_points (Population, Life_Expectancy,data = data_plotly_2, color = Continent,
             hover= list (Country, Continent, HDI, Life_Expectancy, Population)) %>% x_axis(number_formatter = "numeral", format = "0,000")

dp2

grid_plot(list(dp1, dp2), link_data = TRUE)


grid_plot(list(dp1, dp2), link_data = TRUE)  %>%
  theme_title(text_color = "red") %>%
  theme_plot(background_fill_color = "#E6E6E6",
             outline_line_color = "white") %>%
  theme_grid(c("x", "y"), grid_line_color = "white",
             minor_grid_line_color = "white",
             minor_grid_line_alpha = 0.4) %>%
  theme_axis(c("x", "y"), axis_line_color = "white",
             major_label_text_color = "#7F7F7F",
             major_tick_line_color = "#7F7F7F",
             minor_tick_line_alpha = 0, num_minor_ticks = 2)