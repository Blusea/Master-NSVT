function final=computeStdWaveletsSep(wavC)
disp(length(wavC));
Stds=zeros(size(wavC));
for k=1:size(wavC,1);
    i=1;
    m=1;
    while (m<17)
        std1=std(wavC(k,i:i+63));
        Stds(k,m)=std1;
        m=m+1;
        i=i+64;
    end
    
end

final=zeros(1,16);
for k=1:16
    final(1,k)=std(Stds(:,k));
end


figure(1);
plot(final);

