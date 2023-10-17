function [Shells] = F04_2_0_Shells_generieren(Solids, Liste_Voxel, Ausmass)
%% Alle Randvoxel werden bestimmt
Liste_Voxel = HF_12_Randvoxel_bestimmen(Liste_Voxel,Ausmass, 1);

%% Die Solids werden gefiltert
Solids(:,end+1) = Liste_Voxel(:,8);

%% Die Shells werden generiert
Shells = F04_2_1_Shells_erstellen(Solids(Solids(:,end) >= 2,:));

%% Die nicht außenliegenden Shells werden herausgefiltert
Shells = F04_2_2_1_Shells_filtern(Shells , Solids);
end