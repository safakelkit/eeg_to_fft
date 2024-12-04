data = readtable('EEG_data.csv');

channel_data = data.Var1;

Fs = 516; % Örnekleme frekansı (Hz)
L = length(channel_data);

t = (0:L-1) / Fs; % Zaman vektörü

Y = fft(channel_data); % Fourier dönüşümü
P2 = abs(Y/L);         % İki taraflı genlik spektrumu
P1 = P2(1:L/2+1);      % Tek taraflı spektrum (pozitif frekanslar)
P1(2:end-1) = 2*P1(2:end-1); % Tek taraflı spektrum için düzenleme

f = Fs*(0:(L/2))/L; % Frekans vektörü

figure;

% 1. Alt grafik: Genlik-Zaman Grafiği
subplot(1, 2, 1); % 1 satır, 2 sütun, 1. grafik
plot(t, channel_data);
title('Genlik-Zaman Grafiği');
xlabel('Zaman (s)');
ylabel('Genlik');
grid on;

% 2. Alt grafik: Genlik-Frekans Grafiği
subplot(1, 2, 2); % 1 satır, 2 sütun, 2. grafik
plot(f, P1);
title('Genlik-Frekans Grafiği');
xlabel('Frekans (Hz)');
ylabel('Genlik');

set(gca, 'XScale', 'log');
xlim([1, Fs/2]); % Frekans aralığını sınırla (1 Hz ile Nyquist frekansı arası)

grid on;
