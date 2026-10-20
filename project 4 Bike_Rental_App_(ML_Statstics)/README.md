# Bike Rental Demand Prediction

### From demand analysis to an interactive prediction app

An end-to-end regression project for predicting hourly bike rental demand, combining data validation, leakage prevention, feature engineering, model development, diagnostic evaluation, and a locally running Flask application.

**Final validation RMSE: 65.01 · Improvement over Zero Rule: 72.2%**

<img width="1152" height="2688" alt="web app perview" src="https://github.com/user-attachments/assets/d794c918-de83-4b76-9c37-cb3a319e64b1" />


> Image setup: add your actual screenshots and exported plots to `assets/` using the filenames referenced below. Images are not bundled with this README.

### Project at a Glance

| Item | Details |
| :--- | :--- |
| Task | Supervised learning — regression |
| Target | `count`: hourly bike rentals |
| Final estimator | `GradientBoostingRegressor` |
| Target transformation | `log1p` during training; inverse transformation for inference |
| Application | Flask web interface |
| Saved model | `model_v4.pkl` |
| Current status | Working locally; public deployment is a later stage |

### Business Problem

How can a bike rental operator prepare for demand that changes throughout the day?

Insufficient availability during high-demand periods can lead to missed rentals, while excess availability during quiet periods can reduce fleet utilization.

The project's business framing is revenue instability associated with poor fleet distribution. Its proposed business objective is to support availability decisions that could improve rental revenue and fleet utilization.

The technical objective is narrower and measurable: **reduce RMSE when predicting hourly rental count**.

The intended value chain is:

**Better demand forecasts → better availability planning → fewer missed rental opportunities → potential revenue improvement.**

This project evaluates prediction quality, not realized commercial impact. It does not demonstrate a measured revenue increase, and aggregate hourly predictions alone do not solve station-level fleet allocation.

### Dataset

| Item | Value |
| :--- | ---: |
| Training rows | 10,886 |
| Test rows | 6,493 |
| Reported training date range | 2011-01-01 to 2012-12-19 |
| Target | `count` |

Original predictors include `datetime`, `season`, `holiday`, `workingday`, `weather`, `temp`, `atemp`, `humidity`, and `windspeed`.

The reported completeness checks found no missing values in the displayed columns, and the target was checked for negative values. Completeness alone does not establish overall data quality, so exploratory analysis and model diagnostics were also included.

### Leakage Prevention

The training data contains `casual` and `registered`, whose sum equals `count`.

Including them would reveal the answer rather than support a realistic future prediction. Both were excluded from model inputs.

The legacy application's rental-count input was also removed: a prediction interface should not ask users to supply the quantity it is supposed to predict.

**Guiding principle:** a model must use information that will actually be available at inference time.

### Development Journey

The project evolved through iterative execution, output review, and targeted fixes rather than stopping at the first trained model.

| Stage | Main work |
| :--- | :--- |
| Initial review | Examined the existing data, code, and training-to-inference workflow |
| Debugging improvements | Corrected the single-batch overfit diagnostic |
| Feature development | Moved tuning and evaluation to V2 features |
| Diagnostic expansion | Added EDA, visualizations, learning curves, and residual analysis |
| Final V4 | Introduced a log-transformed target and regularized Gradient Boosting |
| Application integration | Updated Flask and the HTML interface for the final model |
| Runtime troubleshooting | Addressed missing dependencies and model-loading version incompatibility |

Historical per-version scores are intentionally omitted unless verified against their original outputs. The documented headline results refer to the final version.

### Feature Engineering

#### Time-based features

Temporal information was extracted into hour, day of week, month, and year.

#### Cyclical encoding

Sine/cosine pairs represent repeating time cycles. This preserves relationships such as the proximity between hour 23 and hour 0, which ordinary numeric distance does not capture.

#### Behavioral and interaction features

The final application code includes:

| Feature | Purpose |
| :--- | :--- |
| `is_rush_hour` | Identify selected commuting-hour windows |
| `is_weekend` | Distinguish weekend behavior |
| `is_late_night` | Represent overnight periods |
| `temp_humidity_ratio` | Combine temperature and humidity information |
| `log_windspeed` | Provide a transformed wind-speed feature |
| `temp_rush` | Capture temperature–rush-hour interaction |
| `rush_hour_workingday` | Capture rush-hour behavior on working days |

Feature definitions, column names, and category encodings must match between training and inference. An application can run without errors while still producing unreliable predictions if these definitions drift.

### Final Modeling Approach

V4 uses `GradientBoostingRegressor` with regularization and a `log1p` target transformation.

The application inference workflow is:

1. Read user inputs.
2. Construct the required features.
3. Pass the feature row to the saved pipeline.
4. Obtain the log-scale prediction.
5. Apply `expm1` to return to the rental-count scale.
6. Display a non-negative rental estimate.

The inverse target transformation must happen exactly once. If it is later incorporated into the estimator itself, the application must be updated accordingly.

### Final Results

| Metric | Reported result |
| :--- | ---: |
| Validation RMSE | **65.01** |
| Improvement over Zero Rule | **72.2%** |
| Mean residual | **21.91** |

These are local evaluation results, not an externally verified leaderboard score.

The non-zero residual mean indicates remaining bias worth investigating. The final model is therefore presented as an improved forecasting solution, not as error-free or unbiased.

### Learning Curve

<img width="1189" height="588" alt="fig8_learning_curve" src="https://github.com/user-attachments/assets/27f688e6-6f3c-492f-92da-6853f35087cc" />


The learning curve supports inspection of training and validation performance as training-set size changes. It helps assess the generalization gap and whether more data or different model complexity may be useful.

### EDA Plots

<img width="2147" height="1181" alt="fig1_to_6_eda" src="https://github.com/user-attachments/assets/42af26cc-0e84-421c-ae23-7753d6d22c00" />


This plot complements aggregate metrics by showing how predictions compare with observations across demand levels.

### Residual Analysis

<img width="2149" height="596" alt="fig9_residual_analysis" src="https://github.com/user-attachments/assets/0ed27597-73c8-4adc-a250-111ab7d5164f" />


Residual diagnostics were used to examine error direction, error distribution, changes in error magnitude, and patterns that a single summary metric can hide.

### Feature Importance

<img width="1187" height="708" alt="fig7_feature_importance" src="https://github.com/user-attachments/assets/b3fe9c86-0e67-43b7-810f-8cd508ac210f" />


Feature importance supports inspection of the signals used by the model. It does not establish causality and can be affected by correlated predictors.

### Challenges and Resolutions

| Challenge | Response |
| :--- | :--- |
| Target leakage through `casual` and `registered` | Excluded both from model inputs |
| Unsuitable debugging setup | Corrected the single-batch overfit step |
| Inconsistent feature usage across experiments | Moved tuning to V2 features |
| Insufficient visibility into model behavior | Added EDA, learning curves, and residual diagnostics |
| Need to improve the final model | Introduced target transformation and regularized Gradient Boosting |
| Legacy Flask app incompatible with the new model | Updated model loading, feature construction, and form inputs |
| Prediction not appearing in the interface | Aligned form fields and template output variables |
| Missing `scikit-learn` in the runtime | Installed the dependency in the application's Python environment |
| Saved-model version incompatibility | Addressed the mismatch between training and loading environments |

#### Model persistence lesson

Loading the model exposed a scikit-learn version mismatch and an error involving `_RemainderColsList`. The saved estimator was associated with **scikit-learn 1.6.1**.

A persisted model is not independent of its software environment. Python and dependency versions matter when moving it between environments.

Simply saving an old model again is not a reliable version-upgrade strategy. For a new environment, retraining, evaluating, and saving within that environment is the more dependable approach.

### Web Application

The Flask application accepts time, weather, and day-related inputs, constructs model features, and displays predicted hourly rentals.

It loads the saved model rather than retraining it for every request.

**The output is rental demand, not revenue or profit.**

### Key Files

| File | Role |
| :--- | :--- |
| `notebook_final_v4.py` | Final ML workflow code |
| `model_v4.pkl` | Saved model used by the application |
| `submission.csv` | Predictions for the test data |
| `app.py` | Flask application |
| `templates/index.html` | Input form and prediction interface |
| `assets/` | Screenshots and evaluation plots referenced here |

### Run Locally

Run these commands from the directory containing `app.py`.

#### 1. Create a virtual environment

```bash
python -m venv .venv
```

#### 2. Activate it — Windows PowerShell

```powershell
.\.venv\Scripts\Activate.ps1
```

#### 3. Install application dependencies

```bash
python -m pip install flask joblib numpy pandas scikit-learn==1.6.1
```

These are application dependencies, not a complete lockfile for reproducing training. Exact experiment reproduction requires the original training environment's dependency versions.

#### 4. Check required files

- Keep `model_v4.pkl` in the working directory used to launch the application.
- Keep `index.html` inside `templates/`.

#### 5. Start Flask

```bash
python app.py
```

Open the [local application](http://127.0.0.1:5000).

> Flask's development server and `debug=True` are intended for local development, not production deployment.

### Limitations

- Forecasting accuracy alone does not demonstrate increased revenue or fleet utilization.
- Historical training data does not establish suitability for new locations or future time periods.
- Aggregate hourly forecasting does not provide station-level allocation decisions.
- Local validation results are not a guarantee of future performance.
- Public hosting and operational monitoring are not part of the current implementation.
- The saved model requires a compatible runtime environment.
- Never load pickle or joblib artifacts from untrusted sources.

### Future Improvements

- Record exact training dependency versions.
- Add automated tests for training–inference feature consistency.
- Strengthen input validation and consistency between dates and day-type inputs.
- Evaluate errors by hour and demand level.
- Validate on newer data before operational use.
- Prepare production-safe deployment and monitoring.
- Measure business impact when operational data becomes available.

These are proposed next steps, not implemented features.

### Takeaway

The value of this project extends beyond producing a prediction:

**Business framing → data validation → leakage prevention → feature engineering → model evaluation → error analysis → local web application.**

The result is an hourly demand prediction workflow with diagnostic visualizations and a usable local interface, documented with explicit boundaries between completed work and future development.
