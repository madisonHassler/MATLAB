%% theoretical gain 
w=linspace(10,100000,100000);
tgain=1./sqrt((-1.11e-11.*w.^2+1).^2+(-8.62e-11.*w.^3+8.798e-4.*w).^2);

r=22e3;
c1=0.93e-9;
c2=234e-9;
c3=37.2e-9;

%tgain=1./(((r.^3).*c1.*c2.*c3.*(w.^3))+(2.*(r.^2).*c1.*(c2+c3).*(w.^2))+(r.*(3.*c1+c3).*w)+1);
%tgain=abs(tgain);

%% theoretical phase shift 
%tphase=-atan((-8.62e-11.*w.^3+8.798e-4.*w)./(-1.11e-11.*w.^2+1));
tphase=-atan(w.*(8.785e-4));
tphase=tphase.*180./pi;


%% bode analyzer data import 
bafile='C:\Users\katez\Documents\MIZ 2021-2022\FIRST SEMESTER\Applied Electronic Instrumentation\Lab 6\Lab6\6_4Bode.txt';
bafileID=fopen(bafile);
batextstuff=textscan(bafileID, '%s %s %s %s','Delimiter','\t');
fclose(bafileID);

%% bode analyzer frequency 
bafreq=batextstuff{1,1};
bafreq=str2double(bafreq);
bafreq=2.*pi.*bafreq;

%% bode analyzer gain 
bagain=batextstuff{1,2};
bagain=str2double(bagain);

%% bode analyzer phase shift
baphase=batextstuff{1,3};
baphase=str2double(baphase);

%% import circuitlab data
clabfile='C:\Users\katez\Documents\MIZ 2021-2022\FIRST SEMESTER\Applied Electronic Instrumentation\Lab 6\6_4 CircuitLab.csv';
clabdata=xlsread(clabfile);

%% circuitlab frequency
clabfreq=clabdata(:,1);
clabfreq=clabfreq.*2.*pi;

%% circuitlab gain
clabgain=clabdata(:,2);

%% circuitlab phase shift 
clabphase=clabdata(:,3);

%% plot 
subplot(2,1,1)
semilogx(w,20.*log10(tgain),'DisplayName','Theoretical')
hold on 
semilogx(bafreq,bagain,'DisplayName','Bode Analyzer')
hold on 
semilogx(clabfreq,clabgain,'g','DisplayName','CircuitLab')
grid on
ylabel('Magnitude (dB)')
title('Bode Diagram')
legend

subplot(2,1,2)
semilogx(w,tphase,'DisplayName','Theoretical')
hold on 
semilogx(bafreq,baphase,'DisplayName','Bode Analyzer')
hold on 
semilogx(clabfreq,clabphase,'g','DisplayName','CircuitLab')
grid on
ylabel('Phase (deg)')
xlabel('Frequency (rad/s)')
legend