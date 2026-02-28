clc;
clearvars -except eeg_data;
close all;

%% Step 1: Use your EEG matrix directly
data = eeg_data;

disp("Dataset size:");
disp(size(data));

%% Step 2: Separate EEG features and label
% Assume last column = stroke risk label
X = data(:,1:end-1);
Y = data(:,end);

%% Step 3: Convert label into binary (Stroke risk classification)
% Threshold-based labeling
threshold = mean(Y);
Y = Y > threshold;

%% Step 4: Normalize EEG signals
X = normalize(X);

%% Step 5: Extract EEG statistical features
mean_feat = mean(X,2);
std_feat  = std(X,0,2);
var_feat  = var(X,0,2);
max_feat  = max(X,[],2);
min_feat  = min(X,[],2);
rms_feat  = sqrt(mean(X.^2,2));

Features = [mean_feat std_feat var_feat max_feat min_feat rms_feat];

disp("Feature extraction completed");

%% Step 6: Split dataset (70% training, 30% testing)
cv = cvpartition(Y,'HoldOut',0.3);

Xtrain = Features(training(cv),:);
Ytrain = Y(training(cv));

Xtest = Features(test(cv),:);
Ytest = Y(test(cv));

%% Step 7: Train machine learning model (Random Forest - better accuracy)
model = fitcensemble(Xtrain,Ytrain);

disp("Model trained successfully");

%% Step 8: Predict stroke risk
Ypred = predict(model,Xtest);

%% Step 9: Calculate accuracy
accuracy = sum(Ypred == Ytest)/length(Ytest)*100;

fprintf('\nStroke Prediction Accuracy = %.2f%%\n', accuracy);

%% Step 10: Confusion Matrix
figure;
confusionchart(Ytest,Ypred);
title('Stroke Risk Prediction Confusion Matrix');

%% Step 11: Plot prediction
figure;
plot(Ytest,'b');
hold on;
plot(Ypred,'r--');
legend('Actual','Predicted');
title('Stroke Risk Prediction using EEG');
xlabel('Sample');
ylabel('Stroke Risk');
grid on;

%% Step 12: Predict new EEG sample
new_sample = Features(100,:);
prediction = predict(model,new_sample);

if prediction == 1
    disp("Stroke Risk Detected");
else
    disp("No Stroke Risk");
end