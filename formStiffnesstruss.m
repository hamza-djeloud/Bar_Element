function [Kel,T,k1] =formStiffnesstruss(C,S,L,EA)

Kel=EA/L*[1  0   -1  0
          0  0   0   0
          -1 0   1   0
          0  0   0   0];
      
T=[C    -S      0       0
   S     C      0       0
   0     0      C       -S
   0     0      S       C];

k1=T*Kel*T';
             
   % stiffness(elementDof,elementDof) = stiffness(elementDof,elementDof)+k1;

