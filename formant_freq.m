load('/File directory')

f_a = zeros(size(a, 1), 3); 
f_e = zeros(size(e, 1), 3); 
f_i = zeros(size(i, 1), 3); 
f_o = zeros(size(o, 1), 3); 
f_u = zeros(size(u, 1), 3); 
f_y = zeros(size(aa, 1), 3);

for k = 1:size(f_a, 1)
    rts = roots(a(k, :));
    rts = rts(imag(rts)>0);
    angz = atan2(imag(rts),real(rts));
    [frqs, indices] = sort(angz.*(Fs/(2*pi)));
    f_a(k, :) = frqs(1:3);
end
for k = 1:size(f_e, 1)
    rts = roots(e(k, :));
    rts = rts(imag(rts)>0);
    angz = atan2(imag(rts),real(rts));
    [frqs, indices] = sort(angz.*(Fs/(2*pi)));
    f_e(k, :) = frqs(1:3);
end
for k = 1:size(f_i, 1)
    rts = roots(i(k, :));
    rts = rts(imag(rts)>0);
    angz = atan2(imag(rts),real(rts));
    [frqs, indices] = sort(angz.*(Fs/(2*pi)));
    f_i(k, :) = frqs(1:3);
end
for k = 1:size(f_o, 1)
    rts = roots(o(k, :));
    rts = rts(imag(rts)>0);
    angz = atan2(imag(rts),real(rts));
    [frqs, indices] = sort(angz.*(Fs/(2*pi)));
    f_o(k, :) = frqs(1:3);
end
for k = 1:size(f_u, 1)
    rts = roots(u(k, :));
    rts = rts(imag(rts)>0);
    angz = atan2(imag(rts),real(rts));
    [frqs, indices] = sort(angz.*(Fs/(2*pi)));
    f_u(k, :) = frqs(1:3);
end
for k = 1:size(f_y, 1)
    rts = roots(y(k, :));
    rts = rts(imag(rts)>0);
    angz = atan2(imag(rts),real(rts));
    [frqs, indices] = sort(angz.*(Fs/(2*pi)));
    f_y(k, :) = frqs(1:3);
end

plot_fun(f_a, 'a', 1, 2, 'b', 800, 2600, true)
plot_fun(f_e, 'e', 1, 2, 'b', 800, 2600, true)
plot_fun(f_i, 'i', 1, 2, 'b', 800, 2600, true)
plot_fun(f_o, 'o', 1, 2, 'b', 800, 2600, true)
plot_fun(f_u, 'u', 1, 2, 'b', 800, 2600, true)
plot_fun(f_y, 'y', 1, 2, 'b', 800, 2600, true)

plot_fun(f_a, 'a', 1, 3, 'b', 800, 3000, true)
plot_fun(f_e, 'e', 1, 3, 'b', 800, 3000, true)
plot_fun(f_i, 'i', 1, 3, 'b', 800, 3000, true)
plot_fun(f_o, 'o', 1, 3, 'b', 800, 3000, true)
plot_fun(f_u, 'u', 1, 3, 'b', 800, 3000, true)
plot_fun(f_y, 'y', 1, 3, 'b', 800, 3000, true)

plot_fun(f_a, 'a', 2, 3, 'b', 2500, 3000, true)
plot_fun(f_e, 'e', 2, 3, 'b', 2500, 3000, true)
plot_fun(f_i, 'i', 2, 3, 'b', 2500, 3000, true)
plot_fun(f_o, 'o', 2, 3, 'b', 2500, 3000, true)
plot_fun(f_u, 'u', 2, 3, 'b', 2500, 3000, true)
plot_fun(f_y, 'y', 2, 3, 'b', 2500, 3000, true)











