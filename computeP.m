function pValue = computeP(table1,table2)
    [h p]=ttest2(table1,table2);
    pValue=p;
end