function squeezed(r,phi,s,num)

omega = 1;
xmax = s;
if (s == 0)
	xmax = 1;
endif
x = linspace(-8*xmax,8*xmax, 1000);

for j = 0:num
	t = (j/10)*(2*pi)/omega;
	sigma_square = (cosh(2*r) - sinh(2*r) * cos(2*omega*t - phi))/2;
	mu = sqrt(2) * s * (cosh(r)*cos(omega * t) - sinh(r)*sin(omega*t - phi));
	y = (1/sqrt(2*pi*sigma_square)) * exp(-((x-mu).^2)/(2*sigma_square));
	h = figure;
	maxyaxis = cosh(2*r);
	plot(x,y,"linewidth",1)
	axis([-8*xmax,8*xmax, 0, maxyaxis]);
	ylabel ("Probability density","fontsize",24);
    xlabel ("x/x_0","Interpreter", "none","fontsize",24);
    title(sprintf("time = (%1.4g T), r = %1.4g, phi = %1.4g",j/num, r , phi),"fontsize",24);
    grid on;
	saveas(h, num2str(j), 'jpg');
 end
