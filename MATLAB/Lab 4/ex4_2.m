%% input data
file='C:\Users\katez\Documents\MIZ 2021-2022\FIRST SEMESTER\Applied Electronic Instrumentation\Lab 4 Exercise 2.txt';
fileID=fopen(file);
textstuff=textscan(fileID, '%s %s %s','Delimiter','\t');
fclose(fileID);

%% organize and separate frequency data
freq=textstuff{1,1};
freq=string(freq);
freq=freq(4:15);
freq=str2double(freq);
freq=2.*pi.*freq;

%% organize and separate gain data
gain=textstuff{1,2};
gain=string(gain);
gain=gain(4:15);
gain=str2double(gain);

%% organize and separate phase shift data
phase=textstuff{1,3};
phase=string(phase);
phase=phase(4:15);
phase=str2double(phase);

%% measured data
f=[3.445,10.335,34.45,103.35,344.5];
f=2.*pi.*f;
g=[0.9951,0.953,0.7165,0.3257,0.0963];
g=20*log10(g);
p=[-4.3655,-22.1748,-43.9031,-75.1561,-76.2723];

%% theoretical gain data
ft=linspace(3.445,516.75,100);
ft=2.*pi.*ft;
wrc=ft.*4620.*0.000001;
wrc2=(wrc).^2;
ur=wrc2+1;
root=sqrt(ur);
il=1./root;
tg=20.*log10(il);

%% theoretical phase shift data 
it=ft.*4620.*0.000001;
tpr=-1.*atan(it);
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
plot(ft,tp,'DisplayName','Theoretical')
hold on
scatter(f(1),p(1),'filled','g')
hold on
scatter(f(2),p(2),'filled','g','DisplayName','Measured')
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
hold off