function [Anzahl_Knoten, Knoten, Flaechen, indexe] = F02_1_2_0_Zuordnung(Anzahl_Knoten, Knoten, Flaechen,indexe, Einstellungen)
indexe = [indexe(1) + 1, 1, 1];
Aktueller_Knoten = F02_1_2_1_Anfangsknoten_bestimmen(Anzahl_Knoten, Knoten, Einstellungen); % Ein Anfangsknoten wird bestimmt
while (Aktueller_Knoten ~= -1)
    %% Den Flächen werden die Indexe zugewiesen
    Zeilen = ismember(Flaechen(:,2:4),Aktueller_Knoten);
    Flaechen(any(Zeilen,2) & Flaechen(:,6) == 0,5) = indexe(1);
    Flaechen(any(Zeilen,2) & Flaechen(:,6) == 0,6) = indexe(2);
    
    %% Die Anzahlsmatrix wird aktualisiert
    Zeilen = HF_04_0_vorkommende_Zeilen(Anzahl_Knoten(:,1), Flaechen(Flaechen(:,5) == indexe(1) & Flaechen(:,6) == indexe(2),2:4),1);
    Anzahl_Knoten(Zeilen,2) = Anzahl_Knoten(Zeilen,2) - 1;
    
    %% Dem Aktuellen Knoten wird sein Index zugewiesen
    Knoten(Knoten(:,1) == Aktueller_Knoten,5:6) = [indexe(1), indexe(3)];
    
    %% Der nächste Knoten wird bestimmt
    Aktueller_Knoten = F02_1_2_2_Aktueller_Knoten_bestimmen(Anzahl_Knoten(Zeilen,1),Anzahl_Knoten);
    
    %% Die Indexe für Knoten und Flächenreihenfolge werden erhöht
    indexe(2:3) = indexe(2:3) + 1;
end
end

