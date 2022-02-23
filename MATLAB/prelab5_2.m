%% gain
w=linspace(1,10000,100000);
rr=10000./1000;
wrc=(w.*10000.*0.000001);
wrc2=(wrc).^2;
ur=1+wrc2;
root=sqrt(ur);
g=rr./root;
G=abs(g);

%% phase shift 
wrc=(w.*10000.*0.000001);
tan=atan(wrc);
tand=tan.*180./pi;
p=180-tand;

%% plot
subplot(2,1,1);
semilogx(w,20.*log10(G))
grid on
ylabel('Magnitude (dB)')
title('Bode Diagram')

subplot(2,1,2)
semilogx(w,p)
grid on
ylabel('Phase (deg)')
xlabel('Frequency (rad/s)')