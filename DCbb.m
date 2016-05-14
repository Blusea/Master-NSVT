function db = DCbb(Signals)

db= zeros(size(Signals));
for k=1 :length(Signals(:,1))
    db(k,:)=DCBiToBit(Signals(k,:));
end

