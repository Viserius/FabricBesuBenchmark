cd 'C:\Users\soelm\Desktop\Repositories\FabricBesuBenchmark\results\experiment1'
clear;
close all;
fabColor = '#F1564A';
besuColor = '#1FA2A1';

xAxisFab = [10, 20, 40, 80, 160, 240, 320, 400, 480, 557.7, 639.6, 678.7, 699.5];
xAxisBesu = [10, 20, 40, 80, 158.5, 238.2, 318.3, 399, 474.5, 555.7, 639.4, 672.2, 718.9, 794.9, 880.6, 982.5, 1006.5];
yAxisInFab = [386, 377.6666667, 373, 370, 363, 361.6666667, 355.6666667, 352, 349.6666667, 345.3333333, 344, 337, 335];
yAxisInBesu = [57.4, 59.06666667, 53.16666667, 51, 110.7, 156.2333333, 180.6666667, 196.3, 212.4, 217.5666667, 226.5333333, 230.1666667, 232.2666667, 238.3333333, 238, 245.4666667, 246.1666667];

yAxisOutFab = [217, 211, 200, 189.6666667, 188, 186, 185, 181, 178.3333333, 173, 170.6666667, 163.6666667, 161];
yAxisOutBesu = [119.0666667, 142.7, 183.4666667, 272.3666667, 3913.766667, 7044.733333, 8143.2, 8376.033333, 7941.966667, 7007.9, 6740.8, 6274.166667, 6073.8, 5740.433333, 5073.116667, 4839.646667, 4739.533333];

figure
set(gca, 'ycolor', 'k')
plot(xAxisFab, yAxisInFab, 's-', 'Color', fabColor, 'LineWidth', 2)
hold on
plot(xAxisBesu, yAxisInBesu, 's-', 'Color', besuColor, 'LineWidth', 2)
title('Baseline Network Traffic')
xlabel('Network Load (TPS)')
ylabel('Network Traffic (MB)')
set(gca, 'YScale', 'log')
grid on

set(gca, 'ycolor', 'k')
plot(xAxisFab, yAxisOutFab, 'o--', 'Color', fabColor, 'LineWidth', 1)
hold on
plot(xAxisBesu, yAxisOutBesu, 'o--', 'Color', besuColor, 'LineWidth', 1)

legend('Traffic In of Fabric', 'Traffic In of Besu', 'Traffic Out of Fabric', ...
    'Traffic Out of Besu', 'Location', 'Northwest')

saveas(gcf,'network.png')