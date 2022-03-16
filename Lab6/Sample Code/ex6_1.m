%% theoretical gain 
w=linspace(10,100000,100000);
%tgain=1./sqrt((-6.24e-8.*w.^2+1).^2+(4.33e-4.*w).^2);

r1=22e3;
r2=22e3;
c1=13.1e-9;
c2=9.84e-9;

tgain=1./((r1.*r2.*c1.*c2.*(w.^2))+((r1+r2).*c2.*w)+1);
tgain=abs(tgain);

%% theoretical phase shift 
%tphase=-atan((4.33e-4)./(-6.24e-8.*w));

tphase=atan(tgain);

tphase=tphase.*180./pi;

%% bode analyzer data import 
bafile='/Users/madi/Documents/GitHub/MATLAB/MATLAB/Lab6/Bode/Lab 6-1 Bode.txt';
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
clabfile='/Users/madi/Documents/GitHub/MATLAB/MATLAB/Lab6/CircuitLAB/6_1 CircuitLab.csv';
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