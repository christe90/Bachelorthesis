function [Liste_Voxel] = F02_2_0_Uebergaenge(Liste_Voxel, Flaechen, Knoten, Gitterausmass)
mkdir('Uebergaenge');

%% Indexe generieren
Liste_Voxel(:,5) = HF_07_0_Indexe_generieren(Liste_Voxel(:,2:4), Gitterausmass);

for i = 1:(size(Flaechen,1) - 1) 
    %% Kontrolle ob es sich um die letzte Fläche in einem Roving handelt
    if(Flaechen(i+1,6) == 1)
        continue;
    end

    %% Aktuelle Voxel ermitteln
    Aktuelle_Voxel = Liste_Voxel(Liste_Voxel(:,7) == Flaechen(i,1) | Liste_Voxel(:,7) == Flaechen(i+1,1),:);

    %% Kollidierende Voxel ermitteln
    Aktuelle_Voxel(:,10) = HF_08_0_Kollisionsvoxel_ermitteln(Aktuelle_Voxel(:,5));
    Aktuelle_Voxel = Aktuelle_Voxel(Aktuelle_Voxel(:,7) == Flaechen(i,1) & Aktuelle_Voxel(:,10) == 1,:);
  
    %% Spiegelachse ermitteln
    Spiegelachse = F02_2_1_Spiegelachse(Flaechen, Knoten, i);
    
    %% Spiegelung durchführen
    Aktuelle_Voxel = F02_2_2_Spiegelung(Aktuelle_Voxel, Spiegelachse, Gitterausmass);

    %% neue Werte in die Gesamtvoxelliste übertragen
    Liste_Voxel = HF_11_Voxel_uebertragen(Aktuelle_Voxel, Liste_Voxel,[2:5,8]);
    
end
disp('Übergänge hergestellt');
end