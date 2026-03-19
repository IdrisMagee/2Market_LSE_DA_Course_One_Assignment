CREATE TABLE marketing_data (
    ID INT PRIMARY KEY,                      -- Unique customer ID
    Year_Birth INT,                           -- Customer’s year of birth
    AGE INT,                                  -- Customer's age
    Education TEXT,                           -- Educational qualification
    Marital_Status TEXT,                      -- Marital status
    Income_clean DECIMAL(15, 2),              -- Customer's annual income
    Kidhome INT,                              -- Number of kids the customer has
    Teenhome INT,                             -- Number of teenagers the customer has
    Clean_Dt_Customer DATE,                   -- Date of customer registration
    Recency INT,                              -- Number of days since last purchase
    AmtLiq DECIMAL(10, 2),                    -- Amount spent on alcoholic beverages
    AmtVege DECIMAL(10, 2),                   -- Amount spent on vegetables
    AmtNonVeg DECIMAL(10, 2),                 -- Amount spent on meat items
    AmtPes DECIMAL(10, 2),                    -- Amount spent on fish products
    AmtChocolates DECIMAL(10, 2),             -- Amount spent on chocolates
    AmtComm DECIMAL(10, 2),                   -- Amount spent on commodities
    NumDeals INT,                             -- Number of deals purchased with a discount
    NumWebBuy INT,                            -- Number of website purchases
    NumWalkinPur INT,                         -- Number of in-store purchases
    NumVisits INT,                            -- Number of website visits
    Response BOOLEAN,                         -- Whether the customer accepted the last campaign's offer
    Complain BOOLEAN,                         -- Whether the customer complained in the last 2 years
    Country TEXT,                             -- Customer's country (e.g., "SP" for Spain)
    Count_success INT                         -- Total number of successful lead conversions
);

COPY marketing_data (ID, Year_Birth, AGE, Education, Marital_Status, Income_clean, Kidhome, Teenhome, Clean_Dt_Customer, Recency, AmtLiq, AmtVege, AmtNonVeg, AmtPes, AmtChocolates, AmtComm, NumDeals, NumWebBuy, NumWalkinPur, NumVisits, Response, Complain, Country, Count_success)
FROM '/Users/Shared/marketing_data_cleaned.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM marketing_data;

CREATE TABLE ad_data (
    id INT PRIMARY KEY,                    -- Unique customer ID
    bulkmail_ad BOOLEAN,                    -- TRUE if successful lead conversion from Bulkmail Ad (1), FALSE if not (0)
    twitter_ad BOOLEAN,                     -- TRUE if successful lead conversion from Twitter Ad (1), FALSE if not (0)
    instagram_ad BOOLEAN,                   -- TRUE if successful lead conversion from Instagram Ad (1), FALSE if not (0)
    facebook_ad BOOLEAN,                    -- TRUE if successful lead conversion from Facebook Ad (1), FALSE if not (0)
    brochure_ad BOOLEAN                     -- TRUE if successful lead conversion from Brochure Ad (1), FALSE if not (0)
);

COPY ad_data (ID, bulkmail_ad, twitter_ad, instagram_ad, facebook_ad, brochure_ad)
FROM '/Users/Shared/ad_data.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM ad_data;

SELECT country,
       SUM(AmtLiq) AS total_spend_liq,
       SUM(AmtVege) AS total_spend_vege,
       SUM(AmtNonVeg) AS total_spend_nonveg,
       SUM(AmtPes) AS total_spend_pes,
       SUM(AmtChocolates) AS total_spend_chocolates,
       SUM(AmtComm) AS total_spend_comm,
       SUM(AmtLiq + AmtVege + AmtNonVeg + AmtPes + AmtChocolates + AmtComm) AS total_spend
FROM marketing_data
GROUP BY country
ORDER BY total_spend DESC;

SELECT Marital_Status, 
       SUM(AmtLiq) AS Total_Alcoholic,
       SUM(AmtVege) AS Total_Vegetables,
       SUM(AmtNonVeg) AS Total_Meat,
       SUM(AmtPes) AS Total_Fish,
       SUM(AmtChocolates) AS Total_Chocolates,
       SUM(AmtComm) AS Total_Commodities
FROM marketing_data
GROUP BY Marital_Status;

SELECT 
    (Kidhome > 0) AS Has_Kids,  
    SUM(AmtLiq) AS Total_Alcoholic,
    SUM(AmtVege) AS Total_Vegetables,
    SUM(AmtNonVeg) AS Total_Meat,
    SUM(AmtPes) AS Total_Fish,
    SUM(AmtChocolates) AS Total_Chocolates,
    SUM(AmtComm) AS Total_Commodities
FROM marketing_data
GROUP BY Has_Kids;

SELECT 
    (TeenHome > 0) AS Has_Teens,  
    SUM(AmtLiq) AS Total_Alcoholic,
    SUM(AmtVege) AS Total_Vegetables,
    SUM(AmtNonVeg) AS Total_Meat,
    SUM(AmtPes) AS Total_Fish,
    SUM(AmtChocolates) AS Total_Chocolates,
    SUM(AmtComm) AS Total_Commodities
FROM marketing_data
GROUP BY Has_Teens;

SELECT 
    (Kidhome > 0) AS Has_Kids,
    (Teenhome > 0) AS Has_Teens,
	(Kidhome + Teenhome > 0) AS Has_Kids_or_Teens,
    SUM(AmtLiq) AS Total_Alcoholic,
    SUM(AmtVege) AS Total_Vegetables,
    SUM(AmtNonVeg) AS Total_Meat,
    SUM(AmtPes) AS Total_Fish,
    SUM(AmtChocolates) AS Total_Chocolates,
    SUM(AmtComm) AS Total_Commodities
FROM marketing_data
GROUP BY Has_Kids, Has_Teens, Has_Kids_or_Teens;
