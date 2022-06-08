function [stiffness] =assemble(elementDof,stiffness,k1)

stiffness(elementDof,elementDof) = stiffness(elementDof,elementDof)+k1;




