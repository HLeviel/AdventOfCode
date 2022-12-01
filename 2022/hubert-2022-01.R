library(tidyverse)

input = "c:/Users/hlevi/Downloads/aoc2022_1a"

elves <- tibble( food_calorie = read_lines( input ) ) %>%
  mutate( food_calorie = as.integer( food_calorie ) ,
          separator = is.na( food_calorie ),
          elf_id = cumsum( separator )) %>%
  group_by( elf_id ) %>% 
  summarise( total_calories = sum( food_calorie, na.rm = TRUE ),
             .groups = "drop" )

# Réponse 1
elves %>% 
  summarise( maximum = max( total_calories ))

# Réponse 2
elves %>%
  slice_max( total_calories, n = 3 ) %>%
  summarise( top_3_total = sum( total_calories ) )
