!
! Level 0 NetCDF wrappers: No checks are performed, except
!                          the error check on exit
!
module stdlib_L0_netcdf_def_dim

    implicit none

contains 
   !
   !   Routine: netCDF_def_dim
   !
   subroutine netCDF_def_dim( ncId, dimName, len, dimID )
      USE netcdf, only: nf90_def_dim
      !
      integer,          intent(in   ) :: ncID
      character(len=*), intent(in   ) :: dimName 
      integer,          intent(in   ) :: len
      integer,          intent(  out) :: dimID
      !
      integer :: ierr
      !
      ierr = nf90_def_dim( ncId, TRIM(dimName), dimId, dimID )
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_def_dim
   !
end module stdlib_L0_netcdf_def_dim
