function [Vektor, Punkt2] = F02_3_2_1_3_2_Z_Vektor(Randvoxel_eigen, Richtungen ,X_Vekt, Ursprung )
%% Abbildungsmatrix erstellen
Einheitsmatrix = eye(3);
Abbildungsmatrix = zeros(3);
Abbildungsmatrix(:,3) = Einheitsmatrix(:,Richtungen(3) - 1);
Abbildungsmatrix(:,1) = X_Vekt;
Abbildungsmatrix(:,2) = cross(Abbildungsmatrix(:,1), Abbildungsmatrix(:,3));

Abbildungsmatrix(:,1) = 1/norm(Abbildungsmatrix(:,1)) * Abbildungsmatrix(:,1);
Abbildungsmatrix(:,2) = 1/norm(Abbildungsmatrix(:,2)) * Abbildungsmatrix(:,2);
Abbildungsmatrix(:,3) = 1/norm(Abbildungsmatrix(:,3)) * Abbildungsmatrix(:,3);
%% 
Randvoxel_eigen(:,2:4) = HF_03_0_Koordinatentransformation(Randvoxel_eigen(:,2:4), Abbildungsmatrix, Ursprung , -1);
Randvoxel_eigen(:,1) = abs(Randvoxel_eigen(:,3));
Randvoxel_eigen = sortrows(Randvoxel_eigen, -1);
Randvoxel_eigen(:,2:4) = HF_03_0_Koordinatentransformation(Randvoxel_eigen(:,2:4), Abbildungsmatrix, Ursprung , 1);

if isempty(Randvoxel_eigen)
    Vektor = nan(1,3);
    Punkt2 = zeros(1,3);
else
    Punkt2 = Randvoxel_eigen(1,2:4);
    Vektor = Punkt2 - Ursprung;
end
end