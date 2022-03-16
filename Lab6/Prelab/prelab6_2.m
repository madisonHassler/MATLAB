%% theoretical gain 
f=linspace(10,10000,100000);
w=2.*pi.*f;
r=22000;
c1=0.93e-9;
c2=234e-9;
c3=37.2e-9;

denom=((r.^3).*c1.*c2.*c3.*(w.^3))+(2.*(r.^2).*c1.*(c2+c3).*(w.^2))+(r.*(3.*c1+c3).*w)+1;
tgain=1./denom;

%% theoretical phase shift 
tphase=-atan(((r.^3).*c1.*c2.*c3.*(w.^3))+(2.*(r.^2).*c1.*(c1+c3).*(w.^2))+(r.*(3.*c1+c2).*w));
tphase=tphase.*180./pi;

%% circuitlab data import 
clabfile='C:\Users\katez\Documents\MIZ 2021-2022\FIRST SEMESTER\Applied Electronic Instrumentation\Lab 6\Pre-lab 6 Data.csv';
clabdata=xlsread(clabfile);

%% circuitlab data 
clabfreq=clabdata(:,1);
clabfreq=2.*pi.*clabfreq;

clabgain=clabdata(:,2);

clabphase=clabdata(:,3);

%% plot 
subplot(2,1,1)
semilogx(w,20.*log10(tgain),'DisplayName','Theoretical')
hold on
semilogx(clabfreq,clabgain,'DisplayName','CircuitLab')
grid on
ylabel('Magnitude (dB)')
title('Bode Diagram')
legend

subplot(2,1,2)
semilogx(w,tphase,'DisplayName','Theoretical')
hold on 
semilogx(clabfreq,clabphase,'DisplayName','CircuitLab');
grid on
ylabel('Phase (deg)')
xlabel('Frequency (rad/s)')
legend