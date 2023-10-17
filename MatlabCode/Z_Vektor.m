function [Vektor] = Z_Vektor(Randvoxel_eigen, Richtungen ,X_Vekt, Ursprung )
Einheitsmatrix = eye(3);
Abbildungsmatrix = zeros(3);
Abbildungsmatrix(:,2) = Einheitsmatrix(:,Richtungen(3) - 1);
Abbildungsmatrix(:,1) = X_Vekt;
Randvoxel_eigen(:,2:4) = HF_03_0_Koordinatentransformation(Randvoxel_eigen(:,2:4), Abbildungsmatrix, Ursprung , 1);
Randvoxel_eigen(:,1) = abs(Randvoxel_eigen(:,Richtungen(2)));
Randvoxel_eigen = sortrows(Randvoxel_eigen, -1);
Punkt2 = Randvoxel_eigen(1,2:4);
Vektor = Punkt2 - Ursprung;
end