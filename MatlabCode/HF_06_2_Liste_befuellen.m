function [Liste_Voxel_neu] = HF_06_2_Liste_befuellen(Liste_Voxel_neu, Liste_Voxel, In_Outlet_Flag, Indexe, Richtung)

k = 1;
for i = 1:size(Indexe,1)
    %% betroffene Voxel ermittlen
    Voxel = Liste_Voxel(Liste_Voxel(:,5) == Indexe(i),:);
    Maximum = max(Voxel(:,Richtung ));
    Minimum = min(Voxel(:,Richtung ));
    
    %% Die Werte in die neue Voxelliste eintragen
    k_neu = Maximum - Minimum + k;
    Liste_Voxel_neu(k:k_neu,2) = Voxel(1,2);
    Liste_Voxel_neu(k:k_neu,3) = Voxel(1,3);
    Liste_Voxel_neu(k:k_neu,4) = Voxel(1,4);
    Liste_Voxel_neu(k:k_neu,Richtung) = (Minimum:Maximum)';
    Liste_Voxel_neu(k:k_neu,8) = 1;
    
    %% In und Outletvoxel definieren
    if (In_Outlet_Flag == 1)
        Liste_Voxel_neu(k,8) = 5;
        Liste_Voxel_neu(k_neu,8) = 6;
    else
        Zeilen = HF_04_0_vorkommende_Zeilen(Liste_Voxel_neu(:,2:4), Voxel(Voxel(:,8) == 5,2:4),2);
        Liste_Voxel_neu(Zeilen,8) = 5;
        
        Zeilen = HF_04_0_vorkommende_Zeilen(Liste_Voxel_neu(:,2:4), Voxel(Voxel(:,8) == 6,2:4),2);
        Liste_Voxel_neu(Zeilen,8) = 6;
    end

    
    %% Index aktualisieren
    k = k_neu + 1;
end

%% Alle leeren Voxel löschen
Liste_Voxel_neu(Liste_Voxel_neu(:,8) == 0,:) = [];

end