function [Flag, Voxel_Scheibe] = F02_3_3_1_2_1_Stauchen(Voxel_Scheibe, i_Koerper)

Differenz_Kollisionen = max(Voxel_Scheibe(Voxel_Scheibe(:,9) == i_Koerper,3)) - min(Voxel_Scheibe(Voxel_Scheibe(:,9) == i_Koerper,3));
Differenz_Freie_Voxel = max(Voxel_Scheibe(Voxel_Scheibe(:,9) == 0,3)) - min(Voxel_Scheibe(Voxel_Scheibe(:,9) == 0,3));
if(isempty(Differenz_Freie_Voxel))
    Flag = 1;
elseif (Differenz_Kollisionen == 0)
    Flag = 0;
    Voxel_Scheibe(Voxel_Scheibe(:,9) == i_Koerper,8) = 0;
else
    Flag = 0;
    Voxel_Scheibe(Voxel_Scheibe(:,9) == i_Koerper,3) = Voxel_Scheibe(Voxel_Scheibe(:,9) == i_Koerper,3) / abs(Differenz_Kollisionen) * abs(Differenz_Freie_Voxel);
    Voxel_Scheibe(Voxel_Scheibe(:,9) == i_Koerper,8) = 0;
end
Voxel_Scheibe(:,3) = round(Voxel_Scheibe(:,3));
end