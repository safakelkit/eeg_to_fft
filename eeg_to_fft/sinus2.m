% Parametreler
Fs = 1000;    % Örnekleme frekansı (Hz)
T = 1;        % Toplam sinyal süresi (saniye)
t = 0:1/Fs:T; % Zaman vektörü

% Sinüs sinyalleri
F1 = 60;                    % 1. sinyalin frekansı (Hz)
F2 = 100;                   % 2. sinyalin frekansı (Hz)
y1 = sin(2 * pi * F1 * t);  % 60 Hz sinüs sinyali
y2 = sin(2 * pi * F2 * t);  % 100 Hz sinüs sinyali

% Sinyalleri toplama
y_combined = y1 + y2;

% FFT işlemi
N = length(y_combined);             % Sinyal uzunluğu
Y = fft(y_combined);                % FFT hesaplama
f = (0:N-1)*(Fs/N);                 % Frekans ekseni
amplitude = abs(Y)/N;               % Genlik spektrumu

% Grafikleri çiz
figure;

% Orijinal sinyal grafiği
subplot(3, 1, 1);
plot(t, y1, 'b', 'LineWidth', 1.5);
grid on;
title('60 Hz Sinüs Sinyali');
xlabel('Zaman (s)');
ylabel('Genlik');

subplot(3, 1, 2);
plot(t, y2, 'g', 'LineWidth', 1.5);
grid on;
title('100 Hz Sinüs Sinyali');
xlabel('Zaman (s)');
ylabel('Genlik');

subplot(3, 1, 3);
plot(t, y_combined, 'r', 'LineWidth', 1.5);
grid on;
title('Toplanmış Sinyal (60 Hz + 100 Hz)');
xlabel('Zaman (s)');
ylabel('Genlik');

% Frekans spektrumu grafiği
figure;
stem(f(1:N/2), amplitude(1:N/2), 'r', 'LineWidth', 1.5); % Pozitif frekanslar
grid on;
title('Frekans Spektrumu (FFT Sonucu)');
xlabel('Frekans (Hz)');
ylabel('Genlik');
xlim([0 200]); % Frekans eksenini sınırlıyoruz (daha net görünüm için)
