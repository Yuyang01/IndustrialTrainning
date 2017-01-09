%

clear;
close all;
clc
model=createpde(1);

% Circle is code 1, center (.5,0), radius .2
C1 = [1,0.5,0,.1]';
geom = C1;
% Names for the two geometric objects
ns = (char('C1'))';
% Set formula
sf = 'C1';
% Create geometry
gd = decsg(geom,sf,ns);

% Include the geometry in the model
geometryFromEdges(model,gd);
pdegplot(model,'EdgeLabels','on')
axis equal
xlim([0.35,0.6])

%create the mesh
generateMesh(model,'Hmax',0.002);

applyBoundaryCondition(model,'edge',1:4,'q',0,'g',0,'Vectorized','on');

%initial condition
u0=char('sin(x)');


tlist=linspace(0,1,50);

d=1;
a=0;
c=0.01;
f=char('-ux-uy');

rtol = 1.0e-3; 
atol = 1.0e-4;
%u=parabolic(u0,tlist,model,c,a,f,d,rtol,atol);
u=parabolic(u0,tlist,model,c,a,f,d,rtol,atol);

[p,e,t]=meshToPet(model.Mesh);

%PostProcessing;
for i=1:length(tlist)
    %i=length(time);
figure(3);
clf(3,'reset');
%pdeplot(model, 'xydata', u(:,i), 'contour', 'off', 'colormap', 'jet');
 trisurf(t(1:3,:)',p(1,:)',p(2,:)',u(:,i))
%trisurf(t(1:3,:)',p(1,:)',p(2,:)',u(:,i))
title(sprintf('Convection-diffusion-reaction, Transi( %d seconds)\n', ...
  tlist(1,i)));
xlabel 'X-coordinate'
ylabel 'Y-coordinate'

 view(3)
pause(0.05)
end




