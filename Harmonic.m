% drum.m
% generate drum signals using Karplus-Strong algorithm.
clear all
close all
clc
L = 440;        % buffer length
alpha=0.5;
t=(1:100:10*440000);

x = [sin(9/2*pi*t(1:L)/L), zeros(1,length(t)-L)];
subplot(2,1,1)
plot(x);xlabel('Time');ylabel('Amplitude');
title('Input')
for i = L+1:length(t),
  x(i)=alpha*x(i-L)+alpha*sign(sin(sinh(100*x(i-L))))*x(i-L+1);
end
w2 = x(1:length(t))*0.999;
subplot(2,1,2)
plot(x);xlabel('Time');ylabel('Amplitude');
title('Output')