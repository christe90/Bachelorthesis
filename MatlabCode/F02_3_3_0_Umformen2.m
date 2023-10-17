function [Liste_Voxel] = F02_3_3_0_Umformen2(Liste_Voxel, Y_Vektoren, Z_Vektoren, Gitterausmass)
%% Alle Rovinge mit einem Kollisionskörper ermitteln
Shell_Indexe = unique(Liste_Voxel(Liste_Voxel(:,9) ~= 0, 7));
%% Die Rovinge werden abgearbeitet
for i_Shell = Shell_Indexe'
    %% Der Kollisionskörper innerhalb des Rovings wird abgearbeitet
    Kollisions_koerper_Indexe = unique(Liste_Voxel(Liste_Voxel(:,7) == i_Shell & Liste_Voxel(:,9) ~= 0,9));
    for i_Kollisions_koerper = Kollisions_koerper_Indexe'
        fprintf('\n%i Kollisionskoerper',i_Kollisions_koerper);
        Liste_Voxel = F02_3_3_1_0_Verschiebungsfunktion(Liste_Voxel,  i_Shell, i_Kollisions_koerper, Y_Vektoren, Z_Vektoren, Gitterausmass);
    end
end
end