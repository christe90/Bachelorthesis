function [Liste_Voxel,Y_Vektoren] = F02_3_2_1_0_Spiegelfunktion(Liste_Voxel, i_Roving, i_Kollisions_koerper, Y_Vektoren)
%% Alle Extrusionskörper die im aktuellen Kollisionskörper vorkommen werden bestimmt
Shell_Indexe_eigen = unique(Liste_Voxel(Liste_Voxel(:,6) == i_Roving & Liste_Voxel(:,9) == i_Kollisions_koerper,7));
Shell_Indexe_fremd = F02_3_2_1_1_fremde_Shells(Liste_Voxel, i_Kollisions_koerper);

%% Die wichtigen Randvoxel werden ermittelt
Randvoxel_eigen = F02_3_2_1_2_Randvoxel(Liste_Voxel, Shell_Indexe_eigen, Shell_Indexe_fremd);

%% Die Schnittfläche wird ermittelt
[Ursprung, Abbildungsmatrix, Flag] = F02_3_2_1_3_0_Schnittflaeche_ermitteln(Randvoxel_eigen);

if Flag == 0
    %% Die zu spiegelnden Voxel werden ausgewählt
    Voxel_spiegelung = Liste_Voxel(Liste_Voxel(:,6) == i_Roving & Liste_Voxel(:,9) == i_Kollisions_koerper,:);
    
    %% Die Richtung des Y-Vektors wird bestimmt
    Abbildungsmatrix = F02_3_2_1_4_Y_Richtung(Liste_Voxel, Shell_Indexe_eigen, i_Kollisions_koerper, Ursprung, Abbildungsmatrix);

    %% Die eigentliche Spiegelung findet statt
    Voxel_spiegelung = F02_3_2_1_5_Spiegelung(Voxel_spiegelung, Ursprung, Abbildungsmatrix);
    
    %% Die Voxel werden wieder zurückübertragen
    [Liste_Voxel] = HF_11_Voxel_uebertragen(Voxel_spiegelung, Liste_Voxel, 1:10);
    
	%% Der Y-Vektor wird abgespeichert
    Y_Vektoren(end+1,1:4) = [i_Kollisions_koerper,  Abbildungsmatrix(1:3,2)'];
    
else
    %% Die Kollidierenden Voxel werden entfernt
    Liste_Voxel = F02_3_2_1_6_Kollisionen_entfernen(Liste_Voxel, i_Kollisions_koerper, i_Roving);
end
end