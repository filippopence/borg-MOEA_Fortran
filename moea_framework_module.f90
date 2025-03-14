module moea_framework_module
  use, intrinsic :: iso_c_binding
  implicit none
  public :: MOEA_Init, MOEA_Next_solution, MOEA_Read_doubles, MOEA_Write, MOEA_Terminate, MOEA_SUCCESS

  
  integer, parameter :: MOEA_SUCCESS = 0
  integer, parameter :: MOEA_EOF = 1
  integer, parameter :: MOEA_PARSE_NO_SOLUTION = 2
  integer, parameter :: MOEA_PARSE_EOL = 3
  integer, parameter :: MOEA_PARSE_DOUBLE_ERROR = 4
  integer, parameter :: MOEA_PARSE_BINARY_ERROR = 5
  integer, parameter :: MOEA_PARSE_PERMUTATION_ERROR = 6
  integer, parameter :: MOEA_MALLOC_ERROR = 7
  integer, parameter :: MOEA_NULL_POINTER_ERROR = 8
  integer, parameter :: MOEA_SOCKET_ERROR = 9

 
  interface
    function MOEA_Init(objectives, constraints) bind(C, name="MOEA_Init")
      import :: c_int
      integer(c_int), value :: objectives, constraints
      integer(c_int) :: MOEA_Init
    end function MOEA_Init

    function MOEA_Next_solution() bind(C, name="MOEA_Next_solution")
      import :: c_int
      integer(c_int) :: MOEA_Next_solution
    end function MOEA_Next_solution

    subroutine MOEA_Read_doubles(size, values) bind(C, name="MOEA_Read_doubles")
      import :: c_int, c_double
      integer(c_int), value :: size
      real(c_double), intent(out) :: values(size)
    end subroutine MOEA_Read_doubles 

    subroutine MOEA_Write(objectives, constraints) bind(C, name="MOEA_Write")
      use, intrinsic :: iso_c_binding
      type(c_ptr), value           :: objectives
      real(c_double), intent(in), optional :: constraints(:)
    end subroutine MOEA_Write

    subroutine MOEA_Terminate() bind(C, name="MOEA_Terminate")
      import :: c_int
    end subroutine MOEA_Terminate
  end interface

end module moea_framework_module
