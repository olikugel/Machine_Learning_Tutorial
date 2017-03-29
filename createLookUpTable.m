function lookUpTable = createLookUpTable(labelledTrainingSamples, trainLabelOccurrences, datasetSpecs)
    
    numberOfDiscreteValues = datasetSpecs(1);
    numberOfClasses = datasetSpecs(2);
    weightToPrior = 0.001 * size(labelledTrainingSamples, 1); % small percentage of training samples
    priorEstimates = zeros(1,57);
    
    
    numberOfClass0Labels = trainLabelOccurrences(1);
    numberOfClass1Labels = trainLabelOccurrences(2);
    if (numberOfClasses == 3)
        numberOfClass2Labels = trainLabelOccurrences(3);
    end
    
    lookUpTable = zeros(numberOfDiscreteValues,numberOfClasses,57);
    
    fprintf('\n\nExamining given training samples ...\n\n');
    
    
    % determine prior estimates
    for featureNumber = 1:57

        priorEstimate = 1 / length(unique(labelledTrainingSamples(:,featureNumber)));
        priorEstimates(featureNumber) = priorEstimate;
        
    end
    
    
    % count occurrences of discrete values for the given classes
    for sampleNumber = 1:2300
        
        % fprintf('Examining training sample %d ...\n', sampleNumber);
        
        for featureNumber = 1:57

            discreteValue = labelledTrainingSamples(sampleNumber,featureNumber);
            indexForDiscreteValue = discreteValue + 1;

            currentLabel = labelledTrainingSamples(sampleNumber,58);
            indexForCurrentLabel = currentLabel + 1;

            lookUpTable(indexForDiscreteValue, indexForCurrentLabel, featureNumber) ...
              = lookUpTable(indexForDiscreteValue, indexForCurrentLabel, featureNumber) + 1;     
        end
    end

    
    % add prior estimates to numerator
    for featureNumber = 1:57
    
        lookUpTable(:, :, featureNumber) ...
           = lookUpTable(:, :, featureNumber) + (weightToPrior * priorEstimates(featureNumber));
        
    end
    
    
    % now consider denominator consisting of numberOfClassXLabels and weightToPrior
    lookUpTable(:,1,:) = lookUpTable(:,1,:) / (numberOfClass0Labels + weightToPrior);
    lookUpTable(:,2,:) = lookUpTable(:,2,:) / (numberOfClass1Labels + weightToPrior);
    if (numberOfClasses == 3)
        lookUpTable(:,3,:) = lookUpTable(:,3,:) / (numberOfClass2Labels + weightToPrior);
    end
 
end