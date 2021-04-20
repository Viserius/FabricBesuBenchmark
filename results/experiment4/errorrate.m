cd 'C:\Users\soelm\Desktop\Repositories\FabricBesuBenchmark\results\experiment4'
clear;
close all;
fabColor = '#F1564A';
besuColor = '#1FA2A1';

xAxis = categorical(["80tps" "160tps" "240tps" "320tps"]);
xAxis = reordercats(xAxis, string(xAxis));
fab3org = [0, 0, 0, 0];
fab4org = [0, 0, 0, 0.21];
fab5org = [0, 0, 5.16, 22.25];

besu3org = [26.22, 63.33, 76.47, 81.66];
besu4org = [0, 26.15, 52.15, 63.37];
besu5org = [0, 0, 1.05, 25.85];

figure
grid on
set(gca, 'ycolor', 'k')
b = bar(xAxis, [fab3org; fab4org; fab5org; besu3org; besu4org; besu5org], 'FaceColor', 'flat');

b(1).CData = [241/255 86/255 74/255];
b(2).CData = [209/255 73/255 63/255];
b(3).CData = [140/255 49/255 42/255];

b(4).CData = [31/255 162/255 161/255];
b(5).CData = [26/255 135/255 134/255];
b(6).CData = [20/255 99/255 99/255];

title('Error Rate for varying network sizes')
xlabel('Network Load (TPS)')
ylabel('Error Rate (%)')

legend('Fabric, 3-peer network', 'Fabric, 4-peer network', 'Fabric, 5-peer network', ...
    'Besu, 3-peer network', 'Besu, 4-peer network', 'Besu, 5-peer network', ...
    'Location', 'Northwest')

saveas(gcf,'errorrate.png')