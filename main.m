clc ;
clear all;
close all;

%Files = dir('VT/*.txt');
%Signals = storeSignals(Files);

%rateSep = computeRythmSepWindows(Signals,Files,1);
%rateOv = computeRythmOvLapWindows(Signals,Files,2);

Files1 = dir('males/*.txt');
Males = storeMales(Files1);



%{
rateMalesSep=computeRythmSepWindows(Males,Files1,8);
p1=mean(computeP(rateMalesSep(:,1:4),rateMalesSep(:,13:16)));
p2=mean(computeP(rateMalesSep(:,1:4),rateMalesSep(:,9:12)));
p3=mean(computeP(rateMalesSep(:,9:12),rateMalesSep(:,13:16)));

 displayBoxPlot(rateMalesSep);

%}

%
rateMalesOver=computeRythmOvLapWindows(Males,Files1,1);
%{
for i=1:size(rateMalesOver);
    disp(i);
    [H, pValue, W] = swtest(rateMalesOver(i,:), 0.05);
    disp(H);
    disp(pValue);
    disp(i);
end
%}
%p1M=mean(computeP(rateMalesOver(:,1:4),rateMalesOver(:,13:16)));
%p2M=mean(computeP(rateMalesOver(:,1:4),rateMalesOver(:,9:12)));
%p3M=mean(computeP(rateMalesOver(:,9:12),rateMalesOver(:,13:16)));
%savePlots(rateMalesOver,'rateMalesOver',p1);
%displayBoxPlot(rateMalesOver);
%}
%
meanNNMalesOver=computeMeanNNOvLapWindows(Males,Files1,1);
%{
for i=1:size(meanNNMalesOver);
    disp(i);
    [H, pValue, W] = swtest(meanNNMalesOver(i,:), 0.05);
    disp(H);
    disp(pValue);
    disp(i);
end

p1=mean(computeP(meanNNMalesOver(:,1:4),meanNNMalesOver(1,13:16)));
p2=mean(computeP(meanNNMalesOver(:,1:4),meanNNMalesOver(1,9:12)));
p3=mean(computeP(meanNNMalesOver(:,9:12),meanNNMalesOver(1,13:16)));
%savePlots(meanNNMalesOver,'meanNNMalesOver',p1);
%}
%displayBoxPlot(meanNNMalesOver);
%}
%}
%{
meanNNMalesSep=computeMeanNNSepWindows(Males,Files1,2);
p1=computeP(meanNNMalesSep(1,1:4),meanNNMalesSep(1,13:16));
p2=computeP(meanNNMalesSep(1,1:4),meanNNMalesSep(1,9:12));
p3=computeP(meanNNMalesSep(1,9:12),meanNNMalesSep(1,13:16));
p=[p1; p2; p3];
displayBoxPlot(meanNNMalesSep);
%}

%{
RMSSDMalesSep=computeRMSSDSepWindows(Males,Files1,4);

p1=computeP(RMSSDMalesSep(:,1:4),RMSSDMalesSep(:,13:16));
p2=computeP(RMSSDMalesSep(:,1:4),RMSSDMalesSep(:,9:12));
p3=computeP(RMSSDMalesSep(:,9:12),RMSSDMalesSep(1,13:16));
displayBoxPlot(RMSSDMalesSep);
%}

%
RMSSDMalesOv=computeRMSSDOvLapWindows(Males,Files1,2);
%{
for i=1:size(RMSSDMalesOv);
    disp(i);
    [H, pValue, W] = swtest(RMSSDMalesOv(i,:), 0.05);
    disp(H);
    disp(pValue);
    disp(i);
end
p1=computeP(RMSSDMalesOv(1,1:4),RMSSDMalesOv(1,13:16));
p2=computeP(RMSSDMalesOv(1,1:4),RMSSDMalesOv(1,9:12));
p3=computeP(RMSSDMalesOv(1,9:12),RMSSDMalesOv(1,13:16));
displayBoxPlot(RMSSDMalesOv);
%savePlots(RMSSDMalesOv,'RMSSDMalesOv',p1);

%}
%{idio me RMSSD
%{
SDSDMalesSep=computeSDSDSepWindows(Males,Files1,2);
p1=computeP(SDSDMalesSep(1,1:6),SDSDMalesSep(1,12:16));
p2=computeP(SDSDMalesSep(1,1:6),SDSDMalesSep(1,6:12));
p3=computeP(SDSDMalesSep(1,6:12),SDSDMalesSep(1,12:16));
p=[p1; p2; p3];
Headers=['SDSDMalesSep';'p1          ';'p2          ';'p3          '];
ArrayToCsv(p,Headers,'SDSDMalesSep.csv');
%}
%{
SDSDMalesOv=computeSDSDOvLapWindows(Males,Files1,2);
p1=computeP(SDSDMalesOv(1,1:6),SDSDMalesOv(1,12:16));
p2=computeP(SDSDMalesOv(1,1:6),SDSDMalesOv(1,6:12));
p3=computeP(SDSDMalesOv(1,6:12),SDSDMalesOv(1,12:16));
p=[p1; p2; p3];
Headers=['SDSDMalesOVE';'p1          ';'p2          ';'p3          '];
ArrayToCsv(p,Headers,'SDSDMalesOVER.csv');
%savePlots(SDSDMalesOv,'SDSDMalesOv',p1);
%}
%}
%
%pNN50MalesOver=computecomputePNN50OvLapWindows(Males,Files1,1);
%{
for i=1:size(pNN50MalesOver);
    disp(i);
    [H, pValue, W] = swtest(pNN50MalesOver(i,:), 0.05);
    disp(H);
    disp(pValue);
    disp(i);
end
%}
%p1=computeP(pNN50MalesOver(1,1:4),pNN50MalesOver(1,13:16));
%p2=computeP(pNN50MalesOver(1,1:4),pNN50MalesOver(1,9:12));
%p3=computeP(pNN50MalesOver(1,9:12),pNN50MalesOver(1,13:16));
%savePlots(pNN50MalesOver,'pNN50MalesOver',p1);
%displayBoxPlot(pNN50MalesOver);
%}
%{
PNN50Males = computePNN50SepWindows(Males,Files1,10);
pOld1=computeP(PNN50Males(1,1:4),PNN50Males(1,13:16));
pOld2=computeP(PNN50Males(1,1:4),PNN50Males(1,9:12));
pOld3=computeP(PNN50Males(1,9:12),PNN50Males(1,13:16));
displayBoxPlot(PNN50Males);
%}

%{
dcBBSep = computedcBBSepWindows(Males,Files1,2);
p1=computeP(dcBBSep(1,1:4),dcBBSep(1,13:16));
p2=computeP(dcBBSep(1,1:4),dcBBSep(1,9:12));
p3=computeP(dcBBSep(1,9:12),dcBBSep(1,13:16));
displayBoxPlot(dcBBSep);
%}
%{
dcBB=computeDCOvLapWindows(Males,Files1,8);

p1=computeP(dcBB(:,1:4),dcBB(:,13:16));
p2=computeP(dcBB(:,1:4),dcBB(:,9:12));
p3=computeP(dcBB(:,9:12),dcBB(:,13:16));
displayBoxPlot(dcBB);
%savePlots(dcBB,'dcBBMales',p1);
%}
%
dcSign=computeDCSignOvLapWindows(Males,Files1,9);
%{
for i=1:size(dcSign);
    disp(i);
    [H, pValue, W] = swtest(dcSign(i,:), 0.05);
    disp(H);
    disp(pValue);
    disp(i);
end
p1=computeP(dcSign(:,1:4),dcSign(:,13:16));
p2=computeP(dcSign(:,1:4),dcSign(:,9:12));
p3=computeP(dcSign(:,9:12),dcSign(:,13:16));
%savePlots(dcSign,'dcSignMales',p1);
displayBoxPlot(dcSign);
%}
%displayBoxPlot(dcSign);
%{
dcSMa=computedcSignSepWindows(Males,Files1,10);
p1=computeP(dcSMa(:,1:4),dcSMa(:,13:16));
p2=computeP(dcSMa(:,1:4),dcSMa(:,9:12));
p3=computeP(dcSMa(:,9:12),dcSMa(:,13:16));
displayBoxPlot(dcSMa);
%}
%{

sdnnMales1= computeSDNNOvWin(Males,Files1,1);
%{
pSDNN1=0.1*computeP(sdnnMales(1,1:6),sdnnMales(1,11:16));
pSDNN2=0.1*computeP(sdnnMales(1,1:6),sdnnMales(1,7:12));
pSDNN3=0.1*computeP(sdnnMales(1,7:12),sdnnMales(1,11:16));
displayBoxPlot(sdnnMales);
%}
%
sdnnMales= computeSDNNSepWin(Males,Files1,10);
pSDNN1=0.1*computeP(sdnnMales(1,1:4),sdnnMales(1,13:16));
pSDNN2=0.1*computeP(sdnnMales(1,1:4),sdnnMales(1,9:12));
pSDNN3=0.1*computeP(sdnnMales(1,9:12),sdnnMales(1,13:16));
displayBoxPlot(sdnnMales);
%}


%
data=zeros(688-86-86,5);
l=86;
%
for i=1:l
    data(i,1:4)=(rateMalesOver(i,1:4));
    data(i,5)=0;
end
k=1;
for i=l+1:2*l
    data(i,1:4)=(rateMalesOver(k,13:16));
    data(i,5)=1;
    k=k+1;
end
%}
%
k=1;
for i=2*l+1:3*l
    
    data(i,1:4)=(meanNNMalesOver(k,1:4));
    data(i,5)=0;
    k=k+1;
end
 k=1;
for i=3*l+1:4*l
   
    data(i,1:4)=(meanNNMalesOver(k,13:16));
    data(i,5)=1;
    k=k+1;
end

%}
k=1;
%{
for i=4*l+1:5*l
    
    data(i,1:4)=(pNN50MalesOver(k,1:4));
    data(i,5)=1;
    k=k+1;
end
  k=1;
for i=5*l+1:6*l
  
    data(i,1:4)=(pNN50MalesOver(k,13:16));
    data(i,5)=0;
    k=k+1;
end
 k=1;
%}
%{
for i=4*l+1:5*l
   
    data(i,1:4)=(dcSign(k,1:4));
    data(i,5)=1;
    k=k+1;
end
k=1;
for i=5*l+1:6*l
    
    data(i,1:4)=(dcSign(k,13:16));
    data(i,5)=0;
    k=k+1;
end
k=1;
 %}
%{
for i=8*l+1:9*l
    
    data(i,1:4)=(sdnnMales(k,1:4));
    data(i,5)=1;
    k=k+1;
end
k=1;
for i=9*l+1:10*l
    
    data(i,1:4)=(sdnnMales(k,13:16));
    data(i,5)=0;
    k=k+1;
end
%}
%
mo=mean(mean(data(:,1:4)));
data1=zeros(516,5);
for i=1:516
    data1(i,1:4)=data(i,1:4)./mo;
    data1(i,5)=data(i,5);
end

groups=(data1(:,5));
suc=zeros(1,150);
spec=zeros(1,150);
sens=zeros(1,150);
for i=1:150
 %   disp(svm(data));
    [suc meanspec meansens]=svm(data1);
    suc(i)=suc;
    spec(i)=meanspec;
    sens(i)=meansens;
end

disp(mean(suc));
disp(mean(spec));
disp(mean(sens));
disp(std(suc));
%}



%Files3 = dir('old/*.txt');
%Old = storeOld(Files3);
%meanNNOld1=computeMeanNN(Old);
%meanNNOld=mean(meanNNOld1);
%nNN50=computeNN50(Old);
%nPNN50=computePNN50(Old,nNN50);
%PNN50Old=mean(nPNN50);

%{
rateSep1 = computeRythmSepWindows(Old,Files3,3);
pOld1=computeP(rateSep1(1,1:6),rateSep1(1,12:16));
pOld2=computeP(rateSep1(1,1:6),rateSep1(1,6:12));
pOld3=computeP(rateSep1(1,6:12),rateSep1(1,12:16));
rateSepOld=zeros(1,16);
for k=1:16
    rateSepOld(1,k)=mean(rateSep1(:,k));
end
displayBoxPlot(rateSep1);
%}

%{
rateOv1 = computeRythmOvLapWindows(Old,Files3,3);
pOld1=computeP(rateOv1(1,1:6),rateOv1(1,12:16));
pOld2=computeP(rateOv1(1,1:6),rateOv1(1,6:12));
pOld3=computeP(rateOv1(1,6:12),rateOv1(1,12:16));
%savePlots(rateOv1,'rateOv1',p1);
rateOvOld=zeros(1,16);
for k=1:16
    rateOvOld(1,k)=mean(rateOv1(:,k));
end
displayBoxPlot(rateOv1);
%}

%{
meanNNOldOver=computeMeanNNOvLapWindows(Old,Files3,2);
pOld1=computeP(meanNNOldOver(1,1:6),meanNNOldOver(1,12:16));
pOld2=computeP(meanNNOldOver(1,1:6),meanNNOldOver(1,6:12));
pOld3=computeP(meanNNOldOver(1,6:12),meanNNOldOver(1,12:16));
%savePlots(meanNNOldOver,'meanNNOldOver',p1);
displayBoxPlot(meanNNOldOver);
%}
%{
meanNNOldSep=computeMeanNNSepWindows(Old,Files3,2);
pOld1=computeP(meanNNOldSep(1,1:6),meanNNOldSep(1,12:16));
pOld2=computeP(meanNNOldSep(1,1:6),meanNNOldSep(1,6:12));
pOld3=computeP(meanNNOldSep(1,6:12),meanNNOldSep(1,12:16));
displayBoxPlot(meanNNOldSep);
%}
%{
pNN50OldOver=computecomputePNN50OvLapWindows(Old,Files3,1);
pOld1=computeP(pNN50OldOver(:,1:4),pNN50OldOver(:,13:16));
pOld2=computeP(pNN50OldOver(:,1:4),pNN50OldOver(1,9:12));
pOld3=computeP(pNN50OldOver(:,9:12),pNN50OldOver(1,13:16));
%savePlots(pNN50OldOver,'pNN50OldOver',p1);
displayBoxPlot(pNN50OldOver);
%}
%{
PNN50Old = computePNN50SepWindows(Old,Files3,1);
pOld1=computeP(PNN50Old(1,1:6),PNN50Old(1,12:16));
pOld2=computeP(PNN50Old(1,1:6),PNN50Old(1,6:12));
pOld3=computeP(PNN50Old(1,6:12),PNN50Old(1,12:16));
displayBoxPlot(PNN50Old);
%}
%{
RMSSDOldSep=computeRMSSDSepWindows(Old,Files3,2);
pOld1=computeP(RMSSDOldSep(1,1:6),RMSSDOldSep(1,12:16));
pOld2=computeP(RMSSDOldSep(1,1:6),RMSSDOldSep(1,6:12));
pOld3=computeP(RMSSDOldSep(1,6:12),RMSSDOldSep(1,12:16));
displayBoxPlot(RMSSDOldSep);
%}

%{
RMSSDOldOv=computeRMSSDOvLapWindows(Old,Files3,2);
p1=computeP(RMSSDOldOv(1,1:6),RMSSDOldOv(1,12:16));
pOld2=computeP(RMSSDOldOv(1,1:6),RMSSDOldOv(1,6:12));
pOld3=computeP(RMSSDOldOv(1,6:12),RMSSDOldOv(1,12:16));
%savePlots(RMSSDOldOv,'RMSSDOldOv',p1);
displayBoxPlot(RMSSDOldOv);
%}
%{
SDSDOldSep=computeSDSDSepWindows(Old,Files3,2);
pOld1=computeP(SDSDOldSep(1,1:6),SDSDOldSep(1,12:16));
pOld2=computeP(SDSDOldSep(1,1:6),SDSDOldSep(1,6:12));
pOld3=computeP(SDSDOldSep(1,6:12),SDSDOldSep(1,12:16));
%}
%{
SDSDOldOv=computeSDSDOvLapWindows(Old,Files3,2);
p1=computeP(SDSDOldOv(1,1:6),SDSDOldOv(1,12:16));
pOld2=computeP(SDSDOldOv(1,1:6),SDSDOldOv(1,6:12));
pOld3=computeP(SDSDOldOv(1,6:12),SDSDOldOv(1,12:16));
savePlots(SDSDOldOv,'SDSDOldOv',p1);
%}

%{
dcBBSepO  = computedcBBSepWindows(Old,Files3,3);
pold1=computeP(dcBBSepO(1,1:6),dcBBSepO(1,12:16));
pold2=computeP(dcBBSepO(1,1:6),dcBBSepO(1,6:12));
pold3=computeP(dcBBSepO(1,6:12),dcBBSepO(1,12:16));
displayBoxPlot(dcBBSepO);
%}
%{
dcBBO=computeDCOvLapWindows(Old,Files3,4);
p1=computeP(dcBBO(1,1:6),dcBBO(1,12:16));
pold2=computeP(dcBBO(1,1:6),dcBBO(1,6:12));
pold3=computeP(dcBBO(1,6:12),dcBBO(1,12:16));
%savePlots(dcBBO,'dcBBOold',p1);
displayBoxPlot(dcBBO);
%}

%{
dcSignO=computeDCSignOvLapWindows(Old,Files3,5);
p1=computeP(dcSignO(1,1:6),dcSignO(1,12:16));
pold2=computeP(dcSignO(1,1:6),dcSignO(1,6:12));
pold3=computeP(dcSignO(1,6:12),dcSignO(1,12:16));
%savePlots(dcSignO,'dcSignOold',p1);
displayBoxPlot(dcSignO);
%}

%{
dcSO=computedcSignSepWindows(Old,Files3,6);
pold1=computeP(dcSO(1,1:6),dcSO(1,12:16));
pold2=computeP(dcSO(1,1:6),dcSO(1,6:12));
pold3=computeP(dcSO(1,6:12),dcSO(1,12:16));
displayBoxPlot(dcSO);
%}

%{
sdnnOLD= computeSDNNOvWin(Old,Files3,6);
pSDNN1=0.1*computeP(sdnnOLD(1,1:6),sdnnOLD(1,11:16));
pSDNN2=0.1*computeP(sdnnOLD(1,1:6),sdnnOLD(1,7:12));
pSDNN3=0.1*computeP(sdnnOLD(1,7:12),sdnnOLD(1,11:16));
displayBoxPlot(sdnnOLD);
%}
%{
sdnnOld= computeSDNNSepWin(Old,Files3,6);
pSDNN1=0.1*computeP(sdnnOld(1,1:4),sdnnOld(1,13:16));
pSDNN2=0.1*computeP(sdnnOld(1,1:4),sdnnOld(1,9:12));
pSDNN3=0.1*computeP(sdnnOld(1,9:12),sdnnOld(1,13:16));
displayBoxPlot(sdnnOld);
%}

%Files4 = dir('young/*.txt');
%Young = storeYoung(Files4);
%meanNNYoung1=computeMeanNN(Young);
%meanNNYoung=mean(meanNNYoung1);
%disp(meanNNYoung);
%nNN50=computeNN50(Young);
%nPNN50=computePNN50(Young,nNN50);
%PNN50Young=mean(nPNN50);


%{
sdnnOY= computeSDNNOvWin(Young,Files4,3);
pSDNN1=0.1*computeP(sdnnOY(1,1:6),sdnnOY(1,11:16));
pSDNN2=0.1*computeP(sdnnOY(1,1:6),sdnnOY(1,7:12));
pSDNN3=0.1*computeP(sdnnOY(1,7:12),sdnnOY(1,11:16));
%[pD1 ,pD2] =displayPdif(mean(sdnnOLD),mean(sdnnOY),'SDNN Overlapping Windows');
displayBoxPlot(sdnnOY);
%}
%{
sdnnY= computeSDNNSepWin(Young,Files4,3);
pSDNN1=0.1*computeP(sdnnY(1,1:4),sdnnY(1,13:16));
pSDNN2=0.1*computeP(sdnnY(1,1:4),sdnnY(1,9:12));
pSDNN3=0.1*computeP(sdnnY(1,9:12),sdnnY(1,13:16));
%[pD1 ,pD2] =displayPdif(mean(sdnnOld),mean(sdnnY),'SDNN Non Overlapping Windows');
displayBoxPlot(sdnnY);
%}


%{
meanNNYoungOver=computeMeanNNOvLapWindows(Young,Files4,3);
p1=computeP(meanNNYoungOver(1,1:6),meanNNYoungOver(1,12:16));
p2=computeP(meanNNYoungOver(1,1:6),meanNNYoungOver(1,6:12));
p3=computeP(meanNNYoungOver(1,6:12),meanNNYoungOver(1,12:16));

%[pD1 ,pD2] =displayPdif(mean(meanNNOldOver),mean(meanNNYoungOver),'MeanNN Overlapping Windows');
displayBoxPlot(meanNNYoungOver);
%}
%{
meanNNYoungSep=computeMeanNNSepWindows(Young,Files4,2);
p1=computeP(meanNNYoungSep(1,1:6),meanNNYoungSep(1,12:16));
p2=computeP(meanNNYoungSep(1,1:6),meanNNYoungSep(1,6:12));
p3=computeP(meanNNYoungSep(1,6:12),meanNNYoungSep(1,12:16));
%[pD1 ,pD2] =displayPdif(mean(meanNNOldSep),mean(meanNNYoungSep),'MeanNN Non Overlapping Windows');
displayBoxPlot(meanNNYoungSep);
%}


%{
pNN50YoungOver=computecomputePNN50OvLapWindows(Young,Files4,1);
p1=computeP(pNN50YoungOver(1,1:6),pNN50YoungOver(1,12:16));
p2=computeP(pNN50YoungOver(1,1:6),pNN50YoungOver(1,6:12));
p3=computeP(pNN50YoungOver(1,6:12),pNN50YoungOver(1,12:16));
%savePlots(pNN50YoungOver,'pNN50YoungOver',p1);
%[pD1 ,pD2] =displayPdif(mean(pNN50OldOver),mean(pNN50YoungOver),'PNN50 Overlapping Windows');
displayBoxPlot(pNN50YoungOver);
%}

%{
PNN50Young = computePNN50SepWindows(Young,Files4,1);
p1=computeP(PNN50Young(1,1:6),PNN50Young(1,12:16));
p2=computeP(PNN50Young(1,1:6),PNN50Young(1,6:12));
p3=computeP(PNN50Young(1,6:12),PNN50Young(1,12:16));
%[pD1 ,pD2] =displayPdif(mean(PNN50Old),mean(PNN50Young),'PNN50 Non Overlapping Windows');
displayBoxPlot(PNN50Young);
%}

%{
RMSSDYoungSep=computeRMSSDSepWindows(Young,Files4,2);
p1=computeP(RMSSDYoungSep(1,1:6),RMSSDYoungSep(1,12:16));
p2=computeP(RMSSDYoungSep(1,1:6),RMSSDYoungSep(1,6:12));
p3=computeP(RMSSDYoungSep(1,6:12),RMSSDYoungSep(1,12:16));
%[pD1 ,pD2] =displayPdif(mean(RMSSDOldSep),mean(RMSSDYoungSep),'RMSSD Non Overlapping Windows');
displayBoxPlot(RMSSDYoungSep);
%}

%{
RMSSDYoungOv=computeRMSSDOvLapWindows(Young,Files4,2);
p1=computeP(RMSSDYoungOv(1,1:6),RMSSDYoungOv(1,12:16));
p2=computeP(RMSSDYoungOv(1,1:6),RMSSDYoungOv(1,6:12));
p3=computeP(RMSSDYoungOv(1,6:12),RMSSDYoungOv(1,12:16));

%savePlots(RMSSDYoungOv,'RMSSDYoungOv',p1);
%[pD1 ,pD2] =displayPdif(mean(RMSSDOldOv),mean(RMSSDYoungOv),'RMSSD Overlapping Windows');
displayBoxPlot(RMSSDYoungOv);
%}


%{
SDSDOYoungSep=computeSDSDSepWindows(Young,Files4,2);
p1=computeP(SDSDOYoungSep(1,1:6),SDSDOYoungSep(1,12:16));
p2=computeP(SDSDOYoungSep(1,1:6),SDSDOYoungSep(1,6:12));
p3=computeP(SDSDOYoungSep(1,6:12),SDSDOYoungSep(1,12:16));
%}


%{
SDSDYoungOv=computeSDSDOvLapWindows(Young,Files4,2);
p1=computeP(SDSDYoungOv(1,1:6),SDSDYoungOv(1,12:16));
p2=computeP(SDSDYoungOv(1,1:6),SDSDYoungOv(1,6:12));
p3=computeP(SDSDYoungOv(1,6:12),SDSDYoungOv(1,12:16));
savePlots(SDSDYoungOv,'SDSDYoungOv',p1);
%}


%{
rateSep2 = computeRythmSepWindows(Young,Files4,2);
p1=computeP(rateSep2(1,1:6),rateSep2(1,12:16));
p2=computeP(rateSep2(1,1:6),rateSep2(1,6:12));
p3=computeP(rateSep2(1,6:12),rateSep2(1,12:16));
rateSepYoung=zeros(1,16);
for k=1:16
    rateSepYoung(1,k)=mean(rateSep2(:,k));
end
displayBoxPlot(rateSep2);
%}
%[1pD1 ,pD2] =displayPdif(rateSepOld,rateSepYoung,'Rate Non Overlapping Windows');


%{
rateOv2 = computeRythmOvLapWindows(Young,Files4,4);
p1=computeP(rateOv2(1,1:6),rateOv2(1,12:16));
p2=computeP(rateOv2(1,1:6),rateOv2(1,6:12));
p3=computeP(rateOv2(1,6:12),rateOv2(1,12:16));
%savePlots(rateOv2,'rateOv2Young',p1);
rateOvYoung=zeros(1,16);
for k=1:16
    rateOvYoung(1,k)=mean(rateOv2(:,k));
end

%[pO1,pO2]=displayPdif(rateOvOld,rateOvYoung,'Rate overlapping windows');
displayBoxPlot(rateOv2);
%}


%{
dcBBSepY = computedcBBSepWindows(Young,Files4,10);
p1=computeP(dcBBSepY(1,1:6),dcBBSepY(1,12:16));
p2=computeP(dcBBSepY(1,1:6),dcBBSepY(1,6:12));
p3=computeP(dcBBSepY(1,6:12),dcBBSepY(1,12:16));
%[pD1 ,pD2] =displayPdif(mean(dcBBSepO),mean(dcBBSepY),'dcBB Non Overlapping Windows');
displayBoxPlot(dcBBSepY);
%}
%{
dcBBY=computeDCOvLapWindows(Young,Files4,11);
p1=computeP(dcBBY(1,1:6),dcBBY(1,12:16));
p2=computeP(dcBBY(1,1:6),dcBBY(1,6:12));
p3=computeP(dcBBY(1,6:12),dcBBY(1,12:16));
%savePlots(dcBBY,'dcBBYoung',p1);
%[pD1 ,pD2] =displayPdif(mean(dcBBO),mean(dcBBY),'dcBB Overlapping Windows');
displayBoxPlot(dcBBY);
%}
%{
dcSignY=computeDCSignOvLapWindows(Young,Files4,12);
p1=computeP(dcSignY(1,1:6),dcSignY(1,12:16));
p2=computeP(dcSignY(1,1:6),dcSignY(1,6:12));
p3=computeP(dcSignY(1,6:12),dcSignY(1,12:16));
%savePlots(dcSignY,'dcSignYoung',p1);
%[pD1 ,pD2] =displayPdif(mean(dcSignO),mean(dcSignY),'SignDC Overlapping Windows');
displayBoxPlot(dcSignY);
%}
%{
dcSY=computeDCSignSepWindows(Young,Files4,13);
p1=computeP(dcSY(1,1:6),dcSY(1,12:16));
p2=computeP(dcSY(1,1:6),dcSY(1,6:12));
p3=computeP(dcSY(1,6:12),dcSY(1,12:16));
%[pD1 ,pD2] =displayPdif(mean(dcSO),mean(dcSY),'SignDC Non Overlapping Windows');
displayBoxPlot(dcSY);
%}

 

%p=displayPdif(dcSO,dcSY,'DCSign SepWindows');


%Files5 = dir('NormalWeight/*.txt');
%NormalWeight = storeMales(Files5);
%%%%!!!!!!!!!!!!!!!!!!!!!!!!!!!!%%%%%%%%%%%%%%%%

%{
sdnnOLD= computeSDNNOvWin(NormalWeight,Files5,1);
pSDNN1=0.1*computeP(sdnnOLD(1,1:6),sdnnOLD(1,11:16));
pSDNN2=0.1*computeP(sdnnOLD(1,1:6),sdnnOLD(1,7:12));
pSDNN3=0.1*computeP(sdnnOLD(1,7:12),sdnnOLD(1,11:16));
displayBoxPlot(sdnnOLD);
%}
%{
sdnnOld= computeSDNNSepWin(NormalWeight,Files5,1);
pSDNN1=0.1*computeP(sdnnOld(1,1:4),sdnnOld(1,13:16));
pSDNN2=0.1*computeP(sdnnOld(1,1:4),sdnnOld(1,9:12));
pSDNN3=0.1*computeP(sdnnOld(1,9:12),sdnnOld(1,13:16));
displayBoxPlot(sdnnOld);
%}

%{
rateNWSep=computeRythmSepWindows(NormalWeight,Files5,1);
pn1=computeP(rateNWSep(1,1:6),rateNWSep(1,12:16));
pn2=computeP(rateNWSep(1,1:6),rateNWSep(1,6:12));
pn3=computeP(rateNWSep(1,6:12),rateNWSep(1,12:16));
displayBoxPlot(rateNWSep);
%}
%{
rateNWOver=computeRythmOvLapWindows(NormalWeight,Files5,1);
pn1=computeP(rateNWOver(1,1:6),rateNWOver(1,12:16));
pn2=computeP(rateNWOver(1,1:6),rateNWOver(1,6:12));
pn3=computeP(rateNWOver(1,6:12),rateNWOver(1,12:16));
%savePlots(rateNWOver,'rateOverNormalWeight',pn1);
displayBoxPlot(rateNWOver);
%}
%{
meanNNNWOver=computeMeanNNOvLapWindows(NormalWeight,Files5,1);
pn1=computeP(meanNNNWOver(1,1:6),meanNNNWOver(1,12:16));
pn2=computeP(meanNNNWOver(1,1:6),meanNNNWOver(1,6:12));
pn3=computeP(meanNNNWOver(1,6:12),meanNNNWOver(1,12:16));
%savePlots(meanNNNWOver,'meanNNNWOverNormalWeight',pn1);
displayBoxPlot(meanNNNWOver);
%}

%{
meanNNNWSep=computeMeanNNSepWindows(NormalWeight,Files5,2);
pn1=computeP(meanNNNWSep(1,1:6),meanNNNWSep(1,12:16));
pn2=computeP(meanNNNWSep(1,1:6),meanNNNWSep(1,6:12));
pn3=computeP(meanNNNWSep(1,6:12),meanNNNWSep(1,12:16));
displayBoxPlot(meanNNNWSep);
%}

%{
RMSSDNWOv=computeRMSSDOvLapWindows(NormalWeight,Files5,2);
pn1=computeP(RMSSDNWOv(1,1:6),RMSSDNWOv(1,12:16));
pn2=computeP(RMSSDNWOv(1,1:6),RMSSDNWOv(1,6:12));
pn3=computeP(RMSSDNWOv(1,6:12),RMSSDNWOv(1,12:16));
%savePlots(RMSSDNWOv,'RMSSDNWOvNormalWeight',pn1);
displayBoxPlot(RMSSDNWOv);
%}
%{
RMSSDNWSep=computeRMSSDSepWindows(NormalWeight,Files5,2);
p1=computeP(RMSSDNWSep(1,1:6),RMSSDNWSep(1,12:16));
p2=computeP(RMSSDNWSep(1,1:6),RMSSDNWSep(1,6:12));
p3=computeP(RMSSDNWSep(1,6:12),RMSSDNWSep(1,12:16));
displayBoxPlot(RMSSDNWSep);
%}

%{
SDSDNWSep=computeSDSDSepWindows(NormalWeight,Files5,2);
pn1=computeP(SDSDNWSep(1,1:6),SDSDNWSep(1,12:16));
pn2=computeP(SDSDNWSep(1,1:6),SDSDNWSep(1,6:12));
pn3=computeP(SDSDNWSep(1,6:12),SDSDNWSep(1,12:16));
displayBoxPlot(RMSSDNWSep);
%}
%{
SDSDNWOv=computeSDSDOvLapWindows(NormalWeight,Files5,2);
pn1=computeP(SDSDNWOv(1,1:6),SDSDNWOv(1,12:16));
pn2=computeP(SDSDNWOv(1,1:6),SDSDNWOv(1,6:12));
pn3=computeP(SDSDNWOv(1,6:12),SDSDNWOv(1,12:16));
savePlots(SDSDNWOv,'SDSDNWOvNormalWeight',pn1);
%}

%{
pNN50NWOver=computecomputePNN50OvLapWindows(NormalWeight,Files5,1);
pOld1=computeP(pNN50NWOver(1,1:6),pNN50NWOver(1,12:16));
pOld2=computeP(pNN50NWOver(1,1:6),pNN50NWOver(1,6:12));
pOld3=computeP(pNN50NWOver(1,6:12),pNN50NWOver(1,12:16));
%savePlots(pNN50NWOver,'pNN50NWOverNormalWeight',pOld1);
displayBoxPlot(pNN50NWOver);
%}
%{
PNN50NWSep = computePNN50SepWindows(NormalWeight,Files5,1);
pOld1=computeP(PNN50NWSep(1,1:6),PNN50NWSep(1,12:16));
pOld2=computeP(PNN50NWSep(1,1:6),PNN50NWSep(1,6:12));
pOld3=computeP(PNN50NWSep(1,6:12),PNN50NWSep(1,12:16));
displayBoxPlot(PNN50NWSep);
%}

%{
dcSignNW=computeDCSignOvLapWindows(NormalWeight,Files5,5);
pn1=computeP(dcSignNW(1,1:6),dcSignNW(1,12:16));
pn2=computeP(dcSignNW(1,1:6),dcSignNW(1,6:12));
pn3=computeP(dcSignNW(1,6:12),dcSignNW(1,12:16));
%savePlots(dcSignNW,'dcSignNWNormalWeight',pn1);
displayBoxPlot(dcSignNW);
%}

%{
dcSNW=computedcSignSepWindows(NormalWeight,Files5,6);
pn1=computeP(dcSNW(1,1:6),dcSNW(1,12:16));
pn2=computeP(dcSNW(1,1:6),dcSNW(1,6:12));
pn3=computeP(dcSNW(1,6:12),dcSNW(1,12:16));
displayBoxPlot(dcSNW);
%}

%{
dcBBSepNW  = computedcBBSepWindows(NormalWeight,Files5,3);
p1=computeP(dcBBSepNW(1,1:6),dcBBSepNW(1,12:16));
p2=computeP(dcBBSepNW(1,1:6),dcBBSepNW(1,6:12));
p3=computeP(dcBBSepNW(1,6:12),dcBBSepNW(1,12:16));
displayBoxPlot(dcBBSepNW);
%}
%{
dcBBONW=computeDCOvLapWindows(NormalWeight,Files5,4);
pn1=computeP(dcBBONW(1,1:6),dcBBONW(1,12:16));
pn2=computeP(dcBBONW(1,1:6),dcBBONW(1,6:12));
pn3=computeP(dcBBONW(1,6:12),dcBBONW(1,12:16));
%savePlots(dcBBONW,'dcBBONWNormalWeight',pn1);
displayBoxPlot(dcBBONW);
%}


%Files6 = dir('OverWeight/*.txt');
%OverWeight = storeMales(Files6);

%{
sdnnOW= computeSDNNOvWin(OverWeight,Files6,1);
pSDNN1=0.1*computeP(sdnnOW(1,1:6),sdnnOW(1,11:16));
pSDNN2=0.1*computeP(sdnnOW(1,1:6),sdnnOW(1,7:12));
pSDNN3=0.1*computeP(sdnnOW(1,7:12),sdnnOW(1,11:16));
%[pD1 ,pD2] =displayPdif(mean(sdnnOLD),mean(sdnnOW),'SDNN Overlapping Windows');
displayBoxPlot(sdnnOW);
%}
%{
sdnnO= computeSDNNSepWin(OverWeight,Files6,1);
pSDNN1=0.1*computeP(sdnnO(1,1:4),sdnnO(1,13:16));
pSDNN2=0.1*computeP(sdnnO(1,1:4),sdnnO(1,9:12));
pSDNN3=0.1*computeP(sdnnO(1,9:12),sdnnO(1,13:16));
%[pD1 ,pD2] =displayPdif(mean(sdnnOld),mean(sdnnO),'SDNN Non Overlapping Windows');
displayBoxPlot(sdnnO);
%}

%{
rateOWSep=computeRythmSepWindows(OverWeight,Files6,1);
p1=computeP(rateOWSep(1,1:6),rateOWSep(1,12:16));
p2=computeP(rateOWSep(1,1:6),rateOWSep(1,6:12));
p3=computeP(rateOWSep(1,6:12),rateOWSep(1,12:16));
%[pD1 ,pD2] =displayPdif(mean(rateNWSep),mean(rateOWSep),'Rate Non Overlapping Windows');
displayBoxPlot(rateOWSep);
%}

%{
rateOWOver=computeRythmOvLapWindows(OverWeight,Files6,1);
p1=computeP(rateOWOver(1,1:6),rateOWOver(1,12:16));
p2=computeP(rateOWOver(1,1:6),rateOWOver(1,6:12));
p3=computeP(rateOWOver(1,6:12),rateOWOver(1,12:16));
%savePlots(rateOWOver,'rateOwOOverWeight',p1);
%[pD1 ,pD2] =displayPdif(mean(rateNWOver),mean(rateOWOver),'Rate Overlapping Windows');
displayBoxPlot(rateOWOver);
%}

%{
meanNNOWOver=computeMeanNNOvLapWindows(OverWeight,Files6,1);
p1=computeP(meanNNOWOver(1,1:6),meanNNOWOver(1,12:16));
p2=computeP(meanNNOWOver(1,1:6),meanNNOWOver(1,6:12));
p3=computeP(meanNNOWOver(1,6:12),meanNNOWOver(1,12:16));
%savePlots(meanNNOWOver,'meanNNOWOverOverWeight',p1);
%[pD1 ,pD2] =displayPdif(mean(meanNNNWOver),mean(meanNNOWOver),'MeanNN Overlapping Windows');
displayBoxPlot(meanNNOWOver);
%}
%{
meanNNOWSep=computeMeanNNSepWindows(OverWeight,Files6,2);
p1=computeP(meanNNOWSep(1,1:6),meanNNOWSep(1,12:16));
p2=computeP(meanNNOWSep(1,1:6),meanNNOWSep(1,6:12));
p3=computeP(meanNNOWSep(1,6:12),meanNNOWSep(1,12:16));
%[pD1 ,pD2] =displayPdif(mean(meanNNNWSep),mean(meanNNOWSep),'MeanNN Non Overlapping Windows');
displayBoxPlot(meanNNOWSep);
%}

%{
RMSSDOWSep=computeRMSSDSepWindows(OverWeight,Files6,2);
p1=computeP(RMSSDOWSep(1,1:6),RMSSDOWSep(1,12:16));
p2=computeP(RMSSDOWSep(1,1:6),RMSSDOWSep(1,6:12));
p3=computeP(RMSSDOWSep(1,6:12),RMSSDOWSep(1,12:16));
%[pD1 ,pD2] =displayPdif(mean(RMSSDNWSep),mean(RMSSDOWSep),'RMSSD Non Overlapping Windows');
displayBoxPlot(RMSSDOWSep);
%}

%{
RMSSDOWOv=computeRMSSDOvLapWindows(OverWeight,Files6,2);
p1=computeP(RMSSDOWOv(1,1:6),RMSSDOWOv(1,12:16));
p2=computeP(RMSSDOWOv(1,1:6),RMSSDOWOv(1,6:12));
p3=computeP(RMSSDOWOv(1,6:12),RMSSDOWOv(1,12:16));
%[pD1 ,pD2] =displayPdif(mean(RMSSDNWOv),mean(RMSSDOWOv),'RMSSD Overlapping Windows');
%savePlots(RMSSDOWOv,'RMSSDOWOvOverWeight',p1);
displayBoxPlot(RMSSDOWOv);
%}

%{
SDSDOWSep=computeSDSDSepWindows(OverWeight,Files6,2);
p1=computeP(SDSDOWSep(1,1:6),SDSDOWSep(1,12:16));
p2=computeP(SDSDOWSep(1,1:6),SDSDOWSep(1,6:12));
p3=computeP(SDSDOWSep(1,6:12),SDSDOWSep(1,12:16));

%}
%{
SDSDOWOv=computeSDSDOvLapWindows(OverWeight,Files6,2);
p1=computeP(SDSDOWOv(1,1:6),SDSDOWOv(1,12:16));
p2=computeP(SDSDOWOv(1,1:6),SDSDOWOv(1,6:12));
p3=computeP(SDSDOWOv(1,6:12),SDSDOWOv(1,12:16));
savePlots(SDSDOWOv,'SDSDOWOvOverWeight',p1);
%}

%{
pNN50OWOver=computecomputePNN50OvLapWindows(OverWeight,Files6,1);
p1=computeP(pNN50OWOver(1,1:6),pNN50OWOver(1,12:16));
p2=computeP(pNN50OWOver(1,1:6),pNN50OWOver(1,6:12));
p3=computeP(pNN50OWOver(1,6:12),pNN50OWOver(1,12:16));
%savePlots(pNN50OWOver,'pNN50OWOvOverWeight',p1);
%[pD1 ,pD2] =displayPdif(mean(pNN50NWOver),mean(pNN50OWOver),'PNN50 Overlapping Windows');
displayBoxPlot(pNN50OWOver);
%}

%{
PNN50OWSep = computePNN50SepWindows(OverWeight,Files6,1);
p1=computeP(PNN50OWSep(1,1:6),PNN50OWSep(1,12:16));
p2=computeP(PNN50OWSep(1,1:6),PNN50OWSep(1,6:12));
p3=computeP(PNN50OWSep(1,6:12),PNN50OWSep(1,12:16));
%[pD1 ,pD2] =displayPdif(mean(PNN50NWSep),mean(PNN50OWSep),'PNN50 Non Overlapping Windows');
displayBoxPlot(PNN50OWSep);
%}

%{
dcSignOW=computeDCSignOvLapWindows(OverWeight,Files6,5);
p1=computeP(dcSignOW(1,1:6),dcSignOW(1,12:16));
p2=computeP(dcSignOW(1,1:6),dcSignOW(1,6:12));
p3=computeP(dcSignOW(1,6:12),dcSignOW(1,12:16));
%savePlots(dcSignOW,'dcSignOWOvOverWeight',p1);
%[pD1 ,pD2] =displayPdif(mean(dcSignNW),mean(dcSignOW),'SignDC Overlapping Windows');
displayBoxPlot(dcSignOW);
%}

%{
dcSOW=computedcSignSepWindows(OverWeight,Files6,6);
p1=computeP(dcSOW(1,1:6),dcSOW(1,12:16));
p2=computeP(dcSOW(1,1:6),dcSOW(1,6:12));
p3=computeP(dcSOW(1,6:12),dcSOW(1,12:16));
%[pD1 ,pD2] =displayPdif(mean(dcSNW),mean(dcSOW),'SignDC Non Overlapping Windows');
displayBoxPlot(dcSOW);
%}



%{
dcBBSepOW  = computedcBBSepWindows(OverWeight,Files6,3);
p_1=computeP(dcBBSepOW(1,1:6),dcBBSepOW(1,12:16));
p_2=computeP(dcBBSepOW(1,1:6),dcBBSepOW(1,6:12));
p_3=computeP(dcBBSepOW(1,6:12),dcBBSepOW(1,12:16));
%[pD1 ,pD2] =displayPdif(mean(dcBBSepNW),mean(dcBBSepOW),'BBDC Non Overlapping Windows');
displayBoxPlot(dcBBSepOW);
%}

%{
dcBBOOW=computeDCOvLapWindows(OverWeight,Files6,4);
p1=computeP(dcBBOOW(1,1:6),dcBBOOW(1,12:16));
p2=computeP(dcBBOOW(1,1:6),dcBBOOW(1,6:12));
p3=computeP(dcBBOOW(1,6:12),dcBBOOW(1,12:16));
%savePlots(dcBBOOW,'dcBBOWOvOverWeight',p1);
%[pD1 ,pD2] =displayPdif(mean(dcBBONW),mean(dcBBOOW),'BBDC Overlapping Windows');
displayBoxPlot(dcBBOOW);
%}
%p=displayPdif(dcBBONW,dcBBOOW,'DCBB OvWindows');
%savePlots(dcBBOOW,'DCBB',p1);

%{
[wavResC  wavResL ]=computeWavelets(OverWeight,8,'bior1.3');
Stds=computeStdWaveletsSep(wavResC);
p1=computeP(Stds(1,1:6),Stds(1,12:16));
p2=computeP(Stds(1,1:6),Stds(1,6:12));
p3=computeP(Stds(1,6:12),Stds(1,12:16));
savePlots(Stds,'OverWeight biorthogonal scale 8',p1);
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{

files_nsvt= dir('nsvt_1/*.txt');
nsvt=storeMales(files_nsvt);
%{
ratensvtSep=computeRythmSepWindows(nsvt,files_nsvt,1);
p1=computeP(ratensvtSep(1,1:6),ratensvtSep(1,12:16));
p2=computeP(ratensvtSep(1,1:6),ratensvtSep(1,6:12));
p3=computeP(ratensvtSep(1,6:12),ratensvtSep(1,12:16));
savePlots(ratensvtSep,'rateNSVTSep',p1);
%}
%{
ratensvtOver=computeRythmOvLapWindows(nsvt,files_nsvt,1);
p1=computeP(ratensvtOver(1,1:6),ratensvtOver(1,12:16));
p2=computeP(ratensvtOver(1,1:6),ratensvtOver(1,6:12));
p3=computeP(ratensvtOver(1,6:12),ratensvtOver(1,12:16));
savePlots(ratensvtOver,'ratensvtOver',p1);
%}

%{
meanNNnsvtOver=computeMeanNNOvLapWindows(nsvt,files_nsvt,1);
p1=computeP(meanNNnsvtOver(1,1:6),meanNNnsvtOver(1,12:16));
p2=computeP(meanNNnsvtOver(1,1:6),meanNNnsvtOver(1,6:12));
p3=computeP(meanNNnsvtOver(1,6:12),meanNNnsvtOver(1,12:16));
savePlots(meanNNnsvtOver,'meanNNnsvtOver',p1);
%}
%{
meanNNnsvtSep=computeMeanNNSepWindows(nsvt,files_nsvt,2);
p1=computeP(meanNNnsvtSep(1,1:6),meanNNnsvtSep(1,12:16));
p2=computeP(meanNNnsvtSep(1,1:6),meanNNnsvtSep(1,6:12));
p3=computeP(meanNNnsvtSep(1,6:12),meanNNnsvtSep(1,12:16));
savePlots(meanNNnsvtSep,'meanNNnsvtSep',p1);
%}
%{
RMSSDnsvtSep=computeRMSSDSepWindows(nsvt,files_nsvt,2);
p1=computeP(RMSSDnsvtSep(1,1:6),RMSSDnsvtSep(1,12:16));
p2=computeP(RMSSDnsvtSep(1,1:6),RMSSDnsvtSep(1,6:12));
p3=computeP(RMSSDnsvtSep(1,6:12),RMSSDnsvtSep(1,12:16));
savePlots(RMSSDnsvtSep,'RMSSDnsvtSep',p1);
%}
%{
RMSSDnsvtOv=computeRMSSDOvLapWindows(nsvt,files_nsvt,2);
p1=computeP(RMSSDnsvtOv(1,1:6),RMSSDnsvtOv(1,12:16));
p2=computeP(RMSSDnsvtOv(1,1:6),RMSSDnsvtOv(1,6:12));
p3=computeP(RMSSDnsvtOv(1,6:12),RMSSDnsvtOv(1,12:16));
savePlots(RMSSDnsvtOv,'RMSSDnsvtOv',p1);
%}
%{
SDSDnsvtSep=computeSDSDSepWindows(nsvt,files_nsvt,2);
p1=computeP(SDSDnsvtSep(1,1:6),SDSDnsvtSep(1,12:16));
p2=computeP(SDSDnsvtSep(1,1:6),SDSDnsvtSep(1,6:12));
p3=computeP(SDSDnsvtSep(1,6:12),SDSDnsvtSep(1,12:16));
%}
%{
SDSDnsvtOv=computeSDSDOvLapWindows(nsvt,files_nsvt,2);
p1=computeP(SDSDnsvtOv(1,1:6),SDSDnsvtOv(1,12:16));
p2=computeP(SDSDnsvtOv(1,1:6),SDSDnsvtOv(1,6:12));
p3=computeP(SDSDnsvtOv(1,6:12),SDSDnsvtOv(1,12:16));
savePlots(SDSDnsvtOv,'SDSDnsvtOv',p1);
%}
%{
pNN50nsvtOver=computecomputePNN50OvLapWindows(nsvt,files_nsvt,1);
p1=computeP(pNN50nsvtOver(1,1:6),pNN50nsvtOver(1,12:16));
p2=computeP(pNN50nsvtOver(1,1:6),pNN50nsvtOver(1,6:12));
p3=computeP(pNN50nsvtOver(1,6:12),pNN50nsvtOver(1,12:16));
savePlots(pNN50nsvtOver,'pNN50nsvtOver',p1);
%}
%{
PNN50nsvtSep = computePNN50SepWindows(nsvt,files_nsvt,1);
p1=computeP(PNN50nsvtSep(1,1:6),PNN50nsvtSep(1,12:16));
p2=computeP(PNN50nsvtSep(1,1:6),PNN50nsvtSep(1,6:12));
p3=computeP(PNN50nsvtSep(1,6:12),PNN50nsvtSep(1,12:16));
%}
%{
dcSignnsvtOver=computeDCSignOvLapWindows(nsvt,files_nsvt,5);
p1=computeP(dcSignnsvtOver(1,1:6),dcSignnsvtOver(1,12:16));
p2=computeP(dcSignnsvtOver(1,1:6),dcSignnsvtOver(1,6:12));
p3=computeP(dcSignnsvtOver(1,6:12),dcSignnsvtOver(1,12:16));
savePlots(dcSignnsvtOver,'dcSignnsvtOver',p1);
%}
%{
dcSnsvtSep=computedcSignSepWindows(nsvt,files_nsvt,6);
p1=computeP(dcSnsvtSep(1,1:6),dcSnsvtSep(1,12:16));
p2=computeP(dcSnsvtSep(1,1:6),dcSnsvtSep(1,6:12));
p3=computeP(dcSnsvtSep(1,6:12),dcSnsvtSep(1,12:16));
%}
%{
dcBBSepnsvt  = computedcBBSepWindows(nsvt,files_nsvt,3);
p_1=computeP(dcBBSepnsvt(1,1:6),dcBBSepnsvt(1,12:16));
p_2=computeP(dcBBSepnsvt(1,1:6),dcBBSepnsvt(1,6:12));
p_3=computeP(dcBBSepnsvt(1,6:12),dcBBSepnsvt(1,12:16));
%}
%{
dcBBOvnsvt=computeDCOvLapWindows(nsvt,files_nsvt,4);
p1=computeP(dcBBOvnsvt(1,1:6),dcBBOvnsvt(1,12:16));
p2=computeP(dcBBOvnsvt(1,1:6),dcBBOvnsvt(1,6:12));
p3=computeP(dcBBOvnsvt(1,6:12),dcBBOvnsvt(1,12:16));
savePlots(dcBBOvnsvt,'dcBBOvnsvt',p1);
%}
%}
%{
files_nsvt_high= dir('nsvt_high_risk/*.txt');
nsvt_high=storeMales(files_nsvt_high);
%{
ratensvtSepH=computeRythmSepWindows(nsvt_high,files_nsvt_high,1);
p1_=computeP(ratensvtSepH(1,1:6),ratensvtSepH(1,12:16));
p2_=computeP(ratensvtSepH(1,1:6),ratensvtSepH(1,6:12));
p3_=computeP(ratensvtSepH(1,6:12),ratensvtSepH(1,12:16));
savePlots(ratensvtSepH,'rateNSVTSepH',p1_);

%}
%{
ratensvtOverH=computeRythmOvLapWindows(nsvt_high,files_nsvt_high,1);
p1=computeP(ratensvtOverH(1,1:6),ratensvtOverH(1,12:16));
p2=computeP(ratensvtOverH(1,1:6),ratensvtOverH(1,6:12));
p3=computeP(ratensvtOverH(1,6:12),ratensvtOverH(1,12:16));
savePlots(ratensvtOverH,'ratensvtOverHigh',p1);
%}

%{
meanNNnsvtOverH=computeMeanNNOvLapWindows(nsvt_high,files_nsvt_high,1);
p1=computeP(meanNNnsvtOverH(1,1:6),meanNNnsvtOverH(1,12:16));
p2=computeP(meanNNnsvtOverH(1,1:6),meanNNnsvtOverH(1,6:12));
p3=computeP(meanNNnsvtOverH(1,6:12),meanNNnsvtOverH(1,12:16));
savePlots(meanNNnsvtOverH,'meanNNnsvtOverH',p1);
%}
%{
meanNNnsvtSepH=computeMeanNNSepWindows(nsvt_high,files_nsvt_high,2);
p1=computeP(meanNNnsvtSepH(1,1:6),meanNNnsvtSepH(1,12:16));
p2=computeP(meanNNnsvtSepH(1,1:6),meanNNnsvtSepH(1,6:12));
p3=computeP(meanNNnsvtSepH(1,6:12),meanNNnsvtSepH(1,12:16));
savePlots(meanNNnsvtSepH,'meanNNnsvtSepH',p1);
%}
%{
RMSSDnsvtSepH=computeRMSSDSepWindows(nsvt_high,files_nsvt_high,2);
p1=computeP(RMSSDnsvtSepH(1,1:6),RMSSDnsvtSepH(1,12:16));
p2=computeP(RMSSDnsvtSepH(1,1:6),RMSSDnsvtSepH(1,6:12));
p3=computeP(RMSSDnsvtSepH(1,6:12),RMSSDnsvtSepH(1,12:16));
savePlots(RMSSDnsvtSepH,'RMSSDnsvtSepH',p1);
%}
%{
RMSSDnsvtOvH=computeRMSSDOvLapWindows(nsvt_high,files_nsvt_high,2);
p1=computeP(RMSSDnsvtOvH(1,1:6),RMSSDnsvtOvH(1,12:16));
p2=computeP(RMSSDnsvtOvH(1,1:6),RMSSDnsvtOvH(1,6:12));
p3=computeP(RMSSDnsvtOvH(1,6:12),RMSSDnsvtOvH(1,12:16));
savePlots(RMSSDnsvtOvH,'RMSSDnsvtOvH',p1);
%}
%{
SDSDnsvtSepH=computeSDSDSepWindows(nsvt_high,files_nsvt_high,2);
p1=computeP(SDSDnsvtSepH(1,1:6),SDSDnsvtSepH(1,12:16));
p2=computeP(SDSDnsvtSepH(1,1:6),SDSDnsvtSepH(1,6:12));
p3=computeP(SDSDnsvtSepH(1,6:12),SDSDnsvtSepH(1,12:16));
%}
%{
SDSDnsvtOvH=computeSDSDOvLapWindows(nsvt_high,files_nsvt_high,2);
p1=computeP(SDSDnsvtOvH(1,1:6),SDSDnsvtOvH(1,12:16));
p2=computeP(SDSDnsvtOvH(1,1:6),SDSDnsvtOvH(1,6:12));
p3=computeP(SDSDnsvtOvH(1,6:12),SDSDnsvtOvH(1,12:16));
savePlots(SDSDnsvtOvH,'SDSDnsvtOvH',p1);
%}
%{
pNN50nsvtOverH=computecomputePNN50OvLapWindows(nsvt_high,files_nsvt_high,1);
p1=computeP(pNN50nsvtOverH(1,1:6),pNN50nsvtOverH(1,12:16));
p2=computeP(pNN50nsvtOverH(1,1:6),pNN50nsvtOverH(1,6:12));
p3=computeP(pNN50nsvtOverH(1,6:12),pNN50nsvtOverH(1,12:16));
savePlots(pNN50nsvtOverH,'pNN50nsvtOver',p1);
%}
%{
PNN50nsvtSepH = computePNN50SepWindows(nsvt_high,files_nsvt_high,1);
p1=computeP(PNN50nsvtSepH(1,1:6),PNN50nsvtSepH(1,12:16));
p2=computeP(PNN50nsvtSepH(1,1:6),PNN50nsvtSepH(1,6:12));
p3=computeP(PNN50nsvtSepH(1,6:12),PNN50nsvtSepH(1,12:16));
%}
%{
dcSignnsvtOverH=computeDCSignOvLapWindows(nsvt_high,files_nsvt_high,5);
p1=computeP(dcSignnsvtOverH(1,1:6),dcSignnsvtOverH(1,12:16));
p2=computeP(dcSignnsvtOverH(1,1:6),dcSignnsvtOverH(1,6:12));
p3=computeP(dcSignnsvtOverH(1,6:12),dcSignnsvtOverH(1,12:16));
savePlots(dcSignnsvtOverH,'dcSignnsvtOverH',p1);
%}
%{
dcSnsvtSepH=computedcSignSepWindows(nsvt_high,files_nsvt_high,6);
p1=computeP(dcSnsvtSepH(1,1:6),dcSnsvtSepH(1,12:16));
p2=computeP(dcSnsvtSepH(1,1:6),dcSnsvtSepH(1,6:12));
p3=computeP(dcSnsvtSepH(1,6:12),dcSnsvtSepH(1,12:16));
%}
%{
dcBBSepnsvtH  = computedcBBSepWindows(nsvt_high,files_nsvt_high,3);
p_1=computeP(dcBBSepnsvtH(1,1:6),dcBBSepnsvtH(1,12:16));
p_2=computeP(dcBBSepnsvtH(1,1:6),dcBBSepnsvtH(1,6:12));
p_3=computeP(dcBBSepnsvtH(1,6:12),dcBBSepnsvtH(1,12:16));
%}
%{
dcBBOvnsvtH=computeDCOvLapWindows(nsvt_high,files_nsvt_high,4);
p1=computeP(dcBBOvnsvtH(1,1:6),dcBBOvnsvtH(1,12:16));
p2=computeP(dcBBOvnsvtH(1,1:6),dcBBOvnsvtH(1,6:12));
p3=computeP(dcBBOvnsvtH(1,6:12),dcBBOvnsvtH(1,12:16));
savePlots(dcBBOvnsvtH,'dcBBOvnsvtH',p1);
%}
%}

%{
files_nsvt_low= dir('nsvt_low_risk/*.txt');
nsvt_low=storeMales(files_nsvt_low);

%{
ratensvtSep=computeRythmSepWindows(nsvt_low,files_nsvt_low,1);
p11=computeP(ratensvtSep(1,1:6),ratensvtSep(1,12:16));
p21=computeP(ratensvtSep(1,1:6),ratensvtSep(1,6:12));
p31=computeP(ratensvtSep(1,6:12),ratensvtSep(1,12:16));
savePlots(ratensvtSep,'rateNSVTSepL',p11);
p=displayPdif(ratensvtSepH,ratensvtSep,'rate SepWindows');
%}
%{
ratensvtOver=computeRythmOvLapWindows(nsvt_low,files_nsvt_low,1);
p11=computeP(ratensvtOver(1,1:6),ratensvtOver(1,12:16));
p21=computeP(ratensvtOver(1,1:6),ratensvtOver(1,6:12));
p31=computeP(ratensvtOver(1,6:12),ratensvtOver(1,12:16));
savePlots(ratensvtOver,'ratensvtOverLow',p1);
p=displayPdif(ratensvtOverH,ratensvtOver,'rate OverLapping Windows');
%}

%{
meanNNnsvtOver=computeMeanNNOvLapWindows(nsvt_low,files_nsvt_low,1);
p11=computeP(meanNNnsvtOver(1,1:6),meanNNnsvtOver(1,12:16));
p21=computeP(meanNNnsvtOver(1,1:6),meanNNnsvtOver(1,6:12));
p31=computeP(meanNNnsvtOver(1,6:12),meanNNnsvtOver(1,12:16));
savePlots(meanNNnsvtOver,'meanNNnsvtOverLow',p11);
p=displayPdif(meanNNnsvtOverH,meanNNnsvtOver,'meanNN OverLapping Windows');
%}
%{
meanNNnsvtSep=computeMeanNNSepWindows(nsvt_low,files_nsvt_low,2);
p11=computeP(meanNNnsvtSep(1,1:6),meanNNnsvtSep(1,12:16));
p21=computeP(meanNNnsvtSep(1,1:6),meanNNnsvtSep(1,6:12));
p31=computeP(meanNNnsvtSep(1,6:12),meanNNnsvtSep(1,12:16));
savePlots(meanNNnsvtSep,'meanNNnsvtSepL',p11);
p=displayPdif(meanNNnsvtSepH,meanNNnsvtSep,'meanNN Separate Windows');
%}
%{
RMSSDnsvtSep=computeRMSSDSepWindows(nsvt_low,files_nsvt_low,2);
p1=computeP(RMSSDnsvtSep(1,1:6),RMSSDnsvtSep(1,12:16));
p2=computeP(RMSSDnsvtSep(1,1:6),RMSSDnsvtSep(1,6:12));
p3=computeP(RMSSDnsvtSep(1,6:12),RMSSDnsvtSep(1,12:16));
savePlots(RMSSDnsvtSep,'RMSSDnsvtSepL',p1);
p=displayPdif(RMSSDnsvtSepH,RMSSDnsvtSep,'RMSSD Separate Windows');
%}
%{
RMSSDnsvtOv=computeRMSSDOvLapWindows(nsvt_low,files_nsvt_low,2);
p11=computeP(RMSSDnsvtOv(1,1:6),RMSSDnsvtOv(1,12:16));
p21=computeP(RMSSDnsvtOv(1,1:6),RMSSDnsvtOv(1,6:12));
p31=computeP(RMSSDnsvtOv(1,6:12),RMSSDnsvtOv(1,12:16));
savePlots(RMSSDnsvtOv,'RMSSDnsvtOvL',p11);
p=displayPdif(RMSSDnsvtOvH,RMSSDnsvtOv,'RMSSD OverLapping Windows');
%}
%{
SDSDnsvtSep=computeSDSDSepWindows(nsvt_low,files_nsvt_low,2);
p11=computeP(SDSDnsvtSep(1,1:6),SDSDnsvtSep(1,12:16));
p21=computeP(SDSDnsvtSep(1,1:6),SDSDnsvtSep(1,6:12));
p31=computeP(SDSDnsvtSep(1,6:12),SDSDnsvtSep(1,12:16));
p=displayPdif(SDSDnsvtSepH,SDSDnsvtSep,'SDSD Separate Windows');
%}
%{
SDSDnsvtOv=computeSDSDOvLapWindows(nsvt_low,files_nsvt_low,2);
p1=computeP(SDSDnsvtOv(1,1:6),SDSDnsvtOv(1,12:16));
p2=computeP(SDSDnsvtOv(1,1:6),SDSDnsvtOv(1,6:12));
p3=computeP(SDSDnsvtOv(1,6:12),SDSDnsvtOv(1,12:16));
savePlots(SDSDnsvtOv,'SDSDnsvtOvL',p1);
p=displayPdif(SDSDnsvtOvH,SDSDnsvtOv,'SDSD Over Windows');
%}
%{
pNN50nsvtOver=computecomputePNN50OvLapWindows(nsvt_low,files_nsvt_low,1);
p1=computeP(pNN50nsvtOver(1,1:6),pNN50nsvtOver(1,12:16));
p2=computeP(pNN50nsvtOver(1,1:6),pNN50nsvtOver(1,6:12));
p3=computeP(pNN50nsvtOver(1,6:12),pNN50nsvtOver(1,12:16));
savePlots(pNN50nsvtOver,'pNN50nsvtOverL',p1);
p=displayPdif(pNN50nsvtOverH,pNN50nsvtOver,'pnn50 Over Windows');
%}
%{
PNN50nsvtSep = computePNN50SepWindows(nsvt_low,files_nsvt_low,1);
p1=computeP(PNN50nsvtSep(1,1:6),PNN50nsvtSep(1,12:16));
p2=computeP(PNN50nsvtSep(1,1:6),PNN50nsvtSep(1,6:12));
p3=computeP(PNN50nsvtSep(1,6:12),PNN50nsvtSep(1,12:16));
p=displayPdif(PNN50nsvtSepH,PNN50nsvtSep,'pnn50 Sep Windows');
%}
%{
dcSignnsvtOver=computeDCSignOvLapWindows(nsvt_low,files_nsvt_low,5);
p1=computeP(dcSignnsvtOver(1,1:6),dcSignnsvtOver(1,12:16));
p2=computeP(dcSignnsvtOver(1,1:6),dcSignnsvtOver(1,6:12));
p3=computeP(dcSignnsvtOver(1,6:12),dcSignnsvtOver(1,12:16));
savePlots(dcSignnsvtOver,'dcSignnsvtOverL',p1);
p=displayPdif(dcSignnsvtOverH,dcSignnsvtOver,'dcSign Over Windows');
%}
%{
dcSnsvtSep=computedcSignSepWindows(nsvt_low,files_nsvt_low,6);
p1=computeP(dcSnsvtSep(1,1:6),dcSnsvtSep(1,12:16));
p2=computeP(dcSnsvtSep(1,1:6),dcSnsvtSep(1,6:12));
p3=computeP(dcSnsvtSep(1,6:12),dcSnsvtSep(1,12:16));
p=displayPdif(dcSnsvtSepH,dcSnsvtSep,'dcSign Sep Windows');
%}
%{
dcBBSepnsvt  = computedcBBSepWindows(nsvt_low,files_nsvt_low,3);
p_1=computeP(dcBBSepnsvt(1,1:6),dcBBSepnsvt(1,12:16));
p_2=computeP(dcBBSepnsvt(1,1:6),dcBBSepnsvt(1,6:12));
p_3=computeP(dcBBSepnsvt(1,6:12),dcBBSepnsvt(1,12:16));
p=displayPdif(dcBBSepnsvtH,dcBBSepnsvt,'dcBB Sep Windows');
%}
%{
dcBBOvnsvt=computeDCOvLapWindows(nsvt_low,files_nsvt_low,4);
p1=computeP(dcBBOvnsvt(1,1:6),dcBBOvnsvt(1,12:16));
p2=computeP(dcBBOvnsvt(1,1:6),dcBBOvnsvt(1,6:12));
p3=computeP(dcBBOvnsvt(1,6:12),dcBBOvnsvt(1,12:16));
savePlots(dcBBOvnsvt,'dcBBOvnsvtL',p1);
p=displayPdif(dcBBOvnsvtH,dcBBOvnsvt,'dcBB Over Windows');
%}

%{
[wavResC  wavResL ]=computeWavelets(nsvt_low,8,'bior1.3');
Stds=computeStdWaveletsSep(wavResC);
p1=computeP(Stds(1,1:6),Stds(1,12:16));
p2=computeP(Stds(1,1:6),Stds(1,6:12));
p3=computeP(Stds(1,6:12),Stds(1,12:16));
savePlots(Stds,'nsvt low risk biorthogonal scale 8',p1);
%}
%}

%Fnsvt= dir('nsvt_whole/*.txt');
%nsvt=storeNSVT(Fnsvt);
%{
ratensvtSep=computeRythmSepWindows(nsvt,Fnsvt,1);
p1_=computeP(ratensvtSep(1,1:6),ratensvtSep(1,12:16));
p2_=computeP(ratensvtSep(1,1:6),ratensvtSep(1,6:12));
p3_=computeP(ratensvtSep(1,6:12),ratensvtSep(1,12:16));
%savePlots(ratensvtSep,'rateNSVTSep',p1_);
%rateOv = computeRythmOvLapWindows(nsvt,Fnsvt,2);
%}
%{
ratensvtOver=computeRythmOvLapWindows(nsvt,Fnsvt,1);
p1=computeP(ratensvtOver(1,1:6),ratensvtOver(1,12:16));
p2=computeP(ratensvtOver(1,1:6),ratensvtOver(1,6:12));
p3=computeP(ratensvtOver(1,6:12),ratensvtOver(1,12:16));
%savePlots(ratensvtOver,'ratensvtOver',p1);
p=displayPdif(rateMalesOver,ratensvtOver,'Rate Over Windows');
%}
%{
meanNNnsvtOver=computeMeanNNOvLapWindows(nsvt,Fnsvt,1);
p1=computeP(meanNNnsvtOver(1,1:6),meanNNnsvtOver(1,12:16));
p2=computeP(meanNNnsvtOver(1,1:6),meanNNnsvtOver(1,6:12));
p3=computeP(meanNNnsvtOver(1,6:12),meanNNnsvtOver(1,12:16));
%savePlots(meanNNnsvtOver,'meanNNnsvtOver',p1);
p=displayPdif(meanNNMalesOver,meanNNnsvtOver,'MeanNN Over Windows');
%}
%{
meanNNnsvtSep=computeMeanNNSepWindows(nsvt,Fnsvt,1);
p1=computeP(meanNNnsvtSep(1,1:6),meanNNnsvtSep(1,12:16));
p2=computeP(meanNNnsvtSep(1,1:6),meanNNnsvtSep(1,6:12));
p3=computeP(meanNNnsvtSep(1,6:12),meanNNnsvtSep(1,12:16));
%}
%{
RMSSDnsvtSep=computeRMSSDSepWindows(nsvt,Fnsvt,1);
p1=computeP(RMSSDnsvtSep(1,1:6),RMSSDnsvtSep(1,12:16));
p2=computeP(RMSSDnsvtSep(1,1:6),RMSSDnsvtSep(1,6:12));
p3=computeP(RMSSDnsvtSep(1,6:12),RMSSDnsvtSep(1,12:16));
%}
%{
RMSSDnsvtOv=computeRMSSDOvLapWindows(nsvt,Fnsvt,1);
p1=computeP(RMSSDnsvtOv(1,1:6),RMSSDnsvtOv(1,12:16));
p2=computeP(RMSSDnsvtOv(1,1:6),RMSSDnsvtOv(1,6:12));
p3=computeP(RMSSDnsvtOv(1,6:12),RMSSDnsvtOv(1,12:16));
%savePlots(RMSSDnsvtOv,'RMSSDnsvtOv',p1);
p=displayPdif(RMSSDMalesOv,RMSSDnsvtOv,'RMSSD Over Windows');
%}
%{
SDSDnsvtSep=computeSDSDSepWindows(nsvt,Fnsvt,1);
p1=computeP(SDSDnsvtSep(1,1:6),SDSDnsvtSep(1,12:16));
p2=computeP(SDSDnsvtSep(1,1:6),SDSDnsvtSep(1,6:12));
p3=computeP(SDSDnsvtSep(1,6:12),SDSDnsvtSep(1,12:16));

%}
%{
SDSDnsvtOv=computeSDSDOvLapWindows(nsvt,Fnsvt,1);
p1=computeP(SDSDnsvtOv(1,1:6),SDSDnsvtOv(1,12:16));
p2=computeP(SDSDnsvtOv(1,1:6),SDSDnsvtOv(1,6:12));
p3=computeP(SDSDnsvtOv(1,6:12),SDSDnsvtOv(1,12:16));
%savePlots(SDSDnsvtOv,'SDSDnsvtOv',p1);
p=displayPdif(SDSDMalesOv,SDSDnsvtOv,'SDSD Over Windows');
%}
%{
pNN50nsvtOver=computecomputePNN50OvLapWindows(nsvt,Fnsvt,1);
p1=computeP(pNN50nsvtOver(1,1:6),pNN50nsvtOver(1,12:16));
p2=computeP(pNN50nsvtOver(1,1:6),pNN50nsvtOver(1,6:12));
p3=computeP(pNN50nsvtOver(1,6:12),pNN50nsvtOver(1,12:16));
%savePlots(pNN50nsvtOver,'pNN50nsvtOver',p1);
p=displayPdif(pNN50MalesOver,pNN50nsvtOver,'pNN50 Over Windows');
%}
%{
PNN50nsvtSepH = computePNN50SepWindows(nsvt,Fnsvt,1);
p1=computeP(PNN50nsvtSepH(1,1:6),PNN50nsvtSepH(1,12:16));
p2=computeP(PNN50nsvtSepH(1,1:6),PNN50nsvtSepH(1,6:12));
p3=computeP(PNN50nsvtSepH(1,6:12),PNN50nsvtSepH(1,12:16));
%}
%{
dcSignnsvtOver=computeDCSignOvLapWindows(nsvt,Fnsvt,1);
p1=computeP(dcSignnsvtOver(1,1:6),dcSignnsvtOver(1,12:16));
p2=computeP(dcSignnsvtOver(1,1:6),dcSignnsvtOver(1,6:12));
p3=computeP(dcSignnsvtOver(1,6:12),dcSignnsvtOver(1,12:16));
%savePlots(dcSignnsvtOver,'dcSignnsvtOver',p1);
p=displayPdif(dcSign,dcSignnsvtOver,'dcSign Over Windows');
%}
%{
dcSnsvtSep=computedcSignSepWindows(nsvt,Fnsvt,1);
p1=computeP(dcSnsvtSep(1,1:6),dcSnsvtSep(1,12:16));
p2=computeP(dcSnsvtSep(1,1:6),dcSnsvtSep(1,6:12));
p3=computeP(dcSnsvtSep(1,6:12),dcSnsvtSep(1,12:16));
%p=displayPdif(dcSnsvtSepH,dcSnsvtSep,'dcSign Sep Windows');
%}
%{
dcBBSepnsvt  = computedcBBSepWindows(nsvt,Fnsvt,1);
p_1=computeP(dcBBSepnsvt(1,1:6),dcBBSepnsvt(1,12:16));
p_2=computeP(dcBBSepnsvt(1,1:6),dcBBSepnsvt(1,6:12));
p_3=computeP(dcBBSepnsvt(1,6:12),dcBBSepnsvt(1,12:16));
p=displayPdif(pNN50MalesOver,pNN50nsvtOver,'pNN50 Over Windows');
%}
%{
dcBBOvnsvt=computeDCOvLapWindows(nsvt,Fnsvt,1);
p1=computeP(dcBBOvnsvt(1,1:6),dcBBOvnsvt(1,12:16));
p2=computeP(dcBBOvnsvt(1,1:6),dcBBOvnsvt(1,6:12));
p3=computeP(dcBBOvnsvt(1,6:12),dcBBOvnsvt(1,12:16));
%savePlots(dcBBOvnsvt,'dcBBOvnsvt',p1);
p=displayPdif(dcBB,dcBBOvnsvt,'dcBB Over Windows');
%}
%{
[wavResC  wavResL ]=computeWavelets(nsvt,8,'bior1.3');
Stds=computeStdWaveletsSep(wavResC);
p1=computeP(Stds(1,1:6),Stds(1,12:16));
p2=computeP(Stds(1,1:6),Stds(1,6:12));
p3=computeP(Stds(1,6:12),Stds(1,12:16));
savePlots(Stds,'nsvt biorthogonal scale 8',p1);
%}