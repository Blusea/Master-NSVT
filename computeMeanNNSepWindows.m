function meanNN = computeMeanNNSepWindows(Signals,Files,fig)

meanNN=zeros(length(Files),16);
for k=1:length(Files)
    i=1;
    m=1;
    l=find(Signals(k,:));
    disp(length(l));
    jump=length(l)/16 ;
    while (m<17)
        mean1=computeMeanNN(Signals(k,i:i+( jump-1)));
        meanNN(k,m)=mean1;
        m=m+1;
        i=i+jump;
    end
    
end

figure(fig);
hold on
for k=1:length(Files)
    hold on
plot(meanNN(k,:),'r');
title('MeanNN with non overlapping windows');
xlabel('windows');
ylabel('meanNN');
end

final=zeros(1,16);
for k=1:16
    final(1,k)=mean(meanNN(:,k));
end


figure(fig);
plot(final);
title('meanNN with non overlapping windows');
xlabel('windows');
ylabel('meanNN');

figure(fig+1);
plot(final);
title('MeanNN with non overlapping windows');
xlabel('windows');
ylabel('meanNN');