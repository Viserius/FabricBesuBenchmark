cd 'C:\Users\soelm\Desktop\Repositories\FabricBesuBenchmark\results\experiment4'
clear;
close all;
fabColor = '#F1564A';
besuColor = '#1FA2A1';

xAxis = categorical(["80tps" "160tps" "240tps" "320tps"]);
xAxis = reordercats(xAxis, string(xAxis));
fab3org = [1.11, 1.20, 1.03, 0.82];
fab4org = [1.17, 1.34, 0.99, 0.96];
fab5org = [1.23, 1.42, 1.05, 1.18];

besu3org = [1.12, 1.77, 1.82, 2.33];
besu4org = [1.12, 1.73, 1.91, 2.43];
besu5org = [1.14, 1.96, 1.98, 2.47];

figure
grid on
set(gca, 'ycolor', 'k')
b = bar(xAxis, [fab3org; fab4org; fab5org; besu3org; besu4org; besu5org], 'FaceColor', 'flat');

b(1).CData = [241/255 86/255 74/255];
b(2).CData = [209/255 73/255 63/255];
b(3).CData = [179/255 63/255 54/255];

b(4).CData = [31/255 162/255 161/255];
b(5).CData = [26/255 135/255 134/255];
b(6).CData = [20/255 99/255 99/255];

title('Latency for varying network sizes')
xlabel('Network Load (TPS)')
ylabel('Latency (s)')

legend('Fabric, 3-peer network', 'Fabric, 4-peer network', 'Fabric, 5-peer network', ...
    'Besu, 3-peer network', 'Besu, 4-peer network', 'Besu, 5-peer network', ...
    'Location', 'Northwest')

saveas(gcf,'latency.png')