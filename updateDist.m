function [ eucl ] = updateDist( pos , ville)
    dist = pos - ville ; 
    eucl = sqrt( dist(1)^2 + dist(2)^2 );
end