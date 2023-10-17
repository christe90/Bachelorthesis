function [Liste_Voxel] = F02_2_2_Spiegelung(Liste_Voxel, Spiegelachse, Gitterausmass)
for i = 1:size(Liste_Voxel,1)
    Punkt1 = Spiegelachse(2,:);
    Punkt2 = Liste_Voxel(i,2:4); %Die Koordinaten des zu spiegelnden Voxels werden ausgelesen
    Lotfusspunkt = (dot((Punkt2 - Punkt1),Spiegelachse(1,1:3)) * Spiegelachse(1,1:3) + Spiegelachse(2,1:3)); %Der Lotfußpunkt auf der Spiegelachse wird bestimmt
    Punkt3 = round(2 * (Lotfusspunkt - Punkt2) + Punkt2);
    Liste_Voxel(i,2:4) = Punkt3; %Die Koordinaten des gespiegelten Voxels überschreiben die Ursprünglichen
    Liste_Voxel(i,5) =  HF_07_0_Indexe_generieren(Liste_Voxel(i,2:4), Gitterausmass);
end
end