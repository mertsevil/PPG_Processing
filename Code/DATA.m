function [valuex,valuey,valuez,NBVP]=DATA(~)
% this code just cynchornise
[valuex,valuey,valuez]=ACClxyz;
%cynchornisation

% valuex=2*((valuex-(-128))/(127+128))-1;
%
% valuey=2*((valuey-(-128))/(127+128))-1;
% valuez=2*((valuez-(-128))/(127+128))-1;
BVP=BVPvalue;

valuex(1:260)=[];
valuey(1:260)=[];
valuez(1:260)=[];
BVP(1:586)=[];
j=1;
for i=1:29314
    if rem(i,2)==1
        NBVP(j)=BVP(i);
        j=j+1;
    end
end
% NBVP=normalize(NBVP,-1,1);
valuex=valuex(1:5000);
valuey=valuey(1:5000);
valuez=valuez(1:5000);
NBVP=NBVP(1:5000);
end

