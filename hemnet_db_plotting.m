clear all

load br;

% excluding incomplete entries
jj = 1;
for ii=1:length(br)
    kv = br(ii).kv;
    if isempty(kv)
    else
        br2(jj) = br(ii);
        jj = jj+1;
    end
    
end
% 
% %bin weeks
% kk = 1;
% start_date = br2(1).date;
% for ii=1:length(br2)
%     if [br2.date] < start_date - (kk-1)*7 & ([br2.date] > start_date - kk*7)
%         date_current = 
%     if length (ind1)>0
%         br3(kk).date = br2(ii).date -3;
%         br3(kk).pricePerKv = mean([br2(ind1).pricePerKv]);
%         kk = kk+1;
%     end
% end
% 
% plot([br3.date],[br3.pricePerKv],'-o')

ind = find([br2.room] == 2 & [br2.kv]>15 & [br2.price]<2000000 & [br2.no]>1000 );
plot(datenum([br2(ind).date]),[br2(ind).pricePerKv],'o')
% datetick('x',20)

plot([br2(ind).kv],[br2(ind).pricePerKv],'ro')

set(gca,'xminortick','on')
axis tight