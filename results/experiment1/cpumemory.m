cd 'C:\Users\soelm\Desktop\Repositories\FabricBesuBenchmark\results\experiment1'
clear;
close all;
fabColor = '#F1564A';
besuColor = '#1FA2A1';

xAxisFab = [10, 20, 40, 80, 160, 240, 320, 400, 480, 557.7, 639.6, 678.7, 699.5];
xAxisBesu = [10, 20, 40, 80, 158.5, 238.2, 318.3, 399, 474.5, 555.7, 639.4, 672.2, 718.9, 794.9, 880.6, 982.5, 1006.5];
yAxisCPUFab = [4.23, 7.113333333, 12.09333333, 24.36, 47.36666667, 65.01666667, 83.55333333, 114.5733333, 110.2733333, 116.53, 125.396667, 135.3266667, 144.7466667];
yAxisCPUBesu = [2.84, 4.526666667, 7.583333333, 13.23333333, 30.85333333, 35.93666667, 49.74, 61.90666667, 60.59, 65.79333333, 69.11666667, 66.67333333, 63.18333333, 70.12, 72.34333333, 67.66333333, 75.86];

yAxisMemoryFab = [292.6666667, 298.6666667, 309.6666667, 343, 408.6666667, 412.3333333, 445.3333333, 453.3333333, 443, 468.3333333, 475.6666667, 501, 520];
yAxisMemoryBesu = [1150, 1150, 1083.333333, 1083, 1314.333333, 1345, 1508.333333, 1806.333333, 2032.333333, 2650, 2447.333333, 2200, 2456.666667, 2613.333333, 2236.666667, 2356.666667, 2310];

figure
grid on
yyaxis left;
set(gca, 'ycolor', 'k')
plot(xAxisFab, yAxisCPUFab, 's-', 'Color', fabColor, 'LineWidth', 2)
hold on
plot(xAxisBesu, yAxisCPUBesu, 's-', 'Color', besuColor, 'LineWidth', 2)
title('Baseline CPU and Memory Usage')
xlabel('Network Load (TPS)')
ylabel('CPU Usage (%)')

yyaxis right;
set(gca, 'ycolor', 'k')
plot(xAxisFab, yAxisMemoryFab, 'o--', 'Color', fabColor, 'LineWidth', 1)
hold on
plot(xAxisBesu, yAxisMemoryBesu, 'o--', 'Color', besuColor, 'LineWidth', 1)
ylabel('Memory Usage (MB)')

legend('CPU usage of Fabric', 'CPU usage of Besu', ...
    'Memory usage of Fabric', 'Memory usage of Besu', ...
    'Location', 'Northwest')

saveas(gcf,'cpu-memory.png')