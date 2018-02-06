function d = ShamirSharing(s,k,n)
% -------------------------------------------------------------------------
% FUNCRION: Shamir's Secret Sharing Algorithm
% also known as (k,n) threshold scheme
% -------------------------------------------------------------------------
% 
% Input: 
%        s = secret information, a number
%        k = the number of parts which are sufficient to reconstruct secret
%        n = total number of parts
% Output:
%        d = n parts of information about s, a n-by-2 matrix
%            where the 1st & 2nd column denotes the x and y coordinate
%            respectively.
%
% Syntax:
%        d = ShamirSharing(100,3,5)
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
if k-round(k)~=0 || k<=0
    error('k has to be a positive integer')
elseif n-round(n)~=0 || n<=0
    error('n has to be a positive integer')
elseif n<k
    error('n has to be no less than k')
end

% initialize random coefficients
r = round(100*(2*rand(1,k-1)-1));
r(r==0) = 1;

% generate the polynomial about x with k unknowns
P = @(x) (x.^(1:k-1))*r'+s;

% generate n pieces of partial information
for i = 1:n
    d(i,1) = i;
    d(i,2) = P(i);
end