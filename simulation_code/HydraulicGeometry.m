%% Function 1 - HG
% Bankfull Hydraulic Geometry
% approximated by linear regression 
% from E. Deal et al., and K. Dunne and D. Jerolmack

%Discharge vs. Width
%log(W) = 0.503*log(Qw) + 0.597;
%Discharge vs. Depth
%log(H) = 0.392*log(Qw) - 0.522;
%Discharge vs. Slope
%log(S) = -0.461*log(Qw) - 1.94;

%manning's Eq.
%U_bk = R^(2/3)*S^(1/2)/nc;
%nc = 0.030; %manning's roughness coefficient for channel

function [H_bk, Wc, U_bk, S] = HydraulicGeometry(Qw)

% W = 10^(0.503*log10(Qw) + 0.597);
% H_bk = 10^(0.392*log10(Qw) - 0.522);
% S = 10^(-0.461*log10(Qw) - 1.94);
% U_bk = Qw/(W*H_bk);

%Calculate normal flow depth

Wc = 10^(0.503*log10(Qw) + 0.597);
S = 10^(-0.461*log10(Qw) - 1.94);

syms hn positive
eq = 1/0.03*(Wc*hn)*((Wc*hn)/(Wc+2*hn))^(2/3)*sqrt(S) == Qw; 
H_bk = double(solve(eq,hn,'PrincipalValue',true));
U_bk = Qw/(Wc*H_bk);

end

