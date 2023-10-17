function [Abbildungsmatrix] = HF_02_2_Abbildungsmatrix_erstellen(Aktuelle_Punkte)
%% Vektoren bestimmen
Abbildungsmatrix(1:3,3) = (Aktuelle_Punkte(3,2:4) - Aktuelle_Punkte(1,2:4))';
Abbildungsmatrix(1:3,1) = (Aktuelle_Punkte(2,2:4) - Aktuelle_Punkte(1,2:4))';
Abbildungsmatrix(1:3,2) = cross(Abbildungsmatrix(1:3,3),Abbildungsmatrix(1:3,1));
Abbildungsmatrix(1:3,1) = cross(Abbildungsmatrix(1:3,2),Abbildungsmatrix(1:3,3));
%% Vektoren normieren
Abbildungsmatrix(1:3,3) = 1/norm(Abbildungsmatrix(1:3,3)) * Abbildungsmatrix(1:3,3);
Abbildungsmatrix(1:3,2) = 1/norm(Abbildungsmatrix(1:3,2)) * Abbildungsmatrix(1:3,2);
Abbildungsmatrix(1:3,1) = 1/norm(Abbildungsmatrix(1:3,1)) * Abbildungsmatrix(1:3,1);
end