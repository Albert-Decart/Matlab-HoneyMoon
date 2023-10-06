clc
clear 

%%
% import share holders data
[name_1,date1,shareHolderId_1,firmId_1,share1,percent1,...
    shareHolderName] = importShareHolderfile('ShareHolders-raw.xlsx','shareHolders',2,87996);
% import index data
[shareHolderId_2,name_2,fullName,firmId_2,market,marketCode,...
    industryCode,industry,subIndustryCode,subIndustry] = importShenasefile('Shenase-raw.xlsx','shenase',1,792);
%%
ShareholderID_unique=unique(shareHolderId_1)
FirmId_unique=unique(firmId_1);
Name_unique=unique(name_1);
Info(:).name=Name_unique;
Info=[{'name',{Name_unique},'firmID',{FirmId_unique}...
    'Date',{},'ShareholderID',{}}]


AA=zeros(size(A,1));
for i=1:size(A,1)
    for j=1:size(A,1)
        if j~=i
            AA(i,j)=percent(j);
        end
    end
end
Y=inv(eye(size(A,1))-AA)*AA;
info=struct([])

info.name=name
info.date=date
info.Id=id
info.shareholderid=shareholderid