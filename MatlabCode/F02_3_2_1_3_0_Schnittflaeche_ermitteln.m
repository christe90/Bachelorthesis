function [Ursprung, Abbildungsmatrix, Flag] = F02_3_2_1_3_0_Schnittflaeche_ermitteln(Randvoxel_eigen)
Abbildungsmatrix = zeros(3);
Flag = 0;

%% größte Entfernung ermitteln
Richtungen = Abstaende_Richtungen(Randvoxel_eigen);

%% X-Vektor ermitteln
[Abbildungsmatrix(1:3,1), Ursprung] = F02_3_2_1_3_1_X_Vektor(Randvoxel_eigen, Richtungen(1));

%% Z_Vektor ermitteln
Abbildungsmatrix(1:3,3) = F02_3_2_1_3_2_Z_Vektor(Randvoxel_eigen, Richtungen ,Abbildungsmatrix(1:3,1), Ursprung );

%% Vorläufiger Y-Vektor ermitteln
Abbildungsmatrix(1:3,2) = cross(Abbildungsmatrix(1:3,1), Abbildungsmatrix(1:3,3));

%% Es wird ein kartesisches Koordiantensystem festgelegt
Abbildungsmatrix(1:3,1) = cross(Abbildungsmatrix(1:3,2), Abbildungsmatrix(1:3,3));

%% Die Vektoren werden normiert
Abbildungsmatrix(1:3,1) = Abbildungsmatrix(1:3,1) / norm(Abbildungsmatrix(1:3,1));
Abbildungsmatrix(1:3,2) = Abbildungsmatrix(1:3,2) / norm(Abbildungsmatrix(1:3,2));
Abbildungsmatrix(1:3,3) = Abbildungsmatrix(1:3,3) / norm(Abbildungsmatrix(1:3,3));

%% Kontrolle ob es wirklich eine Ebene ist
A = isnan(Abbildungsmatrix);
if any(A(:))
    Flag = 1;
else
end
end