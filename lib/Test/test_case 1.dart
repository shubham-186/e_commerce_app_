/*
class MyBloc extends Bloc<MyEvent, MyState> {
  MyBloc() : super(InitialState()) {
    on<EventA>((event, emit) => _handleCommonLogic(event, emit));
    on<EventB>((event, emit) => _handleCommonLogic(event, emit));
  }

  void _handleCommonLogic(MyEvent event, Emitter<MyState> emit) {
    // Common logic for emitting states based on different events
    if (event is EventA) {
      emit(StateForEventA());
    } else if (event is EventB) {
      emit(StateForEventB());
    }
    // ... other common state emission logic
  }
}*/
