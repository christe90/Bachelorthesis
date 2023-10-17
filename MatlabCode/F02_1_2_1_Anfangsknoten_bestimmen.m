function [Anfangsknoten_ID] = F02_1_2_1_Anfangsknoten_bestimmen(Anzahl_Knoten, Knoten, Einstellungen)
%% Knoten die nur einmal in der Flächenmatrix vorkommen ermitteln
Moegliche_IDs = Anzahl_Knoten(Anzahl_Knoten(:,2) == 1,1);

%% Auswahl des Knotens, der den minimalen Wert in injektionsrichtung des Harzes hat
Zeilen = HF_04_0_vorkommende_Zeilen(Knoten(:,1),Moegliche_IDs,1);
Minimum = min(Knoten(Zeilen, Einstellungen(3)));
Anfangsknoten_ID = Knoten(Knoten(:,Einstellungen(3)) == Minimum, 1);
Anfangsknoten_ID = Anfangsknoten_ID(1);
end