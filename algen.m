clc;
clear all;
close all;

%inisialisasi user
cu = 50; % jumlah CU
cr_induk = 350; %radius base statjion
cr_relay = 40; %radius relay
teta_relay = [-40,40]; %jarak relay
daypan_bs = 40; %daya pancar bs
daypan_relay = 35; %daya pancar relay
carrier = 2; %frek carrier
x_bs = 0; y_bs = 0; %titik koordinat BS
x_g1_1 =  -210; y_g1_1 = 280; % Titik relay 1
x_g1_2 = -210; y_g1_2 = -250; % Titik relay 2
x_g1_3 = 0; y_g1_3 = 310;     % Titik relay 3
x_g1_4 = 210; y_g1_4 = 280;   % Titik relay 4
x_g1_5 = 210; y_g1_5 = -250;  % Titik relay 5 
% a1 = 250; b1 = 250; %titik koordinat radius relay
min_jarak_cu_d2d_relay = 5;   % min jarak penyebaran user pada radius relay
max_jarak_cu_d2d_relay = 40;  % max jarak penyebaran user pada radius relay
d2d1 = 100; %jumlah user D2D
min_antara_d2dtx_d2drx = 50; %min jarak penyebaran
max_antara_d2dtx_d2drx = 350; %max jarak penyebaran

figure(1)
%memanggil fungsi lingkaran
lingkaran_bs = lingkaran(cr_induk,x_bs,y_bs); 
plot(x_bs,y_bs,'k^','LineWidth',4);
hold on

%Penyebaran user CU
[d_d2d1,sudutd2d1,x_cu,y_cu] = sebaruser(min_antara_d2dtx_d2drx,max_antara_d2dtx_d2drx,cu);
plot (x_cu,y_cu,'hb');
vektor_cu_bs = [x_cu,y_cu];

%Penyebaran user D2D Tx
[d_d2d1,sudutd2d1,x_d2dtx,y_d2dtx] = sebaruser(min_antara_d2dtx_d2drx,max_antara_d2dtx_d2drx,d2d1);
plot (x_d2dtx,y_d2dtx,'hr');
vektor_d2d_BS = [x_d2dtx,y_d2dtx];

vektor_d2d_all = [vektor_cu_bs;vektor_d2d_BS];

% %Penyebaran user D2D Rx
% [d_d2drx,sudutd2d1,x_d2drx,y_d2drx] = sebaruser(min_antara_d2dtx_d2drx,max_antara_d2dtx_d2drx,d2d1);
% disp(d_d2drx)

%% Algen
crossrate = 0.7; %0.3 - 0.8
mutrate = 0.8; %0.1 - 0.3
iterasi = 300;
jumlahIndividu = 20;
populasi =  inisialisasi();
for j = 1 : iterasi

popSize = length(populasi(:,1));
fitness = hitungFitness(populasi,vektor_d2d_all);
disp('Populasi');
populasi
disp('Fitness');
fitness

indexChild = 0;
%Crossover
prosesCrossover = ceil((ceil(popSize * crossrate))/2);
for i = 1 : prosesCrossover
    indexParent1 = 0;
    indexParent2 = 0;
    while indexParent1 == indexParent2
        indexParent1 = randi(popSize);
        indexParent2 = randi(popSize);
    end
    parent1 = populasi(indexParent1,:);
    parent2 = populasi(indexParent2,:);
    % crossover
    [child1,child2] = crossover(parent1,parent2);
    indexChild = indexChild + 1;
    arrChild(indexChild,:) = child1;
    indexChild = indexChild + 1;
    arrChild(indexChild,:) = child2; 
end


% Mutasi
prosesMutasi = (ceil(popSize * crossrate));
for i = 1 : prosesMutasi 
    indexMutasi= randi(popSize);
    parentMut = populasi(indexMutasi,:);
    indexChild = indexChild + 1;
    arrChild(indexChild,:) = mutasi(parentMut);
end


% Seleksi
% Penggabungan Individu Parent dan child
populasiGabung = [];
index = 0;
for i = 1 : length(populasi(:,1))
    index = index +1;
    populasiGabung(index,:).individu = populasi(i,:);
    populasiGabung(index).fitness = fitness(1,i);
end


fitnessChild = hitungFitness((arrChild), vektor_d2d_BS);

for i = 1 : length(arrChild(:,1))
   index = index + 1;
   populasiGabung(index,:).individu = arrChild(i,:);
   populasiGabung(index).fitness = fitnessChild(1,i);
end

% populasiGabung(:).fitness

newPopulasi =  elitism(populasiGabung);

% Evaluasi
tempPopulasi = [];
for x = 1 : jumlahIndividu
    temp  =  newPopulasi(x,:).individu;
    tempPopulasi = [tempPopulasi ; temp];
    
end

populasi = tempPopulasi;

end

%% Ploting
%Plot Hasil Random ALgen
figure(2)
%memanggil fungsi lingkaran
lingkaran_bs = lingkaran(cr_induk,x_bs,y_bs); 

%peletakan BS
x_bs = 0;
y_bs = 0;
plot(x_bs,y_bs,'k^','LineWidth',4);
hold on

lingkaran_satu = lingkaran(cr_relay, populasi(1,1),  populasi(1,2));
lingkaran_dua = lingkaran(cr_relay, populasi(1,3),  populasi(1,4));
lingkaran_tiga = lingkaran(cr_relay, populasi(1,5),  populasi(1,6));
lingkaran_empat = lingkaran(cr_relay,  populasi(1,7),  populasi(1,8));
lingkaran_lima = lingkaran(cr_relay,  populasi(1,9),  populasi(1,10));

%titik pusat grup
%grup 1
plot(populasi(1,1),  populasi(1,2),'ro','LineWidth',2); 
hold on
%grup 2
plot(populasi(1,3),  populasi(1,4),'mo','LineWidth',2);
hold on
%grup 3
plot(populasi(1,5),  populasi(1,6),'go','LineWidth',2);
hold on
%grup 4
plot( populasi(1,7),  populasi(1,8),'co','LineWidth',2);
hold on
%grup 5
plot(populasi(1,9),  populasi(1,10),'yo','LineWidth',2);
hold on

% plot (x_d2d1b_1,y_d2d1b_1,'hm');
% plot (x_d2d1b_2,y_d2d1b_2,'hm');
% plot (x_d2d1b_3,y_d2d1b_3,'hm');
% plot (x_d2d1b_4,y_d2d1b_4,'hm');
% plot (x_d2d1b_5,y_d2d1b_5,'hm');
plot (vektor_cu_bs(:,1),vektor_cu_bs(:,2),'hb');
plot (vektor_d2d_BS(:,1),vektor_d2d_BS(:,2),'hr');

%% Fungsi
function lingkaran = lingkaran(r,x,y)
hold on
sudut = 0:pi/50:2*pi;
x = r*cos (sudut)+x;
y = r*sin (sudut)+y;
lingkaran = plot(x,y);
end

%fungsi penyebaran circle user d2d
function[duser,sudutuser,x_user,y_user] = sebaruser(r_min,r_max,jml_user)
duser = randi([r_min,r_max],jml_user,1);
sudutuser = randi([0,360],jml_user,1)./(2*pi);
x_user=duser.*cos (sudutuser);
y_user=duser.*sin (sudutuser);
end
