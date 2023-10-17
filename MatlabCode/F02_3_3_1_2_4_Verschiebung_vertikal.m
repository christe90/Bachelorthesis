function [Voxel_aktuell,Flag] = F02_3_3_1_2_4_Verschiebung_vertikal(Voxel_aktuell, Voxel_Scheibe, Blacklist,Flag)
Y_Indexe = unique(Voxel_aktuell(Voxel_aktuell(:,9) ~= 0,3));
Zeilen = HF_04_0_vorkommende_Zeilen(Voxel_Scheibe(:,3), Blacklist,-1);
Verfuegbare_Y = Voxel_Scheibe(Zeilen,3);

for i = Y_Indexe'
    Verfuegbare_Y(:,2) = Verfuegbare_Y(:,1) - i;
    Minimum = min(Verfuegbare_Y(Verfuegbare_Y(:,2) >= 0,2));
    if(isempty(Minimum))
        Flag = 1;
        break;
    end
    Neuer_Index = unique(Verfuegbare_Y(Verfuegbare_Y(:,2) == Minimum,1));
    Voxel_aktuell(Voxel_aktuell(:,3) == i,3) = Neuer_Index;
end
end