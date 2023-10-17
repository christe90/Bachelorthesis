function [Anfangs_End_Flag, Flag_Ende] = HF_02_6_Flags(Flaechen, i)

if (Flaechen(i,6) == 1)
    Anfangs_End_Flag = 5;
    
elseif (i == size(Flaechen,1))
    Anfangs_End_Flag = 6;
    Flag_Ende = 1;
    
elseif (Flaechen(i+1,6) == 1)
    Anfangs_End_Flag = 6;
    
else
    Anfangs_End_Flag = 0;
end

end