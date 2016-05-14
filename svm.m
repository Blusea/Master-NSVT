function [succes_mult meanspec meansens]=svm(data)
%
groups=(data(:,5));
%holdout
%{
[train, test]= crossvalind('HoldOut',groups,0.5);
cp=classperf(groups);

svmStruct=svmtrain(data(train,:),groups(train),'showplot',true,'kernel_function','rbf');

pred=svmclassify(svmStruct,data(test,:),'showplot',true);
disp(pred);
correct_countermulti=0;
for i=1:length(pred)
   if (test(i)==pred(i))
        correct_countermulti=correct_countermulti+1;
        disp('A');
   end
end

success_multi=correct_countermulti/length(pred);
disp('multi svm');
disp(success_multi);
%}

%
k=10;
succes_multi=zeros(k);
cvFolds = crossvalind('Kfold', groups, k);   %# get indices of 10-fold CV
cp = classperf(groups);                      %# init performance tracker

for i = 1:k -1                                 %# for each fold
    testIdx = (cvFolds == i);                %# get indices of test instances
    trainIdx = ~testIdx;                     %# get indices training instances

    %# train an SVM model over training instances
    
    svmModel = svmtrain(data(trainIdx,:), groups(trainIdx,:), ...
                 'Autoscale',true, 'Showplot',false, 'Method','QP', ...
                 'RBF_Sigma', 0.2, 'BoxConstraint', 1, 'Kernel_Function','rbf');

    %# test using test instances
    pred= svmclassify(svmModel, data(testIdx,:), 'Showplot',false);

    %# evaluate and update performance object
    cp = classperf(cp, pred, testIdx);
    correct_countermulti=0;
    for m=1:length(pred)
       if (testIdx(m)==pred(m))
            correct_countermulti=correct_countermulti+1;
       end
    end

    success_multi(i)=correct_countermulti/length(pred);
    disp('multi svm');
    disp(success_multi(i));
   TP(k)=0; 
   for m=1: length(pred)
    if (testIdx(m)==1 && pred(m)==1)
        TP(k)=TP(k)+1;
    end
   end
   TN(k)=0;
   for m=1: length(pred)
    if (testIdx(m)==0 && pred(m)==0)
        TN(k)=TN(k)+1;
    end
   end
   sens(k)=TP(k)/(sum(testIdx == 1));
   spec(k)=TN(k)/(sum(testIdx == 0));
   disp('sens');
   disp(sens(k));
   
   
   disp('spec');
   disp(spec(k));
   
end

succes_mult=mean(success_multi);
meanspec=mean(spec);
meansens=mean(sens);
 
%}