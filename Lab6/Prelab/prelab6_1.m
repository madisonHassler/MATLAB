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

%% plot 
subplot(2,1,1)
semilogx(w,20.*log10(tgain))
hold on
grid on
ylabel('Magnitude (dB)')
title('Bode Diagram')

subplot(2,1,2)
semilogx(w,tphase)
grid on
ylabel('Phase (deg)')
xlabel('Frequency (rad/s)')