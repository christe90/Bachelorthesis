function [Richtungen] = Abstaende_Richtungen(Randvoxel_eigen)
Abstaende = max(Randvoxel_eigen(:,2:4)) - min(Randvoxel_eigen(:,2:4));
Abstaende(2,1:3) = 2:4;
Abstaende = sortrows(Abstaende',-1);
Richtungen = Abstaende(:,2);
end