function Liste_Voxel = F02_3_2_1_6_Kollisionen_entfernen(Liste_Voxel, i_Kollisionskoerper, i_Roving)
%% Die nicht spiegelbaren Voxel werden dem ersten Roving zugeordnet in welchem sie vorkommen
Liste_Voxel(Liste_Voxel(:,9) == i_Kollisionskoerper & Liste_Voxel(:,6) == i_Roving,9:10) = 0;
Liste_Voxel(Liste_Voxel(:,9) == i_Kollisionskoerper,8:10) = 0;
end