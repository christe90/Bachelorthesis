function [Abbildungsmatrix] = F02_3_2_1_4_Y_Richtung(Liste_Voxel, Shell_Indexe_eigen, i_Kollisionskoerper, Ursprung, Abbildungsmatrix)
%% Die aktuell betrachteten Extrusionskörper ermitteln
Zeilen = HF_04_0_vorkommende_Zeilen(Liste_Voxel(:,7), Shell_Indexe_eigen, 1);
Liste_Voxel = Liste_Voxel(Zeilen,:);

%% Aktuellen Voxel in das Koordinatensystem umrechnen
Liste_Voxel(:,2:4) = HF_03_0_Koordinatentransformation(Liste_Voxel(:,2:4), Abbildungsmatrix, Ursprung , -1);

%% Die Anzahl der poitiven nicht zum aktuellen kollisionskörper gehörenden Voxel ermitteln
Positive_Anzahl = size(Liste_Voxel(Liste_Voxel(:,9) ~= i_Kollisionskoerper & Liste_Voxel(:,3) >= 0,1),1);
Negative_Anzahl = size(Liste_Voxel(Liste_Voxel(:,9) ~= i_Kollisionskoerper & Liste_Voxel(:,3) < 0,1),1);

%% Anpassung der Y-Richtung
if Positive_Anzahl < Negative_Anzahl
    Abbildungsmatrix(1:3,2) = -Abbildungsmatrix(1:3,2);
end
end