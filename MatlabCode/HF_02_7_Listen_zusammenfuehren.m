function [Liste_Voxel] = HF_02_7_Listen_zusammenfuehren(Liste_Voxel, Liste_Voxel_neu, Flag_Ende,  Roving, Shell)
%% Metadaten zu den aktuelle ermittelten Voxeln hinzufügen
Liste_Voxel_neu(:,6) = Roving;
Liste_Voxel_neu(:,7) = Shell;

%% Die Listen werden zusammengeführt
Liste_Voxel = vertcat(Liste_Voxel,Liste_Voxel_neu);

%% Falls es sich um die letzte Shell handelt bekommen alle Voxel noch eine ID
if (Flag_Ende == 1)
    for i = 1:size(Liste_Voxel,1)
        Liste_Voxel(i,1) = i;
    end
end
end