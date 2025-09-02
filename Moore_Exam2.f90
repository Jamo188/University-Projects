program Moore_Exam2
implicit none

!    ---This is the declaration section--

real, dimension(4) :: uWind  !Array for the read in u-wind values
real, dimension(4) :: vWind  !Array for the read in v-wind values

integer :: IUnit = 10
! Values for wind speed difference between 0-1, 0-3, and 0-6 respectively for uWind.
real :: uShear1km            
real :: uShear3km
real :: uShear6km

! Values for wind speed difference between 0-1, 0-3, and 0-6 respectively for vWind.
real :: vShear1km
real :: vShear3km
real :: vShear6km

! Values for total vertical wind shear between 0-1, 0-3, and 0-6 respectively.
real :: totalShear1km
real :: totalShear3km
real :: totalShear6km

!    ---This is the execution section---

! The program opens or creates a file named 'OutputExam2.txt' and designates it as an output file that the program will write to. The file is given the unit number 20.
open (UNIT=IUnit, FILE='OutputExam2.txt', STATUS='unknown', ACTION='write')

! Program asks for each u-wind and v-wind values at the four different heights.
write(*,*) 'Enter in the u-wind and v-wind values at a height of 0m'
read(*,*) uWind(1), vWind(1)  !The 1 in the array represents the surface.
write(*,*) 'Enter in the u-wind and v-wind values at a height of 1000m'
read(*,*) uWind(2), vWind(2)  !The 2 in the array represents the height of 1000m.
write(*,*) 'Enter in the u-wind and v-wind values at a height of 3000m'
read(*,*) uWind(3), vWind(3)  !The 3 in the array represents the height of 3000m.
write(*,*) 'Enter in the u-wind and v-wind values at a height of 6000m'
read(*,*) uWind(4), vWind(4)  !The 4 in the array represents the height of 6000m.

! Equations for u-shear and v-shear from 0 to 1 km
uShear1km = (uWind(2) - uWind(1))  !1000m winds minus surface winds
vShear1km = (vWind(2) - vWind(1))

! Equations for u-shear and v-shear from 0 to 3 km
uShear3km = (uWind(3) - uWind(1))  !3000m winds minus surface winds
vShear3km = (vWind(3) - vWind(1))

! Equations for u-shear and v-shear from 0 to 6 km
uShear6km = (uWind(4) - uWind(1))  !6000m winds minus surface winds
vShear6km = (vWind(4) - vWind(1))

! Equations to find the magnitude of the wind shear vectors between 0-1, 0-3, and 0-6 respectively.
totalShear1km = (((uShear1km ** 2) + (vShear1km ** 2)) ** 0.5)  !0-1km u-shear squared plus 0-1km v-shear squared all square rooted (to the power of 0.5)
totalShear3km = (((uShear3km ** 2) + (vShear3km ** 2)) ** 0.5)  !0-3km u-shear squared plus 0-3km v-shear squared all square rooted (to the power of 0.5)
totalShear6km = (((uShear6km ** 2) + (vShear6km ** 2)) ** 0.5)  !0-6km u-shear squared plus 0-6km v-shear squared all square rooted (to the power of 0.5)

! The program writes out the wind shear vectors between 0-1, 0-3, and 0-6 respectively to the output file in a neatly formatted statement.
write(20,*)
write(20,200) '0-1 km vertical wind sheer:', totalShear1km, 'm/s'
write(20,200) '0-3 km vertical wind sheer:', totalShear3km, 'm/s'
write(20,200) '0-6 km vertical wind sheer:', totalShear6km, 'm/s'
200 format (A27, 1x, F5.2, 1x, A3)

! The program also writes this brief description of vertical wind shear to the output file.
write(20,*)
write(20,*) 'Vertical wind shear is the difference between the speed of the wind at two different altitudes.'

close(UNIT=20)  !Program closes the output file

!    ---This is the termination section---

end program