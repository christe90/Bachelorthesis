function [Anzahl_Knoten] = HF_09_Anzahl_ermitteln(Matrix, Knoten)
Knoten = (unique(Knoten(:)));
Anzahl_Knoten = zeros(size(Knoten,1),2);
[Anzahl_Knoten(1:end -1,2), Anzahl_Knoten(:,1)] = histcounts(Matrix, Knoten);

%% Anzahl des letzten Knotens
Anzahl_Knoten(end,2) = size(find(Matrix == Anzahl_Knoten(end,1)),1);
Anzahl_Knoten(end-1,2) = Anzahl_Knoten(end-1,2)- size(find(Matrix > Anzahl_Knoten(end-1,1) & Matrix <= Anzahl_Knoten(end,1)),1);
end