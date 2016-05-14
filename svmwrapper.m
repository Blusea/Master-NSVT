function err = svmwrapper(xTrain, yTrain, xTest, yTest)
  model = svmtrain(yTrain, xTrain, <svm parameters>);
  err = sum(svmpredict(yTest, xTest, model) ~= yTest);
end