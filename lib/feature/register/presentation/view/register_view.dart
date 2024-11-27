import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy_app/constants.dart';
import 'package:shopy_app/core/utils/app_router.dart';
import 'package:shopy_app/core/utils/cache_helper.dart';
import 'package:shopy_app/core/utils/service_locator.dart';
import 'package:shopy_app/feature/register/data/repos/register_repo_impl.dart';
import 'package:shopy_app/feature/register/presentation/manger/cubit/register_cubit.dart';
import 'package:shopy_app/feature/register/presentation/view/widgets/build_register_view.dart';
import '../../../../core/functions/show_toast.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  //static var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(getIt.get<RegisterRepoImpl>()),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              {
                if (state.model.status == false) {
                  showToast(text: state.model.message!, color: Colors.amber);
                } else {
                  showToast(text: state.model.message!, color: Colors.green);
                  CacheHelper.setData(
                      key: 'token', value: state.model.data!.token);
                  token = state.model.data!.token;
                  GoRouter.of(context).push(AppRouter.kHomeLayoutView);
                }
              }
            } else if (state is RegisterFailureState) {
              showToast(text: state.errorMessage, color: Colors.red);
            }
          },
          builder: (context, state) {
            return BuildRegisterView(cubit: RegisterCubit.get(context));
          },
        ),
      ),
    );
  }
}
