function [Liste_Voxel] = HF_02_5_1_Voxel_finden(Geruest, i)
[X, Y, Z] = ind2sub(size(Geruest),find(Geruest == i));
Liste_Voxel = zeros(size(X,1),10);
Liste_Voxel(:,2:4) = [X,Y,Z];
Liste_Voxel(:,8) = i;
end