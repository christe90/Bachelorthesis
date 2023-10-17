function [Shell_Indexe_fremd] = F02_3_2_1_1_fremde_Shells(Liste_Voxel, i_Kollisions_koerper)
Liste_Voxel_eigen = Liste_Voxel(Liste_Voxel(:,9) == i_Kollisions_koerper ,5);
Liste_Voxel_fremd = Liste_Voxel(Liste_Voxel(:,9) ~= i_Kollisions_koerper & Liste_Voxel(:,10) == 1,:);

Zeilen = HF_04_0_vorkommende_Zeilen(Liste_Voxel_fremd(:,5),  Liste_Voxel_eigen,1);
Shell_Indexe_fremd = unique(Liste_Voxel_fremd(Zeilen,7));

end