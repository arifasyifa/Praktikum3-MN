clc;
clear;
close all;

disp('=== Looping For (Kondisi 1) ===');
for i = 2:6
    p = i^2
end
disp('=== Looping For (Kondisi 2) ===');
for j = 1.5:0.5:4.5
    q = j/3
end
disp('=== While Loop ===');
p = 2;
while (p <= 6)
        q = p^2 + p
        p = p + 1;
end
disp('=== Looping Continue ===');
for i = 1:5
    if (i == 3)
        continue
    end
    p = i^2
end
disp('=== Looping Break ===');
for i = 1:5
    if (i == 4)
        break
    end
    p = i^2
end
disp('=== Differensial ===');
try
pkg load symbolic;
catch
end
syms x;
f = input('Masukkan bentuk persamaan f(x) = ');
f_asli = sym(f)
f_turunan = diff(f_asli, 'x')

disp('=== Integral ===');
f = input('Masukkan bentuk persamaan f(x) = ');
f_asli = sym(f)
f_integral = int(f_asli, 'x')

disp('=== Function: File Terpisah ===');
func_p8 = @(param) fprintf('Nama saya %s!\n', param);
func_p8('Arifa');

disp('=== Function: Pemanggilan Fungsi Lokal ===');
callname_p9 = @(param) fprintf('Kata "%s" diawali dengan huruf %c.\n', param, param(1));
func_p9 = @(param) (fprintf('Nama saya %s!\n', param) + 0*callname_p9(param));
func_p9('Arifa');

disp('=== Function: 1 Nilai Return ===');
doubleit = @(param) 2*param;
a = doubleit(8)

disp('=== Function: Beberapa Nilai Return ===');
multi = @(param1, param2) deal(param1*2, param2*3);
[x_val, y_val] = multi(4, 5)

disp('=== Function: Return Sebelum Callname ===');
func_ret = @(param) fprintf('Nama saya %s!\n', param);
func_ret('Arifuyy');

disp('=== Function: Return Sebelum Hitungan ===');
doubleit_ret = @(param) 0;
b = doubleit_ret(7)

disp('=== Anonymous Function: Squared ===');
squared = @(x) x.^2;
ans_sq = squared(4)
ans_sq_arr = squared(1:4)

disp('=== Anonymous Function: Addition ===');
addition = @(x,y) x+y;
ans_add = addition(6, 8)

disp('=== Grafik Garis 2D: Plot Renggang ===');
x = 2:20:90;
y = x.^3 + 3*x.^2 - 30*x;
x, y
figure(1);
plot(x,y);

disp('=== Grafik Garis 2D: Plot Rapat ===');
x = 0:1:90;
y = x.^3 + 3*x.^2 - 30*x;
x, y
figure(2);
plot(x,y);

disp('=== Grafik Garis 2D: Label dan Judul ===');
x = linspace(0,25);
y = exp(-x/5).*sin(x);
figure(3);
plot(x,y);
xlabel('Sumbu X');
ylabel('Sumbu Y');
title('Grafik persamaan f(x)=exp(-x/5).*sin(x)');

disp('=== Grafik Garis 2D: Dua Kurva ===');
x = 0:0.01:2*pi;
y = -12*sin(3*x) - 7*cos(4*x);
z = 9*sin(5*x).*-5.*cos(9*x);
figure(4);
plot(x,y,x,z);

disp('=== Grafik Garis 3D: Line Plot ===');
t = 0:0.1:5*pi;
x = sqrt(t).*sin(3*t);
y = sqrt(t).*cos(3*t);
z = 0.6*t;
figure(5);
plot3(x,y,z,'k','linewidth',1.5);
grid on;
xlabel('x');
ylabel('y');
zlabel('z');

disp('=== Grafik Garis 3D: Mesh Plot ===');
x = -6.5:0.5:6.5;
y = x;
[X,Y] = meshgrid(x,y);
R = sqrt(X.^2 + Y.^2);
R(R == 0) = eps;
Z = sin(R)./R;
figure(6);
mesh(X,Y,Z);

disp('=== Matriks Meshgrid Demo ===');
x_demo = [2, 3, 4];
y_demo = [15, 25];
[X_out, Y_out] = meshgrid(x_demo, y_demo)

disp('=== Grafik Garis 3D: Contour Plot ===');
x = -3.2:0.25:3.2;
y = -3.2:0.25:3.2;
[X,Y] = meshgrid(x,y);
Z = 1.7.^(-1.4*sqrt(X.^2 + Y.^2)).*cos(0.5*Y).*sin(X);
figure(7);
contour3(X,Y,Z,14);
xlabel('x');
ylabel('y');
zlabel('z');
