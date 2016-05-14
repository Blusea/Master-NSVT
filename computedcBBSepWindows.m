function dc= computedcBBSepWindows(Signals,Files,fig)

dc=zeros(length(Files),16);
for k=1:length(Files)
    i=1;
    m=1;
    l=find(Signals(k,:));
    disp(length(l));
    jump=length(l)/16 ;
    while (m<17)
        dctemp=DCBiToBit(Signals(k,i:i+(jump-1)));
    
        dc(k,m)=dctemp(1);
        m=m+1;
        i=i+jump;
    end
    
end

figure(fig);
hold on
for k=1:length(Files)
    hold on
plot(dc(k,:),'r');
title('BBDC with non overlapping windows');
xlabel('windows');
ylabel('BBDC');
end

dc(isnan(dc))=0;
final=zeros(1,16);
for k=1:16
    final(1,k)=mean(dc(:,k));
end


figure(fig);
plot(final);
title('BBDC with non overlapping windows');
xlabel('windows');
ylabel('dc');


figure(fig+1);
plot(final);
title('BBDC with non overlapping windows');
xlabel('windows');
ylabel('dc');
 
