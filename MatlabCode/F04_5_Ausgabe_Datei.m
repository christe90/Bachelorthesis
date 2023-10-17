function [] = F04_5_Ausgabe_Datei(Labels, Knoten, Solids, Shells,  Datei_Ausgabe)
fid = fopen(Datei_Ausgabe,'w');

fprintf(fid, '*KEYWORD \n');
%% Ausgabe Knoten
fprintf(fid, '*NODE \n');
for i = 1:size(Knoten,1)
    fprintf(fid,'%8i%16.4f%16.4f%16.4f \n',Knoten(i,1), Knoten(i,2), Knoten(i,3),Knoten(i,4));
end
%% Ausgabe Randflächen
fprintf(fid, '*ELEMENT_SHELL \n');
Shells(Shells(:,7) == 0,:) = [];
for i = 1:size(Shells,1)
    fprintf(fid,'%8i%8i%8i%8i%8i%8i\n', Shells(i,1), Shells(i,2),Shells(i,3),Shells(i,4),Shells(i,5),Shells(i,6));
end

fprintf(fid, '*SECTION_SHELL \n');
%% Ausgabe Solids
fprintf(fid, '*ELEMENT_SOLID \n');
Solids(Solids(:,11) == 0,:) = [];
for i = 1:size(Solids,1)
    fprintf(fid,'%8i%8i\n', Solids(i,1), Solids(i,2));
    fprintf(fid,'%8i%8i%8i%8i%8i%8i%8i%8i\n', Solids(i,3), Solids(i,4),Solids(i,5),Solids(i,6),Solids(i,7),Solids(i,8),Solids(i,9),Solids(i,10));
end

fprintf(fid, '*SECTION_SOLID \n');

%% Ausgabe Labels
for i = 1:size(Labels,1)
fprintf(fid, '*PART \n');
    switch Labels(i,3)
        case 1
        fprintf(fid, 'Solids_Part_%10i\n',Labels(i,2));
        case 2
        fprintf(fid, 'Shells_Part_%10i\n',Labels(i,2));
        case 3
        fprintf(fid, 'Inlet_Part_%10i\n',Labels(i,2));
        case 4
        fprintf(fid, 'Outlet_Part_%10i\n',Labels(i,2));
    end
    fprintf(fid, '%10i%10i%10i%10i%10i%10i%10i%10i\n',Labels(i,1),0,0,0,0,0,0,0);
end
fprintf(fid, '*END \n');

fclose(fid);
end