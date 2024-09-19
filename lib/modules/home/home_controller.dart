import 'package:bloc/bloc.dart';

import '../../core/app_errors.dart';
import '../../data/repositories/company_repository.dart';
import 'home_states.dart';

class HomeController extends Cubit<HomeState> {
  HomeController(this._repository) : super(LoadingHomeState()) {
    _loadCompanies();
  }

  final CompanyRepository _repository;

  Future<void> reload() => _loadCompanies();

  Future<void> _loadCompanies() async {
    emit(LoadingHomeState());

    try {
      final companies = await _repository.getAllCompanies();

      emit(SuccessHomeState(companies));
    } on AppError catch (e) {
      emit(ErrorHomeState(e));
    }
  }
}
