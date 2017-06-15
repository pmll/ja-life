; update life frame

; substitute these with correct address
neighbour_count: equ 0x00ED
world_bitmap: equ 0x01ED

screen: equ 9216
live_ch: equ 79
dead_ch: equ 32

;
; generate new world from screen to bitmap
;
ld hl, world_bitmap
push hl
ld hl, screen

ld c, 96

byte_loop:
ld b, 8

bit_loop:
call neighbour_count    ; neighbour count -> d

ld a, (hl)
and 11011111b           ; any none space/null character counts as a live cell
jr z, dead_cell

; live cell
ld a, d
cp 2
jr c, cell_dies
cp 4
jr nc, cell_dies
jr cell_lives

dead_cell:
; we have a dead cell
ld a, d
cp 3
jr nz, cell_dies

cell_lives:
scf
jr update_cell

cell_dies:
and a   ; clear carry

update_cell:
ex (sp), hl
rl (hl)
ex (sp), hl
inc hl
djnz bit_loop

ex (sp), hl
inc hl
ex (sp), hl
dec c
jr nz, byte_loop

pop hl

;
; copy bitmap to screen
;
ld de, world_bitmap
ld hl, screen
ld c, 96

byte_loop2:
ld b, 8
ld a, (de)

bit_loop2:
sla a
jr c, output_live_cell

; output a dead cell
ld (hl), dead_ch
jr cell_done

output_live_cell:
ld (hl), live_ch

cell_done:
inc hl
djnz bit_loop2

inc de
dec c
jr nz, byte_loop2

jp (iy)

