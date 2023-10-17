function [Indexe, Ausmasse_gesamt] = HF_06_1_Indexe_generieren (Liste_Voxel, Richtung)
%% Den Voxeln einen Index zuweisen der auf der zur Richtung orthogonalen Ebene liegt
Maximum = max(Liste_Voxel(:,1:3));
Minimum = min(Liste_Voxel(:,1:3))-1;
Liste_Voxel = bsxfun(@minus,Liste_Voxel, Minimum);
Ausmasse_gesamt = max(Liste_Voxel(:,1:3));
Ebene(1,1:3) = [1:3];
Ebene(2,1:3) = Ausmasse_gesamt;
Ebene(:,Richtung - 1) = [];
Indexe = sub2ind([Ebene(2,1), Ebene(2,2)], Liste_Voxel(:,Ebene(1,1)), Liste_Voxel(:,Ebene(1,2)));
end