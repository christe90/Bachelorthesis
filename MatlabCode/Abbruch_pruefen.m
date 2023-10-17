function [Flag] = Abbruch_pruefen(Y_Werte_Scheibe, Blacklist, Voxel_aktuell)
Zeilen = HF_04_0_vorkommende_Zeilen(Y_Werte_Scheibe, Blacklist,-1);
Y_Werte_Scheibe = Y_Werte_Scheibe(Zeilen);

if size(Voxel_aktuell,1) == 0 % Alle Voxel sind verschoben
    Flag = 1;
elseif min(Voxel_aktuell(:,3)) > max(Y_Werte_Scheibe)
    Flag = 1;
else
    Flag = 0;
end

end