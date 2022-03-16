close all 
clear -regexp
tau=2e-4;
w=logspace(2,5,200);

H=1./(1+1j*w*tau);
MagH=abs(H);
PhaseHRad=angle(H);

subplot(2,1,1);
semilogx(w,20*log10(MagH))
grid on
ylabel('Magnitude (dB)')
title('Bode Diagram')

subplot(2,1,2)
semilogx(w,PhaseHRad*(180/pi))
grid on 
ylabel('Phase (deg)')
xlabel('Frequency (rad/s)')