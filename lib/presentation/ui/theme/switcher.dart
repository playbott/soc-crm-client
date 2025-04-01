import 'package:client/bloc/bloc.dart';
import 'package:client/global.dart';
import 'package:client/presentation/widgets/context.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({
    super.key,
    this.btnColor,
    this.iconSize,
  });

  final Color? btnColor;
  final double? iconSize;

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  Future<void> onPressed() async {
    await Future.delayed(const Duration(milliseconds: 100));
    themeBloc.add(ThemeModeSwitch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: themeBloc,
      builder: (context, themeState) {
        final iconColor =
            widget.btnColor ??
            (context.isDarkMode() ? Colors.yellow : Colors.blueGrey);
        final iconData =
            context.isDarkMode() ? Icons.light_mode_rounded : Icons.mode_night;
        final icon = Icon(
          iconData,
          color: iconColor,
          size: widget.iconSize ?? 24,
        );
        return IconButton(onPressed: onPressed, icon: icon);
      },
    );
  }
}
