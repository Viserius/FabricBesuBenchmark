cd 'C:\Users\soelm\Desktop\Repositories\FabricBesuBenchmark\results\experiment3'
clear;
close all;
fabColor = '#F1564A';
besuColor = '#1FA2A1';

xAxis = categorical(["80tps" "160tps" "240tps" "320tps"]);
xAxis = reordercats(xAxis, string(xAxis));
fabhalfbl = [0, 0, 0, 0];
fab1bl = [0, 0, 0, 0.21];
fab4bt = [0, 0, 5.16, 22.25];
fab8bt = [0, 0, 5.25, 22.23];

besu1bt = [26.22, 63.33, 76.47, 81.66];
besu2bt = [0, 26.15, 52.15, 63.37];
besu4bt = [0, 0, 1.05, 25.85];
besu8bt = [0, 0, 0, 0];

figure
grid on
set(gca, 'ycolor', 'k')
b = bar(xAxis, [fabhalfbl; fab1bl; fab4bt; fab8bt; besu1bt; besu2bt; besu4bt; besu8bt], 'FaceColor', 'flat');

b(1).CData = [241/255 86/255 74/255];
b(2).CData = [209/255 73/255 63/255];
b(3).CData = [179/255 63/255 54/255];
b(4).CData = [140/255 49/255 42/255];

b(5).CData = [31/255 162/255 161/255];
b(6).CData = [26/255 135/255 134/255];
b(7).CData = [20/255 99/255 99/255];
b(8).CData = [14/255 71/255 71/255];

title('Error Rate for varying block limits')
xlabel('Network Load (TPS)')
ylabel('Error Rate (%)')

legend('Fabric, 0.5xDEF block limit', 'Fabric, 1xDEF block limit', 'Fabric, 2xDEF block limit', 'Fabric, 4xDEF block limit', ...
    'Besu, 0.5xDEF block limit', 'Besu, 1xDEF block limit', 'Besu, 2xDEF block limit', 'Besu, 4xDEF block limit', ...
    'Location', 'Northwest')

saveas(gcf,'errorrate.png')