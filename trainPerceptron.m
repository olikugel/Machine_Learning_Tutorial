function [weightingVector, iterationVector, accuracyVector] = trainPerceptron(trainingSamples, trueTrainLabels, threshold)

    % initialise weightings to random numbers in the range -1 to 1
    weightingVector = -1 + (1+1) * rand(1,57);
    
    % numberOfIterations = 1;
    % accuracy = 0;
  
  % while (accuracy < 92)
    for numberOfIterations = 1:100
        
        numberOfCorrectlyPredictedLabels = 0;
        
        for sampleNumber = 1:2300

            activationLevel = computeActivation(trainingSamples(sampleNumber,:), weightingVector); 

            if (activationLevel > threshold)
                predictedLabel = 1;
            else
                predictedLabel = 0;
            end

            weightingVector = updateWeighting(weightingVector, trainingSamples(sampleNumber,:), trueTrainLabels(sampleNumber), predictedLabel);

            if (predictedLabel == trueTrainLabels(sampleNumber))
                numberOfCorrectlyPredictedLabels = numberOfCorrectlyPredictedLabels + 1;
            end

        end
        
        accuracy = numberOfCorrectlyPredictedLabels / 2300 * 100;
        
        fprintf('Iteration %d -- %d / %d -- training accuracy: %.2f%% \n', numberOfIterations, numberOfCorrectlyPredictedLabels, 2300, accuracy);
        iterationVector(numberOfIterations) = numberOfIterations;
        accuracyVector(numberOfIterations) = accuracy;
        numberOfIterations = numberOfIterations + 1;
    end
    
end