function numberNN50 = computeNN50(Files)
numberNN50=zeros(size(Files,1),1);

for k=1:size(Files,1)
    i=1;
    while(i<=(length(Files)-1))
        if ((Files(k,i)- Files(k,i+1))>50)
            numberNN50(k)=numberNN50(k)+1;
        end
        i=i+1;
    end
end

   
            