% Function 1
n = -10:1:10;
a = 0.8;
x1 = a.^n;

w = 2*pi * (0:(1024-1)) / 1024;
w_prime = unwrap(fftshift(w) - 2*pi);

% x(n-k) where k=2 -> shift right 2 units
k = 2;

% zero pad 2 units
n_prime = -10:1:(10+k);
x1_prime = [zeros(1,k) x1];

x_rhs = dtft(x1_prime, 1024);
x_lhs = exp(-(1j)*w_prime*k) .* dtft(x1, 1024);

% Plot
figure
subplot(2,1,1);
plot(w_prime, abs(fftshift(x_rhs)));
title('frequency vs magnitude for x(n-k)');
xlabel('frequency f');
ylabel('magnitude');

subplot(2,1,2);
plot(w_prime, abs(fftshift(x_lhs)));
title('frequency vs magnitude for e^jwk X(w)');
xlabel('frequency f');
ylabel('magnitude');
