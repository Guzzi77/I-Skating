using Toybox.Application;
using Toybox.WatchUi;
using Toybox.Position;
using Toybox.Sensor;
using Toybox.Attention;

class SkatingApp extends Application.AppBase {

	var controller;
	var activityView;
	var fitManager;

    function initialize() {
        System.println("SkatingApp initialize");
        AppBase.initialize();
        fitManager = new $.FitManager(); 
        activityView = new $.ActivityView();
        controller = new $.ActivityController();
    }

    function onStart(state) {
        System.println("SkatingApp onStart");        
        Sensor.enableSensorType(Sensor.SENSOR_TECHNOLOGY_BLE as Sensor.SensorType);
        Sensor.enableSensorType(Sensor.SENSOR_TECHNOLOGY_ANT as Sensor.SensorType);
        Sensor.enableSensorType(Sensor.SENSOR_FOOTPOD as Sensor.SensorType);
        Sensor.enableSensorType(Sensor.SENSOR_TECHNOLOGY_ONBOARD as Sensor.SensorType);
        Sensor.enableSensorEvents(method(:onSensor));
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
        System.println("SkatingApp onStop");
    }


    function onSensor(info) {
    }

    function getInitialView() {
        System.println("getInitialView Skating App");
        return [ new InitView(), new WatchUi.BehaviorDelegate() ];
    }

}
