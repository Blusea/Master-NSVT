function displayBoxPlot(table)

rate1=zeros(1,36*4);

m=1;
k=1;
for m=1:36
        for i=1:4
            rate1(1,k)=(table(m,i));
            k=k+1;
        end
    
end

rate2=zeros(1,36*4);
m=1;
k=1;
for m=1:36
        for i=13:16
            rate2(1,k)=(table(m,i));
            k=k+1;
        end
    
end
figure(100);
 
boxplot([rate1(:),rate2(:)],'notch','on','labels',{'timespace1','timespace3'});
title('Box plot for SignDC with non overlapping windows');
%saveas(figure(100),'C:\Users\maria\Desktop\RESULTS 9-7-15 +++\over weight\box_BBDC_over.jpg')