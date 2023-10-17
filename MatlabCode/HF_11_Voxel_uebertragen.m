function [Liste_Voxel] = HF_11_Voxel_uebertragen(Liste_Voxel_aktuell, Liste_Voxel, Spalten)

for i = 1:size(Liste_Voxel_aktuell,1)
    if (size(Liste_Voxel,1) < Liste_Voxel_aktuell(i,1))
        Liste_Voxel(Liste_Voxel(:,1) == Liste_Voxel_aktuell(i,1), Spalten) = Liste_Voxel_aktuell(i,Spalten);
    elseif (Liste_Voxel(Liste_Voxel_aktuell(i,1),1) ~= Liste_Voxel_aktuell(i,1))
        Liste_Voxel(Liste_Voxel(:,1) == Liste_Voxel_aktuell(i,1), Spalten) = Liste_Voxel_aktuell(i,Spalten);
    else
%         Liste_Voxel(i,Spalten) = Liste_Voxel_aktuell(i,Spalten);
        Liste_Voxel(Liste_Voxel_aktuell(i,1),Spalten) = Liste_Voxel_aktuell(i,Spalten);
    end
end

end