function [Referenzpunkt,Gitterausmass ,Knoten, Einstellungen] = HF_05_0_Referenzgitter_erstellen(Knoten,Einstellungen)

%% Die Knotenkoordinaten und Rovingquerschnittshöhe werden in Gitterkoordinaten umgerechnet
Knoten(:,2:4) = round(1/Einstellungen(2) * Knoten(:,2:4));

%% Der Referenzpunkt wird bestimmt
Minima = min(Knoten(:,2:4));
Maxima =max(Knoten(:,2:4));
Referenzpunkt = Minima - (Maxima-Minima);
%% Die Knoten werden in die relative Position zum Referenzpunkt umgerechnet
Knoten(:,2:4) = bsxfun(@minus, Knoten(:,2:4), Referenzpunkt);

%% Die Ausmaße des Referenzgitters werden ermittelt
Gitterausmass = 3 * (Maxima-Minima);
end