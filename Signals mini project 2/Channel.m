function [soundSignalOut1,Time1,soundSignalOut2,Time2,soundSignalOut3,Time3,soundSignalOut4,Time4] = Channel(soundSignalIn,Fs,Time)
%This function acts as the channel block in the communication
%system taking in input signal and returning modified signala

%Starting a new figure
figure('name','Channel');

%performing delta convolution
Delta =(Time == 0) ;
soundSignalOut1 = conv(soundSignalIn , Delta ) ;
Time_Edge_1=length(soundSignalOut1)./Fs;
Time1 =linspace(0,Time_Edge_1,Time_Edge_1*Fs); 

%performing exponential convolution
Exp_1=exp(-2*pi*5000*Time) ;
soundSignalOut2 = conv(soundSignalIn ,Exp_1) ; 
Time_Edge2=length(soundSignalOut2)./Fs;
Time2 =linspace(0,Time_Edge2,Time_Edge2*Fs);

%performing exponential convolution
Exp_2 = exp(-2*pi*1000*Time);
soundSignalOut3 = conv(soundSignalIn ,Exp_2) ;
Time_Edge3=length(soundSignalOut3)./Fs;
Time3 =linspace(0,Time_Edge3,Time_Edge3*Fs);

%performing delta convolution
Deltas=[2 zeros(1,1*Fs-2) 0.5];
soundSignalOut4 = conv(soundSignalIn , Deltas) ;
Time_Edge4=length(soundSignalOut4)./Fs;
Time4 =linspace(0,Time_Edge4,Time_Edge4*Fs);

%Displaying delta channel 
subplot(2,2,1);
plot(Time1,soundSignalOut1);
title('Conv Delta Sound');

%Displaying exponential channel 
subplot(2,2,2);
plot(Time2,soundSignalOut2);
title('Conv Exp1 Sound');
 
%Displaying exponential channel
subplot(2,2,3);
plot(Time3 ,soundSignalOut3);
title('Conv Exp2 Sound');
 
%Displaying delta channel
subplot(2,2,4);
stem(Time4, soundSignalOut4 );
title('Conv Deltas Sound');

end

