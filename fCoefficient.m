function  f = fCoefficient( example )


kc=num2str(example.kc);
ka=num2str(example.ka);
k1=num2str(example.k1);
k0=num2str(example.k0);

Ka=num2str(example.Ka);
eta_m0=num2str(example.eta_m0);

f1='u(2).*(ka+((u(1).^2)./(Ka^2+u(1).^2)))-u(5).*ux(1)-u(6).*uy(1)-u(1).*(ux(5)+uy(6))';
f1=strrep(f1,'ka',ka);
f1=strrep(f1,'Ka',Ka);

f2='kc*u(1)-u(5).*ux(2)-u(6).*uy(2)-u(2).*(ux(5)+uy(6))';
f2=strrep(f2,'kc',kc);

f3='k0*u(4)--u(5).*ux(3)-u(6).*uy(3)-u(3).*(ux(5)+uy(6))';
f3=strrep(f3,'k0',k0);

f4='k1*u(3)';
f4=strrep(f4,'k1',k1);

f5='eta_m0*ux(1)';
f5=strrep(f5,'eta_m0',eta_m0);


f6= 'eta_m0*uy(1)';
f6=strrep(f6,'eta_m0',eta_m0);



f= char(f1,...
    f2,...
    f3,...
    f4,...
    f5,...
    f6);




end

