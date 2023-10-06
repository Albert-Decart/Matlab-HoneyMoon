clear  shareholderLink sharePercent shareCount nonSymPercent
THRESH_HOLD=1;
%%
% there are two main approach to create graph matrix. first is a directed
% graph that we just look at the firms and for each share of a firm, we put
% 1 in the coresponding row and column. we call it shareholder link.
% the second approach however, takes into account the information of
% outside share holders. if two firms have a same share holder, they are
% connected with 2 level distances. so this non-directed matrix has 0, 1 or
% 2 for its values. we call it owner link.
% for computing each kind of link, we use a threshold for the percentage of
% shares the share holders has. If it is below the threshold, it cannot
% create a link between two firms. The higher the threshold, the fewer
% firms connected.
[shareholderLink, sharePercent, shareCount, nonSymPercent] = createShareholderLink(names,info,THRESH_HOLD);
ownerLink = createOwnerLink(names, info,THRESH_HOLD);
Sources_names=names(find(sum(Y')'==0));
%%
% based on which approach we generate graph matrix, there are two ways to
% generate network matrix. the shareholder network is based on shareholder link. it
% is a skew-symmetric matrix. each element represents level of distance to
% share (if positive) or level of distance to shareholder (if negetive).
% elements equal to zero shows a circle, firm i and j are both the share
% holder and share of each other and also the level of distance is equal of
% shares and share holder are equal. if two firms have no connection, then
% their corespondence row and column is inf.
networkSh = findShareholderNetworks(simpleLink);
%%
% this network matrix is much more simpler than the
% last part one. It is just based on the owner link. this is a
% symmetic matrix and the numbers show the level of distance between two
% firms in the graph. if two firms are not connected, then the distance is
% infinity.
networkOw = findOwnerNetworks(ownerLink);