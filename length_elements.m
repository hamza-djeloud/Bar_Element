function [L,C,S]=length_elements(xi,yi,xj,yj)

L = sqrt((xi-xj)^2+(yi-yj)^2);
    C = (xi-xj)/L;
    S = (yi-yj)/L;