%% shlegend
% plots legend 

%%
function Hlegend = shlegend(legend, pos, space, txt, i_legend)
% created 2016/02/28 by Bas Kooijman, modified 2017/12/16

%% Syntax
% Hlegend = <../shlegend.m *shlegend*> (legend, pos, space, txt, i_legend)

%% Description
% plots legend
%
% Input:
%
% * legend: (n,2)-cell matrix with with marker (5-vector of cells), item (string)
% * pos: optional 2-vector with position of lower-left corner of legend within box (default: 0.7, 0.2)
% * space: optinal 2-vector with space between marker and item (horizontal) space between marker and marker (vertical); default: 0.9, 0.45
% * txt: optional character string with title above legend figure
% * i_legend: optional integer with highlighter (from 1 till n)
%
% Output: 
% 
% * Hlegend: handle of figure

%% Remarks
% create legend with select_legend; press any key when done with select_legend 

%% Example of use
% shlegend(select_legend) or 
%   legend = select_legend; shlegend(legend, [], [], 'example'); 

if ~exist('pos', 'var') || isempty(pos)
  pos = [.7 .2];
end
if ~exist('space', 'var') || isempty(space)
  space_MT = 0.9; space_MM = 0.30;
else
  space_MT = space(1); space_MM = space(2);
end
  
n = size(legend,1); width = 0;
for i = 1:n
  width = max(width, length(legend{i,2}));
end
width = 1 + width * 0.5;
height = n * space_MM; 

Hlegend = figure('Position', [300, 400, 29 * width, 150 * height]);

plot([0 width width 0 0], [0 0 height height 0], 'w', 'LineStyle', 'none')
%set(gca, 'FontSize', 35, 'Box', 'off')
hold on

for i = 1:n
  marker = legend{n-i+1,1}; item = legend(n-i+1,2);
  if length(marker) == 5
    T = marker{1}; MS = marker{2}; LW = marker{3}; MEC = marker{4}; MFC = marker{5};  
  else
    T = marker{1}; MS = marker{2}; LW = marker{3}; MEC = [0 0 0]; MFC = [0 0 0];  
  end
  plot(pos(1), pos(2), T, 'MarkerSize', MS, 'LineWidth', LW, 'MarkerFaceColor', MFC, 'MarkerEdgeColor', MEC); axis('off');
  text(space_MT + pos(1), pos(2), strrep(item, '_', '\_'), 'Interpreter', 'tex');
  if exist('i_legend', 'var') && i_legend == n-i+1
    text(pos(1) - 1.5, pos(2), '>');
  end
  pos(2) = pos(2) + space_MM;
end

if exist('txt', 'var') && ~isempty(txt)
  title(txt);
end

