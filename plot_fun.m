function plot_fun( f_x, m, n, color, x_lim, y_lim, new_fig )
if new_fig
    figure('units','normalized','outerposition',[0 0 1 1])
else
    hold on
end
scatter(f_x(:, m), f_x(:, n), '.', 'MarkerEdgeColor', color)
xlim([0, x_lim]) % Hz
ylim([0, y_lim]) % Hz
xlabel(sprintf('F%d [Hz]', m))
ylabel(sprintf('F%d [Hz]', n))
grid on


