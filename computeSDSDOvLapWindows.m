function  final = computeSDSDOvLapWindows(Signals,Files,fig)

SDSD=zeros(length(Files),16);


for k=1:length(Files)
    i=1;
    m=1;
    l=find(Signals(k,:));
    jump=length(l)/16 ;
    while (m<17)
        
        mean1=computeSDSD(Signals(k,i:i+(jump-1)));
        SDSD(k,m)=mean1;
        m=m+1;
        i=i+(jump-((9*jump)/100));
    end
    
end
disp(i);

final=zeros(1,16);
for k=1:16
    final(1,k)=mean(SDSD(:,k));
end

figure(fig);
plot(final);
title('SDSD with  overlapping windows');
xlabel('windows');
ylabel('rate');