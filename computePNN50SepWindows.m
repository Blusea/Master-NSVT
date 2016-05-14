function PNN50 = computePNN50SepWindows(Signals,Files,fig)

PNN50=zeros(length(Files),16);
for k=1:length(Files)
    i=1;
    m=1;
    l=find(Signals(k,:));
    disp(length(l));
    jump=length(l)/16 ;
    while (m<17)
        nNN50=computeNN50(Signals(k,i:i+(jump-1)));
        mean1=computePNN50(Signals(k,i:i+(jump-1)),nNN50);
        PNN50(k,m)=mean1;
        m=m+1;
        i=i+jump;
    end
    
end


figure(fig);
hold on
for k=1:length(Files)
    hold on
plot(PNN50(k,:),'r');
title('PNN50 with non overlapping windows');
xlabel('windows');
ylabel('PNN50');
end

final=zeros(1,16);
for k=1:16
    final(1,k)=mean(PNN50(:,k));
end

figure(fig);
plot(final);
title('PNN50 with non overlapping windows');
xlabel('windows');
ylabel('PNN50');

figure(fig+1);
plot(final);
title('PNN50 with non overlapping windows');
xlabel('windows');
ylabel('PNN50');