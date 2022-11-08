%% Seyed Amir Muhammad Qureshi, Hadi Asgari | Geodesy II
%% Geoid (Potsdam Gravity Potato)
clc
clear all
format long g

%%
phi = -90:5:90;
lambda = 0:5:360;

[P, L] = meshgrid(phi,lambda);

for i = 1:size(P,1)
    for j = 1:size(P,2)
        h(i,j) = geoidheight(P(i,j),L(i,j));
    end
end

a = 6378137; %WGS84
f = 1 / 298.257223563;
e = sqrt(2 * f - f^2);
h = h * 10000;
N = a./(sqrt(1 - ((e.*sind(P)).^2)));
X = ((N + h).*cosd(P).*cosd(L));
Y = ((N + h).*cosd(P).*sind(L));
Z = ((N.*(1 - (e.^2))) + h).*sind(P);

surf(X,Y,Z);
title('Potsdam Gravity Potato')
axis equal
% brighten(.8)

