function [Liste_Voxel] = F02_3_1_0_Kollisionskoerper(Liste_Voxel, Ausmasse)
%% Die kollidierenden Voxel werden ermittelt
Liste_Voxel(Liste_Voxel(:,8) ~= 0,10) =  HF_08_0_Kollisionsvoxel_ermitteln(Liste_Voxel(Liste_Voxel(:,8) ~= 0,5));
%% Alle Rovinge mit kollidierenden Voxeln werden ermittelt
Liste_Rovinge = unique(Liste_Voxel(Liste_Voxel(:,8) ~= 0 & Liste_Voxel(:,10) ~= 0,6));

k = 0;
for i_Roving = Liste_Rovinge'
    %% Die Knoten aus denen die kollierenden Voxel bestehen werden ermittelt
    Aktuelle_Voxel  = Liste_Voxel(Liste_Voxel(:,6) == i_Roving & Liste_Voxel(:,8) ~= 0 & Liste_Voxel(:,10) ~= 0,:);
    Solids = HF_13_Solids_bestimmen(Aktuelle_Voxel,Ausmasse);
    Solids(:,11) = 0;

    %% Die zusammenhängenden Voxel innerhalb der Paare werden ermittelt
    [Solids, k] = F02_3_1_1_Koerper_ermitteln(Solids, k);
    
    %% Die Kollisionskörper den Voxeln zuordnen
    Aktuelle_Voxel(:,9) = Solids(:,11);
    Liste_Voxel = HF_11_Voxel_uebertragen(Aktuelle_Voxel, Liste_Voxel, 9);
end
%% Alle Kollisionskörper die aus weniger als 3 Voxeln bestehen werden herausgefiltert
Liste_Voxel = F02_3_1_3_Kollisionskoerper_filtern(Liste_Voxel);
disp('Kollisionskörper bestimmt');

end