
function output = membersplot(str1,str2)

%stores the fucntions that are being used from the input
%string of char has length of 4 instead of 1 so bar or pie cannot be
%compared to barh because the dimensions are different so using " " means 
%they're each seen as 1 
set1 = ["bar","barh","pie"];

%changes the function names from string to function e.g 'pie'becomes @pie -
%the function 
func1 = str2func(str1);
func2 = str2func(str2);

%creates the tiled layout so the plots can appear next to each other on the
%same figure
tiledlayout(1,2);
nexttile;

%Checks the first function and displays the information accoridngly then
%does the same for the second function
if str1 == set1(3)
    func1([22,45,23,33],{'ME','BM','CE','EE'});
    title('Faculty members by department');   
    nexttile;
else
    if str1 == set1(2)
        x = categorical({'ME','BM','CE','EE'});
        x = reordercats(x,{'ME','BM','CE','EE'});
        y = [22,45,23,33];
        func1(x,y);
        title('Faculty members by department');
        ylabel('Departments');
        xlabel('Number of Faculty members');
        grid on;
        nexttile;
    else
        if str1 == set1(1)
            x = categorical({'ME','BM','CE','EE'});
            x = reordercats(x,{'ME','BM','CE','EE'});
            y = [22,45,23,33];
            func1(x,y);
            title('Faculty members by department');
            xlabel('Departments');
            ylabel('Number of Faculty members');
            grid on;
            nexttile;
        end
    end
end

if str2 == set1(3)
    func2([22,45,23,33],{'ME','BM','CE','EE'});
    title('Faculty members by department');   
else
    if str2 == set1(2)
        x = categorical({'ME','BM','CE','EE'});
        x = reordercats(x,{'ME','BM','CE','EE'});
        y = [22,45,23,33];
        func2(x,y);
        title('Faculty members by department');
        ylabel('Departments');
        xlabel('Number of Faculty members');
        grid on;
    else
        if str2 == set1(1)
            x = categorical({'ME','BM','CE','EE'});
            x = reordercats(x,{'ME','BM','CE','EE'});
            y = [22,45,23,33];
            func2(x,y);
            title('Faculty members by department');
            xlabel('Departments');
            ylabel('Number of Faculty members');
            grid on;
        end
    end
end

%No output needs to be returned as a figure is the ouput produced
end