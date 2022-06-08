function drawingMesh(nodeCoordinates,connectivity,line_original)

 nodeCoordinates(end,3) = 0;

for k = 1:size(connectivity,1)
plot3(nodeCoordinates(connectivity(k,:),1),nodeCoordinates(connectivity(k,:),2),nodeCoordinates(connectivity(k,:),3),line_original,'MarkerSize',12,'Linewidth',1.5)
        end
        
