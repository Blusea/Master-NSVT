function [wavResC  wavResL]= computeWavelets(signals, scale, wavelet)
wavResC=zeros(size(signals),length(signals));
wavResL=zeros(size(signals),length(signals));
for i=1:size(signals)
    [c,l]=wavedec(signals(i,:),scale,wavelet); 
    A3 = wrcoef('a',c,l,wavelet,scale);
    % D1 = wrcoef('d',wavResC,wavResL,'db1',1);
    %D2 = wrcoef('d',wavResC,wavResL,'db1',2);
    D3 = wrcoef('d',c,l,wavelet,scale) ;
    wavResC(i,:)=D3;
    wavResL(i,:)=A3;
end
%{
figure(3);
plot(signals(1,:));
figure(4);
plot(wavResC(1,:));
%}