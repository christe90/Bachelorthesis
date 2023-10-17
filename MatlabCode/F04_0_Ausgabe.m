function [] = F04_0_Ausgabe(Einstellungen, Datei_Ausgabe, Liste_Voxel_Rovinge, Liste_Voxel_Kavitaet)
%% Die Solids werden aus den Voxeln generiert
[Solids, Referenzpunkt,  Liste_Voxel, Ausmass] = F04_1_0_Solids_generieren(Liste_Voxel_Rovinge, Liste_Voxel_Kavitaet);
fprintf('\n Solids generiert');

%% Die Shells werden aus den Voxeln generiert
Shells = F04_2_0_Shells_generieren(Solids, Liste_Voxel, Ausmass);
fprintf('\n Shells generiert');

%% Die Knoten werden generiert
Knoten = F04_3_Knoten_generieren(Solids, Einstellungen, Referenzpunkt, Ausmass);
fprintf('\n Knoten generiert');

%% Die Bezeichnungen werden erstellt
[Labels, Shells, Solids] = F04_4_Labels_generieren(Shells, Solids);
fprintf('\n Labels generiert');

%% Die Ausgabedatei wird an den Speicherort geschriebenoh
F04_5_Ausgabe_Datei(Labels, Knoten, Solids, Shells, Datei_Ausgabe);
fprintf('\n Daten ausgegeben -> Fertig');

end