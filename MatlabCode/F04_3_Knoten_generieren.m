function [Knoten] = F04_3_Knoten_generieren(Solids, Einstellungen, Referenzpunkt, Ausmasse)
%% Alle vorkommenden Knoten werden aufgelistet
Knoten = unique(Solids(:,3:10));

%% Aus den Indexen werden wieder Koordinaten erstellt
[X , Y, Z] = ind2sub(Ausmasse, Knoten);
Knoten = [Knoten, X, Y, Z];

%% Die Koordinaten werden wieder in mm umgerechnet
Knoten(:,2:4) = bsxfun(@plus, Knoten(:,2:4), Referenzpunkt);
Knoten(:,2:4) = Knoten(:,2:4) * Einstellungen(2);
end