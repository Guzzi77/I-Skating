using Toybox.WatchUi;
using Toybox.ActivityRecording;
using Toybox.Activity;
using Toybox.FitContributor;

class ActivityDelegate extends WatchUi.InputDelegate {		

	hidden var _controller;

    function initialize() {
        System.println("initialize ActivityDelegate");
        InputDelegate.initialize();
        _controller = Application.getApp().controller;
    }

	function onKey(keyEvent) {
        System.println(keyEvent.getKey());
		switch (keyEvent.getKey()) {
			case 4:
			case 7: { // ENTER, MENU
				_controller.handleStartStop();
				return true;
			}
			case 5:
			case 19:
			case 20: { // ESC, LAP, RESET
				System.println("onBack ActivityDelegate");
				if (Toybox has :ActivityRecording) {                          // check device for activity recording
					_controller.handleLap();
				}
				return true;   
			} 
			default: return true;
		}
    }

    function onSwipe(swipeEvent) {
		switch (swipeEvent.getDirection()) {
			case 0: {
				_controller.handlePageSwitch(-1);
				return true;
			}
			case 2: {
				_controller.handlePageSwitch(1);
				return true;
			}
			default: return true;
		}
    }

}