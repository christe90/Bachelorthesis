function [Liste_Voxel] = F02_3_3_1_0_Verschiebungsfunktion(Liste_Voxel, i_Shell, i_Kollisions_koerper, Y_Vektoren, Z_Vektoren, Gitterausmass)
%% Das Koordinatensystem wird festgelegt
Abbildungsmatrix = F02_3_3_1_1_Koordinatensystem_Verschiebung(Y_Vektoren, Z_Vektoren, i_Kollisions_koerper, i_Shell);
Ursprung = min(Liste_Voxel(Liste_Voxel(:,7) == i_Shell,2:4));

%% Die Voxel werden in das neue Koordinatensystem umgerechnet
Liste_Voxel(Liste_Voxel(:,7) == i_Shell,2:4) = HF_03_0_Koordinatentransformation(Liste_Voxel(Liste_Voxel(:,7) == i_Shell,2:4), Abbildungsmatrix, Ursprung , -1);
        
%% Die einzelnen Scheiben werden abgearbeitet
Scheiben_Indexe = unique(Liste_Voxel(Liste_Voxel(:,7) == i_Shell & Liste_Voxel(:,9) ~= 0 ,4));
for i_Scheibe = Scheiben_Indexe'
    fprintf('\n%i Scheibe',i_Scheibe);
    Liste_Voxel = F02_3_3_1_2_0_Verschiebungsfunktion_Scheibe(i_Scheibe, i_Shell, Liste_Voxel, Abbildungsmatrix, Ursprung, Gitterausmass, i_Kollisions_koerper);
end

%% Die Voxel werden wieder in das Ursprungssystem zurücktransformiert
Liste_Voxel(Liste_Voxel(:,7) == i_Shell,2:4) = HF_03_0_Koordinatentransformation(Liste_Voxel(Liste_Voxel(:,7) == i_Shell,2:4), Abbildungsmatrix, Ursprung , 1);

end