!
! Level 0 NetCDF wrappers: No checks are performed, except
!                          the error check on exit
!
module stdlib_L0_netcdf_def_var

    implicit none

contains 
   !
   !   Routine: netCDF_def_var
   !
   subroutine netCDF_def_var( ncId, varName, xtype, dimIds, varID )
      USE netcdf, only: nf90_def_var
      !
      integer,          intent(in   ) :: ncID
      character(len=*), intent(in   ) :: varName 
      integer,          intent(in   ) :: xtype
      integer,          intent(in   ) :: dimIds(:) 
      integer,          intent(  out) :: varID
      !
      integer :: ierr
      !
      ierr = nf90_def_var( ncId, TRIM(varName), xtype, dimIds, varID )
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_def_var
   !
end module stdlib_L0_netcdf_def_var
