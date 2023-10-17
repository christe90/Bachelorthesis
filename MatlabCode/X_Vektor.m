function [X_Vektor, Ursprung] = X_Vektor(Randvoxel_eigen, Richtung_1)
Punkt1 = Randvoxel_eigen(Randvoxel_eigen(:,Richtung_1) == min(Randvoxel_eigen(:,Richtung_1)),2:4);
Punkt2 = Randvoxel_eigen(Randvoxel_eigen(:,Richtung_1) == max(Randvoxel_eigen(:,Richtung_1)),2:4);
X_Vektor = Punkt2 - Punkt1;
Ursprung = Punkt1;
end