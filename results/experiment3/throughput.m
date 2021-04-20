cd 'C:\Users\soelm\Desktop\Repositories\FabricBesuBenchmark\results\experiment3'
clear;
close all;
fabColor = '#F1564A';
besuColor = '#1FA2A1';

xAxis = categorical(["80tps" "160tps" "240tps" "320tps"]);
xAxis = reordercats(xAxis, string(xAxis));
fabhalfbl = [80, 159.9, 239.8, 319.6];
fab1bl = [80.0, 159, 239.9, 318.6];
fab2bl = [80, 159.9, 239.6, 318.6];
fab4bl = [80, 159.9, 239.6, 319.1];

besuhalfbl = [70.3, 121.3, 162.1, 194.8];
besu1bl = [80, 122.9, 162.8, 195.2];
besu2bl = [80, 159.9, 162.8, 195.2];
besu4bl = [80, 159.9, 239.6, 317.5];


figure
grid on
set(gca, 'ycolor', 'k')
b = bar(xAxis, [fabhalfbl; fab1bl; fab2bl; fab4bl; besuhalfbl; besu1bl; besu2bl; besu4bl], 'FaceColor', 'flat');

b(1).CData = [241/255 86/255 74/255];
b(2).CData = [209/255 73/255 63/255];
b(3).CData = [179/255 63/255 54/255];
b(4).CData = [140/255 49/255 42/255];

b(5).CData = [31/255 162/255 161/255];
b(6).CData = [26/255 135/255 134/255];
b(7).CData = [20/255 99/255 99/255];
b(8).CData = [14/255 71/255 71/255];

title('Throughput for varying block limits')
xlabel('Network Load (TPS)')
ylabel('Throughput (TPS)')

legend('Fabric, 0.5xDEF block limit', 'Fabric, 1xDEF block limit', 'Fabric, 2xDEF block limit', 'Fabric, 4xDEF block limit', ...
    'Besu, 0.5xDEF block limit', 'Besu, 1xDEF block limit', 'Besu, 2xDEF block limit', 'Besu, 4xDEF block limit', ...
    'Location', 'Northwest')

saveas(gcf,'throughput.png')