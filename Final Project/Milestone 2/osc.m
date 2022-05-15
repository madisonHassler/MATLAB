file='/Users/madi/Documents/GitHub/MATLAB/Final Project/Milestone 2/Milestone 2 Data.txt';
fileID=fopen(file);
data=textscan(fileID, '%s %s %s %s','Delimiter','\t');
fclose(fileID);

w=0:0.000008:0.02;

data1=data{1,2};
data1=str2double(data1);
data1=data1(5:2505);
data2=data{1,4};
data2=str2double(data2);
data2=data2(5:2505);

plot(w,data1,'b')
hold on 
grid on 
plot(w,data2,'r')
ylim([-.02 .22])
maxOvershoot=max(data2);