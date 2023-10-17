function [Liste_Voxel] = F03_0_Kavitaet(Einstellungen, Datei_Eingabe)
%% Die Einagebdatei wird eingelesen
[Flaechen, Knoten] = HF_01_Einlesen(Datei_Eingabe);

%% Vierecke werden in 2 Dreiecke zerlegt
Flaechen = F03_1_Dreiecke_erstellen(Flaechen);


%% Ein Gitter und Referenzpunkt wird ermittelt und die Knotenkoordinaten werden bzgl. diesem Koordinatensystem umgerechnet
[Referenzpunkt,Gitterausmass ,Knoten] = HF_05_0_Referenzgitter_erstellen(Knoten, Einstellungen);

%% Die Flaechen werden extrudiert
Knoten(:,5:6) = 0;
Flaechen(:,5:6) = 0;
Einstellungen(1) = 1;
Liste_Voxel = HF_02_0_Extrudieren(Flaechen, Knoten, Einstellungen);

%% Die Hülle wird mit Voxeln aufgefüllt
Liste_Voxel = F03_2_0_Kavitaet_fuellen(Liste_Voxel,  Gitterausmass);

%% Die In- und Outletvoxel werden bestimmt
Liste_Voxel = F03_3_0_InOutlets(Liste_Voxel,Gitterausmass, Einstellungen);

%% Die Voxel bekommen wieder eine Position relativ zum ursprünglichen Ursprung zugewiesen
Liste_Voxel(:,2:4) = bsxfun(@plus,Liste_Voxel(:,2:4), Referenzpunkt);
end