function [Flaechen, Knoten] = F02_1_1_0_Vorbereitung(Flaechen, Knoten)
Flaechen(:,end+1) = 0;
Knoten(:,end+1 : end+2) = 0;
end