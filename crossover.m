function [child1,child2] = crossover(parent1,parent2)

batas_bawah = -0.25;
batas_atas = 1.25;
child1 = parent1;
child2 = parent2;


 for i=1:10
     temp1 = (batas_atas - (batas_bawah)) * rand(1, 1, 'double');
     alpha1 = batas_bawah + temp1;
     child1(i) = parent1(i) + ( alpha1 * (parent2(i) - parent1(i)));
%      temp2 = (batas_atas - (batas_bawah)) * rand(1, 1, 'double');
%      alpha2 = batas_bawah + temp2;
     child2(i) = parent2(i) + ( alpha1 * (parent1(i) - parent2(i)));
 end


end