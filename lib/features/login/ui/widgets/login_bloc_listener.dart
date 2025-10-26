import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/helpers/extensions.dart';
import 'package:medical_app/core/routing/routes.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/features/login/logic/cubit/login_cubit.dart';
import 'package:medical_app/features/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) =>  Center(
                child: CircularProgressIndicator(color: ColorsManager.mainBLue),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {

            setupErrorState(context, "Invalid email or password");
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
     context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(Icons.error, color: Colors.red,size: 32,),
        content: Text(error,style: TextStyles.font15DarkBlueMedium,textAlign: TextAlign.center),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child:  Text('Got it', style: TextStyles.font14BlueSemiBold,),
          ),
        ],
      ),
    );
  }
}
