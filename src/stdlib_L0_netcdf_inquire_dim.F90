!
! Level 0 NetCDF wrappers: No checks are performed, except
!                          the error check on exit
!
module stdlib_L0_netcdf_inquire_dim

    implicit none

contains 
   !
   !   Routine: netCDF_inquire_dimID
   !
   subroutine netCDF_inquire_dimID( ncId, dimName, dimID )
      USE netcdf, only: nf90_inq_dimID
      !
      integer,          intent(in   ) :: ncID
      character(len=*), intent(in   ) :: dimName 
      integer,          intent(  out) :: dimID
      !
      integer :: ierr
      !
      ierr = nf90_inq_dimID( ncId, dimName, dimID )
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_inquire_dimID
   !
   !   Routine: netCDF_inquire_dim
   !
   subroutine netCDF_inquire_dimension( ncId, dimID, dimName, len )
      USE netcdf, only: nf90_inquire_dimension
      !
      integer,                    intent(in   ) :: ncID
      integer,                    intent(in   ) :: dimID
      character(len=*), optional, intent(  out) :: dimName 
      integer,          optional, intent(  out) :: len
      !
      integer :: ierr
      !
      ierr = nf90_inquire_dimension( ncId, dimID, dimName, len )
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_inquire_dimension
   !
end module stdlib_L0_netcdf_inquire_dim
