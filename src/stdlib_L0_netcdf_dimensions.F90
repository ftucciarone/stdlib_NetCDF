!
! Level 0 NetCDF wrappers: No checks are performed, except
!                          the error check on exit
!
module stdlib_L0_netcdf_dimensions

    implicit none

contains 
   !
   !   Routine: netCDF_def_dim
   !
   subroutine netCDF_def_dim( ncId, dimName, len, dimID, ierr )
      USE netcdf, only: nf90_def_dim, nf90_strerror, nf90_NoErr
      !
      integer,                    intent(in   ) :: ncID
      character(len=*),           intent(in   ) :: dimName 
      integer,                    intent(in   ) :: len
      integer,                    intent(  out) :: dimID
      integer,          optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr = nf90_def_dim( ncId, TRIM(dimName), dimId, dimID )
      !
      if (ierr_ /= nf90_NoErr) then
         if ( present(ierr) ) then
            ierr = ierr_
            return
         else
            error stop nf90_strerror(ierr_)
         end if
      end if
      !
   end subroutine netCDF_def_dim
   !
   !   Routine: netCDF_inquire_dimID
   !
   subroutine netCDF_inquire_dimID( ncId, dimName, dimID, ierr )
      USE netcdf, only: nf90_inq_dimID, nf90_strerror, nf90_NoErr
      !
      integer,                    intent(in   ) :: ncID
      character(len=*),           intent(in   ) :: dimName 
      integer,                    intent(  out) :: dimID
      integer,          optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr = nf90_inq_dimID( ncId, dimName, dimID )
      !
      if (ierr_ /= nf90_NoErr) then
         if ( present(ierr) ) then
            ierr = ierr_
            return
         else
            error stop nf90_strerror(ierr_)
         end if
      end if
      !
   end subroutine netCDF_inquire_dimID
   !
   !   Routine: netCDF_inquire_dim
   !
   subroutine netCDF_inquire_dimension( ncId, dimID, dimName, len, ierr )
      USE netcdf, only: nf90_inquire_dimension, nf90_strerror, nf90_NoErr
      !
      integer,                    intent(in   ) :: ncID
      integer,                    intent(in   ) :: dimID
      character(len=*), optional, intent(  out) :: dimName 
      integer,          optional, intent(  out) :: len
      integer,          optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr = nf90_inquire_dimension( ncId, dimID, dimName, len )
      !
      if (ierr_ /= nf90_NoErr) then
         if ( present(ierr) ) then
            ierr = ierr_
            return
         else
            error stop nf90_strerror(ierr_)
         end if
      end if
      !
   end subroutine netCDF_inquire_dimension
   !
   !   Routine: netCDF_rename_dim
   !
   subroutine netCDF_rename_dim( ncId, dimID, dimNewName, ierr )
      USE netcdf, only: nf90_rename_dim, nf90_strerror, nf90_NoErr
      !
      integer,                    intent(in   ) :: ncID
      integer,                    intent(in   ) :: dimID
      character(len=*), optional, intent(in   ) :: dimNewName
      integer,          optional, intent(  out) :: ierr 
      !
      integer :: ierr_
      !
      ierr = nf90_rename_dim( ncId, dimID, dimNewName )
      !
      if (ierr_ /= nf90_NoErr) then
         if ( present(ierr) ) then
            ierr = ierr_
            return
         else
            error stop nf90_strerror(ierr_)
         end if
      end if
      !
   end subroutine netCDF_rename_dim
   !
end module stdlib_L0_netcdf_dimensions
