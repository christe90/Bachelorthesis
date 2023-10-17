function [Liste_Voxel] = F02_3_1_1_Kollisionen_im_Roving(Liste_Voxel)
A = unique(Liste_Voxel(:,6));
for i = A'
    Liste_Voxel(Liste_Voxel(:,6) == i,:) = HF_10_Kollisionen_entfernen(Liste_Voxel(Liste_Voxel(:,6) == i,:),1);
end
end