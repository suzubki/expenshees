import 'package:bloc/bloc.dart';
import 'logger.dart';

class RegisBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    regisLogger.d('Event Bloc $bloc $event');

    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    regisLogger.e('Bloc Error: $bloc');
    regisLogger.e('Error log: $error');

    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    regisLogger.d('Change Bloc $bloc');
    regisLogger.d(change.currentState);
    regisLogger.d(change.nextState);

    super.onChange(bloc, change);
  }
}
