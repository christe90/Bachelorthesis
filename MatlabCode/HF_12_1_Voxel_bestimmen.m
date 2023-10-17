function [index] = HF_12_1_Voxel_bestimmen (Solids)
%% Anzahl ermitteln
[Anzahl_Knoten] = HF_09_Anzahl_ermitteln(Solids(:,3:10), unique(Solids(:,3:10)));
Anzahl_Knoten(Anzahl_Knoten(:,2) == 8,:) = []; % Alle Punkte die in 8 verschiedenen Voxel vorkommen entfernen
Zeilen = HF_04_0_vorkommende_Zeilen(Solids(:,3:10), Anzahl_Knoten(:,1),1); % Die Solids welche mindestens einen Knoten besitze, der nicht in 8 verschiedenen Voxeln vorkommt werden ausgelesen
index = zeros(size(Solids,1),1);
index(Zeilen) = 2;
end