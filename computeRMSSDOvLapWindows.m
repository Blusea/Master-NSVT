function  RMSSD = computeRMSSDOvLapWindows(Signals,Files,fig)

RMSSD=zeros(length(Files),16);


for k=1:length(Files)
    i=1;
    m=1;
    l=find(Signals(k,:));
    jump=length(l)/16 ;
    while (m<17)
        
        mean1=computeRMSSD(Signals(k,i:i+( jump-1)));
        RMSSD(k,m)=mean1;
        m=m+1;
        i=i+(jump-((9*jump)/100));
    end
    
end
disp(i);


figure(fig);
hold on
for k=1:length(Files)
    hold on
plot(RMSSD(k,:),'r');
title('RMSSD with overlapping windows');
xlabel('windows');
ylabel('RMSSD');
end


final=zeros(1,16);
for k=1:16
    final(1,k)=mean(RMSSD(:,k));
end

figure(fig);
plot(final);
title('RMSSD with  overlapping windows');
xlabel('windows');
ylabel('RMSSD');

figure(fig+1);
plot(final);
title('RMSSD with overlapping windows');
xlabel('windows');
ylabel('RMSSD');