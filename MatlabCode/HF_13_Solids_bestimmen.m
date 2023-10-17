function [Solids] = HF_13_Solids_bestimmen(Liste_Voxel, Ausmass)
%% Leere Liste erstellen
Solids = zeros(size(Liste_Voxel,1),11);
%% Gitter erstellen
for i = 1:size(Liste_Voxel,1)
        Solids(i,1) = Liste_Voxel(i,1);
        Solids(i,2) = Liste_Voxel(i,6);                %X                      Y                    Z
        Solids(i,3) = sub2ind(Ausmass, Liste_Voxel(i,2) - 1, Liste_Voxel(i,3) - 1, Liste_Voxel(i,4)      ); %Knoten 1
        Solids(i,4) = sub2ind(Ausmass, Liste_Voxel(i,2) - 1, Liste_Voxel(i,3)    , Liste_Voxel(i,4)      ); %Knoten 2
        Solids(i,5) = sub2ind(Ausmass, Liste_Voxel(i,2)    , Liste_Voxel(i,3)    , Liste_Voxel(i,4)      ); %Knoten 3
        Solids(i,6) = sub2ind(Ausmass, Liste_Voxel(i,2)    , Liste_Voxel(i,3) - 1, Liste_Voxel(i,4)      ); %Knoten 4
        Solids(i,7) = sub2ind(Ausmass, Liste_Voxel(i,2) - 1, Liste_Voxel(i,3) - 1, Liste_Voxel(i,4) - 1  ); %Knoten 5
        Solids(i,8) = sub2ind(Ausmass, Liste_Voxel(i,2) - 1, Liste_Voxel(i,3)    , Liste_Voxel(i,4) - 1  ); %Knoten 6
        Solids(i,9) = sub2ind(Ausmass, Liste_Voxel(i,2)    , Liste_Voxel(i,3)    , Liste_Voxel(i,4) - 1  ); %Knoten 7
        Solids(i,10) = sub2ind(Ausmass, Liste_Voxel(i,2)   , Liste_Voxel(i,3) - 1, Liste_Voxel(i,4) - 1  ); %Knoten 8    
        Solids(i,11) = Liste_Voxel(i,8);
end
end