%% matismat
% checks if parameter values of results_my_pet1.mat matches those of results_my_pet2.mat

%%
function [info_par, info_metapar, info_txt_par, info_chem] = matismat(my_pet1, my_pet2)
  % created by Starrlight Augustine, Dina Lika, Bas Kooijman, Goncalo Marques and Laure Pecquerie 2015/07/26

  %% Syntax
  % <../matisinit.m *matismat*>(my_pet1, my_pet2)
  
  %% Description
  % Loads results_my_pet1.mat and results_my_pet2.mat to check if all outputs of the latter matches the contents of the first .mat file. 
  %
  % Input
  %
  % * string with name of species 1
  % * string with name of species 2
  %
  % Output
  %
  % * identifyer for equality of all parameters
  % * identifyer for equality of all meta parameters
  % * identifyer for equality of all text of parameters
  % * identifyer for equality of all chemical parameters
  
  %% Remarks
  % The checking excludes the free-setting of the parameters, RE and MRE. 
  
  %% Example of use
  % matismat('my_pet1', 'my_pet2')

  filenm1 = ['results_', my_pet1, '.mat']; filenm2 = ['results_', my_pet2, '.mat'];
  if ~exist(filenm1, 'file')
    fprintf(['Warning from printmat: cannot find ', filenm1, '\n']);
    return
  end
  if ~exist(filenm2, 'file')
    fprintf(['Warning from printmat: cannot find ', filenm2, '\n']);
    return
  end
      
  load(filenm1, 'par', 'metapar', 'txt_par', 'chem');  % load results from .mat
  par1 = par; metapar1 = metapar; txt_par1 = txt_par; chem1 = chem;
  load(filenm2, 'par', 'metapar', 'txt_par', 'chem');  % load results from .mat
  
  
  par1 = rmfield_wtxt(par1, 'free'); par = rmfield_wtxt(par, 'free');                       
  info_par = isempty(comp_struct(par1, par, 0)); 
 
  metapar = rmfield_wtxt(metapar, 'MRE'); metapar1 = rmfield_wtxt(metapar1, 'MRE');
  metapar = rmfield_wtxt(metapar, 'RE'); metapar1 = rmfield_wtxt(metapar1, 'RE');
  info_metapar = isempty(comp_struct(metapar1, metapar, 0)); 

  info_txt_par = isempty(comp_struct(txt_par1, txt_par, 0)); 

  info_chem = isempty(comp_struct(chem1, chem, 0)); 
