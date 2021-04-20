cd 'C:\Users\soelm\Desktop\Repositories\FabricBesuBenchmark\results\experiment4'
clear;
close all;
fabColor = '#F1564A';
besuColor = '#1FA2A1';

xAxis = categorical(["80tps" "160tps" "240tps" "320tps"]);
xAxis = reordercats(xAxis, string(xAxis));
fab3org = [80, 159.9, 239.9, 319.3];
fab4org = [80, 159.8, 239.7, 318.9];
fab5org = [80, 159.7, 238.5, 318.5];

besu3org = [80, 122.9, 162.8, 195.2];
besu4org = [80, 123.1, 162.8, 195.2];
besu5org = [80, 123, 162.9, 195.2];


figure
grid on
set(gca, 'ycolor', 'k')
b = bar(xAxis, [fab3org; fab4org; fab5org; besu3org; besu4org; besu5org], 'FaceColor', 'flat');

b(1).CData = [241/255 86/255 74/255];
b(2).CData = [209/255 73/255 63/255];
b(3).CData = [179/255 63/255 54/255];
%b(4).CData = [140/255 49/255 42/255];

b(4).CData = [31/255 162/255 161/255];
b(5).CData = [26/255 135/255 134/255];
b(6).CData = [20/255 99/255 99/255];
%b(8).CData = [14/255 71/255 71/255];

title('Throughput for varying network sizes')
xlabel('Network Load (TPS)')
ylabel('Throughput (TPS)')

legend('Fabric, 3-peer network', 'Fabric, 4-peer network', 'Fabric, 5-peer network', ...
    'Besu, 3-peer network', 'Besu, 4-peer network', 'Besu, 5-peer network', ...
    'Location', 'Northwest')

saveas(gcf,'throughput.png')