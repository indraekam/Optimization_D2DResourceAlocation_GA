function [childMutasi] = mutasi(parent1)

% parent1 = [0.3 , 1.000, 2.000];
childMutasi =  parent1;
batas_bawah = -0.1;
batas_atas = 0.1;

indexGen = randi(length(parent1(:)));


temp1 = (batas_atas - (batas_bawah)) * rand(1, 1, 'double');
r1 = batas_bawah + temp1;
childMutasi(indexGen) = parent1(indexGen) + (r1 *( (400 - (-400) )));

end