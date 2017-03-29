function newWeightingVector = updateWeighting(oldWeightingVector, trainingSample, trueTrainLabel, predictedLabel)

    newWeightingVector = 1:57;

    for featureNumber = 1:57
        newWeightingVector(featureNumber) = oldWeightingVector(featureNumber) + 0.5 * (trueTrainLabel - predictedLabel) * trainingSample(featureNumber); 
    end

end