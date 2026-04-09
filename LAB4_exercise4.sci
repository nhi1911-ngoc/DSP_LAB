// Tạo tín hiệu sin
Fs = 1000;                 // Tần số lấy mẫu
t = 0:1/Fs:1;              // 1 giây
x = sin(2*%pi*440*t);      // Sóng sin 440Hz (âm La)
// Phát âm thanh
sound(x, Fs);
// Ghi file WAV
wavwrite(x, Fs, "test.wav");
// Đọc lại file
[y, Fs2] = wavread("test.wav");
// Phát lại
sound(y, Fs2);
// Đọc file WAV bằng loadwave
[y, Fs] = loadwave("test.wav");
playsnd(y, Fs);
// Ghi file AU
auwrite(x, Fs, "test.au");
// Đọc file AU
[y, Fs2] = auread("test.au");
// Phát lại
sound(y, Fs2);
t = (0:length(x)-1)/Fs;
plot(t, x);
xlabel("Thời gian (s)");h
ylabel("Biên độ");
title("Tín hiệu âm thanh");

