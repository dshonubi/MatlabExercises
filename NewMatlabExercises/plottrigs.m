
function output = plottrigs(varargin)

%Stores the length of the inout variables to know which case to go to and
%creates the core plot - cos or sin
    inputln = length(varargin);
    sincos = str2func(varargin{1});
    x = ((-2*pi):0.1:(2*pi));
    y = (sincos(x));
    
    % Use of a switch depending on whether there is 1,2,3 or 4 variables. *
    % is used as dot notation, as the MATLAB doc uses it as dot notation. 
    switch inputln
            case 1
                h = plot(x,y);
                grid on;
                xticks(-8:8);
                h.LineWidth = 1;
                h.Color = 'k';
                h.Marker = '*';
                title('1 input argument');
                
            case 2
                h = plot(x,y);
                grid on;
                xticks(-8:8);
                h.LineWidth = 1;
                h.Color = varargin{2};
                h.Marker = '*';
                title('2 input arguments');
                
            case 3 
                h = plot(x,y);
                grid on;
                xticks(-8:8);
                h.LineWidth = varargin{3};
                h.Color = varargin{2};
                h.Marker = '*';
                title('3 input arguments');
                
            case 4 
                h = plot(x,y);
                grid on;
                xticks(-8:8);
                h.LineWidth = varargin{3};
                h.Color = varargin{2};
                h.Marker = varargin{4};
                title('4 input arguments');                  
    end
%No output necessary as it's plot
end