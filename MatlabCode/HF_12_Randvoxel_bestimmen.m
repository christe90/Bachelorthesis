function [Liste_Voxel] = HF_12_Randvoxel_bestimmen(Liste_Voxel, Ausmass, Modus)
%% Solids generieren
Solids = HF_13_Solids_bestimmen(Liste_Voxel, Ausmass);
%% Randvoxel bestimmen
if (Modus == 1) % Nach Randvoxeln für jeden Part einzeln suchen
    for i = min(Solids(:,2)):max(Solids(:,2))
        index = HF_12_1_Voxel_bestimmen (Solids(Solids(:,2) == i,:));
        Solids(Solids(:,2) == i,11) = index;
    end
else % Nach Randvoxeln für alle Parts gemeinsam suchen
        index = HF_12_1_Voxel_bestimmen (Solids);
        Solids(:,11) = index;
end
%% Die Liste Voxel wird aktualisiert
[Zeilen_Null,~] = find(Liste_Voxel(:,8) == 0);
Indexe = horzcat(Liste_Voxel(:,8),Solids(:,11));
Indexe = max(Indexe,[],2);
Liste_Voxel(:,8) = Indexe;
Liste_Voxel(Zeilen_Null,8) = 0;
end