
row = 1;
firmIndex = 1;
names = {};
firmId = {};

while(row < size(date1,1))
    temp = find(strcmp(firmId_1{row},firmId_2) == 1);
    name_1(strcmp(firmId_1,firmId_1{row})) = name_2(temp(1));

    name = name_1(row);
    firmId{end+1} = firmId_1{row};
    names{end+1} = name{1};
    
    date = date1(strcmp(name,name_1));
    shareHolder = shareHolderId_1(strcmp(name,name_1));
    shares = share1(strcmp(name,name_1));
    percents = percent1(strcmp(name,name_1));
    numOfObs = size(unique(date),1);
    
    info(firmIndex).name = name;
    info(firmIndex).id = firmId_1(row);
    info(firmIndex).shareHolderCode = shareHolderId_1(strcmp(firmId_2,info(firmIndex).id));
    
    row = row + size(shareHolder,1);
    index = 1;
    fprintf('generating info: %d \n',firmIndex);
    while(~isempty(shareHolder))
        share = shares(shareHolder(1) == shareHolder);
        percent = percents(shareHolder(1) == shareHolder);
        
        if(size(percent,1) < numOfObs/2)
            shareHolder(shareHolder(1) == shareHolder) = [];
            continue;
        end
        
        info(firmIndex).shareHolder(index).name = shareHolder(1);
        
        info(firmIndex).shareHolder(index).mean = [mean(share) mean(percent)];
        info(firmIndex).shareHolder(index).sd = [var(share)^0.5 var(percent)^0.5];
        info(firmIndex).shareHolder(index).count = size(share,1);
        info(firmIndex).shareHolder(index).all = [mean(share) var(share)^0.5 size(share,1); mean(percent) var(percent)^0.5 size(percent,1)];
        
        shareHolder(shareHolder(1) == shareHolder) = [];
        index = index+1;
    end
    
    
    firmIndex = firmIndex + 1;
end
clear firmIndex row date shareHolder shares percents index share percent
%%

for i = 1:size(names,2)
    fprintf('finding shares: %d\n',i);
    if(~isempty(info(i).shareHolderCode))
        share = {};
        code = info(i).shareHolderCode;
        for j = 1:size(code,1)
            temp = name_1(shareHolderId_1 == code(j));
            while(~isempty(temp))
                name = temp(1);
                if(sum(strcmp(name,share)) == 0)
                    share{end+1} = name{1};
                end
                temp(strcmp(temp,name)) = [];
            end
        end
        info(i).share = share;
    end
end
clear i j temp share code name

