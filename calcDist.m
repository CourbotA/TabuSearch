function [ dist ] = calcDist(chemin,cities)
    dist = 0 ; 
    pos=[0;0];
    fin=[0;0];
    
   for i=1:size(chemin')
    j = chemin(i);
    city = cities(:,j);
    dist = dist + updateDist(pos,city);
    pos = city;
    end
dist = dist + updateDist(pos,fin);

end