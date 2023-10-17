function [Liste_Voxel] = F03_2_0_Kavitaet_fuellen(Liste_Voxel, Gitterausmass)
%% Die H�lle wird gef�llt
[Liste_Voxel_neu1] = HF_06_0_Auffuellen(Liste_Voxel, 2, 0);
disp('Auff�llem 1/3');
[Liste_Voxel_neu2] = HF_06_0_Auffuellen(Liste_Voxel, 3, 0);
disp('Auff�llem 2/3');
[Liste_Voxel_neu3] = HF_06_0_Auffuellen(Liste_Voxel, 4, 0);
disp('Auff�llem 3/3');

%% Die Voxellisten werden kombiniert
Liste_Voxel = vertcat(Liste_Voxel_neu1,Liste_Voxel_neu2, Liste_Voxel_neu3);

Liste_Voxel(:,5) = HF_07_0_Indexe_generieren(Liste_Voxel(:,2:4), Gitterausmass);
[~, Zeilen,~] = unique(Liste_Voxel(:,5));
Liste_Voxel = Liste_Voxel(Zeilen,:);
end