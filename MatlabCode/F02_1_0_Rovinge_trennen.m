function [Flaechen, Knoten] = F02_1_0_Rovinge_trennen(Flaechen, Knoten, Einstellungen)
%% Die Fl�chen und Knotenmatrix werden erweitert
[Flaechen, Knoten] = F02_1_1_0_Vorbereitung(Flaechen, Knoten);

%% Es wird abgez�hlt, wie oft jeder Knoten in der Fl�chenmatrix vorkommt
Anzahl_Knoten = HF_09_Anzahl_ermitteln(Flaechen(:,2:4),unique(Flaechen(:,2:4)));

%% Indexe einf�hren
Indexe = [0, 0, 0]; % Roving-, Flaechen-, Knotenindex

%% Kontrolle ob alle Knoten vergeben sind
while (size(Knoten(Knoten(:,5) == 0,1),1) ~= 0)
    [Anzahl_Knoten, Knoten, Flaechen, Indexe] = F02_1_2_0_Zuordnung(Anzahl_Knoten, Knoten, Flaechen, Indexe, Einstellungen);
    Knoten = F02_1_3_letzte_Flaeche(Flaechen,Knoten);
end

%% Sortierung der Fl�chen und Knoten nach Roving und Reihenfolge
Flaechen = sortrows(Flaechen,[5,6]);
Knoten = sortrows(Knoten,[5,6]);


end