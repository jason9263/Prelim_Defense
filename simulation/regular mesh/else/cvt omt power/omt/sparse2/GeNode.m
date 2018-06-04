%%generate 10W node
clear
clc
A = load('sample10.txt');
A = A';

csvwrite('mu1.csv',A);

B = csvread('mu1.csv');