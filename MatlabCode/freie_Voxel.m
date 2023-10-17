function [Blacklist, freie_Voxel] = freie_Voxel(Voxel_aktuell, Voxel_Scheibe, Liste_Voxel, Blacklist, freie_Voxel, Abbildungsmatrix, Ursprung, Gitterausmass)
%% vorkommende Y-Werte ermitteln
Y_Werte = unique(Voxel_aktuell(:,3));
Zeilen = HF_04_0_vorkommende_Zeilen(Y_Werte, vertcat(Blacklist,unique(freie_Voxel(:,2))), 1);
Y_Werte(Zeilen) = [];

%% Die in frage kommenden Randvoxel ermitteln
Zeilen = HF_04_0_vorkommende_Zeilen(Voxel_Scheibe(:,3), Y_Werte,1);
Voxel_Scheibe = Voxel_Scheibe(Zeilen,:);
Voxel_Scheibe = Voxel_Scheibe(Voxel_Scheibe(:,8) == 2,:);

%% potentielle freie Voxel bestimmen
potentielle_Voxel1 = Voxel_Scheibe;
potentielle_Voxel1(:,2) = potentielle_Voxel1(:,2)-1;

potentielle_Voxel2 = Voxel_Scheibe;
potentielle_Voxel2(:,2) = potentielle_Voxel1(:,2)+1;

potentielle_Voxel = vertcat(potentielle_Voxel1, potentielle_Voxel2);

%% freie _Voxel bestimmen
freie_Voxel_neu = horzcat(potentielle_Voxel(:,2:4), potentielle_Voxel(:,2:4));
freie_Voxel_neu(:,7) = 1;

    %% Die Koordinaten der freien Voxel im globalen System werden bestimmt
    freie_Voxel(:,4:6) = HF_03_0_Koordinatentransformation(freie_Voxel(:,4:6), Abbildungsmatrix, Ursprung , 1);
    %% die Indexe für die ermittelten Positionen im globalen System werden erstellt
    freie_Voxel(:,8) = HF_07_0_Indexe_generieren(freie_Voxel(:,4:6), Gitterausmass);
    %% Es wird geprüft ob die Indexe im globalen System vorkommen
    Zeilen  = HF_04_0_vorkommende_Zeilen(freie_Voxel(:,8), Liste_Voxel(:,5),1);
    freie_Voxel_neu(Zeilen,7) = 0;

%% Blacklist aktualisieren
Zeilen = HF_04_0_vorkommende_Zeilen(Y_Werte, freie_Voxel(freie_Voxel_neu(:,7) == 1,2) ,-1);
Blacklist = horzcat(Blacklist, Y_Werte(Zeilen));

%% freie Voxel aktualisieren
freie_Voxel_neu(freie_Voxel_neu(:,7) == 0,:) = [];
freie_Voxel = vertcat(freie_Voxel, freie_Voxel_neu);
end