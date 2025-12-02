clearvars
clc

%%Day One Part One
%%This should load the password data

Data1 = readlines("AdventOfCode25\SourceData\DayOneDataPartOne.txt");

%counter starts at 50

selector = 50;

%Start var for counting zeros

zerospass = 0;

%loop thorugh data1 and reassign L to neg and R to pos

Data1format = zeros(size(Data1)); % Initialize Data1format array

for i = 1:length(Data1)
    if contains(Data1(i), "L")
        Data1format(i) = -1 * str2double(extractAfter(Data1(i),1));
    elseif contains(Data1(i), "R")
        Data1format(i) = str2double(extractAfter(Data1(i),1));
    end
end
clear i

%now put inputs in and count how many times the selector is at 0

for i = 1:length(Data1format)
    selector = safeinput(selector,Data1format(i));
    if selector == 0
        zerospass = zerospass + 1;
    end

end

%print the number of times it was at zero
fprintf('The selector was at zero %d times.\n', zerospass);




% Reset the selector for part two
selector = 50;
zerospass = 0; % Reset zero pass count for potential further analysis

%Now I need to see how many times it passes zero, not just lands on it
%to do this, i'm just going to move the selector one valuie at a time and
%check for zero between each step

for i = 1:length(Data1format)
    [selector, addzero]  = safeinputsingle(selector,Data1format(i));
    zerospass = zerospass + addzero;

end


%print the number of times it was at zero
fprintf('The selector passed zero %d times.\n', zerospass);


function counter = safeinput(counter, increment)
% Ensure the counter is within the range of 0 to 99
counter = mod(counter + increment, 100);
end

function [counter, passzero] = safeinputsingle(counter,increment)
%almost the same function but will go one at a time and count zeros
%within itself
passzero = 0;
%positve case
if increment > 0
    for i = 1:abs(increment)
        counter = mod(counter + 1, 100);
        if counter == 0
            passzero = passzero + 1;
        end
    end


    %negative case
elseif increment < 0
    for i = 1:abs(increment)
        counter = mod(counter - 1, 100);
        if counter == 0
            passzero = passzero + 1;
        end
    end

end
end