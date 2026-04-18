fs=20;
ms=8;
shape=["--s","--d","--o"];
shape_modified=["-s","-d","-o"];
shape_exp=["s","d","o"];
figure(1)
load('simulation_result_all_20251013_modified_exp_8pi_6mm_l0prop_5mm_1_screen.mat');
cn2=0.6957/0.3267*2E-13*(5:5:50).^2.0022;
cn2=[7.19E-15 cn2];
colors = ['#2CA02C';
          '#1F77B4';
          '#9467BD'];
colors_sim = [
    0.00 0.80 0.50;   % Mint Green (bright & fresh, very different from #2CA02C)
    0.30 0.70 1.00;   % Sky Blue  (lighter & brighter than #1F77B4)
    0.70 0.45 1.00    % Bright Lavender Purple (lighter & less muted than #9467BD)
];
for i=1:3
    plot(cn2,Ecc(i,:),shape(i),'MarkerSize',ms,'LineWidth',1.5,'Color',colors_sim(i,:));
    hold on;
end 
load("Experimental.mat");
cn2=[7.19E-15 2E-13*0.6957/0.3267*[15 30 40 50].^2.0022];
for i=1:3
    errorbar(cn2,Ecc_exp(i,:),Ecc_exp_std(i,:),shape_exp(i),'MarkerSize',ms,'MarkerFaceColor',colors(i,:),'MarkerEdgeColor',colors(i,:),'LineWidth',1.5,'Color',colors(i,:));
    hold on;
end 
hold off;
legend('m=0 modified','m=1 modified','m=2 modified','m=0 exp','m=1 exp','m=2 exp','NumColumns',2,'Location','North');
xlabel('C_{n}^{2} (m^{-2/3})');
ylabel('Eccentricity');
axis([0 1.08E-9 0 1]);
set(gca,'FontSize',fs);
saveas(gca,'ecc_mod.pdf','pdf');
figure(2)
load('simulation_result_all_20251013_modified_exp_8pi_6mm_l0prop_5mm_1_screen.mat');
cn2=0.6957/0.3267*2E-13*(5:5:50).^2.0022;
cn2=[7.19E-15 cn2];
for i=1:3
    plot(cn2,Ell(i,:),shape(i),'MarkerSize',ms,'LineWidth',1.5,'Color',colors_sim(i,:));
    hold on;
end 
load("Experimental.mat");
cn2=[7.19E-15 2E-13*0.6957/0.3267*[15 30 40 50].^2.0022];
for i=1:3
    errorbar(cn2,Ell_exp(i,:),Ell_exp_std(i,:),shape_exp(i),'MarkerSize',ms,'MarkerFaceColor',colors(i,:),'MarkerEdgeColor',colors(i,:),'LineWidth',1.5,'Color',colors(i,:));
    hold on;
end 
hold off;
legend('m=0 modified','m=1 modified','m=2 modified','m=0 exp','m=1 exp','m=2 exp','NumColumns',2,'Location','South');
xlabel('C_{n}^{2} (m^{-2/3})');
ylabel('Ellipticity');
axis([0 1.08E-9 0.6 1]);
set(gca,'FontSize',fs);
saveas(gca,'ell_mod.pdf','pdf');