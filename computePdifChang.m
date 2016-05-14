function p = computePdifChang(table1,table2)

dif1=zeros(1,4);
dif2= zeros(1,4);

    dif1(:)=table1(1:4)-table2(1:4);
    dif2(:)=table1(13:16)-table2(13:16);

p=computeP(dif1,dif2);