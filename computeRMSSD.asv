function [rmssd]=computeRMSSD(patients)
[x y ]=size(patients);
rmssd=zeros(x,1);
 k=1;
 m=1; 
 while m<=x
          i=length(patients(m,:));
          dif1=zeros(length(patients(m,:)));
          n=1;
          while (i>=2)
            dif1(n)=((patients(m,i))-(patients(m,i-1)));
            i=i-1;
            n=n+1;
          end
          dif=sum(dif1.^2);
          rmssd(k)= sqrt(mean(dif));
          k=k+1;
          m=m+1;
         
 end
end