clearvars
clc

%Day 2
Data = readlines("SourceData\DayTwoData.txt","LineEnding",',');             %load data
Fdata = split(Data,'-');                                                    %format data
Fdata = str2double(Fdata);                                                  %ditto

%builds arrays from two data points
for i = 1:length(Fdata)
    numdata{i} = Fdata(i,1):Fdata(i,2);
end

caseresult = zeros(length(numdata),1);%init global results
for i = 1:length(numdata)
    working = string(cell2mat(numdata(i)));%Grabs current id range
    checkhere = (mod(strlength(working),2));%Checks if odd or even
    result = zeros(length(cell2mat(numdata)),1);%init local results
    for ii = 1:size(working,2) %scan id range
        if checkhere(ii) == 0 %if odd, skip bc can not be solution
            workingfront = extractBetween(working(ii),1,strlength(working(ii))/2);%grab front half
            workingass = extractBetween(working(ii),strlength(working(ii))/2+1,strlength(working(ii)));%grab back half

            if workingfront == workingass%Check if id repeats
                result(ii) = working(ii);%set local result to ID if it repeats
            end
        end        
    end
    caseresult(i) = sum(result);%collect local results
end
fprintf("The sum of invalid ID's in the system is %d\n",sum(caseresult))%print global results
