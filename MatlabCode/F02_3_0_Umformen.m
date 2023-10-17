function Liste_Voxel = F02_3_0_Umformen(Liste_Voxel, Z_Vektoren, Gitterausmass)
%% Kollisionen innerhalb der Rovinge werden beseitigt
Liste_Voxel = F02_3_1_1_Kollisionen_im_Roving(Liste_Voxel);

%% Kollisionskoerper bestimmen
Liste_Voxel = F02_3_1_0_Kollisionskoerper(Liste_Voxel,Gitterausmass);

%% Randvoxel bestimmen
Liste_Voxel = HF_12_Randvoxel_bestimmen(Liste_Voxel, Gitterausmass, 1);

%% Verschiebung zur Rovingmitte
[Liste_Voxel, Y_Vektoren] = F02_3_2_0_Umformen1(Liste_Voxel);

%% Verschiebung aus der Rovingmitte heraus
Liste_Voxel = F02_3_3_0_Umformen2(Liste_Voxel, Y_Vektoren, Z_Vektoren, Gitterausmass);

end