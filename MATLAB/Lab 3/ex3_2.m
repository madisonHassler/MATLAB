%% measured
mfile2='C:\Users\katez\Documents\MIZ 2021-2022\FIRST SEMESTER\Applied Electronic Instrumentation\Lab 3 Exercise 2.txt';
mfileID2=fopen(mfile2);
mtextstuff2=textscan(mfileID2, '%s %s %s %s','Delimiter','\t');
fclose(mfileID2);

mtime2=string(mtextstuff2{1,3});
mtime2=erase(mtime2,'9/10/2021  14:37:');
mvolt2=string(mtextstuff2{1,4});

mtime2=mtime2(5:2505);
mvolt2=mvolt2(5:2505);

mtime2=str2double(mtime2);
mvolt2=str2double(mvolt2);

mtime2=mtime2-mtime2(1);
mvolt2=mvolt2-mvolt2(1);

mtime2=mtime2(1:1224);
mvolt2=mvolt2(1:1224);

%% simulated
sfile2='C:\Users\katez\Documents\MIZ 2021-2022\FIRST SEMESTER\Applied Electronic Instrumentation\Lab 3 q2.csv';
sdata2=xlsread(sfile2);

stime2=sdata2(:,1);
svolt2=sdata2(:,2);

stime2=stime2(1:49);
svolt2=svolt2(1:49);

%% theoretical
x=linspace(0,0.05);
fun=@(x)(1-exp(-x./0.00464));

%% cursor values 
t1=0.00232;
v1=0.43371;

t2=0.00464;
v2=0.63572;

t3=0.00696;
v3=0.76597;

%% plot the graphs 
plot(mtime2,mvolt2,'DisplayName','Measured');
hold on
plot(stime2,svolt2,'DisplayName','Simulated');
hold on
plot(x,fun(x),'color','green','DisplayName','Theoretical');
hold on

scatter(t1,v1,'filled','DisplayName','0.5T');
hold on
scatter(t2,v2,'filled','DisplayName','1.0T');
hold on
scatter(t3,v3,'filled','DisplayName','1.5T');
hold on

title('Exercise 3-2: Step Response of a First-Order System');
xlabel('Time (s)');
ylabel('Voltage (V)');

legend 
hold off