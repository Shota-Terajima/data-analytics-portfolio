# **Bellabeat Case Study — Smart Device Usage Trends**

# 

# 

## **Business Task**

# 

* ### Analyze smart device fitness data to uncover usage patterns and identify insights that Bellabeat can apply to one of its wellness products.
* ### The goal is to understand how consumers use non-Bellabeat smart devices and translate those insights into marketing strategies that unlock growth opportunities.

#### 

# 

# 

## **About the Data**

# 

### **Dataset**: FitBit Fitness Tracker Data (CC BY 4.0)

### 

### **ROCCC Criteria**	 **Evaluation	Notes**

### Reliable	  No	　　　　Third-party, self-reported

### Original	  No	　　　　Not collected by Bellabeat

### Comprehensive	  No	　　　　Very small sample size

### Current	　　　　  No	　　　　Data from 04-12-2016 to 05-12-2016

### Cited	　　　　  No	　　　　Limited documentation

### 

### Because of these limitations, insights should be interpreted as directional, not statistically conclusive.

# 

## **Tools Used**

# 

* ### Spreadsheet (Google Sheets) — initial exploration and cleaning

### 

* ### SQL — filtering, joining, and summarizing data

### 

* ### Tableau — dashboards and visualizations

### 

### 

### Process (Ask → Prepare → Process → Analyze → Share → Act)

# 

# 

## **1. Ask**

# 

### 1\. What are some trends in smart device usage?

### 

### 2\. How could these trends apply to Bellabeat customers?

### 

### 3\. How could these trends help influence Bellabeat marketing strategy?

# 

## **2. Prepare**

### 

### I evaluated the FitBit dataset using the ROCCC framework, identified issues such as inconsistent IDs, missing values, and inadequate documentation, and standardized the tables.

### 

### Cleaning steps included:

### 

* ### Removed duplicates
* ### Standardized date formats
* ### Ensured the same user IDs matched across activity/sleep/BMI tables
* ### Removed empty or irrelevant columns

# 

## **3. Process**

# 

### Using Spreadsheets + SQL:

### 

* ### Cleaned and merged daily activity, sleep, and BMI logs
* ### Verified column types
* ### Created calculated fields (weekday, total high active minutes, and total low active minutes)
* ### Summarized activity and sleep by weekday
* ### Identified missing sleep-tracking data → possible non-wear behavior

# 

## **4. Analyze**

# 

### Using SQL, I calculated:

### 

* ### Daily total steps
* ### Highly/low active minutes
* ### Minutes asleep
* ### Weekly movement patterns

### 

### Key patterns found:

### 

* ### Activity levels changed significantly across days
* ### Most users did not wear the device while sleeping
* ### Step counts peaked mid-week
* ### Many users did not reach the recommended daily activity level

# 

## **5. Share**

# 

### I built Tableau dashboards to visualize:

### 

* ### Avg High Active Minutes / Low Active Minutes
* ### Weekly Sleep Patterns
* ### Weekly Activity Patterns
* ### Relationship Between BMI and Minutes Asleep

# 

## **Main insights:**

# 

1. ### Users did not wear their smart devices during sleep
2. ### Most sleep records were missing → suggesting incomplete wear-time.
3. ### Users had the highest step counts mid-week
4. ### Tuesday–Thursday were the most active days.
5. ### Active minutes varied significantly
6. ### Only a portion of users reached high activity thresholds.
7. ### Many users don’t achieve 10k steps consistently
8. ### This suggests a gap between user behavior and wellness goals.

# 

## **WHO Activity Guidelines (for comparison)**

# 

### According to the World Health Organization (2020):

### 

### Adults should achieve at least one of the following:

### 

### 150–300 minutes of moderate activity/week, or

### 

### 75–150 minutes of vigorous activity/week, plus

### 

### Strength training at least 2 days/week

### 

### Source:

### https://www.who.int/publications/i/item/9789240015128

### 

### Most dataset users did not meet these guidelines.

# 

# **Insights \& Interpretation**





## **1. Trends in Smart Device Usage**

# 

1. ### Low nighttime wear → poor sleep tracking
2. ### Peak activity in mid-week
3. ### Large variation in daily activity intensity
4. ### Only some users reach health-recommended steps or active minutes

# 

## **2. How These Trends Apply to Bellabeat Customers**

# 

### Bellabeat customers may:

### 

1. ### Underutilize sleep-tracking features
2. ### Follow similar weekday vs weekend activity patterns
3. ### Fall short of WHO activity recommendations
4. ### Need more motivation and reminders to stay active

# 

## **3. Marketing Strategy Implications**

# 

1. ### Encourage nighttime use
2. ### App reminders to wear the device before bed
3. ### Educational content about sleep health
4. ### Badges for hitting 10k steps
5. ### Rewards or discounts for 60+ active minutes
6. ### Push notifications when users are naturally more active

# 

## **Selected Product: Bellabeat Leaf**

# 

### The Bellabeat Leaf benefits most from these insights because it tracks:

### 

### Activity levels, Steps, Sleep, and Stress

# 

