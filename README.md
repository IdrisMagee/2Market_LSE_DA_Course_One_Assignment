# 2Market_LSE_DA_Course_One_Assignment
Analysis of a Global Supermarket: 2Market

## The Business Problem
Using the ‘FIVE WHYS’ we can determine 2Market wants to
understand how demographic insights impact customer purchase behaviour, which
we will define as patterns and trends in how 2Market’s customers make buying
decision, including how this impacts advertising effectiveness. As such we have
created the following problem statement.

## Problem Statement
2Market is a global supermarket operating both online and in-store, aiming to better
understand their customers’ purchase behaviour. They want to firstly identify key
demographics and then determine and evaluate which products perform best overall
and within these demographics while also evaluating the effectiveness of advertising
channels upon these.

## Analytical Approach
Our first step was importing the raw data into Excel. We cleaned it by checking for
missing values, noticing gaps in ID sequences that raised questions about data
completeness. We removed 47 duplicates after visual inspection using conditional
formatting. We also addressed invalid entries, removing "Yolo" and "Absurd"—
retaining "Alone" as a valid category for single customers.
Formatting issues were resolved: for instance, inconsistent date formats in the
“Dt_Customer” column were cleaned using TEXTSPLIT, then reformatted into a
standard DATE format. We removed currency symbols from the "Income" column
using Excel’s REPLACE function and flagged an outlier income of $666,666.00 for
deletion. Age was calculated using =2016 - [Year_Birth], assuming 2016 was the
year of data collection.
After cleaning, we conducted descriptive statistical analysis (e.g., quartiles,
interquartile range) to identify outliers and understand distribution skews— we
removed outliers in visulisations when necessary. We used pivot tables to
summarize data and identify trends across demographics.
Next, we used PostgreSQL to continue our analysis. We created tables to store the
cleaned data and queried them based on demographic characteristics. Using joins
across tables via the ID field, we aggregated data on advertising conversions. Since
conversion fields were Boolean, we cast them as integers to count conversions by
channel across demographics.
These steps gave us a structured and clean dataset, enabling further exploration in
Tableau. Our SQL queries allowed us to examine patterns in purchase behavior and
advertising effectiveness, forming the backbone for dashboard visualizations and
stakeholder recommendations.

## Dashboard Design and Development
We developed four dashboards tailored to the needs of different stakeholders. Our
guiding principles were clarity, accessibility, interactivity, and consistency in visual
elements like colour and layout.

### Dashboard 1: Demographic Overview
This high-level dashboard targets executives and store managers who need quick
insights. It uses simple bar and pie charts to show the largest customer segments
across demographics such as age, income, marital status, and household size.
Orange highlights the largest groups consistently. A “Customer Profile” section
summarizes key findings.

### Dashboard 2: Demographic Insights
Designed for deeper exploration, this dashboard targets marketing analysts. A
scatter plot (“Income vs Age”) suggests a positive correlation between age and
income. Box plots illustrate income distribution across household size, education,
marital status, and nationality. These visuals emphasize disparities, e.g., lower
income among households with children and customers with only basic education.

### Dashboard 3: Purchase Behaviour
This interactive dashboard allows filtering by demographic traits to examine
purchase behaviour. Product spending is shown through bar charts to assess which
groups spend the most and on what categories. This helps analysts identify product
preferences by segment and develop targeted promotions.

### Dashboard 4: Advertising Data Insights
Focused on ad performance, this dashboard compares conversion counts across
platforms like Twitter, Instagram, Facebook, bulk mail, and brochures. A highlight
table allows for quick comparisons by country and demographic. For example,
Twitter and Instagram performed well in high-income segments, while bulk mail was
more effective with lower-income customers.

In terms of layout, we used a clean grid system and moderate white space.
Interactive filters were added to facilitate user-driven exploration, while legends and
labels were clearly defined. Accessibility considerations included legible font sizes
and colourblind-friendly palettes.

Together, these dashboards provide both high-level overviews and in-depth analytics
for strategic decision-making.

## Patterns, Trends, and Insights
From our analysis, we identified a typical 2Market customer: aged 40–45, married,
with a graduate education, earning $30,000–$40,000, and living in Spain with
children or teens. Income showed a positive correlation with age and was higher
among households without children and those with more education. Nationality and
marital status had minimal impact on income variance.
Purchase behaviour revealed that alcoholic beverages and meat products were the
most frequently purchased categories across countries.
Advertising analysis found Twitter and Instagram to be the most effective channels
overall. Bulk mail was more effective for lower-income segments, highlighting the
importance of tailored advertising.
