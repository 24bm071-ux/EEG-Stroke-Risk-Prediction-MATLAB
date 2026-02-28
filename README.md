# EEG-Stroke-Risk-Prediction-MATLAB
MATLAB-based stroke risk prediction using EEG signals and machine learning

# MATLAB Modeling of Stroke Risk Prediction Using EEG Signals

---

## Objective

To analyze EEG signals and predict stroke risk using statistical feature extraction and machine learning classification in MATLAB. The system uses EEG signal characteristics to classify whether a patient has stroke risk or normal brain activity.

---

## Methodology

Imported EEG dataset as numeric matrix in MATLAB workspace

Separated EEG features and stroke risk indicator

Converted stroke signal into binary classification using statistical threshold

Normalized EEG signals for stable and unbiased feature analysis

Extracted statistical EEG features:

* Mean
* Standard deviation
* Variance
* Maximum
* Minimum
* Root Mean Square (RMS)

Combined extracted features into feature matrix

Split dataset into:

* 70% Training dataset
* 30% Testing dataset

Trained Random Forest Machine Learning Model using MATLAB fitcensemble() function

Predicted stroke risk using trained model

Calculated prediction accuracy

Generated confusion matrix to evaluate performance

Plotted actual vs predicted stroke risk graph

Predicted stroke risk for new EEG sample

---

## Results

The machine learning model successfully classified stroke risk using EEG signals.

Confusion matrix and prediction graph were generated to visualize performance.

The model achieved good classification performance and demonstrated the feasibility of EEG-based stroke prediction.

---

## Confusion Matrix Explanation

Your confusion matrix:

|              | Predicted False | Predicted True |
| ------------ | --------------- | -------------- |
| Actual False | 3710 ✅          | 900 ❌          |
| Actual True  | 848 ❌           | 3842 ✅         |

Meaning:

3710 = True Negatives → Correctly predicted NO stroke

3842 = True Positives → Correctly predicted stroke

900 = False Positives → Predicted stroke but actually no stroke

848 = False Negatives → Missed stroke cases (very important medically)

False negatives are critical in medical systems because missing stroke cases can delay treatment.

---

## Model Accuracy Calculation

Accuracy is calculated using the formula:

Accuracy = (True Positives + True Negatives) / Total Samples

Accuracy = (3710 + 3842) / (3710 + 3842 + 900 + 848)

Accuracy = 7552 / 9300

Accuracy = 81.2%

So your current model accuracy is:

81.2% accuracy

This is good performance for a basic EEG machine learning model, but medical-grade systems typically require 90%–98% accuracy.

---

## Stroke Risk Prediction Graph Explanation

The prediction graph shows comparison between actual stroke condition and predicted stroke condition.

Blue line represents actual stroke condition

Red dashed line represents predicted stroke condition

Dense lines appear because:

* Dataset contains more than 9300 EEG samples
* Stroke classification is binary (0 or 1)
* EEG signals are high-frequency biological signals

---

## Real-Life Interpretation

Each sample represents EEG brain activity measurement from patient

The system analyzes EEG signal patterns

The machine learning model predicts stroke risk continuously

The system can help doctors detect stroke risk early

This type of system can be used in:

* Hospital brain monitoring systems
* ICU monitoring devices
* Stroke early warning systems
* Brain health monitoring applications

---

## Cases

### Normal Case

EEG signals showed normal statistical characteristics

Model predicted low stroke probability

Result: No Stroke Risk Detected

---

### Abnormal Case

EEG signals showed abnormal statistical characteristics

Model predicted high stroke probability

Result: Stroke Risk Detected

---

## Output Files

stroke_prediction_basic.m

Stroke_Risk_Confusion_Matrix.png

Stroke_Risk_Prediction_Graph.png

---

## Tools Used

MATLAB

Machine Learning Toolbox

Signal Processing Toolbox

Random Forest Classifier

Statistical Feature Extraction

---

## Conclusion

The MATLAB-based EEG stroke risk prediction system successfully classified stroke risk using machine learning techniques. Statistical feature extraction and Random Forest classification enabled effective stroke risk detection with 81.2% accuracy. The confusion matrix and prediction graph confirmed that the model can distinguish between normal and abnormal EEG patterns.

This system demonstrates the potential of EEG-based machine learning models for early stroke detection and real-time brain health monitoring.
