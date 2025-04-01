import 'package:admin_client/bloc/bloc.dart';
import 'package:admin_client/core/helpers/timer.dart';
import 'package:admin_client/data/entities/country/country.dart';
import 'package:admin_client/data/entities/country/country_list_request.dart';
import 'package:admin_client/data/entities/page_parameters.dart';
import 'package:fluent_ui/fluent_ui.dart' hide Page;

class CountriesDropdown extends StatefulWidget {
  const CountriesDropdown(
      {super.key, required this.onSelect, required this.value});

  final ValueChanged<int> onSelect;
  final Country? value;

  // final ValueChanged<int> onInput;

  @override
  State<CountriesDropdown> createState() => _CountriesDropdownState();
}

class _CountriesDropdownState extends State<CountriesDropdown> {
  late TextEditingController _controller;
  CountryBloc listBloc = CountryBloc();
  List<Country> list = [];
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
          listBloc.add(CountryEventGetList(
            request: CountryListRequest(
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
      child: BlocListener<CountryBloc, CountryState>(
        bloc: listBloc,
        listener: (context, state) async {
          if (state is CountryStateCompleted) {
            await Future.delayed(
              const Duration(milliseconds: 10),
              () {
                setState(() {
                  list = state.countries.data;
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
        child: BlocBuilder<CountryBloc, CountryState>(
            bloc: listBloc,
            builder: (context, state) {
              return AutoSuggestBox<Country>(
                controller: _controller,
                key: asgbKey,
                items: list
                    .map<AutoSuggestBoxItem<Country>>(
                      (v) => AutoSuggestBoxItem<Country>(
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
                      break;
                  }
                },
                onSelected: (item) {
                  if (item.value != null) {
                    widget.onSelect(item.value!.id);
                  }
                },
              );
            }),
      ),
    );
  }
}
