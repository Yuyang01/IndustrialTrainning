function a = aCoefficient(example)


kc=num2str(example.kc);
ka=num2str(example.ka);
k1=num2str(example.k1);
k0=num2str(example.k0);
xi=num2str(example.xi);
Ka=num2str(example.Ka);

aux='ka+((u(1).^2)./(Ka^2+u(1).^2))';
aux=strrep(aux,'ka',ka);
aux=strrep(aux,'Ka',Ka);

a=char(kc,aux,k1,k0,xi,xi);



end

