load raw_data
sensor1=raw_data.LogMag(:,:,1,1);
x=raw_data.AZ(:,1);
y=raw_data.EL(1,:);
z=zeros(73*4,37*4);
intensity_value=raw_data.LogMag/20;
intensity_value=power(10,intensity_value);
hecheng=intensity_value(:,:,2,1)+intensity_value(:,:,1,1);
contourf(y,x,hecheng)
hecheng=20*(log10(hecheng));
figure(2)
contourf(y,x,hecheng);
figure(3)
contourf(y,x,intensity_value(:,:,2,1))
figure(4)
contourf(y,x,intensity_value(:,:,1,1))

 %zz=raw_data.Phase(:,:,1,1)-raw_data.Phase(:,:,1,4)
% figure(4)
% surf(y,x,raw_data.LogMag(:,:,1,4))
