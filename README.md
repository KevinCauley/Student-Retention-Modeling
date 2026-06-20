# Student Retention Predictive Modeling

This portfolio project applies an end-to-end analytics workflow to undergraduate student data from Advance University. The goal is to model final course performance, identify academic risk patterns, and translate the results into practical student-support recommendations.

The project is framed around early intervention. Instead of waiting until a student disengages or stops out, the analysis looks for academic, attendance, financial, support-service, and engagement patterns that may indicate a need for follow-up.

## Project Focus

The primary modeling outcome is **Final Grade**. Enrollment status is included as a predictor and context variable rather than the target outcome.

A secondary academic-risk flag is used to support interpretation:

* Students with final grades below 70 are treated as academically at risk.
* The model is intended to support advising and student-success review.
* The workflow is not designed for punitive or automatic decision-making.

## Project Pages

The published report is organized into four main sections:

1. **Exploratory Data Analysis**
   Reviews variable roles, missing values, outliers, preprocessing decisions, feature engineering, and early patterns tied to final grade performance.

2. **Predictive Modeling Strategy**
   Documents the modeling workflow, including target selection, train/test split, preprocessing, baseline comparison, and multiple model families.

3. **Model Results & Comparison**
   Compares model performance using cross-validation and holdout results, including RMSE, R-squared, MAE, train/test gap, and variable importance.

4. **Insights & Recommendations**
   Translates the model findings into practical recommendations for advising, tutoring, financial support, attendance follow-up, and retention planning.

## Tools Used

* R
* RMarkdown
* tidyverse
* tidymodels
* ggplot2
* kableExtra
* HTML/CSS
* Git/GitHub

## Repository Structure

```text
Student-Retention/
├── analysis/
│   ├── index.Rmd
│   ├── student_retention_eda.Rmd
│   ├── student_retention_modeling.Rmd
│   ├── student_retention_results.Rmd
│   └── student_retention_insights.Rmd
├── data/
│   ├── raw/
│   └── processed/
├── docs/
│   ├── assets/
│   ├── figures/
│   ├── index.html
│   ├── student_retention_eda.html
│   ├── student_retention_modeling.html
│   ├── student_retention_results.html
│   └── student_retention_insights.html
├── build_student_project.R
├── README.md
└── Student-Retention.Rproj
```

## How to Build the Site

From the project root, run:

```r
source("build_student_project.R")
```

The rendered website files are saved in the `docs/` folder.

## Portfolio Purpose

This project was created to demonstrate practical analytics skills, including data preparation, exploratory analysis, predictive modeling, model evaluation, technical reporting, and business-facing interpretation in a higher education setting.

## Author

**Kevin Cauley**
M.S. Applied Data Analytics
[LinkedIn](https://www.linkedin.com/in/kacauley)
