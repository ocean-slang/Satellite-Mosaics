# Satellite-Mosaics
Easily create maps of Level-2 mosaics (created in NASA SeaDAS) in Matlab. Must be NetCDF files. Use with M_Map (https://www.eoas.ubc.ca/~rich/map.html)

# How to set up folders
<img width="311" alt="Screen Shot 2021-10-29 at 4 43 22 PM" src="https://user-images.githubusercontent.com/83712030/139499427-cad50cc9-68d9-4f1d-98bf-edc9e36bf9b9.png">

- Add m_map to functions, found here: https://www.eoas.ubc.ca/~rich/map.html
- Create mosaics and move to folder "mosaics"

# .m file descriptions:
mapL2_mosaics.m: Plot mosaics. example mosaics include chlorophyll-a, particulate organic carbon (POC), and particulate inorganic carbon (PIC). can specify parameters of interest when you create your own mosaics:

# Creating mosaics in SeaDAS 8.1:
1. Go to Raster > Geometric Operations > Mosaicking
2. I/O Parameters: Select all Level-2 images you want to "mosaic together" under Source Products. Select name (code written for names like "mosaic_288.nc", where 288 is the julian day. but can modify the code for a different naming scheme). Save as NetCDF4-CF.
3. Map Projection Definition: Projection: UTM / WGS 84 (Automatic). Select mosaic bounds. 
4. Variables & Conditions: Select variables of interest for mosaicking.
5. Hit Run. (Note: check to make sure your mosaic bounds are still selected before running. sometimes SeaDAS resets this option, and it will take longer to run the process)
