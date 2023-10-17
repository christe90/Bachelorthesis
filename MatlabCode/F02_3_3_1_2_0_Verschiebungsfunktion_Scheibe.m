function [Liste_Voxel] = F02_3_3_1_2_0_Verschiebungsfunktion_Scheibe(i_Scheibe, i_Shell, Liste_Voxel, Abbildungsmatrix, Ursprung, Gitterausmass, i_Koerper)
freie_Voxel = zeros(0,7);
Blacklist = zeros(0);

        
%% Scheibenvoxel bestimmen
Voxel_Scheibe = Liste_Voxel(Liste_Voxel(:,7) == i_Shell & Liste_Voxel(:,4) == i_Scheibe,:);

%% Die Kollisionsvoxel stauchen
[Flag, Voxel_Scheibe] = F02_3_3_1_2_1_Stauchen(Voxel_Scheibe, i_Koerper);
e = 0;
while (Flag == 0)
    e = e+1;
    fprintf('\nScheibe %i, Shell %i, Kollisionskörper %i, Wiederholung %i', i_Scheibe, i_Shell, i_Koerper, e);
            
    %% Die noch zu verschiebenden Voxel bestimmen
    Voxel_aktuell = Voxel_Scheibe(Voxel_Scheibe(:,9) ~= 0,:);

    %% freie Voxel bestimmen
    [Blacklist, freie_Voxel] = F02_3_3_1_2_1_freie_Voxel_funktion(Voxel_aktuell, Voxel_Scheibe,  Liste_Voxel, Blacklist, freie_Voxel, Abbildungsmatrix, Ursprung, Gitterausmass);

    %% Abbruch prüfen
    Flag = F02_3_3_1_2_2_Abbruch_pruefen(Voxel_Scheibe(:,3), Blacklist, Voxel_aktuell);
    
    %% Verschiebung in horizontaler Richtung
    [Voxel_aktuell, freie_Voxel] = F02_3_3_1_2_3_Verschiebung_horizontal(Voxel_aktuell, freie_Voxel);

    %% Verschiebung in vertikaler Richtung
    [Voxel_aktuell,Flag] = F02_3_3_1_2_4_Verschiebung_vertikal(Voxel_aktuell, Voxel_Scheibe, Blacklist,Flag);
    
    %% Übertragung der aktuellen Voxel in die Scheibenliste
    Voxel_Scheibe = HF_11_Voxel_uebertragen(Voxel_aktuell, Voxel_Scheibe, 1:10);

end
%% Übertragung der Scheibenvoxel in die Voxelliste
[Liste_Voxel] = HF_11_Voxel_uebertragen(Voxel_Scheibe, Liste_Voxel, 1:10);
    
end