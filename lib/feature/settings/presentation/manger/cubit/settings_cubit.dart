import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/login/data/model/login_model.dart';
import 'package:shopy_app/feature/settings/data/repos/settings_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._settingsRepo) : super(SettingsInitialState());

  static SettingsCubit get(context) => BlocProvider.of(context);

  final SettingsRepo _settingsRepo;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  UserModel? userModel;
  Future<void> getSettings() async {
    emit(SettingsLoadingState());
    var result = await _settingsRepo.getSettings();
    result.fold((failure) {
      return emit(SettingsFailureState(errorMessage: failure.errorMessage));
    }, (userData) {
      userModel = userData.data;
      nameController.text = userData.data!.name;
      emailController.text = userData.data!.email;
      phoneController.text = userData.data!.phone;
      return emit(SettingsSuccssState());
    });
  }
}
