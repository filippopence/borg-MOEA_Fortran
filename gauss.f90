program gaussian_3d
    use moea_framework_module                                          ! MOEA framework interface
    use evaluate_module                  
    implicit none

    integer(c_int) :: status
    integer(c_int), parameter :: nvars = 2                             ! Number of variables  (x, y)
    integer(c_int), parameter :: nobjs = 2                             ! Number of objectives (f)
    real(c_double) :: vars(nvars)                                      ! Array to store input variables
    real(c_double), target :: objs(nobjs)                              ! Array to store function output
    real(c_double), pointer :: constrains(:) => null()                 ! Array to store function output
    type(c_ptr) :: objs_cptr                                           ! C compatible pointer 


    status = MOEA_Init(nobjs, 0)
    do while (MOEA_Next_solution() == MOEA_SUCCESS)
        call MOEA_Read_doubles(nvars, vars)
        call evaluate(vars(1), vars(2), objs)

        ! We need to convert our vector into a pointer
        objs_cptr = c_loc(objs)

        call MOEA_Write(objs_cptr, constrains)
    end do

    call MOEA_Terminate()

end program gaussian_3d