function arrPopulasi = inisialisasi()

batasBawah = 280;
batasAtas = 380;

populasi = 20; %random

arrPopulasi = zeros(populasi, 10);
% length(arrPopulasi(:,1))
for i = 1 : length(arrPopulasi(:,1))
    for j = 1 : 10
        duser = randi([batasBawah,batasAtas],1,1);
        sudutuser = randi([0,360],1,1)./(2*pi);
        if mod(j,2) == 0
            arrPopulasi(i,j)=duser.*cos (sudutuser);
        else
            arrPopulasi(i,j)=duser.*sin (sudutuser);
        end
    end
end

end


