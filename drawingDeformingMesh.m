function drawingDeformingMesh(new_nodeCoordinates,connectivity,line_deformed)

    new_nodeCoordinates(end,3) = 0;

        for k = 1:size(connectivity,1)
            plot3(new_nodeCoordinates(connectivity(k,:),1),new_nodeCoordinates(connectivity(k,:),2),new_nodeCoordinates(connectivity(k,:),3),line_deformed,'MarkerSize',12,'Linewidth',1.5)
        end
        
