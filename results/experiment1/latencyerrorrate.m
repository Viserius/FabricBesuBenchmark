cd 'C:\Users\soelm\Desktop\Repositories\FabricBesuBenchmark\results\experiment1'
clear;
close all;
fabColor = '#F1564A';
besuColor = '#1FA2A1';

xAxisFab = [10, 20, 40, 80, 160, 240, 320, 400, 480, 557.7, 639.6, 678.7, 699.5];
xAxisBesu = [10, 20, 40, 80, 158.5, 238.2, 318.3, 399, 474.5, 555.7, 639.4, 672.2, 718.9, 794.9, 880.6, 982.5, 1006.5];
yAxisLatencyFab = [1.08, 1.06, 1.08, 1.11, 1.20, 1.03, 0.82, 0.83, 0.78, 0.75, 0.76, 1.15, 4.96];
yAxisLatencyBesu = [0.95, 1.08, 1.07, 1.12, 1.77, 1.82, 2.33, 2.45, 3.41, 4.86, 7.32, 6.10, 7.24, 6.74, 5.85, 7.39, 7.50];

yAxisErrorFab = [0, 0, 0, 0, 0, 0, 0.21, 4.36, 11.72, 17.49, 28.69, 47.59, 86.07];
yAxisErrorBesu = [0, 0, 0, 0, 26.15, 52.15, 63.37, 71.02, 76.59, 80.99, 82.77, 84.81, 85.30, 87.04, 89.39, 90.57, 90.95];

figure
grid on
yyaxis left;
set(gca, 'ycolor', 'k')
plot(xAxisFab, yAxisLatencyFab, 's-', 'Color', fabColor, 'LineWidth', 2)
hold on
plot(xAxisBesu, yAxisLatencyBesu, 's-', 'Color', besuColor, 'LineWidth', 2)
title('Baseline Latency and Error Rate')
xlabel('Network Load (TPS)')
ylabel('Average Latency (s)')

yyaxis right;
set(gca, 'ycolor', 'k')
plot(xAxisFab, yAxisErrorFab, 'o--', 'Color', fabColor, 'LineWidth', 1)
hold on
plot(xAxisBesu, yAxisErrorBesu, 'o--', 'Color', besuColor, 'LineWidth', 1)
ylabel('Error Rate (%)')

legend('Average Latency of Fabric', 'Average Latency of Besu', ...
    'Error rate of Fabric', 'Error rate of Besu', ...
    'Location', 'Northwest')

saveas(gcf,'latency-error.png')