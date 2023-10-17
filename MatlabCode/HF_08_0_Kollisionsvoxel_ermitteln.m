function [Kollisionen] = HF_08_0_Kollisionsvoxel_ermitteln(Indexe)
%% Es wird gezählt wie oft jeder Index vorkommt
Anzahl_Indexe = HF_09_Anzahl_ermitteln(Indexe, Indexe);
Anzahl_Indexe(Anzahl_Indexe(:,2) < 2,:) = [];

%% Die Indexe welche öfter als einmal vorkommen werden als Kollisionen gekennzeichnet
Zeilen = HF_04_0_vorkommende_Zeilen(Indexe,Anzahl_Indexe(:,1),1);
Kollisionen = zeros(size(Indexe,1),1);
Kollisionen(Zeilen,1) = 1;
end