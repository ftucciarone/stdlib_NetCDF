!
! Level 0 NetCDF wrappers: No checks are performed, except
!                          the error check on exit
!
module stdlib_L0_netcdf_rename_dim

    implicit none

contains 
   !
   !   Routine: netCDF_rename_dim
   !
   subroutine netCDF_rename_dim( ncId, dimID, dimNewName )
      USE netcdf, only: nf90_rename_dim
      !
      integer,                    intent(in   ) :: ncID
      integer,                    intent(in   ) :: dimID
      character(len=*), optional, intent(in   ) :: dimNewName 
      !
      integer :: ierr
      !
      ierr = nf90_rename_dim( ncId, dimID, dimNewName )
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_rename_dim
   !
end module stdlib_L0_netcdf_rename_dim
