function init()
    clear;
    clc;
    clc;
    clear;  %������в���
    load raw_data
    global Mag
    global Mag_pow10
    global Phase_raw 
    global Phase
    global Phase_cos
    global Phase_sin
   
   Mag = raw_data.LogMag;
   Mag(find(isnan(Mag))) = -10;
   Mag(find(isinf(Mag))) = -10;
   Mag_pow10= (10.^(Mag/20));
   %Mag_pow10= (10.^(Mag/20));
   Phase_raw = raw_data.Phase;
   Phase_raw(find(isnan(Phase_raw))) = 0;
   Phase_raw(find(isinf(Phase_raw))) = 0;
   Phase=Phase_raw/180*pi;
   Phase(find(isnan(Phase))) = 0;
   Phase(find(isinf(Phase))) = 0;
   Phase_cos=cos(Phase);
   Phase_sin=sin(Phase);  %LogMag��Phase���ݴ�����inf��nanȫ�����0;
%    [r,c]=size(Phase);
%    magic=0.50;
%    for i =1:r
%        for j=1:c
%            if(Phase_cos(i,j)<0)
%                t=rand();
%                if(t<=magic)
%                    Phase_cos(i,j)= -Phase_cos(i,j);
%                end
%            end
%            if(Phase_sin(i,j)<0)
%                t=rand();
%                if(t<=magic)
%                    Phase_sin(i,j)= -Phase_sin(i,j);
%                end
%            end
%        end
%    end
   
                  
   