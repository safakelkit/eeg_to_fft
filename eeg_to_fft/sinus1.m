% Parametreler
F = 60;       % Sinyal frekansı (Hz)
Fs = 1000;    % Örnekleme frekansı (Hz) (Fs > 2*F olmalı, Nyquist kuralı)
T = 1;        % Toplam sinyal süresi (saniye)

% Zaman vektörü
t = 0:1/Fs:T; % Örnekleme periyodu ile zaman vektörü

% Sinüs sinyalini oluştur
y = sin(2 * pi * F * t);

% FFT işlemi
N = length(y);             % Sinyal uzunluğu
Y = fft(y);                % FFT hesaplama
f = (0:N-1)*(Fs/N);        % Frekans ekseni
amplitude = abs(Y)/N;      % Genlik spektrumu

% Sinyali ve FFT'yi çiz
figure;

% Orijinal sinyal
subplot(2, 1, 1); % 2 satır, 1. grafik
plot(t, y, 'b', 'LineWidth', 1.5);
grid on;
title('Orijinal Sinüs Sinyali (F = 60 Hz)');
xlabel('Zaman (s)');
ylabel('Genlik');

% Frekans spektrumu
subplot(2, 1, 2); % 2. grafik
stem(f(1:N/2), amplitude(1:N/2), 'r', 'LineWidth', 1.5); % Pozitif frekanslar
grid on;
title('Frekans Spektrumu (FFT Sonucu)');
xlabel('Frekans (Hz)');
ylabel('Genlik');
xlim([0 200]); % Frekans eksenini sınırlıyoruz (daha net görünüm için)
