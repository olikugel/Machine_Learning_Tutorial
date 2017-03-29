function activation = computeActivation(digitAsVector, weightingVector)

    activation = 0;

    for featureNumber = 1:57 % current column of the input vectors
        
        activation = activation + (digitAsVector(featureNumber) * weightingVector(featureNumber));
       
    end

end