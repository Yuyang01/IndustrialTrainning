function example= SetExample()

% tolerance for the solution
example.tol=1e-7;

% effective viscosity of actin flow
example.nu0=1e3;

%myosin contraction coefficient
example.eta_m0=100;

%F-actin protrusion coefficient
example.eta_a0=560;

%characteristic gripping stress
example.F_grip0=10;

%gripping coefficient
example.k_grip0=2.5;

% slipping coefficient

example.k_slip0=0.25;

%base friction coefficient
example.xi=50;

%slipping to gripping rate
example.r_on=0.005;

%gripping to slipping 
example.r_off=0.002;

%death rate of slipping site
example.r_die=0.2;

%base polymerization rate
%example.ka=0.01;
example.ka=0.067;
%F-actin polymerization rate
%example.kb=10;
example.kb=1;

%positive feedback threshold
example.Ka=1;

%F-actin depolymerization rate 
%example.kc=10;
example.kc=1;

%actin netwrok diffusion coefficient
%example.Da=0.8;

example.Da=0.1;
example.Db=10;


%max myosin diffusion coefficient
example.Dm0=2;

%myosin diffusion threshold
example.KD=2;

%tension coefficient
example.gamma=20;

%bending coefficient
example.kappa=20;

%total amount of actin
example.rhoa_tot=800;

% initial density of myosin 0.2-0.4
example.rhom0=0.3;

%number of adhesion sites
example.Nadh=1000;

%width of phase field
example.eps=2;

%Lagrange multiplier
example.lagrange=0.4;

%myosin detachment rate
example.k1=0.01;
%myosin attachment rate
example.k0=0.02;

end

