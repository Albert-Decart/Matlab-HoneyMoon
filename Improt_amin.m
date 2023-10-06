clc
clear

cd('C:\Users\Amin Behrad\Dropbox\Block Trading-Behrad\Literature\blockholding ownership structure\W77--Farajpour Thesis\farajpour thesis\Raw data\Archive\Data Processed');
%%
% import share holders data
[name_1,date1,shareHolderId_1,firmId_1,share1,percent1,shareHolderName] = importShareHolderfile('ShareHolders-raw.xlsx','shareHolders',2,87996);
% import index data
[shareHolderId_2,name_2,fullName,firmId_2,market,marketCode,industryCode,industry,subIndustryCode,subIndustry] = importShenasefile('Shenase-raw.xlsx','shenase',1,792);
%%
% we got a 24-month data, from begining of 1395 to the end of 1396. We want
% to make sure that our firm has at least one data in year 1395, so we put
% a threshhold; If any firm's first data meet the threshold, we keep the
% data, otherwise we remove it
START_DATE = 20160323;
END_DATE = 20180223;
THRESH_HOLD_DATE = 20170223;
THRESH_HOLD = 5;

toBeDeleted = find(date1 > END_DATE);
name_1(toBeDeleted) = [];
date1(toBeDeleted) = [];
shareHolderId_1(toBeDeleted) = [];
firmId_1(toBeDeleted) = [];
share1(toBeDeleted) = [];
percent1(toBeDeleted) = [];
shareHolderName(toBeDeleted) = [];

toBeDeleted = find(date1 < START_DATE);
name_1(toBeDeleted) = [];
date1(toBeDeleted) = [];
shareHolderId_1(toBeDeleted) = [];
firmId_1(toBeDeleted) = [];
share1(toBeDeleted) = [];
percent1(toBeDeleted) = [];
shareHolderName(toBeDeleted) = [];

toBeDeleted = zeros(size(date1,1),1);
i = 1;
while(i < size(date1,1))
    name = name_1(i);
    date = date1(strcmp(name,name_1));
    
    if(min(date) >= THRESH_HOLD_DATE)
        toBeDeleted = toBeDeleted + strcmp(name,name_1);
    end
    i = i + size(date,1);
end
toBeDeleted = toBeDeleted > 0;

name_1(toBeDeleted) = [];
date1(toBeDeleted) = [];
shareHolderId_1(toBeDeleted) = [];
firmId_1(toBeDeleted) = [];
share1(toBeDeleted) = [];
percent1(toBeDeleted) = []; 
shareHolderName(toBeDeleted) = [];

clear toBeDeleted name date i