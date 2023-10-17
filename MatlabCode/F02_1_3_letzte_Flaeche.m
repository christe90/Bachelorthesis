function [Knoten] = F02_1_3_letzte_Flaeche(Flaechen,Knoten)
%% Die zuletzt ermittelte Fläche ermitteln
Flaechen = sortrows(Flaechen,[5,6]);
Anzahl_Knoten = HF_09_Anzahl_ermitteln(Flaechen(:,2:4),Flaechen(end,2:4)');
Anzahl_Knoten = sortrows(Anzahl_Knoten,-2);

%% Der letzte Knotenindex wird ermittelt
indexe = Flaechen(end,5:6);

%% Den Knoten wird ihre Reihenfolge und Rovingindex zugeschrieben
for i = 1:size(Anzahl_Knoten,1)
    Knoten(Knoten(:,1) == Anzahl_Knoten(i,1),5:6) = [indexe(1), (indexe(2) + i -1)];
end

end