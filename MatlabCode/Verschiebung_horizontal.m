function [Voxel_aktuell, freie_Voxel] = Verschiebung_horizontal(Voxel_aktuell, freie_Voxel)
%% Die Reihen werden abgearbeitet
Y_Werte = unique(Voxel_aktuell(:,3));
for i = Y_Werte
    A = Voxel_aktuell(Voxel_aktuell(:,3) == i,:);
    B = freie_Voxel(freie_Voxel(:,2) == i,:);
    Minimum = min(size(A,1), size(B,1));
    A(1:Minimum,2:4) = B(1:Minimum,1:3);
    A(1:Minimum,9:10) = 0;
    A(1:Minimum,8) = 2;
    B(1:Minimum,7) = 0;
    freie_Voxel(freie_Voxel(:,2) == i,:) = B;
    Voxel_aktuell(Voxel_aktuell(:,3) == i,:) = A;
end
freie_Voxel(freie_Voxel(:,7) == 0,:) = [];
end