import 'dart:js_interop';

extension type AudioContext._(JSObject _jsObject) implements JSObject {
  external AudioContext();
  external num get currentTime;
  external OscillatorNode createOscillator();
  external AudioDestinationNode get destination;
  external JSPromise resume();
  external JSPromise suspend();
  external JSPromise close();
  external String get state;
}

extension type OscillatorNode(JSObject _jsObject) implements JSObject {
  external set type(String value);
  external AudioParam get frequency;
  external void connect(AudioDestinationNode destination);
  external void start([num when]);
  external void stop([num when]);
}

extension type AudioParam(JSObject _jsObject) implements JSObject {
  external void setValueAtTime(num value, num startTime);
}

extension type AudioDestinationNode(JSObject _jsObject) implements JSObject {}
