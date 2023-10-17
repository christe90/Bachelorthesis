function [Liste_Voxel_Rovinge, Liste_Voxel_Kavitaet, Ausmass, Referenzpunkt] = F04_1_1_gmeinsames_Gitter(Liste_Voxel_Rovinge, Liste_Voxel_Kavitaet, Referenzpunkt_Rovinge, Referenzpunkt_Kavitaet)
%% Der gemeinsame Referenzpunkt wird ermittelt
Minimum = min(vertcat(Liste_Voxel_Kavitaet(:,2:4),Liste_Voxel_Rovinge(:,2:4)));
Referenzpunkt = Minimum - 2;

%% Die Voxel werden relativ zum neuen Referenzpunkt berechnet
Liste_Voxel_Rovinge(:,2:4) = bsxfun(@minus, Liste_Voxel_Rovinge(:,2:4), Referenzpunkt);
Liste_Voxel_Kavitaet(:,2:4) = bsxfun(@minus, Liste_Voxel_Kavitaet(:,2:4), Referenzpunkt);

%% Das Gitterausmass wird berechnet
Ausmass = max(vertcat(Liste_Voxel_Kavitaet(:,2:4),Liste_Voxel_Rovinge(:,2:4)));

end