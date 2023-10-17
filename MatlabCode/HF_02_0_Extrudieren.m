function [Liste_Voxel, Z_Vektoren] = HF_02_0_Extrudieren(Flaechen, Knoten, Einstellungen)
mkdir('Extrusion');

%% Die Listen werden vorbereitet
Liste_Voxel = zeros(0,10);
Z_Vektoren = zeros(size(Flaechen,1),4);

for i = 1:size(Flaechen,1)
    %% Die Punkte welche zur aktuell gehörenden Fläche werden herausgesucht und es wird geprüft ob es sich um den Anfang oder das Ende eines Rovings handelt
    Aktuelle_Punkte = HF_02_1_Punkte_waehlen(Flaechen(i,2:4), Knoten);

    %% Die Abbildungsmatrix wird erstellt
    Abbildungsmatrix = HF_02_2_Abbildungsmatrix_erstellen(Aktuelle_Punkte);
    Ursprung = min(Aktuelle_Punkte(:,2:4)); 
    
    %% Die Richtung des Y-Vektors wird festgelegt
    Abbildungsmatrix = HF_02_3_Y_Vektor_Richtung(Abbildungsmatrix);
    
    %% Die Punktkoordinaten werden in das flächenfeste Koordinatensystem transformiert
    Aktuelle_Punkte(:,2:4) = HF_03_0_Koordinatentransformation(Aktuelle_Punkte(:,2:4), Abbildungsmatrix, Ursprung , -1);

    %% Das Voxelgerüst wird erstellt und befüllt
    [Geruest, Ursprung_Flaeche] = HF_02_3_0_Geruest_erstellen(Aktuelle_Punkte, Einstellungen(1));
    
    %% Aus dem Geruest eine Liste erstellen
    Liste_Voxel_neu = HF_02_5_0_Liste_erstellen(Geruest, Ursprung_Flaeche);
        
    %% Die Koordinaten werden in das globale Koordinatensystem zurücktransformiert
    Liste_Voxel_neu(:,2) = Liste_Voxel_neu(:,2) -1;
    Liste_Voxel_neu(:,2:4) = HF_03_0_Koordinatentransformation(Liste_Voxel_neu(:,2:4), Abbildungsmatrix, Ursprung , 1);
%     Liste_Voxel_neu(:,2:4) = Liste_Voxel_neu(:,2:4) +1;
    
    %% Entstandene Hohlräume werden aufgefüllt
    Liste_Voxel_neu = HF_06_0_Auffuellen(Liste_Voxel_neu, Einstellungen(3), 0);

    %% Die errechneten Voxel werden an die bereits errrechneten Voxel angehängt und durch Metadaten ergänzt
    if (i == size(Flaechen,1))
        Flag_Ende = 1;
    else
        Flag_Ende = 0;
    end
    Liste_Voxel = HF_02_7_Listen_zusammenfuehren(Liste_Voxel, Liste_Voxel_neu, Flag_Ende, Flaechen(i,5), Flaechen(i,1));
    
    %% Der Z-Vektor wird in die Matrix eingetragen
    Z_Vektoren(i,:) = [Flaechen(i,1), Abbildungsmatrix(1:3,3)'];
    
    %% Ausgabe
    fprintf('\nEs wurden %i von %i Flächen extrudiert',i,size(Flaechen,1));
    
end

end