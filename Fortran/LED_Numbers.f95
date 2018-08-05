program LED_Numbers

  implicit none

  character(100) :: num
  integer :: leng 
  integer, dimension(:), allocatable :: nums
  integer i, j, x, lenled
  integer :: allst
  character(15), dimension(10) :: leds
  character(:), allocatable :: led1
  character(:), allocatable :: led2
  character(:), allocatable :: led3
  character(:), allocatable :: text
  character(:), allocatable :: concat
  
  leds(1) = " _  ,| | ,|_| ,"
  leds(2) = "  ,| ,| ,"
  leds(3) = " _  , _| ,|_  ,"
  leds(4) = "_  ,_| ,_| ,"
  leds(5) = "    ,|_| ,  | ,"
  leds(6) = " _  ,|_  , _| ,"
  leds(7) = " _  ,|_  ,|_| ,"
  leds(8) = "_   , |  , |  ,"
  leds(9) = " _  ,|_| ,|_| ,"
  leds(10) = " _  ,|_| , _| ,"
  
  led1 = ""
  led2 = ""
  led3 = ""
  
  write(*,'(a)',advance="no") "Enter a number: "
  read(*,*) num
  
  leng = LEN(TRIM(num))
  allocate(nums(leng), stat=allst)
 
  nums = get_digits(trim(num))
  concat = ""
	
  do i = 1, leng
    x = 1
    text = trim(leds(nums(i) + 1))
    lenled = len(trim(text))
    
    do j = 1, lenled
      if(text(j:j) /= ",") then
        concat = concat // text(j:j)
      else
        select case (x)
          case (1)
            led1 = led1 // concat
          case (2)
            led2 = led2 // concat
          case (3)
            led3 = led3 // concat
        end select
        concat = ""
        x = x + 1
      end if
    end do
  end do

  write(*,*) led1
  write(*,*) led2
  write(*,*) led3
  
  contains
  
    function get_digits(num)

      character(100):: num
      integer :: allst
      integer :: numslide
      integer :: leng
      integer :: cvtErr
      integer :: i
 
      integer, dimension(:), allocatable :: get_digits
 
      leng = len(trim(num))
      allocate(get_digits(leng), stat=allst)
 
      do i = 1, leng
        read(num(i:i), * ,iostat=cvtErr) numslide
        get_digits(i) = numslide
      end do 
  
      return
  
    end function get_digits
  
end program LED_Numbers
