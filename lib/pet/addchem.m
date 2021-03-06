%% addchem
% sets chemical parameters and text for units and labels

%%
function [par, units, label, free] = addchem(par, units, label, free, phylum, class)
  % created by Starrlight Augustine, Dina Lika, Bas Kooijman, Goncalo Marques and Laure Pecquerie 2015/07/23
  % last modified 2015/07/29
  
  %% Syntax
  % [par, units, label, free] = <../addchem.m *addchem*>(par, units, label, free, phylum, class)
  
  %% Description
  % sets chemical parameters and text for units and labels
  %
  % Input
  %
  % * par: strucutre with parameters - each field is a scalar
  % * units: structure with units of each parameters - each field is a
  % string
  % * label: structure with the description of each parameter - each field is a
  % string
  % * free: structure with each field  being a 0 or 1 - this specifies
  % whether the parameter is to be freed to not during estimation
  % * phylum, character string used to get d_V
  % * class, character string used to get d_V
  %  
  % Output
  %
  % * par: strucutre with parameters - each field is a scalar
  % * units: structure with units of each parameters - each field is a
  % string
  % * label: structure with the description of each parameter - each field is a
  % string
  % * free: structure with each field  being a 0 or 1 - this specifies
  % whether the parameter is to be freed to not during estimation
  
  %% Remark
  % Calls get_d_V to set specific density of structure
  % For a specific density of wet mass of 1 g/cm^3,
  % a specific density of d_E = d_V = 0.1 g/cm^3 means a dry-over-wet weight ratio of 0.1
  
% specific densities
%   set specific densites using the pet's taxonomy
d_V = get_d_V(phylum, class); % see comments on section 3.2.1 of DEB3 
par.d_X = d_V;     free.d_X = 0;  units.d_X = 'g/cm^3'; label.d_X = 'specific density of food'; 
par.d_V = d_V;     free.d_V = 0;  units.d_V = 'g/cm^3'; label.d_V = 'specific density of structure'; 
par.d_E = d_V;     free.d_E = 0;  units.d_E = 'g/cm^3'; label.d_E = 'specific density of reserve'; 
par.d_P = d_V;     free.d_P = 0;  units.d_P = 'g/cm^3'; label.d_P = 'specific density of faeces';

% chemical potentials from Kooy2010 Tab 4.2
par.mu_X = 525000; free.mu_X = 0;  units.mu_X = 'J/ mol'; label.mu_X = 'chemical potential of food'; 
par.mu_V = 500000; free.mu_V = 0;  units.mu_V = 'J/ mol'; label.mu_V = 'chemical potential of structure'; 
par.mu_E = 550000; free.mu_E = 0;  units.mu_E = 'J/ mol'; label.mu_E = 'chemical potential of reserve'; 
par.mu_P = 480000; free.mu_P = 0;  units.mu_P = 'J/ mol'; label.mu_P = 'chemical potential of faeces'; 

% chemical potential of minerals
par.mu_C = 0;      free.mu_C = 0;  units.mu_C = 'J/ mol'; label.mu_C = 'chemical potential of CO2'; 
par.mu_H = 0;      free.mu_H = 0;  units.mu_H = 'J/ mol'; label.mu_H = 'chemical potential of H2O'; 
par.mu_O = 0;      free.mu_O = 0;  units.mu_O = 'J/ mol'; label.mu_O = 'chemical potential of O2'; 
par.mu_N = 0;      free.mu_N = 0;  units.mu_N = 'J/ mol'; label.mu_N = 'chemical potential of NH3'; 

% chemical indices for water-free organics from Kooy2010 Fig 4.15 (excluding contributions of H and O atoms from water)
par.n_CX = 1;      free.n_CX = 0;  units.n_CX = '-'; label.n_CX = 'chem. index of carbon in food'; % C/C = 1 by definition
par.n_HX = 1.8;    free.n_HX = 0;  units.n_HX = '-'; label.n_HX = 'chem. index of hydrogen in food';
par.n_OX = 0.5;    free.n_OX = 0;  units.n_OX = '-'; label.n_OX = 'chem. index of oxygen in food';
par.n_NX = 0.15;   free.n_NX = 0;  units.n_NX = '-'; label.n_NX = 'chem. index of nitrogen in food';
%
par.n_CV = 1;      free.n_CV = 0;  units.n_CV = '-'; label.n_CV = 'chem. index of carbon in structure'; % n_CV = 1 by definition
par.n_HV = 1.8;    free.n_HV = 0;  units.n_HV = '-'; label.n_HV = 'chem. index of hydrogen in structure';
par.n_OV = 0.5;    free.n_OV = 0;  units.n_OV = '-'; label.n_OV = 'chem. index of oxygen in structure';
par.n_NV = 0.15;   free.n_NV = 0;  units.n_NV = '-'; label.n_NV = 'chem. index of nitrogen in structure';
%
par.n_CE = 1;      free.n_CE = 0;  units.n_CE = '-'; label.n_CE = 'chem. index of carbon in reserve';   % n_CE = 1 by definition
par.n_HE = 1.8;    free.n_HE = 0;  units.n_HE = '-'; label.n_HE = 'chem. index of hydrogen in reserve';
par.n_OE = 0.5;    free.n_OE = 0;  units.n_OE = '-'; label.n_OE = 'chem. index of oxygen in reserve';
par.n_NE = 0.15;   free.n_NE = 0;  units.n_NE = '-'; label.n_NE = 'chem. index of nitrogen in reserve';
%
par.n_CP = 1;      free.n_CP = 0;  units.n_CP = '-'; label.n_CP = 'chem. index of carbon in faeces';    % n_CP = 1 by definition
par.n_HP = 1.8;    free.n_HP = 0;  units.n_HP = '-'; label.n_HP = 'chem. index of hydrogen in faeces';
par.n_OP = 0.5;    free.n_OP = 0;  units.n_OP = '-'; label.n_OP = 'chem. index of oxygen in faeces';
par.n_NP = 0.15;   free.n_NP = 0;  units.n_NP = '-'; label.n_NP = 'chem. index of nitrogen in faeces';  

% chemical indices for minerals from Kooy2010 
par.n_CC = 1;   free.n_CC = 0;  units.n_CC = '-'; label.n_CC = 'chem. index of carbon in CO2'; 
par.n_HC = 0;   free.n_HC = 0;  units.n_HC = '-'; label.n_HC = 'chem. index of hydrogen in CO2';
par.n_OC = 2;   free.n_OC = 0;  units.n_OC = '-'; label.n_OC = 'chem. index of oxygen in CO2';
par.n_NC = 0;   free.n_NC = 0;  units.n_NC = '-'; label.n_NC = 'chem. index of nitrogen in CO2';
%
par.n_CH = 0;   free.n_CH = 0;  units.n_CH = '-'; label.n_CH = 'chem. index of carbon in H2O'; 
par.n_HH = 2;   free.n_HH = 0;  units.n_HH = '-'; label.n_HH = 'chem. index of hydrogen in H2O';
par.n_OH = 1;   free.n_OH = 0;  units.n_OH = '-'; label.n_OH = 'chem. index of oxygen in H2O';
par.n_NH = 0;   free.n_NH = 0;  units.n_NH = '-'; label.n_NH = 'chem. index of nitrogen in H2O';
% 
par.n_CO = 0;   free.n_CO = 0;  units.n_CO = '-'; label.n_CO = 'chem. index of carbon in O2';   
par.n_HO = 0;   free.n_HO = 0;  units.n_HO = '-'; label.n_HO = 'chem. index of hydrogen in O2';
par.n_OO = 2;   free.n_OO = 0;  units.n_OO = '-'; label.n_OO = 'chem. index of oxygen in O2';
par.n_NO = 0;   free.n_NO = 0;  units.n_NO = '-'; label.n_NO = 'chem. index of nitrogen in O2';
% 
par.n_CN = 0;   free.n_CN = 0;  units.n_CN = '-'; label.n_CN = 'chem. index of carbon in NH3';    
par.n_HN = 3;   free.n_HN = 0;  units.n_HN = '-'; label.n_HN = 'chem. index of hydrogen in NH3';
par.n_ON = 0;   free.n_ON = 0;  units.n_ON = '-'; label.n_ON = 'chem. index of oxygen in NH3';
par.n_NN = 1;   free.n_NN = 0;  units.n_NN = '-'; label.n_NN = 'chem. index of nitrogen in NH3';

end