function Flaechen = F03_1_Dreiecke_erstellen(Flaechen)
%% Alle Flaechen die bereits in Dreieckform sind werden kopiert
Flaechen1 = Flaechen(Flaechen(:,5) == 0,1:4);
%% Alle 4-Eckigen Flächen werden extrahiert
Flaechen = Flaechen(Flaechen(:,5) ~= 0,:);

Flaechen2 = zeros(2*size(Flaechen,1),4);
for i = 1:size(Flaechen,1) 
    Flaechen2(i*2-1,2:4) = [Flaechen(i,2),Flaechen(i,3),Flaechen(i,5)] ;
    Flaechen2(i*2,2:4) = [Flaechen(i,3),Flaechen(i,4),Flaechen(i,5)] ;
end
Flaechen = vertcat(Flaechen1, Flaechen2);
Flaechen(:,1) = 1:size(Flaechen,1);
end