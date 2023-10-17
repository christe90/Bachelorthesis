function [Liste_Voxel] = F02_3_1_3_Kollisionskoerper_filtern(Liste_Voxel)
%% Alle nicht kollidierenden oder existente Voxel werden dem Kollisionskörper 0 zugeordnet
Liste_Voxel(Liste_Voxel(:,8) == 0 | Liste_Voxel(:,10) == 0, 9:10) = 0;

%% Alle Kollisionskörper die aus weniger als 4 Voxeln bestehen werden dem Kollisionskörper 0 zugeordnet
[Anzahl_Knoten] = HF_09_Anzahl_ermitteln(Liste_Voxel(:,9), unique(Liste_Voxel(:,9)));
Anzahl_Knoten(Anzahl_Knoten(:,2) > 3,:) = [];
Zeilen = HF_04_0_vorkommende_Zeilen(Liste_Voxel(:,9), Anzahl_Knoten(:,1),1);
Liste_Voxel(Zeilen,9:10) = 0;

%% Die Indexe zuordnen
Koerper_IDs = unique(Liste_Voxel(:,9));
for i = 2:length(Koerper_IDs)
    Liste_Voxel(Liste_Voxel(:,9) == Koerper_IDs(i),9) = i-1;
end
end