function [Signals]= storeSignals(Files)

Signals=zeros(length(Files),1024);
for k=1:length(Files)
    FileNames=Files(k).name;
    disp(FileNames);
    
    fid=fopen(FileNames);
    line=fgets(fid);
    disp(line);
    i=1;
    Signals(k,i)=str2num(line);
    i=i+1;
    while ischar(line)&& (i<=1024)
        disp(line);
        line = fgets(fid);
        Signals(k,i)=str2num(line);
        i=i+1;   
    end
    disp(line);
    fclose(fid);
         
end    
    
    
    