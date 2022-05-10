clear;close all; clc;
%% Tabu search : Travelling salesman problem

% Chabrol Agathe
% Courbot Antoine
% Zahiri Oumaïma

%% Datas
cities = [4 8 9 0 2 7  ;
          2 1 5 4 3 9 ];
 
%chemin = [ 6 2 3 4 1 5];
 chemin =[6 5 3 4 2 1];
fin = [0;0];
pos = [0;0]; %initial starting point
tabu=[];
%% calcul de la distance avec un chemin
distance = calcDist(chemin,cities);
%% calcul des variations du coût avec permutation de (i,j)
perm = Permutation(chemin) ; 
for p=1:5
    distance = calcDist(chemin,cities);
    bestDelta= 1000;
    
    for j=1:size(perm')
        % Permutation de 2 termes dans un chemin
        cheminbis = chemin ; 
        p1 = perm(1,j);
        p2 = perm(2,j);
        r1 = cheminbis(p1);
        r2 = cheminbis(p2);
        cheminbis(p2) = r1;
        cheminbis(p1) = r2;

        delta = calcDist(cheminbis,cities) - distance;
        if delta<bestDelta 
            bestDelta = delta ; 
            bestPerm = perm(:,j);
            bestChemin = cheminbis;
            [ cities(:,bestPerm(1))  cities(:,bestPerm(2)) ];
        end
    end
    chemin = bestChemin;
    tabu = [];
end