# CBB-Analysis
Visit the site here: https://edward-xiao.shinyapps.io/CBB-Analysis/


Have you ever wondered what was the most important factor for winning in College Basketball?
This web app looks at College Basketball Efficiency Metrics and plots the correlation of the metric with wins and prints out the correlation coefficient so you can see which metric correlates the most with wins.

Using data from Andrew Sundberg on Kaggle (https://www.kaggle.com/andrewsundberg/college-basketball-dataset) who scraped the data from https://barttorvik.com/trank.php#, the web app allows the user to filter through which efficiency metric to compare to wins as well as choosing which year they want to look at (2015-2020).  

For example the user can choose Adjusted Offensive Efficiency (ADJOE) and the year 2020, and find a detailed plot of Division 1 teams and what their ADJOE rating was along with the wins while displaying the correlation coefficient of .6975, while also being color coded by the conference.  

# Usage

Site URL: https://edward-xiao.shinyapps.io/CBB-Analysis/

Choose an efficiency metric and year to see the results!

# Creation

Front end written using Shiny which is an R package that helps build interactive web apps on R
Back end written using r data operations and the displayed plot was written using ggplot2 which is an R package that helps build graphs

# Data

All data is from https://www.kaggle.com/andrewsundberg/college-basketball-dataset
