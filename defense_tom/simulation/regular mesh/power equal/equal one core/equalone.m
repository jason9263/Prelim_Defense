%%
%this funciton to describe how many node on each level
%input is the size of mesh
%input is the position of the data source
%this experiment we assume it's 5*5 regular mesh
%%
clear
clc

fid = fopen('levelnumber.txt');
tline = fgetl(fid);

while ischar(tline)
    
    disp(tline);
    
    nunitm(tline);
    %nunitm_no(tline);
    
    tline = fgetl(fid);
end

fclose(fid);

xlabel('zTcm to wTcp');
ylabel('SpeedUp');
title('5x5 Regular mesh SpeedUp With Front End');