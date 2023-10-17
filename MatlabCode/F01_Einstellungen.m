function [Einstellungen, Datei_Ausgabe, Datei_Roving, Datei_Kavitaet] = F01_Einstellungen()

Einstellungen(1) = 1/2; % Die H�he des Faserquerschnitts eingeben
Einstellungen(2) = 1/15; % Die Aufl�sung/ Kantenl�nge der Voxel festlegen
Einstellungen(3) = 2; % Die Flussrichtung des Harzes in die Kavitaet (2 f�r X-Richtung, 3 f�r Y-Richtung, 4 f�r Z-Richtung)
Einstellungen(1) = round(Einstellungen(1) / Einstellungen(2)); %H�he des Faserquerschnitts wird in vielfachen der KAntenl�nge angegeben 

[Name,Pfad] = uigetfile('*.pc','Die Datei mit dem Rovingverlauf ausw�hlen');
Datei_Roving = [Pfad  Name];

[Name,Pfad] = uigetfile('*.pc','Die Datei mit dem Kavit�tsverlaufverlauf ausw�hlen');
 Datei_Kavitaet = [Pfad  Name];

[Name, Pfad] = uiputfile('*.dyn','Die Ausgabedateibestimmen');
 Datei_Ausgabe = [Pfad  Name];

end