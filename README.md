# stdlib_NetCDF
A set of wrappers and high-level functions and subroutines to read and write Network Common Data Form (NetCDF) files


## Level 0 NetCDF readers-writers
This is the set of routines that act exactly like the base function call in the `netcdf` module, they just include the output error check. These routines are fairly low-level and intended to be used by experienced users, or users that have done all their homework before (that is, you know exactly what you are reading, writing, its characteristics, size, kind, everything). These routines should be the fastest routines, as they only wraps the original, no extra checks are performed. 

> [!TIP]
> If the optional argument `ierr` is passed to the subroutine, the error check is returned into the variable itself to give the user control over error handling. If this argument is not passed, level 0 NetCDF routine will simply call an error stop and use the string provided by `nf90_strerror` as information. The error handling block is
> ```fortran
> if (ierr_ /= nf90_NoErr) then
>    if ( present(ierr) ) then
>       ierr = ierr_
>       return
>    else
>       error stop TRIM(nf90_strerror(ierr_))
>    end if
> end if
> ```
> where `ierr_` is the result of the netcdf function call.

## Level 1 NetCDF readers-writers
Here we start adding some fancy checking before the call to make writing or reading an unknown variable a little easier.
