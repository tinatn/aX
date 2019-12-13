library(dplyr)
library(ggplot2)

ufos <- read.csv("data/scrubbed.csv", stringsAsFactors = FALSE)

sightings_by_state <- ufos %>%
  filter(country == "us")

occurrences <- sightings_by_state %>%
  group_by(state) %>%
  summarize(count = n())

occurrences_by_state <- ggplot(data = occurrences) +
  geom_col(mapping = aes(x = reorder(state, -count), y = count), fill = "#FCD33D") +
  ggtitle("Occurrences by State") + 
  labs(x = "State", y = "Occurrences") +
  theme(axis.text.x=element_text(angle=70, size=13, vjust=0.5))

