import 'package:client/global.dart';

class PageLayout extends StatelessWidget {
  const PageLayout({
    super.key,
    required this.child,
    this.constraints,
    this.margin,
  });

  final Widget child;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: margin ?? const EdgeInsets.all(10.0),
      padding: const EdgeInsets.only(left: 10.0),
      constraints:
          constraints ?? BoxConstraints(maxHeight: 700, maxWidth: 1000),
      child: Container(
        decoration: BoxDecoration(
          //TODO Fix color
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: child,
        ),
      ),
    );
  }
}
