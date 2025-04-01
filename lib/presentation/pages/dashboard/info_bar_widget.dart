import 'package:client/bloc/bloc.dart';
import 'package:client/global.dart';

class InfoBarWrapper extends StatefulWidget {
  const InfoBarWrapper({super.key, required this.child});

  final Widget child;

  @override
  State<InfoBarWrapper> createState() => _InfoBarWrapperState();
}

class _InfoBarWrapperState extends State<InfoBarWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<GlobalMessageBloc, GlobalMessageState>(
      bloc: globalMessageBloc,
      listener: (blocContext, state) async {
        if (state is GlobalMessageStateMessage) {
          // TODO: implement display info bar method
        }
      },
      child: widget.child,
    );
  }
}
