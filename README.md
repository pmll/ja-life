# ja-life

Conway's Game of Life for the unexpanded Jupiter Ace microcomputer.

This was inspired by a Youtube video of an existing version by Dutra de Lacerda.
As such, this is a pale imitation and does not add anything to the genre. Having
viewed the video, I got to thinking how it could be done. The unexpanded Jupiter
Ace does not allow programs of much more than 800 bytes and the full screen
requires 768 bytes, so it would be impossible to use a straight forward array to
hold the state of the grid. The next most obvious thing to do is to reduce the
size of the array by storing the grid as a bitmap. However, I thought I had a
better way which was to take advantage of the user defined graphics to create
different versions of the live and dead cells thus hiding information about the
cell state in the previous frame. That way, the screen can be updated in place
by scanning the screen and using the previous state of neighbour cells behind
the cursor and the current state of those ahead of the cursor. This idea worked
but the result was not satisfying as the update process was slow enough to be
able to see it working its way down the screen. The Youtube video updated the
screen in a very pleasing way. So, back to plan A, which is to generate a new
version of the grid to a bitmap and then reveal it to the screen in a "Ta-da!"
moment. As luck would have it, I have made the generation of the new grid
inefficient enough so as to leave a decent pause between each reveal.

The file forth/life.ja4 is all that is required for the game. The asm folder
contains the source for the machine code sections in the forth file.

There are two ways to run it. Use the word "gen-life" to automatically generate
a starting position. Use "des-life" to manually design the starting position.
In design mode; the "h", "j", "k", and "l" keys move the cursor; space
toggles a cell on or off and "s" starts proceedings once the design is
complete.

