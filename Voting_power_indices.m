clc
clear k kk ii jj ee c d prand x y i n
t=1;    
n=4;
ii=4;
prand=rand(n,1);
prandt=prand(prand>0)
for j=0:n-2
totalvotes_losing=[];
totalvotes_winning=[];
totalvotes_winning=combntns(prandt,size(prandt,1)-j)'
size(totalvotes_winning,2)
for i=1:size(totalvotes_winning,2)
    
totalvotes_losing=combntns(totalvotes_winning(:,i),size(totalvotes_winning,1)-1)'
end
end