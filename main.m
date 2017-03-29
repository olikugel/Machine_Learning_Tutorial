close all;
clear all;
givenDataset = input('Enter a filename to load data for training/testing: ','s');
load(givenDataset);


numberOfDiscreteValues = length(unique(AttributeSet));
numberOfClasses = length(unique(LabelSet));
datasetSpecs = [numberOfDiscreteValues numberOfClasses];

trainingSamples = AttributeSet([1:2300],:);
trueTrainLabels = LabelSet(1:2300);

testingSamples = testAttributeSet([1:2300],:);
trueTestLabels = validLabel(1:2300);


% --------------------------------- TRAINING ----------------------------------
  labelledTrainingSamples = [AttributeSet([1:2300],:) LabelSet([1:2300],:)];

  trainLabelOccurrences = countClassLabels(trueTrainLabels);

  lookUpTable = createLookUpTable(labelledTrainingSamples, trainLabelOccurrences, datasetSpecs);
  
  predictedTrainLabels = predictLabelsFromTrainSamples(trainingSamples, lookUpTable, trainLabelOccurrences);
  
  trainingAccuracy = computeTrainingAccuracy(predictedTrainLabels, trueTrainLabels);
% -----------------------------------------------------------------------------



% --------------------------------- TESTING -----------------------------------
  testLabelOccurrences = countClassLabels(trueTestLabels);
  
  predictedTestLabels = predictLabelsFromTestSamples(testingSamples, lookUpTable, testLabelOccurrences);

  testingAccuracy = computeTestingAccuracy(predictedTestLabels, trueTestLabels);
% -----------------------------------------------------------------------------



fprintf('\nTraining Accuracy with Naive Bayes: %.2f%% \n\n', trainingAccuracy * 100);

confusionMatrix = constructConfusionMatrix(predictedTestLabels, trueTestLabels);
display(confusionMatrix);

fprintf('\n');
fprintf('************************************************************ \n');
fprintf('Testing Accuracy with Naive Bayes on Dataset %s: %.2f%% \n', givenDataset, testingAccuracy * 100);
fprintf('************************************************************ \n\n\n');



% -------------------------------- PERCEPTRON ---------------------------------
if (numberOfClasses ~= 3)
  fprintf('Adjusting feature weightings with Perceptron ...\n\n');

   threshold = 10;

   [weightingVector, iterationVector, accuracyVector] = trainPerceptron(trainingSamples, trueTrainLabels, threshold);

   plot(iterationVector, accuracyVector, 'r-');
   title('Testing accuracy of a perceptron on increasing number of iterations');
   xlabel('Number of Iterations');
   ylabel('Testing Accuracy');

   testingAccuracyWithPerceptron = classifyWithPerceptron(testingSamples, trueTestLabels, weightingVector, threshold);

   fprintf('\nTesting Accuracy with Perceptron: %.2f%%\n', testingAccuracyWithPerceptron * 100);
end
% -----------------------------------------------------------------------------




