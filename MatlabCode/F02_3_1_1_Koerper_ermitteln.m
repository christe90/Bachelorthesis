function [Solids,k] = F02_3_1_1_Koerper_ermitteln(Solids,k)
for i = 1:size(Solids,1)
    %% Verbindung zu bereits definierten Kollisionskörpern wird hergestellt
    Zeilen = HF_04_0_vorkommende_Zeilen(Solids(Solids(:,11) ~= 0,3:10),Solids(i,3:10),1);
    Koerper_IDs = unique(Solids(Zeilen,11));
    
    if (isempty(Koerper_IDs)) % Ein neuer Kollisionskörper wird defiuniert
        k = k + 1;
        Solids(i,11) = k;
    elseif (length(Koerper_IDs) == 1) % Es wird der Kollisionskörper übernommen
        Solids(i,11) = Koerper_IDs;
    else %% Es wird für alle referenzierte Koerper der minimale bereits bestehende Index ausgewählt
        Minimum = min(Solids(Zeilen, 11));
        Zeilen = HF_04_0_vorkommende_Zeilen(Solids(:,11), Koerper_IDs,1);
        Solids(Zeilen,11) = Minimum;
        Solids(i,11) = Minimum;
    end
    fprintf('\n%i von %i Voxel bearbeitet',i , size(Solids,1));
end
end