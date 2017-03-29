function predictedLabels = predictLabelsFromTrainSamples(trainingSamples, lookUpTable, trainLabelOccurrences)


    predictedLabels = zeros(2300,1);
    predictedLabels(:,1) = 8; % initialise labels to garbage value, USED FOR DEBUGGING
    
    numberOfClass0Labels = trainLabelOccurrences(1);
    numberOfClass1Labels = trainLabelOccurrences(2);
    numberOfClass2Labels = trainLabelOccurrences(3);
    
    totalNumberOfClassLabels = numberOfClass0Labels + numberOfClass1Labels + numberOfClass2Labels;
    
    numberOfClasses = size(lookUpTable,2); % returns second dimension of look up table
    
    probOfClass0 = numberOfClass0Labels / totalNumberOfClassLabels; % P(C = c0) 
    probOfClass1 = numberOfClass1Labels / totalNumberOfClassLabels; % P(C = c1) 
    probOfClass2 = numberOfClass2Labels / totalNumberOfClassLabels; % P(C = c2) 
    
    
    for sampleNumber = 1:2300 % for all training samples, could have called this 'current row'
	    
        % fprintf('Classifying training sample %d ...\n', sampleNumber);
                       
	    probOfBeingOfClass0 = probOfClass0; % initialise P(C = c0 | x1) to P(C = c0) 
	    probOfBeingOfClass1 = probOfClass1; % initialise P(C = c1 | x1) to P(C = c1)
	    probOfBeingOfClass2 = probOfClass2; % initialise P(C = c2 | x1) to P(C = c2)
        
        for featureNumber = 1:57 
            
            discreteValueFromTestSample = trainingSamples(sampleNumber,featureNumber);
            
            indexForDiscreteValueFTS = discreteValueFromTestSample + 1;
            
            
            discrValueProbGivenClass0 = lookUpTable(indexForDiscreteValueFTS,1,featureNumber); % 1 means Class 0
            probOfBeingOfClass0 = probOfBeingOfClass0 * discrValueProbGivenClass0;  
          
            
            discrValueProbGivenClass1 = lookUpTable(indexForDiscreteValueFTS,2,featureNumber); % 2 means Class 1
            probOfBeingOfClass1 = probOfBeingOfClass1 * discrValueProbGivenClass1; 
            
            
            if (numberOfClasses == 3)
                discrValueProbGivenClass2 = lookUpTable(indexForDiscreteValueFTS,3,featureNumber); % 3 means Class 2
                probOfBeingOfClass2 = probOfBeingOfClass2 * discrValueProbGivenClass2;
            end

        end
        
  
        % assign class-label to the given training-sample (i.e. the given feature vector)
        probsOfBeingOfClassX = [probOfBeingOfClass0 probOfBeingOfClass1 probOfBeingOfClass2];
        
        [maximumProb indexOfMaximumProb] = max(probsOfBeingOfClassX);
        
        labelToBeAssigned = indexOfMaximumProb - 1;
    
        predictedLabels(sampleNumber) = labelToBeAssigned;
        
        
    end % --> let's classify the next sample
    
end % end of function












