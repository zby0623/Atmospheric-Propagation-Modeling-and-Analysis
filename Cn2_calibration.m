clear
close all;
dia = 2.9e-3; % Diameter of the 635 nm probe laser
aoa = [1e-11, 2e-11, 3e-11, 4e-11, 5e-11, 6e-11, 7e-11, 8e-11];
%%
l0 = 1e-3; % inner scale (m)
L0 = 0.105; % outer scale (m)
l = 7;
N = 2^l - 1; % grid number
n0 = 1.000275;
Ld = 635e-9; % wavelength
k0 = 1/Ld * 2 * pi() * n0;
Lx = 0.1;
dx = Lx/(N+1);
delta = dx;
x = ((-(N+1)/2 : (N+1)/2-1)) * delta;
k = linspace(0, 1/dx, 5.*N+1);
turblen = 0.15;
k=k(2:end);
Km = 3.3/l0; % inner scale frequency [1/m]
K0 = 8*pi/L0; % outer scale frequency [1/m]
PSD_phi = 0.033.* exp(-(k./Km).^2)./ (k.^2).^(11/6) .* (1+1.802.*(k./Km) - 0.254 .*(k./Km).^(7/6)).*(1-exp(-k.^2/K0.^2)); % modified PSD
Km1 = 5.92/l0; % inner scale frequency [1/m]
K01 = 1/L0*2*pi;
PSD_phi1 = 0.033.* exp(-(k./Km1).^2)./ (k.^2 + K01^2).^(11/6); % mvK PSD
Km2=5.92/l0;
PSD_phi2 = 0.033*k.^(-11/3).*exp(-(k./Km2).^2); % Tatarskii PSD
PSD_phi3 = 0.033*k.^(-11/3); % Kolmogorov PSD
J = besselj(0,dia.*k); % Bessel function
D_mvk = aoa.*(k0.*dia).^2;
Cn2 = D_mvk ./( 8.*pi^2.*k0.^2*turblen.*sum(k.*PSD_phi.*(1-J),'all').*(k(2)-k(1)) );
Cn2_mvk = D_mvk ./( 8.*pi^2.*k0.^2*turblen.*sum(k.*PSD_phi1.*(1-J),'all').*(k(2)-k(1)) );
Cn2_Tar = D_mvk ./( 8.*pi^2.*k0.^2*turblen.*sum(k.*PSD_phi2.*(1-J),'all').*(k(2)-k(1)) );
Cn2_kol = aoa.*dia.^(1/3)./2.91./turblen;
%% Plot Cn2 vs. AoA
color=["#FF2908","#FCA800","#1D00DB","#00A204"];
f = figure();
plot([0,aoa], [0,Cn2], '-o','LineWidth',1.5,'MarkerSize',8,'Color',color(1)); hold on;
plot([0,aoa], [0,Cn2_mvk],'-*','LineWidth',1.5,'MarkerSize',8,'Color',color(2)); hold on;
plot([0,aoa], [0,Cn2_Tar],'-d','LineWidth',1.5,'MarkerSize',8,'Color',color(3)); hold on;
plot([0,aoa], [0,Cn2_kol],'-s','LineWidth',1.5,'MarkerSize',8,'Color',color(4)); hold on;
hold off;
set(gca,'FontSize',16);
set(gca,'FontWeight','bold');
xlabel('Variance of AoA [rad^2]')
ylabel('C_n^2 [m^{-2/3}]');
legend('modified','modified von Karman','Tatarskii','Kolmogorov', 'Location', 'northwest');
saveas(gca,'PSD_L0.105_blue.pdf','pdf');
copygraphics(f)
a= Cn2(end)/aoa(end);
b= Cn2_mvk(end)/aoa(end);
c= Cn2_kol(end)/aoa(end);
d= Cn2_Tar(end)/aoa(end);
disp(c/c); % Constant A in Eq. (4) for Kolmogorov PSD
disp(d/c); % Constant A in Eq. (4) for Tatarskii PSD
disp(b/c); % Constant A in Eq. (4) for mvK PSD
disp(a/c); % Constant A in Eq. (4) for modified PSD
%% Directly calculating constant A based on Eq. (20)
disp(2.91*(dia)^(5/3)/(8.*pi^2.*sum(k.*PSD_phi.*(1-J),'all').*(k(2)-k(1))));
disp(2.91*(dia)^(5/3)/(8.*pi^2.*sum(k.*PSD_phi1.*(1-J),'all').*(k(2)-k(1))));
disp(2.91*(dia)^(5/3)/(8.*pi^2.*sum(k.*PSD_phi2.*(1-J),'all').*(k(2)-k(1))));
