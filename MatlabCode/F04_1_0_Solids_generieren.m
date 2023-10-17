function [Solids, Referenzpunkt, Voxel_Gesamt, Ausmass] = F04_1_0_Solids_generieren(Liste_Voxel_Rovinge, Liste_Voxel_Kavitaet)
%% Alle Voxel-Koordinaten in ein gemeinsames Gitter umwandeln
[Liste_Voxel_Rovinge, Liste_Voxel_Kavitaet, Ausmass, Referenzpunkt] = F04_1_1_gmeinsames_Gitter(Liste_Voxel_Rovinge, Liste_Voxel_Kavitaet);

%% Die Voxel Listen miteinander kombiniert
Voxel_Gesamt = F04_1_2_gesamte_Voxelliste(Liste_Voxel_Rovinge, Liste_Voxel_Kavitaet, Ausmass);

%% Alle nicht mehr existenten Voxel werden entfernt
Voxel_Gesamt(Voxel_Gesamt(:,8) == 0,:) = [];

%% Solids erzeugen
[Solids] = HF_13_Solids_bestimmen(Voxel_Gesamt, Ausmass);
end