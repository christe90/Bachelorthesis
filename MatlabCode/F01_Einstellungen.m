function [Einstellungen, Datei_Ausgabe, Datei_Roving, Datei_Kavitaet] = F01_Einstellungen()

Einstellungen(1) = 1/2; % Die Höhe des Faserquerschnitts eingeben
Einstellungen(2) = 1/15; % Die Auflösung/ Kantenlänge der Voxel festlegen
Einstellungen(3) = 2; % Die Flussrichtung des Harzes in die Kavitaet (2 für X-Richtung, 3 für Y-Richtung, 4 für Z-Richtung)
Einstellungen(1) = round(Einstellungen(1) / Einstellungen(2)); %Höhe des Faserquerschnitts wird in vielfachen der KAntenlänge angegeben 

[Name,Pfad] = uigetfile('*.pc','Die Datei mit dem Rovingverlauf auswählen');
Datei_Roving = [Pfad  Name];

[Name,Pfad] = uigetfile('*.pc','Die Datei mit dem Kavitätsverlaufverlauf auswählen');
 Datei_Kavitaet = [Pfad  Name];

[Name, Pfad] = uiputfile('*.dyn','Die Ausgabedateibestimmen');
 Datei_Ausgabe = [Pfad  Name];

end