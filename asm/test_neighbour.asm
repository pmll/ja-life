; test neighbour
; test hl for a live cell

ld a, (hl)
and 11011111b           ; any none space/null character counts as a live cell
jr z, done

inc d

done:
ret

