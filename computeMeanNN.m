function meanNN = computeMeanNN(Files)
meanNN=zeros(size(Files,1),1);
disp(size(Files,1));
    for i=1:size(Files,1)
        meanNN(i) = mean(Files(i,:));
    end