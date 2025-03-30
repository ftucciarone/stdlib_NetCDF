# stdlib_NetCDF
A set of wrappers and high-level functions and subroutines to read and write Network Common Data Form (NetCDF) files


## Level 0 NetCDF readers-writers
This is the set of routines that act exactly like the base function call in the `netcdf` module, they just include the output error check. These routines are fairly low-level and intended to be used by experienced users, or users that have done all their homework before (that is, you know exactly what you are reading, writing, its characteristics, size, kind, everything). These routines should be the fastest routines, as they only wraps the original, no checks are performed. 

## Level 1 NetCDF readers-writers
Here we start adding some fancy checking before the call to make writing or reading an unknown variable a little easier.
