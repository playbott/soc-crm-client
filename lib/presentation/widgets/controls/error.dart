
import 'package:client/presentation/widgets/controls/text.dart';

import '../../../global.dart';
import '../../ui/theme/constants.dart';
import 'button.dart';

class RequestErrorWidget extends StatelessWidget {
  const RequestErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Icon(
        Icons.error_outline,
        color: Colors.redAccent,
      ),
    );
  }
}

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({
    required this.title,
    required this.message,
    required this.retryAction,
    super.key,
  });

  final String title;
  final String message;
  final VoidCallback retryAction;

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    return Container(
      width: MediaQuery.of(context).size.width*0.8,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: themeMode == Brightness.light ? Colors.white : const Color.fromARGB(255, 44, 44, 66),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: themeMode == Brightness.light ? Colors.black26 : Colors.black87,
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.warning_amber,
            color: Colors.amber,
            size: 50.0,
          ),
          const SizedBox(height: 10.0),
          MyLabel(
            text: title,
              size: FS.p5,
              fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 5.0),
          MyLabel(
            text: message,
            size: FS.p6,
            align: TextAlign.center,
            maxLines: 2,
          ),
          const SizedBox(height: 20.0),
          MyButton(
            color: AppTheme.lightBlueColor,
            onPressed: retryAction,
            text: 'retry'.i18n(),
          )
        ],
      ),
    );
  }
}
