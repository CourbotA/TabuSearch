clear;close all; clc;
%% Tabu search : Travelling salesman problem

% Chabrol Agathe
% Courbot Antoine
% Zahiri Oumaïma

%% Datas
cities = [-19 19 -11 -2 0 18 -9 -6 5 3 10 9 -7 20 21 12 11 16 17 8 -17 14 25 2 -22 -5 7 -1 1 15 22 -24 4 -21 -20 6 -18 -3 -23 -4 -12 -13 -16 -8 13 24 -14 -15 23 -10;
          9 -14 21 1 -16 7 13 -21 8 3 20 18 6 -12 2 4 -19 -15 17 -1 -22 -9 -18 16 -11 -20 -3 -10 -13 -4 -7 15 25 19 12 24 22 -23 -5 -17 11 0 5 -2 -24 -6 -8 10 14 23]
      
%random first chemin
chemin = randperm(size(cities,2),size(cities,2));
 
fin = [0;0];
pos = [0;0]; %initial starting point

tlist=zeros(size(cities,2),size(cities,2));
tabuTime = 75;
BestDist = inf;

%% calcul de la distance avec un chemin
distance = calcDist(chemin,cities);
%% calcul des variations du coût avec permutation de (i,j)
perm = Permutation(chemin) ; 

for p=1:2500
    
    distance = calcDist(chemin,cities);
    bestDelta= inf;
    
    for j=1:size(perm') %for each permutation.
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
            if ( tlist(perm(1,j),perm(2,j)) == 0 ) || ( NewDist < BestDist )     
                bestDelta = delta ; 
                IterrateBestPerm = perm(:,j);
                IterrateBestChemin = cheminbis;
            end
        end
    end
    
    % update chemin an tabuList
    tlist(find(tlist~=0)) = tlist(find(tlist~=0)) -1 ;
    chemin = IterrateBestChemin;
    tlist(IterrateBestPerm(1),IterrateBestPerm(2)) = tabuTime ; 
    tlist(IterrateBestPerm(2),IterrateBestPerm(1)) = tabuTime ; 
    %save best ever results
    if distance < BestDist
        BestDist = distance ;
        BestChemin = chemin;
    end 

end