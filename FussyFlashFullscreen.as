package {

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageDisplayState;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.events.KeyboardEvent;

    //  Change the following properties to match the game.
    [SWF(width='512',height='480', backgroundColor='#000000', frameRate='30')]

    public class FussyFlashFullscreen extends Sprite {

        //  baseContainerWidth and baseContainerHeight should be equal to the above SWF dimensions.
        public var baseContainerWidth:int = 512;
        public var baseContainerHeight:int = 480;
        //  This should match the scale of your game, e.g. if you display pixel art at 2x, set this to 2.
        public var baseScale:int = 2;
        //  The hotkey for fullscreen, defaults to 70 which is the F key. Note that standalone/projectors can 
        //  already use the Ctrl/Cmd + F key to toggle fullscreen. To disable this hotkey, set to -1.
        public var fullScreenKeyCode:int = 70;
        //  This is the object for your game. In Flixel this is what extends the FlxGame object and is 
        //  typically the AS object that you have compiled, until now.
        public var gameObject:TheGameObject = new TheGameObject();
        public var container:Sprite;

        public function FussyFlashFullscreen():void {

            //  Disable scaling in fullscreen by default. We'll do this manually later.
            stage.scaleMode = StageScaleMode.NO_SCALE;

            //  In fullscreen we'll start at top left and then add to the x and y values
            //  to manually center the container as needed.
            stage.align = StageAlign.TOP_LEFT;

            //  Add an event listener for fullscreen events.
            stage.addEventListener(Event.RESIZE, resizeHandler);
            stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);

            //  Make the container for the game.
            container = new Sprite();
            addChild(container);

            //  Add the game object to the container.
            container.addChild(gameObject);

        }

        public function resizeHandler(e:Event = null):void {
            fullscreenToggled();
        }

        public function keyDownHandler(e:KeyboardEvent = null):void {

            //  First check if the key pressed matches the fullscreen keyCode, ignore otherwise.
            if (e.keyCode == fullScreenKeyCode) {

                //  Switch into or out of fullscreen depending on the current state.
                if (stage.displayState == StageDisplayState.NORMAL) {
                    stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
                } else {
                    stage.displayState = StageDisplayState.NORMAL;
                }

                fullscreenToggled();
            }
        }

        public function fullscreenToggled():void {

            //  If we are now in fullscreen...
            if (stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE) {

                //  Scale the container as many times as the screen size will allow.
        		container.scaleX = Math.floor(stage.stageWidth / (baseContainerWidth / baseScale)) / 2;
        		container.scaleY = Math.floor(stage.stageHeight / (baseContainerHeight / baseScale)) / 2;

        		//  Then make sure both scale values are equal, using the lesser of the two.
        		if (container.scaleX < container.scaleY) {
            		container.scaleY = container.scaleX;
        		} else if (container.scaleX > container.scaleY) {
            		container.scaleX = container.scaleY;
        		}

        		//  Now, position the game in the center of the screen.
                container.x = (stage.stageWidth - (baseContainerWidth * container.scaleX)) / 2;
                container.y = (stage.stageHeight - (baseContainerHeight * container.scaleY)) / 2;

            } else {

                //  We're exiting fullscreen, so bring things back to normal.
                container.scaleX = 1;
                container.scaleY = 1;
                container.x = 0;
                container.y = 0;
 
           }
        }
    }
}