clear all; close all;
clc;

load DataExp7_N1000.mat;

OMP_mean = mean(err_relative{1},2);
OMP_std = std(err_relative{1},0,2);
BP_mean = mean(err_relative{2},2);
BP_std = std(err_relative{2},0,2);
AMP_mean = mean(err_relative{3},2);
AMP_std = std(err_relative{3},0,2);
MPGAMP_mean = mean(err_relative{4},2);
MPGAMP_std = std(err_relative{4},0,2);

fig_mse = figure;
h_OMP = plot(Alpha,OMP_mean,'k-+','LineWidth',1);
hold on;
h_BP = plot(Alpha,BP_mean,'g-s','LineWidth',1);
hold on;
h_AMP = plot(Alpha,AMP_mean,'b-x','LineWidth',1);
hold on;
h_MPGAMP = plot(Alpha,MPGAMP_mean,'r-^','LineWidth',1);

xlabel('\alpha','FontSize',12); ylabel('Average Relative Error','FontSize',12);
box on; grid on;
axis([0.19,1.01,-0.1,1.9]);

h_lgd = legend([h_OMP, h_BP, h_AMP, h_MPGAMP],...
                'OMP','BP','AMP','MPGAMP','Location','NorthEast');
set(h_lgd, 'FontSize', 12);
set(h_lgd, 'FontName','Arial');
%set(h_lgd, 'Units', 'centimeters');
%pos = get(h_lgd, 'position');
%set(h_lgd, 'position', pos+[0,0,5,5])

set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperPosition', [0 0 500 250]);

fig_name = ['FigExp7'];
print(fig_mse, '-depsc', fig_name)
