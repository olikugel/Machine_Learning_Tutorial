
function numberOfClassLabels = countClassLabels(LabelSet)
    
    numberOfClassLabels = zeros(1,3);
    
    for sampleNumber = 1:2300
        
        if (LabelSet(sampleNumber) == 0)
            numberOfClassLabels(1,1) = numberOfClassLabels(1,1) + 1;
            
        elseif (LabelSet(sampleNumber) == 1)
            numberOfClassLabels(1,2) = numberOfClassLabels(1,2) + 1;
           
        elseif (LabelSet(sampleNumber) == 2)
            numberOfClassLabels(1,3) = numberOfClassLabels(1,3) + 1;
        end
        
    end

end
