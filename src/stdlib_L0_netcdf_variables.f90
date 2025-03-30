!
! Level 0 NetCDF wrappers: No checks are performed, except
!                          the error check on exit
!
module stdlib_L0_netcdf_variables

    implicit none
    !
    ! Generic name: nc_get_var
    !
    interface nc_get_var
       
       module procedure netCDF_get_var_0D_sp
       module procedure netCDF_get_var_1D_sp
       module procedure netCDF_get_var_2D_sp
       module procedure netCDF_get_var_3D_sp
       module procedure netCDF_get_var_4D_sp
       module procedure netCDF_get_var_5D_sp
       module procedure netCDF_get_var_6D_sp
       module procedure netCDF_get_var_7D_sp
       
       module procedure netCDF_get_var_0D_dp
       module procedure netCDF_get_var_1D_dp
       module procedure netCDF_get_var_2D_dp
       module procedure netCDF_get_var_3D_dp
       module procedure netCDF_get_var_4D_dp
       module procedure netCDF_get_var_5D_dp
       module procedure netCDF_get_var_6D_dp
       module procedure netCDF_get_var_7D_dp

    end interface
    !
    ! Generic name: nc_put_var
    !
    interface nc_put_var
       
       module procedure netCDF_put_var_0D_sp
       module procedure netCDF_put_var_1D_sp
       module procedure netCDF_put_var_2D_sp
       module procedure netCDF_put_var_3D_sp
       module procedure netCDF_put_var_4D_sp
       module procedure netCDF_put_var_5D_sp
       module procedure netCDF_put_var_6D_sp
       module procedure netCDF_put_var_7D_sp
       
       module procedure netCDF_put_var_0D_dp
       module procedure netCDF_put_var_1D_dp
       module procedure netCDF_put_var_2D_dp
       module procedure netCDF_put_var_3D_dp
       module procedure netCDF_put_var_4D_dp
       module procedure netCDF_put_var_5D_dp
       module procedure netCDF_put_var_6D_dp
       module procedure netCDF_put_var_7D_dp

    end interface
    !
contains 
   !
   !   Routine: netCDF_def_var
   !
   subroutine netCDF_def_var( ncId, varName, xtype, dimIds, varID, ierr )
      USE netcdf, only: nf90_def_var, nf90_strerror, nf90_NoErr
      !
      integer,                    intent(in   ) :: ncID
      character(len=*),           intent(inout) :: varName 
      integer,                    intent(in   ) :: xtype
      integer,                    intent(in   ) :: dimIds(:) 
      integer,                    intent(  out) :: varID
      integer,          optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_def_var( ncId, TRIM(varName), xtype, dimIds, varID )
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
   end subroutine netCDF_def_var
   !
   !   Routine: netCDF_inquire_var
   !
   subroutine netCDF_inquire_varID( ncId, varName, varID, ierr )
      USE netcdf, only: nf90_inq_varID, nf90_strerror, nf90_NoErr
      !
      integer,                    intent(in   ) :: ncID
      character(len=*),           intent(inout) :: varName 
      integer,                    intent(  out) :: varID
      integer,          optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_inq_varID( ncId, TRIM(varName), varID )
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
   end subroutine netCDF_inquire_varID
   !
   !   Routine: netCDF_inquire_var
   !
   subroutine netCDF_inquire_var( ncId, varID, varName, xtype, nDims, dimsIDs, nAtts, ierr )
      USE netcdf, only: nf90_inquire_variable, nf90_strerror, nf90_NoErr
      !
      integer,                    intent(in   ) :: ncID
      integer,                    intent(in   ) :: varID
      character(len=*), optional, intent(  out) :: varName 
      integer,          optional, intent(  out) :: xtype
      integer,          optional, intent(  out) :: nDims
      integer,          optional, intent(  out) :: dimsIDs(:)
      integer,          optional, intent(  out) :: nAtts
      integer,          optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_inquire_variable( ncId, varID, varName, xtype, nDims, dimsIDs, nAtts )
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
   end subroutine netCDF_inquire_var
   !
   !   Routine: netCDF_rename_var
   !
   subroutine netCDF_rename_var( ncId, varID, varNewName, ierr )
      USE netcdf, only: nf90_rename_var, nf90_strerror, nf90_NoErr
      !
      integer,                    intent(in   ) :: ncID
      integer,                    intent(in   ) :: varID
      character(len=*), optional, intent(in   ) :: varNewName 
      integer,          optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_rename_var( ncId, varID, TRIM(varNewName) )
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
   end subroutine netCDF_rename_var
   !
   !
   !   Routine: netCDF_get_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   !    Rank 0: netCDF_get_var_0D_sp
   !
   subroutine netCDF_get_var_0D_sp( ncId, varId, values, ierr )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_get_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(  out) :: values
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_get_var( ncId, varId, values) !0D_sp
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
   end subroutine netCDF_get_var_0D_sp
   !
   !   Routine: netCDF_put_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   !    Rank 0: netCDF_put_var_0D_sp
   !
   subroutine netCDF_put_var_0D_sp( ncId, varId, values, ierr )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_put_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(in   ) :: values
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_put_var( ncId, varId, values) !0D_sp
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
   end subroutine netCDF_put_var_0D_sp   
   !
   !
   !   Routine: netCDF_get_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   !    Rank 1: netCDF_get_var_1D_sp
   !
   subroutine netCDF_get_var_1D_sp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_get_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(  out) :: values(:)
      integer,  optional, intent(in   ) :: start(1)
      integer,  optional, intent(in   ) :: count(1)
      integer,  optional, intent(in   ) :: stride(1)
      integer,  optional, intent(in   ) :: map(1)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_get_var( ncId, varId, values, start, count, stride, map ) !1D_sp
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
   end subroutine netCDF_get_var_1D_sp
   !
   !   Routine: netCDF_put_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   !    Rank 1: netCDF_put_var_1D_sp
   !
   subroutine netCDF_put_var_1D_sp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_put_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(in   ) :: values(:)
      integer,  optional, intent(in   ) :: start(1)
      integer,  optional, intent(in   ) :: count(1)
      integer,  optional, intent(in   ) :: stride(1)
      integer,  optional, intent(in   ) :: map(1)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_put_var( ncId, varId, values, start, count, stride, map ) !1D_sp
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
   end subroutine netCDF_put_var_1D_sp   
   !
   !
   !   Routine: netCDF_get_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   !    Rank 2: netCDF_get_var_2D_sp
   !
   subroutine netCDF_get_var_2D_sp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_get_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(  out) :: values(:,:)
      integer,  optional, intent(in   ) :: start(2)
      integer,  optional, intent(in   ) :: count(2)
      integer,  optional, intent(in   ) :: stride(2)
      integer,  optional, intent(in   ) :: map(2)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_get_var( ncId, varId, values, start, count, stride, map ) !2D_sp
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
   end subroutine netCDF_get_var_2D_sp
   !
   !   Routine: netCDF_put_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   !    Rank 2: netCDF_put_var_2D_sp
   !
   subroutine netCDF_put_var_2D_sp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_put_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(in   ) :: values(:,:)
      integer,  optional, intent(in   ) :: start(2)
      integer,  optional, intent(in   ) :: count(2)
      integer,  optional, intent(in   ) :: stride(2)
      integer,  optional, intent(in   ) :: map(2)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_put_var( ncId, varId, values, start, count, stride, map ) !2D_sp
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
   end subroutine netCDF_put_var_2D_sp   
   !
   !
   !   Routine: netCDF_get_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   !    Rank 3: netCDF_get_var_3D_sp
   !
   subroutine netCDF_get_var_3D_sp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_get_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(  out) :: values(:,:,:)
      integer,  optional, intent(in   ) :: start(3)
      integer,  optional, intent(in   ) :: count(3)
      integer,  optional, intent(in   ) :: stride(3)
      integer,  optional, intent(in   ) :: map(3)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_get_var( ncId, varId, values, start, count, stride, map ) !3D_sp
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
   end subroutine netCDF_get_var_3D_sp
   !
   !   Routine: netCDF_put_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   !    Rank 3: netCDF_put_var_3D_sp
   !
   subroutine netCDF_put_var_3D_sp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_put_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(in   ) :: values(:,:,:)
      integer,  optional, intent(in   ) :: start(3)
      integer,  optional, intent(in   ) :: count(3)
      integer,  optional, intent(in   ) :: stride(3)
      integer,  optional, intent(in   ) :: map(3)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_put_var( ncId, varId, values, start, count, stride, map ) !3D_sp
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
   end subroutine netCDF_put_var_3D_sp   
   !
   !
   !   Routine: netCDF_get_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   !    Rank 4: netCDF_get_var_4D_sp
   !
   subroutine netCDF_get_var_4D_sp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_get_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(  out) :: values(:,:,:,:)
      integer,  optional, intent(in   ) :: start(4)
      integer,  optional, intent(in   ) :: count(4)
      integer,  optional, intent(in   ) :: stride(4)
      integer,  optional, intent(in   ) :: map(4)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_get_var( ncId, varId, values, start, count, stride, map ) !4D_sp
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
   end subroutine netCDF_get_var_4D_sp
   !
   !   Routine: netCDF_put_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   !    Rank 4: netCDF_put_var_4D_sp
   !
   subroutine netCDF_put_var_4D_sp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_put_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(in   ) :: values(:,:,:,:)
      integer,  optional, intent(in   ) :: start(4)
      integer,  optional, intent(in   ) :: count(4)
      integer,  optional, intent(in   ) :: stride(4)
      integer,  optional, intent(in   ) :: map(4)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_put_var( ncId, varId, values, start, count, stride, map ) !4D_sp
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
   end subroutine netCDF_put_var_4D_sp   
   !
   !
   !   Routine: netCDF_get_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   !    Rank 5: netCDF_get_var_5D_sp
   !
   subroutine netCDF_get_var_5D_sp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_get_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(  out) :: values(:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(5)
      integer,  optional, intent(in   ) :: count(5)
      integer,  optional, intent(in   ) :: stride(5)
      integer,  optional, intent(in   ) :: map(5)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_get_var( ncId, varId, values, start, count, stride, map ) !5D_sp
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
   end subroutine netCDF_get_var_5D_sp
   !
   !   Routine: netCDF_put_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   !    Rank 5: netCDF_put_var_5D_sp
   !
   subroutine netCDF_put_var_5D_sp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_put_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(in   ) :: values(:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(5)
      integer,  optional, intent(in   ) :: count(5)
      integer,  optional, intent(in   ) :: stride(5)
      integer,  optional, intent(in   ) :: map(5)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_put_var( ncId, varId, values, start, count, stride, map ) !5D_sp
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
   end subroutine netCDF_put_var_5D_sp   
   !
   !
   !   Routine: netCDF_get_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   !    Rank 6: netCDF_get_var_6D_sp
   !
   subroutine netCDF_get_var_6D_sp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_get_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(  out) :: values(:,:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(6)
      integer,  optional, intent(in   ) :: count(6)
      integer,  optional, intent(in   ) :: stride(6)
      integer,  optional, intent(in   ) :: map(6)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_get_var( ncId, varId, values, start, count, stride, map ) !6D_sp
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
   end subroutine netCDF_get_var_6D_sp
   !
   !   Routine: netCDF_put_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   !    Rank 6: netCDF_put_var_6D_sp
   !
   subroutine netCDF_put_var_6D_sp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_put_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(in   ) :: values(:,:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(6)
      integer,  optional, intent(in   ) :: count(6)
      integer,  optional, intent(in   ) :: stride(6)
      integer,  optional, intent(in   ) :: map(6)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_put_var( ncId, varId, values, start, count, stride, map ) !6D_sp
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
   end subroutine netCDF_put_var_6D_sp   
   !
   !
   !   Routine: netCDF_get_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   !    Rank 7: netCDF_get_var_7D_sp
   !
   subroutine netCDF_get_var_7D_sp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_get_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(  out) :: values(:,:,:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(7)
      integer,  optional, intent(in   ) :: count(7)
      integer,  optional, intent(in   ) :: stride(7)
      integer,  optional, intent(in   ) :: map(7)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_get_var( ncId, varId, values, start, count, stride, map ) !7D_sp
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
   end subroutine netCDF_get_var_7D_sp
   !
   !   Routine: netCDF_put_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   !    Rank 7: netCDF_put_var_7D_sp
   !
   subroutine netCDF_put_var_7D_sp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_put_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(in   ) :: values(:,:,:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(7)
      integer,  optional, intent(in   ) :: count(7)
      integer,  optional, intent(in   ) :: stride(7)
      integer,  optional, intent(in   ) :: map(7)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_put_var( ncId, varId, values, start, count, stride, map ) !7D_sp
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
   end subroutine netCDF_put_var_7D_sp   
   !
   !
   !   Routine: netCDF_get_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   !    Rank 0: netCDF_get_var_0D_dp
   !
   subroutine netCDF_get_var_0D_dp( ncId, varId, values, ierr )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_get_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(  out) :: values
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_get_var( ncId, varId, values) !0D_dp
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
   end subroutine netCDF_get_var_0D_dp
   !
   !   Routine: netCDF_put_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   !    Rank 0: netCDF_put_var_0D_dp
   !
   subroutine netCDF_put_var_0D_dp( ncId, varId, values, ierr )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_put_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(in   ) :: values
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_put_var( ncId, varId, values) !0D_dp
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
   end subroutine netCDF_put_var_0D_dp   
   !
   !
   !   Routine: netCDF_get_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   !    Rank 1: netCDF_get_var_1D_dp
   !
   subroutine netCDF_get_var_1D_dp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_get_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(  out) :: values(:)
      integer,  optional, intent(in   ) :: start(1)
      integer,  optional, intent(in   ) :: count(1)
      integer,  optional, intent(in   ) :: stride(1)
      integer,  optional, intent(in   ) :: map(1)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_get_var( ncId, varId, values, start, count, stride, map ) !1D_dp
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
   end subroutine netCDF_get_var_1D_dp
   !
   !   Routine: netCDF_put_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   !    Rank 1: netCDF_put_var_1D_dp
   !
   subroutine netCDF_put_var_1D_dp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_put_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(in   ) :: values(:)
      integer,  optional, intent(in   ) :: start(1)
      integer,  optional, intent(in   ) :: count(1)
      integer,  optional, intent(in   ) :: stride(1)
      integer,  optional, intent(in   ) :: map(1)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_put_var( ncId, varId, values, start, count, stride, map ) !1D_dp
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
   end subroutine netCDF_put_var_1D_dp   
   !
   !
   !   Routine: netCDF_get_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   !    Rank 2: netCDF_get_var_2D_dp
   !
   subroutine netCDF_get_var_2D_dp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_get_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(  out) :: values(:,:)
      integer,  optional, intent(in   ) :: start(2)
      integer,  optional, intent(in   ) :: count(2)
      integer,  optional, intent(in   ) :: stride(2)
      integer,  optional, intent(in   ) :: map(2)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_get_var( ncId, varId, values, start, count, stride, map ) !2D_dp
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
   end subroutine netCDF_get_var_2D_dp
   !
   !   Routine: netCDF_put_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   !    Rank 2: netCDF_put_var_2D_dp
   !
   subroutine netCDF_put_var_2D_dp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_put_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(in   ) :: values(:,:)
      integer,  optional, intent(in   ) :: start(2)
      integer,  optional, intent(in   ) :: count(2)
      integer,  optional, intent(in   ) :: stride(2)
      integer,  optional, intent(in   ) :: map(2)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_put_var( ncId, varId, values, start, count, stride, map ) !2D_dp
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
   end subroutine netCDF_put_var_2D_dp   
   !
   !
   !   Routine: netCDF_get_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   !    Rank 3: netCDF_get_var_3D_dp
   !
   subroutine netCDF_get_var_3D_dp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_get_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(  out) :: values(:,:,:)
      integer,  optional, intent(in   ) :: start(3)
      integer,  optional, intent(in   ) :: count(3)
      integer,  optional, intent(in   ) :: stride(3)
      integer,  optional, intent(in   ) :: map(3)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_get_var( ncId, varId, values, start, count, stride, map ) !3D_dp
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
   end subroutine netCDF_get_var_3D_dp
   !
   !   Routine: netCDF_put_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   !    Rank 3: netCDF_put_var_3D_dp
   !
   subroutine netCDF_put_var_3D_dp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_put_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(in   ) :: values(:,:,:)
      integer,  optional, intent(in   ) :: start(3)
      integer,  optional, intent(in   ) :: count(3)
      integer,  optional, intent(in   ) :: stride(3)
      integer,  optional, intent(in   ) :: map(3)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_put_var( ncId, varId, values, start, count, stride, map ) !3D_dp
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
   end subroutine netCDF_put_var_3D_dp   
   !
   !
   !   Routine: netCDF_get_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   !    Rank 4: netCDF_get_var_4D_dp
   !
   subroutine netCDF_get_var_4D_dp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_get_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(  out) :: values(:,:,:,:)
      integer,  optional, intent(in   ) :: start(4)
      integer,  optional, intent(in   ) :: count(4)
      integer,  optional, intent(in   ) :: stride(4)
      integer,  optional, intent(in   ) :: map(4)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_get_var( ncId, varId, values, start, count, stride, map ) !4D_dp
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
   end subroutine netCDF_get_var_4D_dp
   !
   !   Routine: netCDF_put_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   !    Rank 4: netCDF_put_var_4D_dp
   !
   subroutine netCDF_put_var_4D_dp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_put_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(in   ) :: values(:,:,:,:)
      integer,  optional, intent(in   ) :: start(4)
      integer,  optional, intent(in   ) :: count(4)
      integer,  optional, intent(in   ) :: stride(4)
      integer,  optional, intent(in   ) :: map(4)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_put_var( ncId, varId, values, start, count, stride, map ) !4D_dp
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
   end subroutine netCDF_put_var_4D_dp   
   !
   !
   !   Routine: netCDF_get_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   !    Rank 5: netCDF_get_var_5D_dp
   !
   subroutine netCDF_get_var_5D_dp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_get_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(  out) :: values(:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(5)
      integer,  optional, intent(in   ) :: count(5)
      integer,  optional, intent(in   ) :: stride(5)
      integer,  optional, intent(in   ) :: map(5)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_get_var( ncId, varId, values, start, count, stride, map ) !5D_dp
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
   end subroutine netCDF_get_var_5D_dp
   !
   !   Routine: netCDF_put_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   !    Rank 5: netCDF_put_var_5D_dp
   !
   subroutine netCDF_put_var_5D_dp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_put_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(in   ) :: values(:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(5)
      integer,  optional, intent(in   ) :: count(5)
      integer,  optional, intent(in   ) :: stride(5)
      integer,  optional, intent(in   ) :: map(5)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_put_var( ncId, varId, values, start, count, stride, map ) !5D_dp
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
   end subroutine netCDF_put_var_5D_dp   
   !
   !
   !   Routine: netCDF_get_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   !    Rank 6: netCDF_get_var_6D_dp
   !
   subroutine netCDF_get_var_6D_dp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_get_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(  out) :: values(:,:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(6)
      integer,  optional, intent(in   ) :: count(6)
      integer,  optional, intent(in   ) :: stride(6)
      integer,  optional, intent(in   ) :: map(6)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_get_var( ncId, varId, values, start, count, stride, map ) !6D_dp
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
   end subroutine netCDF_get_var_6D_dp
   !
   !   Routine: netCDF_put_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   !    Rank 6: netCDF_put_var_6D_dp
   !
   subroutine netCDF_put_var_6D_dp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_put_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(in   ) :: values(:,:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(6)
      integer,  optional, intent(in   ) :: count(6)
      integer,  optional, intent(in   ) :: stride(6)
      integer,  optional, intent(in   ) :: map(6)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_put_var( ncId, varId, values, start, count, stride, map ) !6D_dp
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
   end subroutine netCDF_put_var_6D_dp   
   !
   !
   !   Routine: netCDF_get_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   !    Rank 7: netCDF_get_var_7D_dp
   !
   subroutine netCDF_get_var_7D_dp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_get_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(  out) :: values(:,:,:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(7)
      integer,  optional, intent(in   ) :: count(7)
      integer,  optional, intent(in   ) :: stride(7)
      integer,  optional, intent(in   ) :: map(7)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_get_var( ncId, varId, values, start, count, stride, map ) !7D_dp
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
   end subroutine netCDF_get_var_7D_dp
   !
   !   Routine: netCDF_put_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   !    Rank 7: netCDF_put_var_7D_dp
   !
   subroutine netCDF_put_var_7D_dp( ncId, varId, values, start, count, stride, map , ierr )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_put_var, nf90_strerror, nf90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(in   ) :: values(:,:,:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(7)
      integer,  optional, intent(in   ) :: count(7)
      integer,  optional, intent(in   ) :: stride(7)
      integer,  optional, intent(in   ) :: map(7)
      integer,  optional, intent(  out) :: ierr
      !
      integer :: ierr_
      !
      ierr_ = nf90_put_var( ncId, varId, values, start, count, stride, map ) !7D_dp
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
   end subroutine netCDF_put_var_7D_dp   
   !
   !
end module stdlib_L0_netcdf_variables
