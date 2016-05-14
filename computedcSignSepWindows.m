function dc= computedcSignSepWindows(Signals,Files,fig)

dc=zeros(length(Files),16);
for k=1:length(Files)
    i=1;
    m=1;
    l=find(Signals(k,:));
    disp(length(l));
    jump=length(l)/16 ;
    while (m<17)
        dctemp=DCSign(Signals(k,i:i+(jump-1)));
    
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
title('SignDC with  overlapping windows');
xlabel('windows');
ylabel('SignDC');
end

dc(isnan(dc))=0;
dc(isinf(dc))=0;
final=zeros(1,16);
for k=1:16
    final(1,k)=mean(dc(:,k));
end

figure(fig);
plot(final);
title('SignDC with non overlapping windows');
xlabel('windows');
ylabel('SignDC');

figure(fig+1);
plot(final);
title('SignDC with non overlapping windows');
xlabel('windows');
ylabel('SignDC');