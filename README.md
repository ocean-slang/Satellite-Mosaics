# Satellite-Mosaics
Easily create maps of Level-2 mosaics (created in NASA SeaDAS) in Matlab. Must be NetCDF files. Use with M_Map (https://www.eoas.ubc.ca/~rich/map.html)

# How to set up folders
- Add m_map to functions, found here: https://www.eoas.ubc.ca/~rich/map.html
- Create mosaics and move to folder "mosaics"

# .m file descriptions:
mapL2_mosaics.m: Plot mosaics. example mosaics include chlorophyll-a, particulate organic carbon (POC), and particulate inorganic carbon (PIC). can specify parameters of interest when you create your own mosaics:

# Creating mosaics in SeaDAS 8.1:
1. Go to Raster > Geometric Operations > Mosaicking
2. I/O Parameters: Select all Level-2 images you want to "mosaic together" under Source Products. Select name, save as NetCDF4-CF.
3. Map Projection Definition: Projection: UTM / WGS 84 (Automatic). Select mosaic bounds. 
4. Variables & Conditions: Select variables of interest for mosaicking.
5. Hit Run. (Note: check to make sure your mosaic bounds are still selected before running. sometimes SeaDAS resets this option, and it will take longer to run the process)
