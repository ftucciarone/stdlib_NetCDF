!
! Level 0 NetCDF wrappers: No checks are performed, except
!                          the error check on exit
!
submodule (stdlib_netcdf) stdlib_L0_netcdf_rename_var

    implicit none

contains 
   !
   !   Routine: netCDF_rename_var
   !
   subroutine netCDF_rename_var( ncId, varID, varNewName )
      USE netcdf, only: nf90_rename_var, f90_NoErr
      !
      integer,                    intent(in   ) :: ncID
      integer,                    intent(in   ) :: varID
      character(len=:), optional, intent(in   ) :: varNewName 
      !
      integer :: ierr
      !
      ierr = nf90_rename_var( ncId, varID, varNewName )
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_rename_var
   !
end submodule stdlib_L0_netcdf_rename_var
