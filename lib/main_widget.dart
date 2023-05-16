import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_clean_archi/presentation/custom/snackbar/snakbar.dart';
import 'package:otp_clean_archi/presentation/di/injector.dart';
import 'core/core.dart';
import 'presentation/modules/otp/otp.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController transitionController;
  late Animation transition;

  @override
  void dispose() {
    super.dispose();
    transitionController.dispose();
  }

  @override
  void initState() {
    transitionController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    transition = Tween<double>(begin: -100, end: 50).animate(
        CurvedAnimation(parent: transitionController, curve: Curves.ease));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Injector(
      child: BlocListener<SnackbarBloc, SnackbarState>(
        listener: (context, state) {
          if (state is SnackbarShow) {
            transitionController.forward();
          }
          if (state is SnackbarHide) {
            transitionController.reverse();
          }
        },
        child: SizedBox(
            width: context.deviceWidth(100),
            height: context.deviceWidth(100),
            child: Stack(
              children: [
                const OTPPage(),
                AnimatedBuilder(
                  animation: transition,
                  builder: (context, child) {
                    return BlocBuilder<SnackbarBloc, SnackbarState>(
                      buildWhen: (previous, current) => current is SnackbarShow,
                      builder: (context, state) {
                        if (state is SnackbarShow) {
                          return Positioned(
                            top: transition.value,
                            child: MySnackBar(
                              body: state.body,
                              title: state.title,
                            ).topCenter,
                          );
                        }
                        return const SizedBox();
                      },
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }
}
