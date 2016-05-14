function [NSVT]= storeNSVT(Files)

NSVT=zeros(length(Files),125000);
for k=1:length(Files)
    FileNames=Files(k).name;
    disp(FileNames);
    
    fid=fopen(FileNames);
    line=fgets(fid);
    %disp(line);
    i=1;
    NSVT(k,i)=str2num(line);
    i=i+1;
    while ischar(line)&& ((~feof(fid)))
        %disp(line);
        line = fgets(fid);
        NSVT(k,i)=str2num(line);
        i=i+1;   
    end
    %disp(line);
    fclose(fid);
         
end