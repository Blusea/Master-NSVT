clc;
clear all;
close all;


Files3 = dir('NormalWeight/*.txt');
NormalWeight = storeOld(Files3);
rateSep1 = computeRythmSepWindows(NormalWeight,Files3,3);


rateOv1 = computeRythmOvLapWindows(NormalWeight,Files3,3);

meanNNOldOver=computeMeanNNOvLapWindows(NormalWeight,Files3,2);


meanNNOldSep=computeMeanNNSepWindows(NormalWeight,Files3,2);


pNN50OldOver=computecomputePNN50OvLapWindows(NormalWeight,Files3,1);


PNN50Old = computePNN50SepWindows(NormalWeight,Files3,1);


RMSSDOldSep=computeRMSSDSepWindows(NormalWeight,Files3,2);


RMSSDOldOv=computeRMSSDOvLapWindows(NormalWeight,Files3,2);



dcBBSepO  = computedcBBSepWindows(NormalWeight,Files3,3);


dcBBO=computeDCOvLapWindows(NormalWeight,Files3,4);


dcSignO=computeDCSignOvLapWindows(NormalWeight,Files3,5);



dcSO=computedcSignSepWindows(NormalWeight,Files3,6);
sdnnOLD= computeSDNNOvWin(NormalWeight,Files3,6);


%
sdnnOldS= computeSDNNSepWin(NormalWeight,Files3,6);

Files4 = dir('OverWeight/*.txt');
OverWeight = storeYoung(Files4);



sdnnOY= computeSDNNOvWin(OverWeight,Files4,3);
pSDNNOV = computePdifChang(mean(sdnnOY),mean(sdnnOLD));

sdnnY= computeSDNNSepWin(OverWeight,Files4,3);
pSDNNSEp = computePdifChang(mean(sdnnY),mean(sdnnOldS));

meanNNYoungOver=computeMeanNNOvLapWindows(OverWeight,Files4,3);
pmeanOver= computePdifChang(mean(meanNNYoungOver),mean(meanNNOldOver));

meanNNYoungSep=computeMeanNNSepWindows(OverWeight,Files4,2);
pmeanSep= computePdifChang(mean(meanNNYoungSep),mean(meanNNOldSep));


pNN50YoungOver=computecomputePNN50OvLapWindows(OverWeight,Files4,1);
ppnn50Over= computePdifChang(mean(pNN50YoungOver),mean(pNN50OldOver));

PNN50Young = computePNN50SepWindows(OverWeight,Files4,1);
ppnn50Sep= computePdifChang(mean(PNN50Young),mean(PNN50Old));


RMSSDYoungSep=computeRMSSDSepWindows(OverWeight,Files4,2);
prmssdsep= computePdifChang(mean(RMSSDYoungSep),mean(RMSSDOldSep));

RMSSDYoungOv=computeRMSSDOvLapWindows(OverWeight,Files4,2);
prmssdov= computePdifChang(mean(RMSSDYoungOv),mean(RMSSDOldOv));

rateSep2 = computeRythmSepWindows(OverWeight,Files4,2);
prateSep= computePdifChang(mean(rateSep2),mean(rateSep1));


rateOv2 = computeRythmOvLapWindows(OverWeight,Files4,4);
prateOv= computePdifChang(mean(rateOv2),mean(rateOv1));


dcBBSepY = computedcBBSepWindows(OverWeight,Files4,10);
prbbdsep= computePdifChang(mean(dcBBSepY),mean(dcBBSepO));

dcBBY=computeDCOvLapWindows(OverWeight,Files4,11);
prbbdcov= computePdifChang(mean(dcBBY),mean(dcBBO));

dcSignY=computeDCSignOvLapWindows(OverWeight,Files4,12);
prsigndcov= computePdifChang(mean(dcSignY),mean(dcSignO));


dcSY=computeDCSignSepWindows(OverWeight,Files4,13);
prsigndsep= computePdifChang(mean(dcSY),mean(dcSO));

 
