using Toybox.WatchUi;
using Toybox.Graphics;

class InitView extends WatchUi.View {

	hidden var initImage;

    function initialize() {
        View.initialize();
    }
    
    function onLayout(dc) {
    	var xPos = (dc.getWidth() - 170) / 2;
    	var yPos = (dc.getHeight() - 170) / 2;
        initImage = new WatchUi.Bitmap({
            :rezId=>Rez.Drawables.InlineSkater,
            :locX=>xPos,
            :locY=>yPos
        });
    }

    function onUpdate(dc) {
    	dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_WHITE);
    	dc.clear();
        initImage.draw(dc);
    }

}