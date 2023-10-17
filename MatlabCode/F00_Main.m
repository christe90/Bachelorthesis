clc;
clear;

%% Einstellungen für das Programm eingeben
[Einstellungen, Datei_Ausgabe, Datei_Eingabe_Rovinge, Datei_Eingabe_Kavitaet] = F01_Einstellungen;

%% Die Rovinge werden erstellt
Liste_Voxel_Rovinge = F02_0_Rovinge(Einstellungen, Datei_Eingabe_Rovinge);

%% Die Kavität wird erstellt
Liste_Voxel_Kavitaet = F03_0_Kavitaet(Einstellungen, Datei_Eingabe_Kavitaet);

%% Die erstellten Daten werden ausgegeben
F04_0_Ausgabe(Einstellungen, Datei_Ausgabe, Liste_Voxel_Rovinge, Liste_Voxel_Kavitaet);
