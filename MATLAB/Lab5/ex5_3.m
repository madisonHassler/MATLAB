%% import experimental bode data 
ebfile='/Users/madi/Documents/GitHub/MATLAB/MATLAB/Lab5/LAb5-3 Bode.txt';
ebfileID=fopen(ebfile);
ebtextstuff=textscan(ebfileID, '%s %s %s %s','Delimiter','\t');
fclose(ebfileID);

%% measured data 
ebfreq=ebtextstuff{1,1};
ebfreq=str2double(ebfreq);
ebfreq=ebfreq(4:37);
ebfreq=2.*pi.*ebfreq;

ebgain=ebtextstuff{1,2};
ebgain=str2double(ebgain);
ebgain=ebgain(4:37);

ebphase=ebtextstuff{1,3};
ebphase=str2double(ebphase);
ebphase=ebphase(4:37);

%% oscilloscope data 
of1=1.5915.*2.*pi;
og1=20.*log10(10.9125);
op1=169.0173;

of2=4.775.*2.*pi;
og2=20.*log10(10.6277);
op2=168.4444;

of3=15.915.*2.*pi;
og3=20.*log10(7.9801);
op3=138.651;

of4=47.75.*2.*pi;
og4=20.*log10(4.0206);
op4=107.942;

of5=159.15.*2.*pi;
og5=20.*log10(1.6409);
op5=94.5351;

%% theoretical data 
w=linspace(1,1000000,10000000);
rf=10000;
ri=1000;
cf=1e-6;

t=rf*cf;
tg=((rf/ri)./(sqrt(1+(w.*t).^2)));
tg=abs(tg);

tp=pi-atan(w.*rf.*cf);
tp=tp.*180./pi;

%% circuitlab data 
clabfile='/Users/madi/Documents/GitHub/MATLAB/MATLAB/Lab5/Lab 5 Pre-lab 3.csv';
clabdata=readmatrix(clabfile);

%% organize circuitlab data 
clabfreq=clabdata(:,1);
%clabfreq=clabfreq(2:17);
clabfreq=2.*pi.*clabfreq;

clabgain=clabdata(:,2);
%clabgain=clabgain(2:17);

clabphase=clabdata(:,3);
%clabphase=clabphase(2:17);

%% plot
subplot(2,1,1);
semilogx(ebfreq,ebgain,'r','DisplayName','Measured');
hold on 
semilogx(clabfreq,clabgain,'b','DisplayName','CircuitLab');
hold on
semilogx(w,20.*log10(tg),'DisplayName','Theoretical');
hold on
scatter(of1,og1,'filled','m');
hold on 
scatter(of2,og2,'filled','m');
hold on 
scatter(of3,og3,'filled','m');
hold on 
scatter(of4,og4,'filled','m');
hold on 
scatter(of5,og5,'filled','m');
hold on 
grid on
ylabel('Magnitude (dB)')
title('Bode Diagram')
legend('Measured','CircuitLab','Theoretical','Oscilloscope')


subplot(2,1,2);
semilogx(ebfreq,ebphase,'r','DisplayName','Measured');
hold on 
semilogx(clabfreq,clabphase,'b','DisplayName','CircuitLab');
hold on
semilogx(w,tp,'DisplayName','Theoretical');
hold on
scatter(of1,op1,'filled','m');
hold on 
scatter(of2,op2,'filled','m');
hold on 
scatter(of3,op3,'filled','m');
hold on 
scatter(of4,op4,'filled','m');
hold on
scatter(of5,op5,'filled','m');
hold on
grid on
ylabel('Phase (deg)')
xlabel('Frequency (rad/s)')
legend('Measured','CircuitLab','Theoretical','Oscilloscope')
hold off 