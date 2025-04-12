function arrFitness  = hitungFitness(arrPopulasi, dataTrain)

arrFitness = [];
cakupan = 50;
jarakRelay = 80;
for i = 1 : length(arrPopulasi(:,1))
    %Inisialisasi Titik Relay 
    titikSatu = [arrPopulasi(i,1) , arrPopulasi(i,2)];
    titikDua =  [arrPopulasi(i,3) , arrPopulasi(i,4)];
    titikTiga = [arrPopulasi(i,5) , arrPopulasi(i,6)];
    titikEmpat = [arrPopulasi(i,7), arrPopulasi(i,8)];
    titikLima = [arrPopulasi(i,9), arrPopulasi(i,10)];
    
    sumSatu = 0;
    sumDua = 0;
    sumTiga = 0;
    sumEmpat = 0;
    sumLima = 0;
    
    %Hitung Jumlah User yg tercakup area relay
    for j = 1 : length(dataTrain(:,1))
        %Relay 1
        jarak1 = sqrt(((titikSatu(1) - dataTrain(j,1))^2) + ((titikSatu(2) - dataTrain(j,2))^2));
        if jarak1  <= cakupan 
            sumSatu = sumSatu + 1;
        end
        
        % Relay 2
        jarak2 = sqrt(((titikDua(1) - dataTrain(j,1))^2) + ((titikDua(2) - dataTrain(j,2))^2));
         if jarak2  <= cakupan 
            sumDua = sumDua + 1;
         end
        
         %Relay 3
         jarak3 =  sqrt(((titikTiga(1) - dataTrain(j,1))^2) + ((titikTiga(2) - dataTrain(j,2))^2));
         if jarak3  <= cakupan 
            sumTiga  = sumTiga + 1;
         end
         
         %Relay 4
        jarak4 =  sqrt(((titikEmpat(1) - dataTrain(j,1))^2) + ((titikEmpat(2) - dataTrain(j,2))^2));
        if jarak4  <= cakupan 
            sumEmpat = sumEmpat + 1;
        end
        
        %Relay 5
        jarak5 = sqrt(((titikLima(1) - dataTrain(j,1))^2) + ((titikLima(2) - dataTrain(j,2))^2));
        if jarak5  <= cakupan 
            sumLima = sumLima +  1;
        end
        
        
        

    end
    pinalty13 = 0;
    pinalty12 = 0;
    pinalty14 = 0;
    pinalty15 = 0;
    pinalty23 = 0;
    pinalty24 = 0;
    pinalty25 = 0;
    pinalty34 = 0;
    pinalty35 = 0;
    pinalty45 = 0;
    
    jarak12_relay = sqrt(((titikSatu(1) - titikDua(1))^2) + ((titikSatu(2) - titikDua(2))^2));
    if jarak12_relay  <= jarakRelay 
       pinalty12 = -20;
    end
    
    jarak13_relay = sqrt(((titikSatu(1) - titikTiga(1))^2) + ((titikSatu(2) - titikTiga(2))^2));
    if jarak13_relay  <= jarakRelay 
       pinalty13 = -20;
    end
    
    jarak14_relay = sqrt(((titikSatu(1) - titikEmpat(1))^2) + ((titikSatu(2) - titikEmpat(2))^2));
    if jarak14_relay  <= jarakRelay 
       pinalty14 = -20;
    end
    
    jarak15_relay = sqrt(((titikSatu(1) - titikLima(1))^2) + ((titikSatu(2) - titikLima(2))^2));
    if jarak15_relay  <= jarakRelay 
       pinalty15 = -20;
    end
    
    jarak23_relay = sqrt(((titikDua(1) - titikTiga(1))^2) + ((titikDua(2) - titikTiga(2))^2));
    if jarak23_relay  <= jarakRelay 
       pinalty23 = -20;
    end
    
    jarak24_relay = sqrt(((titikDua(1) - titikEmpat(1))^2) + ((titikDua(2) - titikEmpat(2))^2));
    if jarak24_relay  <= jarakRelay 
       pinalty24 = -20;
    end
    
    jarak25_relay = sqrt(((titikDua(1) - titikLima(1))^2) + ((titikDua(2) - titikLima(2))^2));
    if jarak25_relay  <= jarakRelay 
       pinalty25 = -20;
    end
    
    jarak34_relay = sqrt(((titikTiga(1) - titikEmpat(1))^2) + ((titikTiga(2) - titikEmpat(2))^2));
    if jarak34_relay  <= jarakRelay 
       pinalty34 = -20;
    end
    
    jarak35_relay = sqrt(((titikTiga(1) - titikLima(1))^2) + ((titikTiga(2) - titikLima(2))^2));
    if jarak35_relay  <= jarakRelay 
       pinalty35 = -20;
    end
    
    jarak45_relay = sqrt(((titikEmpat(1) - titikLima(1))^2) + ((titikEmpat(2) - titikLima(2))^2));
    if jarak45_relay  <= jarakRelay 
       pinalty45 = -20;
    end
    
    totalUser =  sumSatu + sumDua + sumTiga + sumEmpat + sumLima + pinalty12 + pinalty13 + pinalty14 + pinalty15 + pinalty23 + pinalty24 + pinalty25 + pinalty34 + pinalty35 + pinalty45;
    arrFitness(i) = totalUser;
%     euSatu = sqrt(sumSatu);
%     euDua = sqrt(sumDua);
%     euTiga= sqrt(sumTiga);
%     euEmpat= sqrt(sumEmpat);

end

% disp('arrFitness');
% arrFitness

end

