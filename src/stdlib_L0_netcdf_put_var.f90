!
! Level 0 NetCDF wrappers: No checks are performed, except
!                          the error check on exit
!
submodule (stdlib_netcdf) stdlib_L0_netcdf_put_var

    implicit none
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

contains 

   !
   !   Routine: netCDF_put_var_XD_sp
   ! Precision: sp
   !      Type: real(sp)
   ! 
   !    Rank 0: netCDF_put_var_0D_sp
   !
   subroutine netCDF_put_var_0D_sp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_put_var, f90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(in   ) :: values
      integer,  optional, intent(in   ) :: start     
      integer,  optional, intent(in   ) :: count
      integer,  optional, intent(in   ) :: stride
      integer,  optional, intent(in   ) :: map
      !
      integer :: ierr
      !
      ierr = nf90_put_var( ncId, varId, values, start, count, stride, map)
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_put_var_0D_sp
   !
   !    Rank 1: netCDF_put_var_1D_sp
   !
   subroutine netCDF_put_var_1D_sp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_put_var, f90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(in   ) :: values(:)
      integer,  optional, intent(in   ) :: start(1)     
      integer,  optional, intent(in   ) :: count(1)
      integer,  optional, intent(in   ) :: stride(1)
      integer,  optional, intent(in   ) :: map(1)
      !
      integer :: ierr
      !
      ierr = nf90_put_var( ncId, varId, values, start, count, stride, map)
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_put_var_1D_sp
   !
   !    Rank 2: netCDF_put_var_2D_sp
   !
   subroutine netCDF_put_var_2D_sp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_put_var, f90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(in   ) :: values(:,:)
      integer,  optional, intent(in   ) :: start(2)     
      integer,  optional, intent(in   ) :: count(2)
      integer,  optional, intent(in   ) :: stride(2)
      integer,  optional, intent(in   ) :: map(2)
      !
      integer :: ierr
      !
      ierr = nf90_put_var( ncId, varId, values, start, count, stride, map)
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_put_var_2D_sp
   !
   !    Rank 3: netCDF_put_var_3D_sp
   !
   subroutine netCDF_put_var_3D_sp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_put_var, f90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(in   ) :: values(:,:,:)
      integer,  optional, intent(in   ) :: start(3)     
      integer,  optional, intent(in   ) :: count(3)
      integer,  optional, intent(in   ) :: stride(3)
      integer,  optional, intent(in   ) :: map(3)
      !
      integer :: ierr
      !
      ierr = nf90_put_var( ncId, varId, values, start, count, stride, map)
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_put_var_3D_sp
   !
   !    Rank 4: netCDF_put_var_4D_sp
   !
   subroutine netCDF_put_var_4D_sp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_put_var, f90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(in   ) :: values(:,:,:,:)
      integer,  optional, intent(in   ) :: start(4)     
      integer,  optional, intent(in   ) :: count(4)
      integer,  optional, intent(in   ) :: stride(4)
      integer,  optional, intent(in   ) :: map(4)
      !
      integer :: ierr
      !
      ierr = nf90_put_var( ncId, varId, values, start, count, stride, map)
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_put_var_4D_sp
   !
   !    Rank 5: netCDF_put_var_5D_sp
   !
   subroutine netCDF_put_var_5D_sp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_put_var, f90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(in   ) :: values(:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(5)     
      integer,  optional, intent(in   ) :: count(5)
      integer,  optional, intent(in   ) :: stride(5)
      integer,  optional, intent(in   ) :: map(5)
      !
      integer :: ierr
      !
      ierr = nf90_put_var( ncId, varId, values, start, count, stride, map)
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_put_var_5D_sp
   !
   !    Rank 6: netCDF_put_var_6D_sp
   !
   subroutine netCDF_put_var_6D_sp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_put_var, f90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(in   ) :: values(:,:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(6)     
      integer,  optional, intent(in   ) :: count(6)
      integer,  optional, intent(in   ) :: stride(6)
      integer,  optional, intent(in   ) :: map(6)
      !
      integer :: ierr
      !
      ierr = nf90_put_var( ncId, varId, values, start, count, stride, map)
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_put_var_6D_sp
   !
   !    Rank 7: netCDF_put_var_7D_sp
   !
   subroutine netCDF_put_var_7D_sp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: sp
      USE netcdf, only: nf90_put_var, f90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(sp),           intent(in   ) :: values(:,:,:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(7)     
      integer,  optional, intent(in   ) :: count(7)
      integer,  optional, intent(in   ) :: stride(7)
      integer,  optional, intent(in   ) :: map(7)
      !
      integer :: ierr
      !
      ierr = nf90_put_var( ncId, varId, values, start, count, stride, map)
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_put_var_7D_sp
   !
   !
   !   Routine: netCDF_put_var_XD_dp
   ! Precision: dp
   !      Type: real(dp)
   ! 
   !    Rank 0: netCDF_put_var_0D_dp
   !
   subroutine netCDF_put_var_0D_dp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_put_var, f90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(in   ) :: values
      integer,  optional, intent(in   ) :: start     
      integer,  optional, intent(in   ) :: count
      integer,  optional, intent(in   ) :: stride
      integer,  optional, intent(in   ) :: map
      !
      integer :: ierr
      !
      ierr = nf90_put_var( ncId, varId, values, start, count, stride, map)
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_put_var_0D_dp
   !
   !    Rank 1: netCDF_put_var_1D_dp
   !
   subroutine netCDF_put_var_1D_dp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_put_var, f90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(in   ) :: values(:)
      integer,  optional, intent(in   ) :: start(1)     
      integer,  optional, intent(in   ) :: count(1)
      integer,  optional, intent(in   ) :: stride(1)
      integer,  optional, intent(in   ) :: map(1)
      !
      integer :: ierr
      !
      ierr = nf90_put_var( ncId, varId, values, start, count, stride, map)
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_put_var_1D_dp
   !
   !    Rank 2: netCDF_put_var_2D_dp
   !
   subroutine netCDF_put_var_2D_dp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_put_var, f90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(in   ) :: values(:,:)
      integer,  optional, intent(in   ) :: start(2)     
      integer,  optional, intent(in   ) :: count(2)
      integer,  optional, intent(in   ) :: stride(2)
      integer,  optional, intent(in   ) :: map(2)
      !
      integer :: ierr
      !
      ierr = nf90_put_var( ncId, varId, values, start, count, stride, map)
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_put_var_2D_dp
   !
   !    Rank 3: netCDF_put_var_3D_dp
   !
   subroutine netCDF_put_var_3D_dp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_put_var, f90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(in   ) :: values(:,:,:)
      integer,  optional, intent(in   ) :: start(3)     
      integer,  optional, intent(in   ) :: count(3)
      integer,  optional, intent(in   ) :: stride(3)
      integer,  optional, intent(in   ) :: map(3)
      !
      integer :: ierr
      !
      ierr = nf90_put_var( ncId, varId, values, start, count, stride, map)
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_put_var_3D_dp
   !
   !    Rank 4: netCDF_put_var_4D_dp
   !
   subroutine netCDF_put_var_4D_dp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_put_var, f90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(in   ) :: values(:,:,:,:)
      integer,  optional, intent(in   ) :: start(4)     
      integer,  optional, intent(in   ) :: count(4)
      integer,  optional, intent(in   ) :: stride(4)
      integer,  optional, intent(in   ) :: map(4)
      !
      integer :: ierr
      !
      ierr = nf90_put_var( ncId, varId, values, start, count, stride, map)
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_put_var_4D_dp
   !
   !    Rank 5: netCDF_put_var_5D_dp
   !
   subroutine netCDF_put_var_5D_dp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_put_var, f90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(in   ) :: values(:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(5)     
      integer,  optional, intent(in   ) :: count(5)
      integer,  optional, intent(in   ) :: stride(5)
      integer,  optional, intent(in   ) :: map(5)
      !
      integer :: ierr
      !
      ierr = nf90_put_var( ncId, varId, values, start, count, stride, map)
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_put_var_5D_dp
   !
   !    Rank 6: netCDF_put_var_6D_dp
   !
   subroutine netCDF_put_var_6D_dp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_put_var, f90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(in   ) :: values(:,:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(6)     
      integer,  optional, intent(in   ) :: count(6)
      integer,  optional, intent(in   ) :: stride(6)
      integer,  optional, intent(in   ) :: map(6)
      !
      integer :: ierr
      !
      ierr = nf90_put_var( ncId, varId, values, start, count, stride, map)
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_put_var_6D_dp
   !
   !    Rank 7: netCDF_put_var_7D_dp
   !
   subroutine netCDF_put_var_7D_dp( ncId, varId, values, start, count, stride, map )
      USE stdlib_kinds, only: dp
      USE netcdf, only: nf90_put_var, f90_NoErr
      !
      integer,            intent(in   ) :: ncID
      integer,            intent(in   ) :: varID
      real(dp),           intent(in   ) :: values(:,:,:,:,:,:,:)
      integer,  optional, intent(in   ) :: start(7)     
      integer,  optional, intent(in   ) :: count(7)
      integer,  optional, intent(in   ) :: stride(7)
      integer,  optional, intent(in   ) :: map(7)
      !
      integer :: ierr
      !
      ierr = nf90_put_var( ncId, varId, values, start, count, stride, map)
      if ( ierr /= f90_NoErr ) ERROR STOP
      !
   end subroutine netCDF_put_var_7D_dp
   !
   !
end submodule stdlib_L0_netcdf_put_var
