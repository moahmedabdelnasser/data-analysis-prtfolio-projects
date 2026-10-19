# 🛒 End-to-End Sales Data Analysis Project

![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python)
![Excel](https://img.shields.io/badge/Excel-VBA-green?logo=microsoft-excel)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Records](https://img.shields.io/badge/Records-555_Clean-orange)

> A complete data analytics pipeline — from raw data to an interactive dashboard and automated data entry — built with Python and Excel/VBA.

## 📸 Project Preview

<!-- Upload your dashboard screenshot to images/dashboard.png -->
![Dashboard Preview](images/dashboard.png)

## 📁 Project Structure

The project includes raw data, cleaned data, preprocessed data, statistical analysis, dashboard visualizations, and a VBA data entry form.

Keep the screenshot folder beside this README:

    README.md
    images/
        dashboard.png
        project_structure.png
        cleaning_comparison.png
        preprocessed_sheet.png
        pivot_tables.png
        dashboard_full.png
        charts.png
        vba_form.png

<!-- Optional: upload your folder structure screenshot to images/project_structure.png -->
![Project Structure](images/project_structure.png)

## 🎯 Project Objectives

- Clean and validate a sales dataset with multiple quality issues.
- Engineer meaningful features to enable deeper analysis.
- Perform descriptive statistics and hypothesis testing.
- Build an interactive dashboard for business insights.
- Support future data entry using a VBA UserForm.

## 🔄 Data Pipeline (5 Stages)

**Raw Data → Data Cleaning → Preprocessing → Analysis → Visualization**

| Stage | Description |
| --- | --- |
| 1️⃣ Raw | 556 records before cleaning |
| 2️⃣ Cleaned | 555 records after cleaning |
| 3️⃣ Preprocessed | Seven engineered features |
| 4️⃣ Analysis | Pivot tables and statistical analysis |
| 5️⃣ Visualization | Charts and interactive dashboard |

## 🧹 Data Quality Issues & Solutions

| Challenge | Approach |
| --- | --- |
| Order dates stored as Excel serial integers | Convert serial values into readable dates |
| Missing values | Identify missing entries and handle them during cleaning |
| Unnecessary empty columns | Review and exclude empty columns from the analytical dataset |
| Questionable country entries, including Antarctica | Flag entries for business validation rather than assume they are valid markets |
| Inconsistent date presentation | Standardize dates for analysis |
| High return rate | Compare delivery times between returned and completed orders |

<!-- Upload your before-and-after cleaning screenshot to images/cleaning_comparison.png -->
![Data Cleaning Comparison](images/cleaning_comparison.png)

## ⚙️ Feature Engineering

Seven columns were added in the preprocessing stage:

| New Column | Description | Method |
| --- | --- | --- |
| `Year` | Order year | Extracted from Order Date |
| `Month` | Order month name | Extracted from Order Date |
| `Day` | Day of week | Extracted from Order Date |
| `Delivery Time` | Days from order to delivery | Delivered Date − Order Date |
| `Total costs` | Order costs | Cost values calculated in the preprocessing workbook |
| `Sales Revenue` | Order revenue | Unit Price × Quantity |
| `Net profit` | Profit per order | Sales Revenue − Total costs |

<!-- Upload your engineered-columns screenshot to images/preprocessed_sheet.png -->
![Preprocessed Data](images/preprocessed_sheet.png)

## 📊 Key Business Insights

| Metric | Value |
| --- | --- |
| 📦 Total Orders (Clean) | **555** |
| 💰 Total Revenue | **$1,471,551** |
| 📈 Total Net Profit | **$514,299** |
| 🔁 Return Rate | **48.3%** |
| 🌍 Top Revenue Country | **Nigeria** |
| 📚 Most Profitable Category | **Books** |
| 📅 Peak Sales Month | **December** |

## 📐 Descriptive Statistics

| Metric | Delivery Time | Sales Revenue | Net Profit | Quantity | Unit Price |
| --- | --- | --- | --- | --- | --- |
| Mean | 5.59 | 2,651.44 | 927.00 | 5.51 | 495.65 |
| Median | 5.00 | 1,890.00 | 661.50 | 5.00 | 497.00 |
| Std Dev | 2.89 | 2,508.33 | 877.92 | 2.88 | 285.42 |
| Min | 1 | 42 | 14.70 | 1 | 12 |
| Max | 14 | 9,800 | 3,430 | 10 | 999 |
| Skewness | 0.71 | 1.23 | 1.23 | -0.03 | 0.01 |

## 🧪 Statistical Hypothesis Testing (t-Test)

**Question:** Is delivery time different between returned and completed orders?

| Item | Value |
| --- | --- |
| **H₀** | No difference in mean delivery time |
| **H₁** | A difference exists in mean delivery time |
| **t-statistic** | −5.532 |
| **p-value** | 4.96 × 10⁻⁸ |
| **Result** | Reject H₀ at the 5% significance level |
| **Observed mean difference** | Returned orders take **1.79 days longer** |

> **Conclusion:** The analysis identifies a statistically significant difference in delivery time between the two groups. This is evidence of an association, not proof that delivery delays cause returns.

## 📊 Pivot Tables & Analysis

<!-- Upload your pivot tables screenshot to images/pivot_tables.png -->
![Pivot Tables](images/pivot_tables.png)

Analysis covered:

- Revenue and profit by **Country**
- Sales by **Product Category**
- Monthly **Sales Trends**
- **Return Rate** by category and country
- **Payment Method** distribution

## 📉 Dashboard & Visualizations

### Interactive Dashboard

<!-- Upload your full dashboard screenshot to images/dashboard_full.png -->
![Full Dashboard](images/dashboard_full.png)

### Supporting Charts

<!-- Upload your charts screenshot to images/charts.png -->
![Sales Analysis Charts](images/charts.png)

## 🤖 VBA Data Entry Form

A custom **Excel UserForm** was created to support structured data entry and enforce validation, reducing the risk of future data quality issues.

<!-- Upload your VBA UserForm screenshot to images/vba_form.png -->
![VBA Data Entry Form](images/vba_form.png)

## 🛠️ Tools & Technologies

| Tool | Purpose |
| --- | --- |
| **Python** | Data analysis and statistical evaluation |
| **Microsoft Excel** | Data preparation, pivot tables, and dashboard |
| **VBA / UserForm** | Structured data entry and validation |
| **Excel Charts** | Data visualization |

## 💡 Business Recommendations

1. **Investigate the 48.3% return rate** — examine patterns across categories and countries.
2. **Review Nigeria operations** — prioritize understanding the highest-revenue market.
3. **Investigate delivery delays** — assess their association with returns and test operational improvements.
4. **Prepare for the December peak** — align inventory and promotions with observed seasonal demand.
5. **Evaluate the Books category** — investigate opportunities based on its leading profit contribution.
6. **Use the VBA form for future entries** — support consistent data entry and validation.

## 👤 Author

**[Your Name]**

- **Email:** [Your email address]
- **LinkedIn:** [Your LinkedIn profile URL]
- **GitHub:** [Your GitHub profile URL]

## 📄 Usage

This project is presented for educational and portfolio purposes.
