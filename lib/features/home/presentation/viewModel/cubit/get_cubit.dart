import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_state.dart';

class GetCubit extends Cubit<GetState> {
  GetCubit() : super(GetInitial());
}
