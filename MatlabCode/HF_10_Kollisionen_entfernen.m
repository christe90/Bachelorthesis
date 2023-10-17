function [Liste_Voxel] = HF_10_Kollisionen_entfernen(Liste_Voxel,Modus)

if Modus == 1 %% Die Minimalen Rovinge bleiben erhalten
    Liste_Voxel = sortrows(Liste_Voxel,6);

elseif Modus == 2 %% Die Maximalen Rovinge bleiben erhalten
    Liste_Voxel = sortrows(Liste_Voxel,-6);

else %% Die zunächst vorkommenden voxel bleiben erhalten
end
%% Die einmaligvorkommenden Voxel werden ermittelt
[~, Zeilen,~] = unique(Liste_Voxel(:,5));
A = Liste_Voxel(Zeilen,8);
Liste_Voxel(:,8) = 0;
Liste_Voxel(Zeilen,8) = A;

%% 
Liste_Voxel = sortrows(Liste_Voxel,1);
end