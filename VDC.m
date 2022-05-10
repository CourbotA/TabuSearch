clear;close all; clc;
%% Tabu search : Travelling salesman problem

% Chabrol Agathe
% Courbot Antoine
% Zahiri Ouma�ma

%% Datas
cities = [-2 -5 -1 -6 3 5 -4 2 4 0 1 -3 8 7 6;
          -3 3 6 -2 1 5 0 -5 -1 4 -4 8 7 -6 2]
      
%random first chemin
chemin = randperm(size(cities,2),size(cities,2));
 
fin = [0;0];
pos = [0;0]; %initial starting point
tabuList= [];
% elements stays in tabuList for exactly tabuListSIZE iterations 
tabuListSIZE = 25;
BestDist = inf;

%% calcul de la distance avec un chemin
distance = calcDist(chemin,cities);
%% calcul des variations du co�t avec permutation de (i,j)
perm = Permutation(chemin) ; 

for p=1:10000
    distance = calcDist(chemin,cities);
    bestDelta= inf;
    
    for j=1:size(perm')
        % Permutation de 2 termes dans un chemin
        cheminbis = chemin ; 
        p1 = perm(1,j);
        p2 = perm(2,j);
        r1 = cheminbis(p1);
        r2 = cheminbis(p2);
        cheminbis(p2) = r1;
        cheminbis(p1) = r2;
        
        NewDist = calcDist(cheminbis,cities);

        delta = NewDist - distance;
        if delta<bestDelta 
            %best result not in tabu list but aspiration criterium 
            if ( sum(sum(ismember( [ cities(:, perm(1,j)) cities(:, perm(2,j) ) ] , tabuList)))<4 )  || (NewDist< BestDist)         
                bestDelta = delta ; 
                IterrateBestPerm = perm(:,j);
                IterrateBestChemin = cheminbis;
            end
        end
    end
    
    % update chemin
    chemin = IterrateBestChemin;
    
    %save best ever results
    if distance < BestDist
        BestDist = distance;
        BestChemin = chemin;
    end 
    
    %update Tabu LIST
    if size(tabuList ,2) < 2*tabuListSIZE
        tabuList = [ tabuList   [ cities(:,IterrateBestPerm(1))   cities(:,IterrateBestPerm(2))]] ;
    else 
        tabuList = [ tabuList(:,3:2*tabuListSIZE) [ cities(:,IterrateBestPerm(1))   cities(:,IterrateBestPerm(2))]];
    end
   
   
end