function [p1 ,p2] =displayPdif(table1,table2,measurement)
    
p1=computeP(table1(1:4),table2(1:4));

p2=computeP(table1(13:16),table2(13:16));

figure(158);

plot(table1,'g');
hold on 
plot(table2,'r');
title('Normal VS Over Weight p value of the change');
xlabel('windows');
ylabel(measurement);
str = {'Normal Weight'};
annotation('textbox', [0.15,0.75,0.1,0.1],...
           'String', str,'Color','g');
str = {'Over Weight'};
annotation('textbox', [0.40,0.75,0.1,0.1],...
           'String', str,'Color','r');
       str={'p value = ',p1};
   
annotation('textbox', [0.15,0.15,0.1,0.1],...
           'String', str,'Color','m');
       str={'p value = ',p2};
annotation('textbox', [0.7,0.15,0.1,0.1],...
           'String',str,'Color','m');
       

%saveas(figure(1),'C:\Users\maria\Desktop\nsvt_res\nsvt oloklira\dif with males\dcBB.jpg');
