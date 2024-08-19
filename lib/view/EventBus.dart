class EventBus {
  static final EventBus _instance = EventBus._internal();

  factory EventBus() {
    return _instance;
  }

  EventBus._internal();

  final Map<String, List<void Function(dynamic sender)>> _listeners = {};

  void subscribe(String event, void Function(dynamic sender) callback) {
    if (_listeners[event] == null) {
      _listeners[event] = [];
    }
    _listeners[event]!.add(callback);
  }

  void unsubscribe(String event, void Function(dynamic sender) callback) {
    _listeners[event]?.remove(callback);
  }

  void dispatch(String event, dynamic sender) {
    if (_listeners[event] != null) {
      for (var callback in _listeners[event]!) {
        callback(sender);
      }
    }
  }
}
