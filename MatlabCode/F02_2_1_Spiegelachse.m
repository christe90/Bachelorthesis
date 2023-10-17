function [Spiegelachse,Knoten2] = F02_2_1_Spiegelachse(Flaechen, Knoten, i)
%Spiegelachse bestimmen
Gemeinsame_Knoten = intersect(Flaechen(i,2:4), Flaechen(i+1,2:4));
Spiegelachse = Knoten( Knoten(:,1) == Gemeinsame_Knoten(1),2:4) - Knoten(Knoten(:,1) == Gemeinsame_Knoten(2),2:4); %Die Spiegelachse wird ermittelt
Spiegelachse = Spiegelachse / norm(Spiegelachse);

%% Der Referenzpunkt wird ermittelt
Spiegelachse(2,1:3) =  Knoten(Knoten(:,1) == Gemeinsame_Knoten(1),2:4); 

Knoten2 = zeros(2,3);
Knoten2(1,:) = Knoten( Knoten(:,1) == Gemeinsame_Knoten(1),2:4);
Knoten2(2,:) = Knoten( Knoten(:,1) == Gemeinsame_Knoten(2),2:4);
end