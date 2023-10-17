function Abbildungsmatrix = F02_3_3_1_1_Koordinatensystem_Verschiebung(Y_Vektoren, Z_Vektoren, i_Kollisions_koerper, i_Shell)
Abbildungsmatrix = zeros(3);
%% Auslesen der bereits bestehenden Vektoren
Abbildungsmatrix(:,2) = Y_Vektoren(Y_Vektoren(:,1) == i_Kollisions_koerper,2:4);
Abbildungsmatrix(:,3) = Z_Vektoren(Z_Vektoren(:,1) == i_Shell,2:4);

%% Ergänzen der weiteren Vektoren
Abbildungsmatrix(:,1) = cross(Abbildungsmatrix(:,2), Abbildungsmatrix(:,3));
Abbildungsmatrix(:,2) = cross(Abbildungsmatrix(:,1), Abbildungsmatrix(:,3));

%% Normierung
Abbildungsmatrix(:,1) = Abbildungsmatrix(:,1) / norm(Abbildungsmatrix(:,1));
Abbildungsmatrix(:,2) = Abbildungsmatrix(:,2) / norm(Abbildungsmatrix(:,2));
Abbildungsmatrix(:,3) = Abbildungsmatrix(:,3) / norm(Abbildungsmatrix(:,3));
end