using Toybox.WatchUi;
using Toybox.Graphics;

class ChooseSportMenuDelegate extends WatchUi.MenuInputDelegate {

	hidden var _fitManager;
	hidden var _controller;

    function initialize() {
        System.println("initialize ChooseSportMenuDelegate");
        MenuInputDelegate.initialize();
        _fitManager = Application.getApp().fitManager;
        _controller = Application.getApp().controller;
    }

    function onMenuItem(item) {
        if (item == :iceSkating) {
            _fitManager.sportType = ActivityRecording.SPORT_ICE_SKATING;
        }
        _controller.chooseSportAndShowDataFields();
    }

}