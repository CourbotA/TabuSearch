function [ listPerm ] = Permutation(chemin)
    listPerm = [];
   
    for i=1:size(chemin')
       for j=i:size(chemin')
           if i~=j
            listPerm = [ listPerm [i;j] ] ;
           end
       end
    end
end
