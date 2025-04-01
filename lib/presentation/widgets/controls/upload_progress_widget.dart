import 'dart:async';

import 'package:client/global.dart';

class UploadProgressWidget extends StatefulWidget {
  const UploadProgressWidget({
    super.key,
    required this.progressStreamController,
  });

  final StreamController<double> progressStreamController;

  @override
  State<UploadProgressWidget> createState() => _UploadProgressWidgetState();
}

class _UploadProgressWidgetState extends State<UploadProgressWidget> {
  double progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 2,
                color: Colors.black45,
              ),
            ],
          ),
          child: SizedBox(
            height: 10,
            width: 300,
            child: StreamBuilder<double>(
                stream: widget.progressStreamController.stream,
                builder: (context, snapshot) {
                  double progress = snapshot.data ?? 0.0;
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.black12,
                      semanticsLabel: '$progress%',
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
