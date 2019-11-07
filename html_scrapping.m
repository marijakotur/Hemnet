clear all
close all


ind = 1;
for jj=1:131
    url = ['http://www.hemnet.se/salda/bostader?item_types%5B%5D=bostadsratt&location_ids%5B%5D=898716&page=' num2str(jj)];
    html = urlread(url);
    a = strfind(html,'"item sold result normal"');

    
    for ii=1:length(a)
        if ii<length(a)
            html2 = html(a(ii):a(ii+1));
        else
            html2 = html(a(ii):end);
        end
        br(ind).no = ind;
        br(ind).date = html2(strfind(html2,'>Såld')+5:strfind(html2,'>Såld')+15);
        br(ind).address = html2(strfind(html2,'"item sold result normal"')+83:strfind(html2,'"item sold result normal"')+115);
        br(ind).price = html2(strfind(html2,'Slutpris')+9:strfind(html2,'Slutpris')+17);
        br(ind).avgift = html2(strfind(html2,'fee">')+21:strfind(html2,'fee">')+26);
        br(ind).askPrice = html2(strfind(html2,'asked-price')+34:strfind(html2,'asked-price')+44);
        br(ind).area = html2(strfind(html2,'area">')+61:strfind(html2,'area">')+66);        
        br(ind).kv = html2(strfind(html2,'living-area item')+88:strfind(html2,'living-area')+90);
        br(ind).room = html2(strfind(html2,' rum')-3:strfind(html2,' rum')-1);
        br(ind).pricePerKv = html2(strfind(html2,'"price-per-m2">')+22:strfind(html2,'"price-per-m2">')+27);
        
        
        %clean up strings
        br(ind).kv = strrep(br(ind).kv, ',', '');
        br(ind).kv = str2num(br(ind).kv);
        
        br(ind).room = strrep(br(ind).room, ',', '.');
        br(ind).room = str2num(br(ind).room);
        
        br(ind).price = strrep(br(ind).price,char(160),'');
        br(ind).price = deblank(br(ind).price);
        br(ind).price = strrep(br(ind).price,'kr','');
        br(ind).price = strrep(br(ind).price,'k','');
        br(ind).price = str2num(br(ind).price);
        
        br(ind).askPrice = deblank(br(ind).askPrice);
        br(ind).askPrice = strrep(br(ind).askPrice,char(160),'');
        br(ind).askPrice = str2num(br(ind).askPrice);
        
        br(ind).avgift = strrep(br(ind).avgift,char(160),'');
        br(ind).avgift = str2num(br(ind).avgift);
        
        br(ind).date = datenum(br(ind).date);
%         br(ind).date = datestr(br(ind).date);

        br(ind).pricePerKv = deblank(br(ind).pricePerKv );
        br(ind).pricePerKv = strrep(br(ind).pricePerKv,'k','');
        br(ind).pricePerKv = strrep(br(ind).pricePerKv,char(160),'');
        br(ind).pricePerKv = str2num(br(ind).pricePerKv);
        
%         br(ind).area = strrep(br(ind).area,''',);
        
        
        ind = ind+1;
    end
end
   
% length([br.price])
% length([br.room])
% length([br.kv])
% length([br.avgift])

% dn=datenum(data(:,1),'yyyymmdd');
% plot(dn,data(:,2))
% datetick('x','keepticks','keeplimits')

br(1)

plot(datenum([br.date]),[br.price],'d')
datetick('x','keepticks','keeplimits')
