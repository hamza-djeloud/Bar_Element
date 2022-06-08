
clear all;    % Clear all variables in memory
close all;    % close all figures
clc           % Clear screen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB Codes for Finite Element Analysis   %%
% 2D Barr elements                           %%
% HAMZA DJELOUD  2020                        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% E; modulus of elasticity
% A: area of cross section
E = 30e6; A = 2; EA = E*A;

connectivity = load('connectivity.txt');

nodeCoordinates = load('nodeCoordinates.txt');

numberElements =size(connectivity,1);    
numberNodes = size(nodeCoordinates,1);   

xx = nodeCoordinates(:,1);
yy = nodeCoordinates(:,2);


GDof = 2*numberNodes;           
displacements = zeros(GDof,1);  
force = zeros(GDof,1);          


force(2) = -10000.0;
stiffness=zeros(GDof);

for i_el = 1:numberElements
    
    i=connectivity(i_el,1);
    j=connectivity(i_el,2);
    
  indice=[i j];
  
    elementDof = [i*2-1 i*2 j*2-1 j*2] ;
   xi = nodeCoordinates(i,1);
   yi = nodeCoordinates(i,2);
   xj = nodeCoordinates(j,1);
   yj = nodeCoordinates(j,2);
    [L,C,S]=length_elements(xi,yi,xj,yj);
    
[Kel,T,k1] =formStiffnesstruss(C,S,L,EA);
[stiffness] =assemble(elementDof,stiffness,k1);
end

prescribedDof = [3:8]';

displacements = solution(GDof,prescribedDof,stiffness,force,displacements);


uuxx=displacements(1:2:end);
uuyy=displacements(2:2:end);

figure
ut=sqrt(uuxx).^2+(uuyy).^2;
scaleFact = max(ut)
hold on
line_original='k.-';
drawingMesh(nodeCoordinates,connectivity,line_original)
stresses2Dtruss(numberElements,connectivity,xx,yy,displacements,E)
outputDisplacementsReactions(displacements,stiffness,GDof,prescribedDof)
