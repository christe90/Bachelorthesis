function [Liste_Voxel_neu] = HF_06_0_Auffuellen(Liste_Voxel, Richtung, Anfangs_End_Flag)
%% Für jeden Voxel wird ein eindeutiger Index generiert
[Liste_Voxel(:,5), Ausmasse] = HF_06_1_Indexe_generieren (Liste_Voxel(:,2:4), Richtung);

%% Alle vorkommenden Indexe herausfiltern
Indexe = unique(Liste_Voxel(:,5));

%% Die Liste_Voxel erweitern
Liste_Voxel_neu = zeros(Ausmasse(1) * Ausmasse(2) * Ausmasse(3), 10);

%% Die Voxel_Liste befüllen
Liste_Voxel_neu = HF_06_2_Liste_befuellen(Liste_Voxel_neu, Liste_Voxel, Anfangs_End_Flag, Indexe, Richtung);
fprintf('\nDie Befüllung in Richtung %i wurde durchgeführt',Richtung);

endVorko