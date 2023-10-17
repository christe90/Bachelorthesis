function [Voxel] = F02_3_2_1_5_Spiegelung(Voxel, Ursprung, Abbildungsmatrix)
%% Die Voxel werden in das Schnittfeste koordinatensystem umgerechnet
Voxel(:,2:4) = HF_03_0_Koordinatentransformation(Voxel(:,2:4), Abbildungsmatrix, Ursprung , -1);
Voxel(Voxel(:,3) > 0, 9:10) = 0;

Voxel(Voxel(:,3) <= 0,3) = -Voxel(Voxel(:,3) <= 0,3);
Voxel(:,2:4) = HF_03_0_Koordinatentransformation(Voxel(:,2:4), Abbildungsmatrix, Ursprung , 1);
end