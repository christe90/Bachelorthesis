function [Liste_Voxel] = F02_0_Rovinge(Einstellungen, Datei_Eingabe_Rovinge)

%% Die Einagebdatei wird eingelesen
[Flaechen, Knoten] = HF_01_Einlesen(Datei_Eingabe_Rovinge);

%% Die Rovinge werden getrennt
[Flaechen, Knoten] = F02_1_0_Rovinge_trennen(Flaechen, Knoten, Einstellungen);

%% Ein Gitter und Referenzpunkt wird ermittelt und die Knotenkoordinaten werden bzgl. diesem Koordinatensystem umgerechnet
[Referenzpunkt,Gitterausmass ,Knoten,Einstellungen] = HF_05_0_Referenzgitter_erstellen(Knoten, Einstellungen);

%% Die Rovinge werden extrudiert
[Liste_Voxel, Z_Vektoren] = HF_02_0_Extrudieren(Flaechen, Knoten, Einstellungen);

%% Die übergänge zwischen den einzelenen extrudiereten Körpern werden hergestellt
Liste_Voxel = F02_2_0_Uebergaenge(Liste_Voxel, Flaechen, Knoten, Gitterausmass);

%% Die Kollisionen werden beseitigt
Liste_Voxel = F02_3_0_Umformen(Liste_Voxel, Z_Vektoren, Gitterausmass);

%% Die Voxel bekommen wieder eine Position relativ zum ursprünglichen Ursprung zugewiesen
Liste_Voxel(:,2:4) = bsxfun(@plus,Liste_Voxel(:,2:4), Referenzpunkt);
end