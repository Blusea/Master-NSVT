function  dc1= computeDCOvLapWindows(Signals,Files,fig)

dc1=zeros(length(Files),16);


for k=1:length(Files)
    i=1;
    m=1;
    l=find(Signals(k,:));
    jump=length(l)/16 ;
   while (m<17)
       dctemp=DCBiToBit(Signals(k,i:i+(jump-1)));
       disp(dctemp);
        dc1(k,m)=dctemp(1);
        m=m+1;
        i=i+(jump-((9*jump)/100));
    end
    
end

figure(fig);
hold on
for k=1:length(Files)
    hold on
plot(dc1(k,:),'r');
title('BBDC with  overlapping windows');
xlabel('windows');
ylabel('BBDC');
end

dc1(isnan(dc1))=0;
final=zeros(1,16);
for k=1:16
    final(1,k)=mean(dc1(:,k));
end


figure(fig);
plot(final);
title('BBDC with overlapping windows');
xlabel('windows');
ylabel('dc');


figure(fig+1);
plot(final);
title('BBDC with overlapping windows');
xlabel('windows');
ylabel('dc');
 