function accuracy = classifyWithPerceptron(testSamples, trueTrainLabels, weightingVector, threshold)

    numberOfCorrectPredictions = 0;

    for rowNumber = 1:2300

        activationLevel = computeActivation(testSamples(rowNumber,:), weightingVector); 

        if (activationLevel > threshold)
            predictedLabel = 1;
        else
            predictedLabel = 0;
        end

        if (predictedLabel == trueTrainLabels(rowNumber,:))
            numberOfCorrectPredictions = numberOfCorrectPredictions + 1;
        end
                  
    end
        
    accuracy = numberOfCorrectPredictions / 2300;
    
end