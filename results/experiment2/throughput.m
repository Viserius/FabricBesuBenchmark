cd 'C:\Users\soelm\Desktop\Repositories\FabricBesuBenchmark\results\experiment2'
clear;
close all;
fabColor = '#F1564A';
besuColor = '#1FA2A1';

xAxis = categorical(["80tps" "160tps" "240tps" "320tps"]);
xAxis = reordercats(xAxis, string(xAxis));
fab1bt = [80, 159.9, 239.8, 319.5];
fab2bt = [80, 159.9, 239.9, 319.3];
fab4bt = [80, 159.9, 239.7, 319.3];
fab8bt = [80, 159.9, 239.7, 319.3];

besu1bt = [80, 159.9, 237.7, 245.6];
besu2bt = [80, 122.9, 162.8, 195.2];
besu4bt = [61.8, 97.4, 122.3, 147.2];
besu8bt = [48.7, 69.8, 82, 92.2];


figure
grid on
set(gca, 'ycolor', 'k')
b = bar(xAxis, [fab1bt; fab2bt; fab4bt; fab8bt; besu1bt; besu2bt; besu4bt; besu8bt], 'FaceColor', 'flat');

b(1).CData = [241/255 86/255 74/255];
b(2).CData = [209/255 73/255 63/255];
b(3).CData = [179/255 63/255 54/255];
b(4).CData = [140/255 49/255 42/255];

b(5).CData = [31/255 162/255 161/255];
b(6).CData = [26/255 135/255 134/255];
b(7).CData = [20/255 99/255 99/255];
b(8).CData = [14/255 71/255 71/255];

title('Throughput for varying block times')
xlabel('Network Load (TPS)')
ylabel('Throughput (TPS)')

legend('Fabric, block time of 1s', 'Fabric, block time of 2s', 'Fabric, block time of 4s', 'Fabric, block time of 8s', ...
    'Besu, block time of 1s', 'Besu, block time of 2s', 'Besu, block time of 4s', 'Besu, block time of 8s', ...
    'Location', 'Northwest')

saveas(gcf,'throughput.png')