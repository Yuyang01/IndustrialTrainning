
clear;
close all;
clc;
%% Define the geometry and create the mesh
% create 4 coupled PDEs:
% u(1):actin-filament :used
% u(2):actin monomer
% u(3):myosin active :working 
% u(4):myosin inactive:free
% u(5): X-velocity
% u(6): Y-velocity
model=createpde(6);

% Circle is code 1, center (0,0), radius .2
%C1 = [4,0,0,1,0.25,0]';
C1=[1,0,0,pi/2]';
geom = C1;
% Names for the two geometric objects
ns = char('C1');
ns=ns';
% Set formula
sf = 'C1';
% Create geometry
gd = decsg(geom,sf,ns);
% Include the geometry in the model
geometryFromEdges(model,gd);
pdegplot(model,'EdgeLabels','on')
axis equal

%create the mesh
generateMesh(model,'Hmax',0.08);

%% Set parameter of the problem
% define parameter about the cell
example= SetExample();

%% Assign Robin boundary condition and Neumann boundary condition (both 0)
% boundary condition
%  myufun = @(region,state)state.time*(region.x - region.y);
%  mygfun = @(region,state)(region.x.^2 + region.y.^2);
% applyBoundaryCondition(model,'edge',1:4,'u',myufun,'Vectorized','on');
 
 % apply Robin boundary condition for equation 1,2,3 (convection exist)
 qMat=[0 0 0 0 0 0;
       0 0 0 0 0 0;
       0 0 0 0 0 0;
       0 0 0 0 0 0;
       0 0 0 0 0 0;
       0 0 0 0 0 0];
 gVec=[0,0,0,0,0,0]';
 applyBoundaryCondition(model,'edge',1:4,'q',qMat,'g',gVec,'Vectorized','on');
 

 
% Set the voltage (solution component 3) on the top edge to V.
%voltTop = applyBoundaryCondition(model,'Edge',1, 'u', V, 'EquationIndex', 3);
% Set the voltage (solution component 3) on the bottom edge to zero.
%voltBot = applyBoundaryCondition(model,'Edge',2, 'u', 0, 'EquationIndex', 3);

%% Set initial condition
%initial condition
%u0 = @initfun;

% intially: no actin filament, actin monomers=2, no working myosin, free
% myosin=3,all the velcity equals to zero

%u0= char('sin(x)+1','sin(x+pi)+1','sin(x)+1','sin(x+pi)+1','0','0');      
 
%u0= char('0','sin(x+pi)+1','0','sin(x+pi)+1','0','0');

u0= char('sin(x)+1','sin(x+pi)+1','sin(x+pi)+1','sin(x)+1','0','0'); 

%u0= char('1','0','1','0','0','0');
%u0= char('0','sin(x+pi)','sin(x)','sin(x+pi)','0','0');

%u0= char('0','sin(x+pi)+1','sin(x)+1','0','0','0');
%u0= char('sin(x)','0','sin(x+pi)','0','0','0');

%% Set Parabolic Solution Times
tlist=linspace(0,1,3000);

%% Set coefficient 
% solution
d=char('1','1','1','1','u(1)','u(1)'); % expanded into 6*6 diagonal

c = cCoefficient(example);

a = aCoefficient(example);

f = fCoefficient(example);

rtol = 1.0e-3; 
atol = 1.0e-4;

%% Solutions
u=parabolic(u0,tlist,model,c,a,f,d,rtol,atol);

%% Post-process
results=createPDEResults(model,u);
rs=results.NodalSolution;

[p,e,t]=meshToPet(model.Mesh);


for tt = 1:length(tlist) % number of steps
    figure(1);
    clf(1,'reset');
   % pdeplot(model,'xydata',rs(:,1,tt),'zdata',rs(:,1,tt),'contour','off')
   
    %[ux,uy]=pdegrad(p,t,rs(:,1,tt));
   % ugrad=[ux;uy];
    %pdeplot(p,e,t,'flowdata',ugrad)
   %axis equal
  %xlim([0.35,0.6])
    % ylim([0.35,0.6])
   quiver(p(1,:)',p(2,:)',rs(:,5,tt),rs(:,6,tt),'r');
  %zlim([0.35,0.6])
  % view(3)
  % trisurf(t(1:3,:)',p(1,:)',p(2,:)',rs(:,1,tt))
  % axis([0.35 0.6 0.35 0.6 0.35 0.6])
    pause(0.01);
  
    
end









