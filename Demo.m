%--------------------------------------------------------------------------
% Shamir's Secret Sharing Demo
% By Yue Wu
% ywu03@ece.tufts.edu
% 01/10/2010
%--------------------------------------------------------------------------

clear all
close all
clc

s = -1234.5; % the secret number
k = 3; % the number of pieces of info which are sufficient for reconstruction
n = 6; % total number of pieces of info
d = ShamirSharing(s,k,n); % generate pieces of info parts
c = d(3:5,:); % collect 3 pieces of info
r = ShamirReconstruction(c,k); % reconstruct secret info

display(['the secret info is ' num2str(s)])
display(['the used info is:'])
display(c);
display(['reconstruction is ' num2str(r)])
