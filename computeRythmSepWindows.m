function rate = computeRythmSepWindows(Signals,Files,fig)

rate=zeros(length(Files),16);
for k=1:length(Files)
    i=1;
    m=1;
    l=find(Signals(k,:));
    disp(length(l));
    jump=length(l)/16 ;
    while (m<17)
        mean1=mean(Signals(k,i:i+(jump-1)));
        rate(k,m)=1/mean1;
        m=m+1;
        i=i+jump;
    end
    
end

figure(fig+100);
hold on
for k=1:length(Files)
    hold on
plot(rate(k,:),'r');
title('Rate with non overlapping windows');
xlabel('windows');
ylabel('rate');
end

final=zeros(1,16);
for k=1:16
    final(1,k)=mean(rate(:,k));
end


%figure(fig+100);
plot(final,'-');
title('Rate with non overlapping windows');
xlabel('windows');
ylabel('rate');


figure(fig+103);
plot(final);
title('Rate with non overlapping windows');
xlabel('windows');
ylabel('rate');