function s = ShamirReconstruction(d,k)
% -------------------------------------------------------------------------
% FUNCRION: Shamir's Secret Sharing Algorithm
% also known as (k,n) threshold scheme
% -------------------------------------------------------------------------
% 
% Input: 
%        d = k parts of information about s, a k-by-2 matrix
%            where the 1st & 2nd column denotes the x and y coordinate
%            respectively.
% Output:
%        s = secret information, a number
%
% Syntax:
%        s = ShamirReconstruction([1,100;2,200])
% 
% -------------------------------------------------------------------------
% Shamir's Paper: "How to share a secret", 
% Communications of the ACM 22(11): 612613, doi:10.1145/359168.359176
% -------------------------------------------------------------------------
% Written by:
% Yue Wu, ywu03@ece.tufts.edu
% ECE Dept. @Tufts Univ.
% 01/10/2011
% -------------------------------------------------------------------------

% check settings
if size(d,1)<k
    error('insufficient pieces of information parts for reconstruction')
end

% obtain k pieces of info
x = d(1:k,1)';
y = d(1:k,2)';

% generate Largrange Polynomial
% see detailed algorithm on
% http://en.wikipedia.org/wiki/Shamir's_Secret_Sharing
% and
% http://en.wikipedia.org/wiki/Lagrange_polynomial
delElement = @(x,i) [x(1:i-1),x(i+1:end)];
lj = @(a,j) prod(delElement(a-x,j)'./delElement(x(j)-x,j)');
Lj = @(y,j) y(j)*lj(0,j);

% reconstruct secret info
s = 0;
for i = 1:k
    s = s+Lj(y,i);
end