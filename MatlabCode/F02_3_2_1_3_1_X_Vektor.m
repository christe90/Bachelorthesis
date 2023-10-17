function [X_Vektor, Ursprung, Punkte] = F02_3_2_1_3_1_X_Vektor(Randvoxel_eigen, Richtung_1)
Punkt1 = Randvoxel_eigen(Randvoxel_eigen(:,Richtung_1) == min(Randvoxel_eigen(:,Richtung_1)),2:4);
Punkte = zeros(2,3);
if isempty(Punkt1)
    X_Vektor = nan(3,1);
    Ursprung = Punkt1;
else
    Punkt1 = Punkt1(1,:);
    Punkt2 = Randvoxel_eigen(Randvoxel_eigen(:,Richtung_1) == max(Randvoxel_eigen(:,Richtung_1)),2:4);
    Punkt2 = Punkt2(1,:);
    X_Vektor = Punkt2 - Punkt1;
    Ursprung = Punkt1;
    Punkte(1,:) = Punkt1;
    Punkte(2,:) = Punkt2;
end
end