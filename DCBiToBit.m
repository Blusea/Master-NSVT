function dc=DCBiToBit(x)

x=millisec(x);
N=length(x);

valid=zeros(N);
anchor=zeros(N);
for i=2:N
    if x(i)/x(i-1)<=1.05
        valid(i)=1;
    end
    if x(i)>x(i-1)
        anchor(i)=1;
    end
end
    
d=zeros(N);

count=0;
for i=3:N-2
    d(i)=valid(i)*anchor(i)*(x(i)-x(i-1))/2;
    if valid(i)~=0 && anchor(i)~=0
        count=count+1;
    end
end
    dc=sum(d)/count; 

end

