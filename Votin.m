clc
clear k kk ii jj ee c d prand
t=1;    
ii=2;
prand=rand(4,1);
%BNZ index

    ee{t}=combntns(prand,ii)'
    for i=1:size(ee{t})
        for j=1:ii
            if sum(ee{t}(:,:))>1
                c{t}=[,];
            end
        end
    end
    
    
    clc
clear k kk ii jj ee c d
t=1;
for ii=2:10
    
    
    ee{t}=combntns(prand,ii)'
    if sum(ee{t})>1
        ff{i}=ee{t}
        i=i+1;
    end
        for i=2:ii
            kk= sum(combntns(k{t},ii-1)')>2
        end
        if sum(kk)>2
            kk
        end
    t=t+1;
end


% 
% for i=0:10
%     for j=0:10
%         if i+j>0 &i+j<11
%         if perand(i+j)>.5
%            c{t}=[i,j];
%            t=t+1;
%         end
%         end
%         for ii=1:11
% find(sum(combntns(rand(10,1),ii)')>1)
% end
%     end 
% end
        
    
     