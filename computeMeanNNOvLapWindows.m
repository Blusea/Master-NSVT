function  meanNN1 = computeMeanNNOvLapWindows(Signals,Files,fig)

meanNN1=zeros(length(Files),16);

for k=1:length(Files)
    i=1;
    m=1;
    l=find(Signals(k,:));
    jump=length(l)/16 ;
    while (m<17)
       
        mean1=computeMeanNN(Signals(k,i:i+( jump-1)));
        meanNN1(k,m)=mean1;
        m=m+1;
        i=i+(jump-((9*jump)/100));
    end
    
end
disp(i);


figure(fig);
hold on
for k=1:length(Files)
    hold on
plot(meanNN1(k,:),'r');
title('MeanNN with overlapping windows');
xlabel('windows');
ylabel('meanNN');
end


final=zeros(1,16);
for k=1:16
    final(1,k)=mean(meanNN1(:,k));
end

figure(fig);
plot(final);
title('MeanNN with  overlapping windows');
xlabel('windows');
ylabel('meanNN');

figure(fig+1);
plot(final);
title('MeanNN with overlapping windows');
xlabel('windows');
ylabel('meanNN');