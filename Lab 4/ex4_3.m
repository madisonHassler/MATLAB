%% input data
file='C:\Users\katez\Documents\MIZ 2021-2022\FIRST SEMESTER\Applied Electronic Instrumentation/Lab 4 Exercise 3.txt';
fileID=fopen(file);
textstuff=textscan(fileID, '%s %s %s','Delimiter','\t');
fclose(fileID);

%% organize and separate frequency data
freq=textstuff{1,1};
freq=string(freq);
freq=freq(4:23);
freq=str2double(freq);
freq=2.*pi.*freq;

%% organize and separate gain data
gain=textstuff{1,2};
gain=string(gain);
gain=gain(4:23);
gain=str2double(gain);

%% organize and separate phase shift data
phase=textstuff{1,3};
phase=string(phase);
phase=phase(4:23);
phase=str2double(phase);

%% measured data
f=[15.915,47.745,159.15,477.45,1591.5];
f=2.*pi.*f;
g=[0.3897,0.4105,0.5963,0.8954,0.9931];
g=20*log10(g);
p=[6.3023,15.7272,26.0115,19.7664,8.5941];

%% theoretical gain data
ft=linspace(15.915,2387.25,100);
ft=2.*pi.*ft;
n=ft.*0.047./47;
wlr=ft.*0.047./47;
wlr2=(wlr).^2;
dur=1+wlr2;
d=sqrt(dur);
il=n./d;
tg=20.*log10(il);

%% theoretical phase shift data 
it=2.*pi.*ft.*0.047./47;
tpr=(pi./2)-atan(it);
tp=tpr.*180./pi;

%% gain plot
subplot(2,1,1);
semilogx(freq,(gain),'DisplayName','Bode Analyzer')
hold on
plot(ft,tg,'DisplayName','Theoretical')
hold on
scatter(f(1),g(1),'filled','g','DisplayName','Measured')
hold on
scatter(f(2),g(2),'filled','g')
hold on
scatter(f(3),g(3),'filled','g')
hold on
scatter(f(4),g(4),'filled','g')
hold on
scatter(f(5),g(5),'filled','g')
hold on
grid on
ylabel('Magnitude (dB)')
title('Bode Diagram')
legend('Bode Analyzer','Theoretical','Measured')
hold off

%% phase shift plot 
subplot(2,1,2)
semilogx(freq,phase,'DisplayName','Bode Analyzer')
hold on 
plot(ft,tp,'DisplayName','Theoretical');
scatter(f(1),p(1),'filled','g','DisplayName','Measured')
hold on
scatter(f(2),p(2),'filled','g')
hold on
scatter(f(3),p(3),'filled','g')
hold on
scatter(f(4),p(4),'filled','g')
hold on
scatter(f(5),p(5),'filled','g')
hold on
grid on 
ylabel('Phase (deg)')
xlabel('Frequency (rad/s)')
legend('Bode Analyzer','Theoretical','Measured')