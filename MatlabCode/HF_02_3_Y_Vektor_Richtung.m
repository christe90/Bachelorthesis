function [Abbildungsmatrix] = HF_02_3_Y_Vektor_Richtung(Abbildungsmatrix)
%% Der Winkel zwischen den beiden Vektoren wird ermittelt
Winkel = asin(norm(cross(Abbildungsmatrix(1:3,3),Abbildungsmatrix(1:3,1))) / (norm(Abbildungsmatrix(1:3,3)) * norm(Abbildungsmatrix(1:3,1))));
%% Bei negativem Winkel wird der Y-Vektor umgedreht
if Winkel < 0
    Abbildungsmatrix(1:3,2) = -1 * Abbildungsmatrix(1:3,2);
end
end