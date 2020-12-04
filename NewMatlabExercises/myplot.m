
function output = myplot(vec1,vec2)

% loaded the file but only to read, the contents does not need to be used.
% Which is why I am confused why there is other things present within the
% file?
m = load('plot_properties.mat','-mat');

%Made a tiled layout for the three plots to fit on one figure then applied
%the relevant details in the plot_properties.mat file to each plot
tiledlayout(3,1);
nexttile;
h = plot(vec1,vec2);
h.LineWidth = 2;
h.LineStyle = '--';
h.Color = 'r';
grid on;

nexttile;
h2 = bar(vec1,vec2);
h2.BarWidth = 1;
h2.FaceColor = 'b';
h2.EdgeColor = 'y';
grid on;

nexttile;
h3 = barh(vec1,vec2);
h3.BarWidth = 1;
h3.FaceColor = 'g';
h3.EdgeColor = 'b';
grid on;

%No output necessary 
end