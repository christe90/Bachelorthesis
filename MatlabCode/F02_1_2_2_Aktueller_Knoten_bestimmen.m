function [Aktueller_Knoten] = F02_1_2_2_Aktueller_Knoten_bestimmen(Aktuelle_Knoten_IDs,Anzahl_Knoten)
%% Alle aktuellen Knoten, die nur noch einmal auswählbar sind werden ermittelt
Zeilen = ismember(Anzahl_Knoten(:,1), Aktuelle_Knoten_IDs);
Aktueller_Knoten = Anzahl_Knoten(Zeilen & Anzahl_Knoten(:,2) == 1,1);

if(size(Aktueller_Knoten,1) == 0)
    Aktueller_Knoten = -1;
elseif (size(Aktueller_Knoten,1) > 1)
    Aktueller_Knoten = Aktueller_Knoten(1);
end

end