cd 'C:\Users\soelm\Desktop\Repositories\FabricBesuBenchmark\results\experiment2'
clear;
close all;
fabColor = '#F1564A';
besuColor = '#1FA2A1';

xAxis = categorical(["80tps" "160tps" "240tps" "320tps"]);
xAxis = reordercats(xAxis, string(xAxis));
fab1bt = [0, 0, 0, 0];
fab2bt = [0, 0, 0, 0.21];
fab4bt = [0, 0, 0, 0.33];
fab8bt = [0, 0, 0, 1.44];

besu1bt = [0, 0, 0, 26.1];
besu2bt = [0, 26.15, 52.15, 63.37];
besu4bt = [26.18, 63.37, 76.47, 84.4];
besu8bt = [63.35, 82.21, 88.39, 92.20];

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

title('Error Rate for varying block times')
xlabel('Network Load (TPS)')
ylabel('Error Rate (%)')

legend('Fabric, block time of 1s', 'Fabric, block time of 2s', 'Fabric, block time of 4s', 'Fabric, block time of 8s', ...
    'Besu, block time of 1s', 'Besu, block time of 2s', 'Besu, block time of 4s', 'Besu, block time of 8s', ...
    'Location', 'Northwest')

saveas(gcf,'errorrate.png')