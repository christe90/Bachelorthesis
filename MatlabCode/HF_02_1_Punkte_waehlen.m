function [Aktuelle_Punkte] = HF_02_1_Punkte_waehlen(Knoten_IDs, Knoten)

%% Die Koordinaten und die Reihenfolge der verwendeten Knoten aus der aktuellen Fläche werden kopiert
Zeilen = HF_04_0_vorkommende_Zeilen(Knoten(:,1),Knoten_IDs,1);
Aktuelle_Punkte = Knoten(Zeilen,[1:4,6]);
Aktuelle_Punkte = sortrows(Aktuelle_Punkte,5);
end