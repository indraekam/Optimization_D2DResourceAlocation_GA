function [newPopulation] = elitism(populasi)

for i=1:length(populasi)
    fitness(i) = populasi(i).fitness;
end

for j = 1:length(fitness)-1
    for i = 1:length(fitness)-j
        if fitness(i)<fitness(i+1)
            temp = fitness(i);
            fitness(i) = fitness(i+1);
            fitness(i+1) = temp;
            temp1 = populasi(i,:);
            populasi(i,:) = populasi(i+1,:);
            populasi(i+1,:) = temp1;
        end
    end
end

% length(fitness)
% for j = 1:length(population) -1
%     for i = 1:length(population)-j-1
%         if fitness(i)<fitness(i+1)
%             temp = population(:,i);
%             population(:,i) = population(:,i+1);
%             population(:,i+1) = temp(:);
%         end
%     end
% end

newPopulation = populasi;

end