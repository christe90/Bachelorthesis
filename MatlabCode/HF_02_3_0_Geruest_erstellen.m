function [Geruest, Ursprung_Flaeche] = HF_02_3_0_Geruest_erstellen(Aktuelle_Punkte, Hoehe)

%% Das Gitter wird erstellt
Ursprung_Flaeche = min(Aktuelle_Punkte(:,2:4)) - 1;
Laengen = max(Aktuelle_Punkte(:,2:4)) - Ursprung_Flaeche;
Aktuelle_Punkte(:,2:4) = bsxfun(@minus, Aktuelle_Punkte(:,2:4), Ursprung_Flaeche);

Geruest = zeros(Laengen(1), ceil(Hoehe/2), Laengen(3));


%% Das Gitter wird gefüllt
Geruest = HF_02_3_1_Geruest_fuellen(Geruest, Hoehe);

%% Die über die ursprüngliche Fläche stehenden Teile werden entfernt
Geruest = HF_02_3_2_Geruest_beschneiden(Geruest, Aktuelle_Punkte);

end