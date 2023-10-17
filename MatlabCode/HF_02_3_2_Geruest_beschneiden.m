function Geruest = HF_02_3_2_Geruest_beschneiden(Geruest, Aktuelle_Punkte)
%% Abschneiden Teil 1
for x = 1:size(Geruest,1)
    z = floor((Aktuelle_Punkte(2,4) -1 - Aktuelle_Punkte(1,4)) / ( Aktuelle_Punkte(2,2) - Aktuelle_Punkte(1,2)) * (x - Aktuelle_Punkte(1,2))  + Aktuelle_Punkte(1,4));
    if (z < 1)
        continue
    else
        Geruest(x, :, 1:z) = 0;
    end
    

end

%% Abschneiden Teil 2
for x = 1:size(Geruest,1)
    z = ceil((Aktuelle_Punkte(3,4) - Aktuelle_Punkte(2,4)+1) / ( Aktuelle_Punkte(3,2) - Aktuelle_Punkte(2,2)) * (x - Aktuelle_Punkte(2,2))  + Aktuelle_Punkte(2,4));
    if (z >= size(Geruest,3))
        continue
    else
        Geruest(x, :, z:end) = 0;
    end   
end    
end