function trainingAccuracy = computeTrainingAccuracy(predictedLabels, trueLabels)

    totalNumberOfLabels = 2300;
    numberOfCorrectlyPredictedLabels = 0;
    
    fprintf('\nComputing training accuracy ...\n\n');
    
    for row = 1:2300
        
        if (predictedLabels(row,1) == trueLabels(row,1))
            numberOfCorrectlyPredictedLabels = numberOfCorrectlyPredictedLabels + 1;
        end
        
    end
    
    trainingAccuracy = numberOfCorrectlyPredictedLabels / totalNumberOfLabels;

end