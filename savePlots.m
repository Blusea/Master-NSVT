function savePlots(table,name,p)
    figure(100);
    plot(table,'b');
    hold on;
    plot(table(1:6),'m');
    plot((12:16),table(12:16),'m');
    str={name};
    title(str);
    xlabel('windows');
    ylabel(name);
    %%p=p*0.1;
    str={'p value = ',p};
    annotation('textbox', [0.7,0.7,0.1,0.1],...
           'String',str,'Color','m');
       

saveas(figure(100),'C:\Users\maria\Desktop\nsvt_res\nsvt oloklira\wavelets\bior8.jpg')