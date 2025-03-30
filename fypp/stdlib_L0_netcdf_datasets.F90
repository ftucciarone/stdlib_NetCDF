!
! Level 0 NetCDF wrappers: No checks are performed, except
!                          the error check on exit
!
module stdlib_L0_netcdf_datasets

    implicit none

contains 

   module character function netCDF_get_version()
      USE netcdf, only: nf90_inq_libvers
      !
      character(:), allocatable :: get_version
      !
      get_version = TRIM(nf90_inq_libvers())
      !
   end function netCDF_get_version
   !
   ! 
   !
   module subroutine netCDF_create( path, cmode, initialsize, chunksize, ncID, ierr )
      USE netcdf, only: nf90_create, nf90_strerror, nf90_NoErr
      !
      character(len=*),           intent(in   ) :: path
      integer,                    intent(in   ) :: cmode
      integer,          optional, intent(inout) :: initialsize
      integer,          optional, intent(inout) :: chunksize
      integer,                    intent(  out) :: ncID
      integer,          optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_create( path, cmode, initialsize, chunksize, ncID )
      !
      if (ierr_ /= nf90_NoErr) then
         if ( present(ierr) ) then
            ierr = ierr_
            return
         else
            error stop TRIM(nf90_strerror(ierr_))
         end if
      end if
      !
   end subroutine netCDF_create
   !
   ! 
   !
   module subroutine netCDF_open( path, cmode, ncID, chunksize, ierr )
      USE netcdf, only: nf90_open, nf90_strerror, nf90_NoErr
      !
      character(len=*),           intent(in   ) :: path
      integer,                    intent(in   ) :: cmode
      integer,                    intent(  out) :: ncID
      integer,          optional, intent(inout) :: chunksize
      integer,          optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_open( path, cmode, chunksize, ncID )
      !
      if (ierr_ /= nf90_NoErr) then
         if ( present(ierr) ) then
            ierr = ierr_
            return
         else
            error stop TRIM(nf90_strerror(ierr_))
         end if
      end if
      !
   end subroutine netCDF_open
   !
   ! 
   !
   module subroutine netCDF_redef( ncID, ierr )
      USE netcdf, only: nf90_redef, nf90_strerror, nf90_NoErr
      !
      integer,           intent(in   ) :: ncID
      integer, optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !      
      ierr_ = nf90_redef( ncID )
      !
      if (ierr_ /= nf90_NoErr) then
         if ( present(ierr) ) then
            ierr = ierr_
            return
         else
            error stop TRIM(nf90_strerror(ierr_))
         end if
      end if
      !
   end subroutine netCDF_redef
   !
   !
   !
   module subroutine netCDF_enddef( ncID, h_minfree, v_align, v_minfree, r_align, ierr )
      USE netcdf, only: nf90_enddef, nf90_strerror, nf90_NoErr
      !
      integer,           intent(in   ) :: ncID
      integer, optional, intent(in   ) :: h_minfree
      integer, optional, intent(in   ) :: v_align
      integer, optional, intent(in   ) :: v_minfree
      integer, optional, intent(in   ) :: r_align
      integer, optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_enddef( ncID, h_minfree, v_align, v_minfree, r_align )
      !
      if (ierr_ /= nf90_NoErr) then
         if ( present(ierr) ) then
            ierr = ierr_
            return
         else
            error stop TRIM(nf90_strerror(ierr_))
         end if
      end if
      !
   end subroutine netCDF_enddef
   !
   ! 
   !
   module subroutine netCDF_close( ncID, ierr )
      USE netcdf, only: nf90_close, nf90_strerror, nf90_NoErr
      !
      integer,           intent(in   ) :: ncID
      integer, optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !      
      ierr_ = nf90_close( ncID )
      !
      if (ierr_ /= nf90_NoErr) then
         if ( present(ierr) ) then
            ierr = ierr_
            return
         else
            error stop TRIM(nf90_strerror(ierr_))
         end if
      end if
      !
    end subroutine netCDF_close
    !
end module stdlib_L0_netcdf_datasets
