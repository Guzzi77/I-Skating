using Toybox.WatchUi;
using Toybox.ActivityRecording;
using Toybox.Activity;
using Toybox.FitContributor;

class SkatingDelegate  extends WatchUi.InputDelegate {		

	hidden var _controller;

    function initialize() {
        System.println("initialize SkatingDelegate");
        BehaviorDelegate.initialize();
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
				System.println("onBack SkatingDelegate");
				if (Toybox has :ActivityRecording) {                          // check device for activity recording
					_controller.handleLap();
				}
				else {
					// This product doesn't\nhave FIT Support
				}
				return true;   
			} 
			default: return true;
		}
    }

	// function onPreviousPage() {
	// 	_controller.handlePageSwitch(-1);
	// }
	
	// function onNextPage() {
	// 	_controller.handlePageSwitch(1);
	// }

}