function Voxel_Gesamt = F04_1_2_gesamte_Voxelliste(Liste_Voxel_Rovinge, Liste_Voxel_Kavitaet, Ausmasse)
Liste_Voxel_Kavitaet(:,6) = 1;
Liste_Voxel_Rovinge(:,6) = Liste_Voxel_Rovinge(:,6) +1;
Voxel_Gesamt = vertcat(Liste_Voxel_Kavitaet, Liste_Voxel_Rovinge);
Voxel_Gesamt(:,1) = 1:size(Voxel_Gesamt,1);
Voxel_Gesamt(:,5) = HF_07_0_Indexe_generieren(Voxel_Gesamt(:,2:4), Ausmasse);
[Voxel_Gesamt] = HF_10_Kollisionen_entfernen(Voxel_Gesamt,2);
end