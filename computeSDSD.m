function [sdsd]=computeSDSD(patientsY)
[x y]=size(patientsY);
sdsd=zeros(x,1);
 k=1;
 m=1;
 while m<=x
          i=length(patientsY(m,:));
          dif=zeros(length(patientsY(m,:)));
          n=1;
          while (i>=2)
            dif(n)=((patientsY(m,i))-(patientsY(m,i-1)));
            i=i-1;
            n=n+1;
          end
          sdsd(k)=std(dif(:));
          k=k+1;
          m=m+1;
 end
end