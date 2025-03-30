!
! Level 0 NetCDF wrappers: No checks are performed, except
!                          the error check on exit
!
module stdlib_L0_netcdf_get_var

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

contains 

   !
   !   Routine: netCDF_get_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   ! 
   !    Rank 0: netCDF_get_var_0D_sp
   !
   subroutine netCDF_get_var_0D_sp( ncId, varId, values)
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_get_var
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(  out) :: values
      !
      integer :: ierr
      !
      ierr = nf90_get_var( ncId, varId, values) !0D_sp
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_get_var_0D_sp
   !
   !    Rank 1: netCDF_get_var_1D_sp
   !
   subroutine netCDF_get_var_1D_sp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_get_var
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(  out) :: values(:)
      integer,  optional, intent(in   ) :: start(1)
      integer,  optional, intent(in   ) :: count(1)
      integer,  optional, intent(in   ) :: stride(1)
      integer,  optional, intent(in   ) :: map(1)
      !
      integer :: ierr
      !
      ierr = nf90_get_var( ncId, varId, values, start, count, stride, map ) !1D_sp
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_get_var_1D_sp
   !
   !    Rank 2: netCDF_get_var_2D_sp
   !
   subroutine netCDF_get_var_2D_sp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_get_var
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(  out) :: values(:,:)
      integer,  optional, intent(in   ) :: start(2)
      integer,  optional, intent(in   ) :: count(2)
      integer,  optional, intent(in   ) :: stride(2)
      integer,  optional, intent(in   ) :: map(2)
      !
      integer :: ierr
      !
      ierr = nf90_get_var( ncId, varId, values, start, count, stride, map ) !2D_sp
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_get_var_2D_sp
   !
   !    Rank 3: netCDF_get_var_3D_sp
   !
   subroutine netCDF_get_var_3D_sp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_get_var
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(  out) :: values(:,:,:)
      integer,  optional, intent(in   ) :: start(3)
      integer,  optional, intent(in   ) :: count(3)
      integer,  optional, intent(in   ) :: stride(3)
      integer,  optional, intent(in   ) :: map(3)
      !
      integer :: ierr
      !
      ierr = nf90_get_var( ncId, varId, values, start, count, stride, map ) !3D_sp
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_get_var_3D_sp
   !
   !    Rank 4: netCDF_get_var_4D_sp
   !
   subroutine netCDF_get_var_4D_sp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_get_var
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(  out) :: values(:,:,:,:)
      integer,  optional, intent(in   ) :: start(4)
      integer,  optional, intent(in   ) :: count(4)
      integer,  optional, intent(in   ) :: stride(4)
      integer,  optional, intent(in   ) :: map(4)
      !
      integer :: ierr
      !
      ierr = nf90_get_var( ncId, varId, values, start, count, stride, map ) !4D_sp
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_get_var_4D_sp
   !
   !    Rank 5: netCDF_get_var_5D_sp
   !
   subroutine netCDF_get_var_5D_sp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_get_var
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(  out) :: values(:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(5)
      integer,  optional, intent(in   ) :: count(5)
      integer,  optional, intent(in   ) :: stride(5)
      integer,  optional, intent(in   ) :: map(5)
      !
      integer :: ierr
      !
      ierr = nf90_get_var( ncId, varId, values, start, count, stride, map ) !5D_sp
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_get_var_5D_sp
   !
   !    Rank 6: netCDF_get_var_6D_sp
   !
   subroutine netCDF_get_var_6D_sp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_get_var
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(  out) :: values(:,:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(6)
      integer,  optional, intent(in   ) :: count(6)
      integer,  optional, intent(in   ) :: stride(6)
      integer,  optional, intent(in   ) :: map(6)
      !
      integer :: ierr
      !
      ierr = nf90_get_var( ncId, varId, values, start, count, stride, map ) !6D_sp
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_get_var_6D_sp
   !
   !    Rank 7: netCDF_get_var_7D_sp
   !
   subroutine netCDF_get_var_7D_sp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_get_var
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(  out) :: values(:,:,:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(7)
      integer,  optional, intent(in   ) :: count(7)
      integer,  optional, intent(in   ) :: stride(7)
      integer,  optional, intent(in   ) :: map(7)
      !
      integer :: ierr
      !
      ierr = nf90_get_var( ncId, varId, values, start, count, stride, map ) !7D_sp
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_get_var_7D_sp
   !
   !
   !   Routine: netCDF_get_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   ! 
   !    Rank 0: netCDF_get_var_0D_dp
   !
   subroutine netCDF_get_var_0D_dp( ncId, varId, values)
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_get_var
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(  out) :: values
      !
      integer :: ierr
      !
      ierr = nf90_get_var( ncId, varId, values) !0D_dp
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_get_var_0D_dp
   !
   !    Rank 1: netCDF_get_var_1D_dp
   !
   subroutine netCDF_get_var_1D_dp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_get_var
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(  out) :: values(:)
      integer,  optional, intent(in   ) :: start(1)
      integer,  optional, intent(in   ) :: count(1)
      integer,  optional, intent(in   ) :: stride(1)
      integer,  optional, intent(in   ) :: map(1)
      !
      integer :: ierr
      !
      ierr = nf90_get_var( ncId, varId, values, start, count, stride, map ) !1D_dp
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_get_var_1D_dp
   !
   !    Rank 2: netCDF_get_var_2D_dp
   !
   subroutine netCDF_get_var_2D_dp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_get_var
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(  out) :: values(:,:)
      integer,  optional, intent(in   ) :: start(2)
      integer,  optional, intent(in   ) :: count(2)
      integer,  optional, intent(in   ) :: stride(2)
      integer,  optional, intent(in   ) :: map(2)
      !
      integer :: ierr
      !
      ierr = nf90_get_var( ncId, varId, values, start, count, stride, map ) !2D_dp
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_get_var_2D_dp
   !
   !    Rank 3: netCDF_get_var_3D_dp
   !
   subroutine netCDF_get_var_3D_dp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_get_var
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(  out) :: values(:,:,:)
      integer,  optional, intent(in   ) :: start(3)
      integer,  optional, intent(in   ) :: count(3)
      integer,  optional, intent(in   ) :: stride(3)
      integer,  optional, intent(in   ) :: map(3)
      !
      integer :: ierr
      !
      ierr = nf90_get_var( ncId, varId, values, start, count, stride, map ) !3D_dp
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_get_var_3D_dp
   !
   !    Rank 4: netCDF_get_var_4D_dp
   !
   subroutine netCDF_get_var_4D_dp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_get_var
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(  out) :: values(:,:,:,:)
      integer,  optional, intent(in   ) :: start(4)
      integer,  optional, intent(in   ) :: count(4)
      integer,  optional, intent(in   ) :: stride(4)
      integer,  optional, intent(in   ) :: map(4)
      !
      integer :: ierr
      !
      ierr = nf90_get_var( ncId, varId, values, start, count, stride, map ) !4D_dp
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_get_var_4D_dp
   !
   !    Rank 5: netCDF_get_var_5D_dp
   !
   subroutine netCDF_get_var_5D_dp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_get_var
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(  out) :: values(:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(5)
      integer,  optional, intent(in   ) :: count(5)
      integer,  optional, intent(in   ) :: stride(5)
      integer,  optional, intent(in   ) :: map(5)
      !
      integer :: ierr
      !
      ierr = nf90_get_var( ncId, varId, values, start, count, stride, map ) !5D_dp
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_get_var_5D_dp
   !
   !    Rank 6: netCDF_get_var_6D_dp
   !
   subroutine netCDF_get_var_6D_dp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_get_var
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(  out) :: values(:,:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(6)
      integer,  optional, intent(in   ) :: count(6)
      integer,  optional, intent(in   ) :: stride(6)
      integer,  optional, intent(in   ) :: map(6)
      !
      integer :: ierr
      !
      ierr = nf90_get_var( ncId, varId, values, start, count, stride, map ) !6D_dp
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_get_var_6D_dp
   !
   !    Rank 7: netCDF_get_var_7D_dp
   !
   subroutine netCDF_get_var_7D_dp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_get_var
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(  out) :: values(:,:,:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(7)
      integer,  optional, intent(in   ) :: count(7)
      integer,  optional, intent(in   ) :: stride(7)
      integer,  optional, intent(in   ) :: map(7)
      !
      integer :: ierr
      !
      ierr = nf90_get_var( ncId, varId, values, start, count, stride, map ) !7D_dp
      if ( ierr /= 0 ) ERROR STOP
      !
   end subroutine netCDF_get_var_7D_dp
   !
   !
end module stdlib_L0_netcdf_get_var
