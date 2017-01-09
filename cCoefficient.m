function c = cCoefficient( example )





Da=num2str(example.Da);
Db=num2str(example.Db);

Dm0=num2str(example.Dm0);
KD=num2str(example.KD);
nu0=num2str(example.nu0);
zer='0';

c11=char(Da,zer,Da);
c22=char(Db,zer,Db);
c33=char(zer,zer,zer);

a4='Dm0./(1+u(1)./KD)';
a4=strrep(a4,'Dm0',Dm0);
a4=strrep(a4,'KD',KD);
c44=char(a4,zer,a4);

a5='2*nu0';
a5=strrep(a5,'nu0',nu0);
a6='nu0';
a6=strrep(a6,'nu0',nu0);

c55=char(a5,zer,a5);
c56=char(zer,a6,zer,zer);
c66=char(a6,zer,a5);

space=char(zer, zer, zer, zer);

c=char(c11,space,c22,space,space,c33,space,space,space,c44,...
    space,space,space,space,c55,space,space,space,space,c56,c66);

end

