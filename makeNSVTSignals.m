function makeNSVTSignals(file,file_name)
   
    fid=fopen(file.name);
    line=fgets(fid);
    %disp(line);
    line_count1=1;
    while ischar(line)&& (~feof(fid))
        line_count1=line_count1+1;
        line = fgets(fid);
    end
    fclose(fid);

    pulse=cell(1,line_count1);

    fid=fopen(file.name);
    line=fgets(fid);
    line_count=1;
    line1=strsplit(line);
    pls=line1{2};
    pulse{line_count}=pls;
    
    while ischar(line)&& (~feof(fid));
        line_count=line_count+1;
        %disp(line);
        line = fgets(fid);
        line1=strsplit(line);
        pls=line1{2};
        pulse{line_count}=pls;
    end

    fid = fopen(file_name,'w');
    for i=1:line_count1
        fprintf(fid,'%d\n',str2num(pulse{i}));
    end
    fclose(fid);