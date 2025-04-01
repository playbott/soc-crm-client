import 'package:admin_client/bloc/bloc.dart';
import 'package:admin_client/core/helpers/timer.dart';
import 'package:admin_client/data/entities/artist/artist.dart';
import 'package:admin_client/data/entities/artist/artist_list_request.dart';
import 'package:admin_client/data/entities/page_parameters.dart';
import 'package:admin_client/global.dart';

class ArtistsDropdown extends StatefulWidget {
  const ArtistsDropdown({
    super.key,
    this.onSelect,
    this.onCleared,
    this.placeholder,
    this.value,
    this.label,
    this.prefixIcon,
  });

  final ValueChanged<int>? onSelect;
  final VoidCallback? onCleared;
  final Artist? value;
  final String? placeholder;
  final String? label;
  final Widget? prefixIcon;

  // final ValueChanged<int> onInput;

  @override
  State<ArtistsDropdown> createState() => _ArtistsDropdownState();
}

class _ArtistsDropdownState extends State<ArtistsDropdown> {
  late TextEditingController _controller;
  ArtistBloc listBloc = ArtistBloc();
  List<Artist> list = [];
  String currentValue = '';

  late ResettableTimer timer;

  final asgbKey = GlobalKey<AutoSuggestBoxState>();

  @override
  void initState() {
    _controller = TextEditingController(
        text: widget.value != null ? widget.value!.title : '');
    timer = ResettableTimer(
        duration: const Duration(seconds: 1),
        action: () {
          listBloc.add(ArtistEventGetList(
            request: ArtistListRequest(
              title: currentValue,
              page: Page(
                orderBy: 'id',
                size: 10,
                number: 0,
              ),
            ),
          ));
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => listBloc,
      child: BlocListener<ArtistBloc, ArtistState>(
        bloc: listBloc,
        listener: (context, state) async {
          if (state is ArtistStateCompleted) {
            await Future.delayed(
              const Duration(milliseconds: 10),
              () {
                setState(() {
                  list = state.artists.data;
                  asgbKey.currentState?.setState(() {});
                  asgbKey.currentState?.dismissOverlay();
                });
              },
            );
            await Future.delayed(
              const Duration(milliseconds: 1),
              () {
                setState(() {
                  asgbKey.currentState?.setState(() {});
                  asgbKey.currentState?.dismissOverlay();
                });
              },
            );
            await Future.delayed(
              const Duration(milliseconds: 1),
              () {
                setState(() {
                  asgbKey.currentState?.setState(() {});
                  asgbKey.currentState?.dismissOverlay();
                  asgbKey.currentState?.showOverlay();
                  asgbKey.currentState?.setState(() {});
                });
              },
            );
          }
        },
        child: BlocBuilder<ArtistBloc, ArtistState>(
            bloc: listBloc,
            builder: (context, state) {
              return (Widget child) {
                if (widget.label != null) {
                  return InfoLabel(
                    label: widget.label ?? '',
                    child: child,
                  );
                }
                return child;
              }(AutoSuggestBox<Artist>(
                placeholder: widget.placeholder,
                placeholderStyle: const TextStyle(fontStyle: FontStyle.italic),
                controller: _controller,
                leadingIcon: widget.prefixIcon,
                key: asgbKey,
                items: list
                    .map<AutoSuggestBoxItem<Artist>>(
                      (v) => AutoSuggestBoxItem<Artist>(
                        value: v,
                        label: v.title ?? '',
                        onFocusChange: (focused) {},
                      ),
                    )
                    .toList(),
                autofocus: false,
                onChanged: (v, TextChangedReason r) async {
                  currentValue = v;
                  switch (r) {
                    case TextChangedReason.userInput:
                      if (v.length > 1) {
                        await Future.delayed(
                          const Duration(milliseconds: 600),
                          () {
                            timer.resetTimer();
                            timer.startTimer();
                          },
                        );
                      }
                      break;
                    case TextChangedReason.suggestionChosen:
                      break;
                    case TextChangedReason.cleared:
                      if (widget.onCleared != null) {
                        widget.onCleared!();
                      }
                      break;
                  }
                },
                onSelected: (item) {
                  if (item.value != null) {
                    if (widget.onSelect != null) {
                      widget.onSelect!(item.value!.id);
                    }
                  }
                },
              ));
            }),
      ),
    );
  }
}
