cd 'C:\Users\soelm\Desktop\Repositories\FabricBesuBenchmark\results\experiment1'
clear;
close all;
fabColor = '#F1564A';
besuColor = '#1FA2A1';

xAxisFab = [10, 20, 40, 80, 160, 240, 320, 400, 480, 557.7, 639.6, 678.7, 699.5];
xAxisBesu = [10, 20, 40, 80, 158.5, 238.2, 318.3, 399, 474.5, 555.7, 639.4, 672.2, 718.9, 794.9, 880.6, 982.5, 1006.5];
yAxisTPSFab = [10, 20, 40, 80, 159.9, 239.9, 319.3, 399.0 478.0, 555.9, 635.3, 671.7, 675.4];
yAxisTPSBesu = [10.0, 20.0, 40, 80, 122.9, 162.8, 195.2, 222.3, 235.7, 241.1, 251, 256.4, 259.9, 268.4, 278.6, 288.5, 296.5];

yAxisErrorFab = [0, 0, 0, 0, 0, 0, 0.21, 4.36, 11.72, 17.49, 28.69, 47.59, 86.07];
yAxisErrorBesu = [0, 0, 0, 0, 26.15, 52.15, 63.37, 71.02, 76.59, 80.99, 82.77, 84.81, 85.30, 87.04, 89.39, 90.57, 90.95];

figure
grid on
yyaxis left;
set(gca, 'ycolor', 'k')
plot(xAxisFab, yAxisTPSFab, 's-', 'Color', fabColor, 'LineWidth', 2)
hold on
plot(xAxisBesu, yAxisTPSBesu, 's-', 'Color', besuColor, 'LineWidth', 2)
title('Baseline Throughput and Error rate')
xlabel('Network Load (TPS)')
ylabel('Throughput (TPS)')

yyaxis right;
set(gca, 'ycolor', 'k')
plot(xAxisFab, yAxisErrorFab, 'o--', 'Color', fabColor, 'LineWidth', 1)
hold on
plot(xAxisBesu, yAxisErrorBesu, 'o--', 'Color', besuColor, 'LineWidth', 1)
%bar(xAxis, transpose([yAxisErrorBesu; yAxisErrorFab]), 5)
ylabel('Error Rate (%)')

legend('Throughput of Fabric', 'Throughput of Besu', 'Error Rate of Fabric', ...
    'Error Rate Besu', 'Location', 'Northwest')

saveas(gcf,'throughput-error.png')