; neighbour count -> a
; input: screen address in hl
; uses de

; substitute these with correct addresses
apply_horiz_offset: equ 0x00ED
apply_vert_offset: equ 0x01ED
test_neighbour: equ 0x02ED

push hl

; reset d which will contain neighbour count
ld d, 0

ld a, 1
call apply_horiz_offset
call test_neighbour
ld a, -2
call apply_horiz_offset
call test_neighbour
ld a, -32
call apply_vert_offset
call test_neighbour
ld a, 1
call apply_horiz_offset
call test_neighbour
ld a, 1
call apply_horiz_offset
call test_neighbour
ld a, 64
call apply_vert_offset
call test_neighbour
ld a, -1
call apply_horiz_offset
call test_neighbour
ld a, -1
call apply_horiz_offset
call test_neighbour

pop hl
ret

