function ArrayToCsv(Array,Headers,TargetFile)

fid = fopen(TargetFile,'w');
fprintf(fid,'%s%s%s\n',Headers(1,:));
for i=1:length(Array)
    fprintf(fid,'\n');
    fprintf(fid,'%s%s%s', Headers(i+1,:));
    fprintf(fid,' \t');
    fprintf(fid,'%f%10.2e',Array(i));
end
fclose(fid);
end