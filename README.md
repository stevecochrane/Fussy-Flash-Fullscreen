Fussy Flash Fullscreen
======================

This is a container element for Flash games that is built specifically with pixel art in mind. The usual methods for fullscreen mode in Flash aren't ideal for pixel art because they scale up by inexact multiples and distort the art, or they apply antialiasing. This method scales up the game by an exact multiple (think Nearest Neighbor in Photoshop) as much as the viewer's display will allow, and no further. 

This is also designed to work well when run in the browser or standalone/projector mode. The F key toggles fullscreen by default and uses the "fullscreen interactive" mode introduced in Flash Player 11.3 which allows for keyboard input. If you're distributing as a standalone/projector and have no need for the hotkey you can easily disable it.

Here are some instructions for how to get set up:

1. Move FussyFlashFullscreen.as into your game's directory.

2. Since this will replace your game's object as the object that gets compiled, the SWF properties should be removed or commented out from the game object AS. For example with Flixel's [Mode](https://github.com/AdamAtomic/Mode) you would comment out the line starting with "[SWF" in Mode.as.

3. In FussyFlashFullscreen.as, change the SWF properties to match your game and follow the commented directions near the top for a few more changes. You shouldn't have to change anything below the variable declarations.

4. Change instances of 'FussyFlashFullscreen' and the file name to whatever your game is called.

5. Compile FussyFlashFullscreen.as (or whatever you renamed it to) and enjoy!

Feedback and questions are welcome: steve@stevecochrane.com