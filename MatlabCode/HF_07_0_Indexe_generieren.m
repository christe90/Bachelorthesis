function [Indexe] = HF_07_0_Indexe_generieren(Liste_Voxel, Gitterausmass)
Indexe = sub2ind(Gitterausmass, Liste_Voxel(:,1),  Liste_Voxel(:,2),  Liste_Voxel(:,3));
end