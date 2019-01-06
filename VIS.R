
# R VIS

# Scatterplot

data("countries")
sc<- c("Canada", "Ireland", "United Kingdom", "United States",
       "New Zealand", "Iceland", "Japan", "Luxembourg", 
       "Netherlands", "Switzerland")

# Encoding GDP with size channel using point mark/geom
countries %>%
    filter(Year == 2009) %>%
    filter(Name %in% sc) %>%
    ggplot(aes(x= healthexp, y= infmortality, size= GDP)) +
    geom_point(shape= 21, colour= "black", fill= "cornsilk") +
    scale_size_area(max_size= 15)


data("heightweight")
hw<- heightweight
# Encoding weight with gradient color
ggplot(hw, aes(x= ageYear, y= heightIn, colour= weightLb)) +
    geom_point(size= 3) +
    scale_color_gradient(low= "black", high= "white")

data("mlb11")
ml<- mlb11

# Strong, positive linear relationship with trendline and standard errors
ggplot(ml, aes(x= new_obs, y= runs)) + geom_point() +
    stat_smooth(method= "lm", se= TRUE)

# Line chart

data(BOD)
# Simple line chart: demand over time
ggplot(BOD, aes(x= Time, y= demand)) + geom_line() + geom_point()

# I'm sorry. I just like area charts. 
ggplot(uspopage, aes(x= Year, y= Thousands, fill= AgeGroup)) +
    geom_area()

# Same data, but more custom
ggplot(uspopage, aes(x= Year, y= Thousands, fill= AgeGroup, 
                     order=desc(AgeGroup))) +
    geom_area(colour= NA, alpha= .4) +
    scale_fill_brewer(palette= "BuPu") +
    geom_line(position= "stack", size= .2)

# Bar chart

data("diamonds")
d<- diamonds
ggplot(d, aes(x= cut)) + geom_bar()
ggplot(d, aes(x= cut, fill= cut)) + geom_bar()
# Stacked bar chart
ggplot(d, aes(x= cut, fill= color)) + geom_bar()

# Y axis is value, not count
countries %>% filter(Year== "2009") %>%
    filter(GDP > 63524) %>%
    arrange(desc(GDP)) %>%
    ungroup() %>%
    ggplot(aes(x= Name, y= GDP)) +
    labs(x= NULL, y= "GDP") +
    ggtitle("GDP by Country") +
    geom_bar(stat= "identity", fill= "green", colour= "blue") 
    
    

  
    


