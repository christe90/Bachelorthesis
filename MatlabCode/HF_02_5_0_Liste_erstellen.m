function [Liste_Voxel] = HF_02_5_0_Liste_erstellen(Geruest, Ursprung_Flaeche)
%% Alle Voxel werden in einer Liste mit ihren Postionen vermerkt

Liste_Voxel5 = HF_02_5_1_Voxel_finden(Geruest, 5); %% Alle Inletvoxel werden in eine Liste geschrieben
Liste_Voxel6 = HF_02_5_1_Voxel_finden(Geruest, 6); %% Alle Outletvoxel werden in eine Liste geschrieben
Liste_Voxel1 = HF_02_5_1_Voxel_finden(Geruest, 1); %% Alle sonstigen Voxel werden in eine Liste geschrieben 

% Die Listen werden zusammengeführt
Liste_Voxel = vertcat(Liste_Voxel1, Liste_Voxel5, Liste_Voxel6);

% Die Liste wird an der X_Z Ebene gespiegelt
Liste_Voxel2 = Liste_Voxel;
Liste_Voxel2(:,3) = -1 * Liste_Voxel2(:,3) +1;

% Die Listen werden zusammengeführt
Liste_Voxel = vertcat(Liste_Voxel, Liste_Voxel2);
Liste_Voxel(:,3) = Liste_Voxel(:,3);
Ursprung_Flaeche(1) = Ursprung_Flaeche(1) +1;
Ursprung_Flaeche(2) = Ursprung_Flaeche(2) +1;
Liste_Voxel(:,2:4) = bsxfun(@plus, Liste_Voxel(:,2:4), Ursprung_Flaeche);
end