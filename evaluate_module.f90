module evaluate_module
    use, intrinsic :: iso_c_binding  ! C compatibility
    implicit none

contains

    subroutine evaluate(x, y, f)
        use moea_framework_module
        use, intrinsic :: iso_c_binding

        implicit none
        real(c_double), intent(in)  :: x, y      ! Input variables
        real(c_double), intent(out) :: f(:)      ! Output function value

        ! Parameters of the Gaussian function
        real(c_double), parameter :: A = 1.0       ! Amplitude
        real(c_double), parameter :: x0 = 0.0      ! Center in x
        real(c_double), parameter :: y0 = 0.0      ! Center in y
        real(c_double), parameter :: sigma_x = 1.0 ! Standard deviation in x
        real(c_double), parameter :: sigma_y = 1.0 ! Standard deviation in y

        ! Compute the Gaussian function
        f(1) = - A * exp( -((x - x0)**2 / (2.0 * sigma_x**2)) &
                    -((y - y0)**2 / (2.0 * sigma_y**2))  ) 
        ! Compute the second Gaussian function (translated and inverted)
        f(2) = - 2*A * exp( -((x - x0 + 1)**2 / (2.0 * sigma_x**2)) &
                    -((y - y0 + 1)**2 / (2.0 * sigma_y**2)) )

        ! Print the result
        ! print *, "f(x, y) =", f
    end subroutine evaluate

end module evaluate_module
