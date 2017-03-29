function confusionMatrix = constructConfusionMatrix(predictedLabels, trueLabels)

     numberOfClasses = length(unique(trueLabels));
     
     confusionMatrix = zeros(numberOfClasses,numberOfClasses);

     actual0Predict0 = 0;
     actual0Predict1 = 0;
     
     actual1Predict0 = 0;
     actual1Predict1 = 0;
     
     if (numberOfClasses == 3)
         actual1Predict2 = 0;
         actual0Predict2 = 0;
         actual2Predict0 = 0;
         actual2Predict1 = 0;
         actual2Predict2 = 0;
     end

     
     for rowNumber = 1:2300
        
        if ((predictedLabels(rowNumber) == 0) && (trueLabels(rowNumber) == 0) )
                 actual0Predict0 = actual0Predict0 + 1;
                 confusionMatrix(1,1) = confusionMatrix(1,1) + 1;
        end
        
        if ((predictedLabels(rowNumber) == 0) && (trueLabels(rowNumber) == 1) )
                 actual1Predict0 = actual1Predict0 + 1;
                 confusionMatrix(2,1) = confusionMatrix(2,1) + 1;
        end

       
        if ((predictedLabels(rowNumber) == 1) && (trueLabels(rowNumber) == 0) )
                 actual0Predict1 = actual0Predict1 + 1;
                 confusionMatrix(1,2) = confusionMatrix(1,2) + 1;
        end
        
        if ((predictedLabels(rowNumber) == 1) && (trueLabels(rowNumber) == 1) )
                 actual1Predict1 = actual1Predict1 + 1;
                 confusionMatrix(2,2) = confusionMatrix(2,2) + 1;
        end

        
        if (numberOfClasses == 3)
            if ((predictedLabels(rowNumber) == 0) && (trueLabels(rowNumber) == 2) )
                     actual2Predict0 = actual2Predict0 + 1;
                     confusionMatrix(3,1) = confusionMatrix(3,1) + 1;
            end

            if ((predictedLabels(rowNumber) == 1) && (trueLabels(rowNumber) == 2) )
                     actual2Predict1 = actual2Predict1 + 1;
                     confusionMatrix(3,2) = confusionMatrix(3,2) + 1;
            end

            if ((predictedLabels(rowNumber) == 2) && (trueLabels(rowNumber) == 0) )
                     actual0Predict2 = actual0Predict2 + 1;
                     confusionMatrix(1,3) = confusionMatrix(1,3) + 1;
            end

            if ((predictedLabels(rowNumber) == 2) && (trueLabels(rowNumber) == 1) )
                     actual1Predict2 = actual1Predict2 + 1;
                     confusionMatrix(2,3) = confusionMatrix(2,3) + 1;
            end

            if ((predictedLabels(rowNumber) == 2) && (trueLabels(rowNumber) == 2) )
                     actual2Predict2 = actual2Predict2 + 1;
                     confusionMatrix(3,3) = confusionMatrix(3,3) + 1;
            end
        end
        

    end
        
end