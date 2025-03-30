!
! Level 0 NetCDF wrappers: No checks are performed, except
!                          the error check on exit
!
module stdlib_L0_netcdf_rename_var

    implicit none

contains 
   !
   !   Routine: netCDF_rename_var
   !
   subroutine netCDF_rename_var( ncId, varID, varNewName )
      USE netcdf, only: nf90_rename_var
      !
      integer,                    intent(in   ) :: ncID
      integer,                    intent(in   ) :: varID
      character(len=*), optional, intent(in   ) :: varNewName 
      !
      integer :: ierr
      !
      ierr = nf90_rename_var( ncId, varID, varNewName )
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_rename_var
   !
end module stdlib_L0_netcdf_rename_var
