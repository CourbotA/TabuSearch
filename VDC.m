clear;close all; clc;
%% Tabu search : Travelling salesman problem

% Chabrol Agathe
% Courbot Antoine
% Zahiri Oumaïma

%% Datas
cities = [4 8 9 0 2 7  ;
          2 1 5 4 3 9 ];
 
chemin = [ 6 2 3 4 1 5];
fin = [0;0];
pos = [0;0]; %initial starting point

%% calcul de la distance avec un chemin
distance = calcDist(chemin,cities);
%%
tabuList = [chemin];


