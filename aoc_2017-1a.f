
!     Advent of Code 2017 Day 1 Part 1

      PROGRAM  aoc_2017_1a
      IMPLICIT  NONE

      INTEGER :: io, status, ic
      INTEGER :: match = 0 ! game results
      CHARACTER :: c, prev_c = '_', first_c ! char, previous char
      LOGICAL :: firsr_char_sem = .FALSE.

      OPEN(NEWUNIT=io,FILE="aoc_2017-1.dat",STATUS="OLD",ACTION="READ")
      DO
         CALL FGETC(io, c, status)
 
         IF (status .NE. 0) EXIT
         IF (prev_c .EQ. c) THEN
            READ(c, "(I1)") ic ! convert to integer
            match = match + ic
         ENDIF
         IF (prev_c .EQ. '_') THEN
            first_c = c
         ENDIF
         IF (c .GE. '0' .AND. c .LE. '9') THEN ! There's some
            prev_c = c ! ... garbage characters at the end of the 
         ENDIF         ! ... file
      END DO
 
      IF (first_c .EQ. prev_c) THEN ! check the wrap-around
         READ(first_c, "(I1)") ic
         match = match + ic
      ENDIF
      CLOSE(io)

      WRITE(*,*) "Elves' game result: ", match
 
      END PROGRAM  aoc_2017_1a
