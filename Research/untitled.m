r = corrcoef(LOT,Asp);


% scatter(LOT,Asp,"filled");
hold on;

% mdl = fitlm(LOT,Asp);
[p,F] = coefTest(mdl);
mdl.Coefficients