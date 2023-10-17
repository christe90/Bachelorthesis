function [Randvoxel_eigen] = F02_3_2_1_2_Randvoxel(Liste_Voxel, Shell_Indexe_eigen, Shell_Indexe_fremd)
Randvoxel =  Liste_Voxel(Liste_Voxel(:,8) == 2,:);
%% Alle Eigenen Randvoxel bestimmen
Zeilen = HF_04_0_vorkommende_Zeilen(Randvoxel(:,7), Shell_Indexe_eigen,1);
Randvoxel_eigen = Randvoxel(Zeilen,:);


%% Alle fremden Randvoxel bestimmen
Zeilen = HF_04_0_vorkommende_Zeilen(Randvoxel(:,7), Shell_Indexe_fremd,1);
Randvoxel_fremd = Randvoxel(Zeilen,:);

%% Die kollidierenden Voxel werden ermittelt
Zeilen = HF_04_0_vorkommende_Zeilen(Randvoxel_eigen(:,5), Randvoxel_fremd(:,5),1);
Randvoxel_eigen = Randvoxel_eigen(Zeilen,:);
end