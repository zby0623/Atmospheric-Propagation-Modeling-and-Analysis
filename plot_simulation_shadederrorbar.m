close all;
filenames=["simulation_result_all_20251013_modified_exp_8pi_6mm_l0prop_5mm_1_screen",...
    "simulation_result_all_20251013_mvK_6mm_l0prop_5mm_1_screen",...
    "simulation_result_all_20251013_Tatarskii_6mm_l0prop_5mm_1_screen",...
    "simulation_result_all_20251013_Kolmogorov_6mm_l0prop_5mm_1_screen"];% load data matrices from simulations
color = [
    0.00 0.80 0.50;   % Mint Green (bright & fresh, very different from #2CA02C)
    0.30 0.70 1.00;   % Sky Blue  (lighter & brighter than #1F77B4)
    0.70 0.45 1.00    % Bright Lavender Purple (lighter & less muted than #9467BD)
];
str=["mod","mvK","Tar","Kol"];
fs=18;
for i=1:4
    load(filenames(i));
    f1=figure(2*(i-1)+1);
    firstax = axes (f1, 'FontSize', fs);
    p1=gobjects(1,3);
    p2=gobjects(1,3);
    for j=1:3
        x=[cn2 fliplr(cn2)];
        y=[Ell(j,:)+Ellstd(j,:) fliplr(Ell(j,:)-Ellstd(j,:))];
        p1(j)=patch(x,y,color(j,:),'EdgeColor','none','Parent',firstax);
        alpha(0.15);
        hold on;
    end
    xlabel('C_{n}^{2} (m^{-2/3})');
    ylabel('Ellipticity');
    axis([0 max(cn2) 0.6 1]);
    l1=legend(p1,{'m=0','m=1','m=2'},'Location','Southwest');
    set(l1,'FontSize',fs);
    secondax = copyobj(firstax, gcf);
    %set(secondax,'Position',get(firstax,'Postion'));
    delete(get(secondax, 'Children'))
    for j=1:3
        p2(j)=plot(cn2,Ell(j,:),'-o','Color',color(j,:),'LineWidth',1.5,'Parent',secondax);
        hold on;
    end
    hold off;
    set(secondax, 'Color', 'none','Box', 'on','Visible','on');
    axis([0 max(cn2) 0.6 1]);
    l2=legend (secondax,p2, {'m=0', 'm=1', 'm=2'}, 'Location', 'Southwest');
    set(l2.BoxFace, 'ColorType','truecoloralpha', 'ColorData',uint8(255*[.5;.5;.5;0]));
    set(l2,'FontSize',fs);
    saveas(gca,str(i)+"_ell.pdf");
    f2=figure(2*(i-1)+2);
    firstax = axes (f2, 'FontSize', fs);
    p1=gobjects(1,3);
    p2=gobjects(1,3);
    for j=1:3
        x=[cn2 fliplr(cn2)];
        y=[Ecc(j,:)+Eccstd(j,:) fliplr(Ecc(j,:)-Eccstd(j,:))];
        p1(j)=patch(x,y,color(j,:),'EdgeColor','none','Parent',firstax);
        alpha(0.15);
        hold on;
    end
    xlabel('C_{n}^{2} (m^{-2/3})');
    ylabel('Eccentricity');
    axis([0 max(cn2) 0 1]);
    l1=legend(p1,{'m=0','m=1','m=2'},'Location','Northwest');
    set(l1,'FontSize',fs);
    secondax = copyobj(firstax, gcf);
    %set(secondax,'Position',get(firstax,'Postion'));
    delete(get(secondax, 'Children'))
    for j=1:3
        p2(j)=plot(cn2,Ecc(j,:),'-o','Color',color(j,:),'LineWidth',1.5,'Parent',secondax);
        hold on;
    end
    hold off;
    set(secondax, 'Color', 'none','Box', 'on','Visible','on');
    axis([0 max(cn2) 0 1]);
    l2=legend (secondax,p2, {'m=0', 'm=1', 'm=2'}, 'Location', 'Northwest');
    set(l2.BoxFace, 'ColorType','truecoloralpha', 'ColorData',uint8(255*[.5;.5;.5;0]));
    set(l2,'FontSize',fs);
    saveas(gca,str(i)+"_ecc.pdf");
end
