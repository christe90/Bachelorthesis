function [Shells] = F04_2_2_1_Shells_filtern(Shells, Solids)
%% Ein Shellindex wird erstellt
for i = min(Shells(:,2)):max(Shells(:,2))

    Aktuelle_Shells = Shells(Shells(:,2) == i,:);
    %% Alle Shells die über einen Knoten verfügen, der in 8 verschiedenen Solids vorkommt werden entfernt
    Anzahl = HF_09_Anzahl_ermitteln(Solids(Solids(:,2) == i,3:10), unique(Aktuelle_Shells(:,3:6)));
    Anzahl(Anzahl(:,2) < 8,:) = [];
    Zeilen = HF_04_0_vorkommende_Zeilen(Aktuelle_Shells(:,3:6), Anzahl(:,1),1);
    Aktuelle_Shells(Zeilen,7) = 0;
    
    %% Alle Shells die noch 2 Fach vorkommen werden entfernt
    Minimum = min(Aktuelle_Shells(:,3:6)) -1;
    Aktuelle_Shells(:,3:6) = bsxfun(@minus, Aktuelle_Shells(:,3:6), Minimum);
    Maximum = max(Aktuelle_Shells(:,3:6));
    Aktuelle_Shells(:,8 ) = 0;
    Aktuelle_Shells(Aktuelle_Shells(:,7) ~= 0,8) = sub2ind(Maximum, Aktuelle_Shells(Aktuelle_Shells(:,7) ~= 0,3), Aktuelle_Shells(Aktuelle_Shells(:,7) ~= 0,4), Aktuelle_Shells(Aktuelle_Shells(:,7) ~= 0,5), Aktuelle_Shells(Aktuelle_Shells(:,7) ~= 0,6));
    Anzahl = HF_09_Anzahl_ermitteln(Aktuelle_Shells(Aktuelle_Shells(:,7) ~= 0,8), Aktuelle_Shells(Aktuelle_Shells(:,7) ~= 0,8));
    Anzahl(Anzahl(:,2) < 2,:) = [];
    Zeilen = HF_04_0_vorkommende_Zeilen(Aktuelle_Shells(:,8), Anzahl(:,1),1);
    Aktuelle_Shells(Zeilen,7) = 0;
    Aktuelle_Shells(:,3:6) = bsxfun(@plus, Aktuelle_Shells(:,3:6), Minimum);
    %% Die Shells werden wieder zurückübertragen
    Shells(Shells(:,2) == i,:) = Aktuelle_Shells(:,1:7);
end

end