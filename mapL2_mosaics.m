% Code written by Sarah Lang, slang@uri.edu. University of Rhode Island's Graduate School of Oceanography.
% November 1, 2021

%% Read data
cd '/Users/sarahlang/Desktop/mapL2/'; %change your cd

% Add functions to path
addpath('/Users/sarahlang/Desktop/mapL2/functions')
addpath('/Users/sarahlang/Desktop/mapL2/functions/m_map')

% Loop Through Directory and Write Coordinates to a Structure
sdir = dir('/Users/sarahlang/Desktop/mapL2/data/*nc');
spath = '/Users/sarahlang/Desktop/mapL2/mosaics/';

% Note: The mosaics processed have the bounds 20˚ to 50˚ latitude, -135˚ to
% -110˚ longitude
%% Loop through directory, map parameter of interest
for file = 1:length(sdir)
    
    cd(spath)
    
    % Read Files
    filename = sdir(file).name;
    
    chlora=ncread(filename,'chlor_a');
%   pic=ncread(filename,'pic');
%   poc=ncread(filename,'poc');
    lat=ncread(filename,'lat');
    lon=ncread(filename,'lon');

    % Subset data
    latmatches = (lat >= 28 & lat <= 42); %define bounds of latitude
    longmatches = (lon >= -130 & lon <= -116); %define bounds of longitude
    subset = (longmatches==1 & latmatches==1); %create logical array
    chl=chlora.*subset;
    chl(chl==0)= NaN;
    longitude=lon.*subset;
    lon(lon==0)= NaN;
    latitude=lat.*subset;
    lat(lat==0)= NaN;
    
 
    LATLIMS=[28 42];
    LONLIMS=[-130 -116];
    
    %get date for plot titles
    j= erase( filename , "mosaic_"); 
    julianday = erase(j,".nc");
    t=datestr(datenum(2021,0, str2num(julianday)));
    
    figure()
    m_proj('Mercator','lon',LONLIMS,'lat',LATLIMS);
    m_pcolor(lon, lat, chl);shading flat;
    m_grid('linewi',2,'tickdir','out');
    h=colorbar;
    m_coast('linewidth',0.5,'color','k');
    %m_coast('patch',[0.5 0.5 0.5]);
    set(get(h,'ylabel'),'String','Chlorophyll-a (mg/m^{3})');
    caxis([0 1])
    ylabel('Latitude ( Â°)')
    xlabel('Longitude ( Â°)')
    title([t])
    set(gca,'FontSize',14);  
    print(gcf,[t,'_chl.pdf'],'-dpdf','-r300'); 
end
