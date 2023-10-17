function [Liste_Voxel, Y_Vektoren] = F02_3_2_0_Umformen1(Liste_Voxel)
%% Alle Rovinge mit einem Kollisionskörper ermitteln
Roving_Indexe = unique(Liste_Voxel(Liste_Voxel(:,9) ~= 0, 6));
%% Die Rovinge werden abgearbeitet
Y_Vektoren = zeros(0,4);
for i_Roving = Roving_Indexe'
    %% Der Kollisionskörper innerhalb des Rovings wird abgearbeitet
    Kollisions_koerper_Indexe = unique(Liste_Voxel(Liste_Voxel(:,6) == i_Roving & Liste_Voxel(:,9) ~= 0,9));
    for i_Kollisions_koerper = Kollisions_koerper_Indexe'
        [Liste_Voxel,Y_Vektoren] = F02_3_2_1_0_Spiegelfunktion(Liste_Voxel, i_Roving, i_Kollisions_koerper, Y_Vektoren);
    end
end
end