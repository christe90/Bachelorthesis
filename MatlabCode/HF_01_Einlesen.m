function [Flaechen, Knoten] = HF_01_Einlesen(Datei)
fid=fopen(Datei);
kline=0;
sline=0;
while not(feof(fid))
    tline = fgetl(fid);
    %Einlesen der Knoten aus pc-File
    if strfind(tline,'NODE') == 1
        kline = kline + 1;
        Knoten(kline,1) = str2double(tline(9:16)); % Knoten ID,  mit tline(9:16) sind die neunte bis sechszehnte Stelle der Zeile gemeint
        Knoten(kline,2) = str2double(tline(17:32)); %X im pc-file
        Knoten(kline,3) = str2double(tline(33:48)); %Y im pc-file
        Knoten(kline,4) = str2double(tline(49:64)); %Z im pc-file
    end
    
    %Einlesen der Flächen aus pc-File
    if strfind(tline,'SHELL') == 1
        sline = sline + 1;
        Flaechen(sline,1) = str2double(tline(9:16)); %Shell ID,  mit tline(9:16) sind die neunte bis sechszehnte Stelle der Zeile gemeint
        Flaechen(sline,2) = str2double(tline(25:32)); %Node1 im pc-file
        Flaechen(sline,3) = str2double(tline(33:40)); %Node2 im pc-file
        Flaechen(sline,4) = str2double(tline(41:48)); %Node3 im pc-file
        Flaechen(sline,5) = str2double(tline(49:56)); %Node4 im pc-file
    end
end
end