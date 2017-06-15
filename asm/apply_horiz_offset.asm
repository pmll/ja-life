; with wrap around at 32 boundary, apply horizontal offset a to hl
; uses e
add a, l
and 11111b
ld e, a
ld a, l
and 11100000b
or e
ld l, a
ret

