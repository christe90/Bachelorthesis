function [Liste_Voxel] = F03_3_0_InOutlets(Liste_Voxel, Ausmass, Einstellungen)
%% Randvoxel bestimmen
[Liste_Voxel] = HF_12_Randvoxel_bestimmen(Liste_Voxel, Ausmass, 0);

%% Indexe zuordnen
[Liste_Voxel(:,5), ~] = HF_06_1_Indexe_generieren (Liste_Voxel(:,2:4), Einstellungen(3));

%% In- und Outlets bestimmen
Indexe = unique(Liste_Voxel(:,5));
for i = 1:size(Indexe,1)
    Maximum = max( Liste_Voxel(Liste_Voxel(:,5) == Indexe(i), Einstellungen(3)));
    Minimum = min( Liste_Voxel(Liste_Voxel(:,5) == Indexe(i), Einstellungen(3)));
    
    Liste_Voxel(Liste_Voxel(:,5) == Indexe(i) & Liste_Voxel(:,Einstellungen(3)) == Minimum,8) = 5;
    Liste_Voxel(Liste_Voxel(:,5) == Indexe(i) & Liste_Voxel(:,Einstellungen(3)) == Maximum,8) = 6;
end
end