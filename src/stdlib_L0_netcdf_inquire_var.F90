!
! Level 0 NetCDF wrappers: No checks are performed, except
!                          the error check on exit
!
submodule (stdlib_netcdf) stdlib_L0_netcdf_inquire_var

    implicit none

contains 
   !
   !   Routine: netCDF_inquire_var
   !
   subroutine netCDF_inquire_var( ncId, varID, varName, xtype, nDims, dimsIDs, nAtts )
      USE netcdf, only: nf90_inquire_var, f90_NoErr
      !
      integer,                    intent(in   ) :: ncID
      integer,                    intent(in   ) :: varID
      character(len=:), optional, intent(  out) :: varName 
      integer,          optional, intent(  out) :: xtype
      integer,          optional, intent(  out) :: nDims
      integer,          optional, intent(  out) :: dimsIDs(:)
      integer,          optional, intent(  out) :: nAtts
      !
      integer :: ierr
      !
      ierr = nf90_inquire_var( ncId, varID, varName, xtype, nDims, dimsIDs, nAtts )
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_inquire_var
   !
end submodule stdlib_L0_netcdf_inquire_var
