; apply vertical offset a to hl with wrap at screen start/end
; uses e

screen: equ 9216
screen_end: equ 9216 + 768

bit 7, a
jr nz, subtract
add l
ld l, a
jr nc, testwrap
inc h
jr testwrap

subtract:
neg
ld e, a
ld a, l
sub e
ld l, a
jr nc, testwrap
dec h

testwrap:

; is now < screen start? - we rely on the fact that screen is on a 256 boundary
ld a, h
cp screen / 256
jr nc, not_less

; add 768 to hl
add a, 3
ld h, a
jr done

not_less:
; is now > screen_end?
cp screen_end / 256
jr c, not_greater

; subtract 768 from hl
sub a, 3
ld h, a

not_greater:
done:
ret

