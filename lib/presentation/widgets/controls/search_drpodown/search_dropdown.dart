import 'package:client/data/entities/app/title_provider.dart';
import 'package:client/presentation/ui/theme/constants.dart';
import 'package:client/presentation/ui/theme/search_drpodown/custom_dropdown_decoration.dart';
import 'package:client/presentation/widgets/controls/field_label.dart';
import 'package:client/presentation/widgets/controls/text.dart';
import 'package:client/presentation/widgets/context.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart' hide Title;

class MyDropDown<T extends TitleBase> extends StatefulWidget {
  const MyDropDown({
    required this.items,
    required this.onChanged,
    this.onClear,
    this.initCallback,
    this.enabled = true,
    this.initValue,
    this.centerHeader = false,
    this.filled = false,
    this.excludeSelected = false,
    this.label,
    super.key,
  });

  final List<T> items;
  final Function(T?) onChanged;
  final VoidCallback? initCallback;
  final VoidCallback? onClear;
  final bool enabled;
  final T? initValue;
  final bool centerHeader;
  final bool filled;
  final bool excludeSelected;
  final String? label;

  @override
  State<MyDropDown<T>> createState() => _MyDropDownState<T>();
}

class _MyDropDownState<T extends TitleBase> extends State<MyDropDown<T>> {
  late SingleSelectController<T> controller = SingleSelectController(
    widget.initValue ?? widget.items.first,
  );

  void setFirstElement() {
    controller.value = widget.initValue ?? widget.items.first;
  }

  @override
  void initState() {
    super.initState();
    controller = SingleSelectController(widget.initValue ?? widget.items.first);
    widget.initCallback?.call();
  }

  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: [
        if (widget.label != null) FieldLabel(label: widget.label!),
        Material(
          color: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          type: MaterialType.button,
          child: CustomDropdown<T>(
            controller: controller,
            closedHeaderPadding: const EdgeInsets.only(left: 10, right: 6, top: 8, bottom: 8),
            decoration: customDropdownDecoration(
              ctx,
              filled: widget.filled,
              suffixIcon:
                  widget.onClear != null
                      ? InkWell(
                        onTap: () {
                          setFirstElement();
                        },
                        child: Icon(
                          Icons.clear,
                          color: Theme.of(context).primaryColor.withAlpha(150),
                          size: FS.p5,
                        ),
                      )
                      : null,
            ),
            disabledDecoration: customDropdownDisabledDecoration(
              ctx,
              filled: widget.filled,
            ),
            hintText: 'select',
            enabled: widget.enabled,
            headerBuilder: (context, selectedItem, enabled) {
              return IntrinsicHeight(
                child: MyLabel(
                  text: selectedItem.title,
                  align:
                      widget.centerHeader
                          ? TextAlign.center
                          : TextAlign.left,
                  color:
                      selectedItem.firstElement
                          ? (context.isDarkMode()
                              ? AppTheme.textUnselectedColorDark
                              : AppTheme.textUnselectedColorLight)
                          : null,
                ),
              );
            },
            listItemBuilder: (context, item, isSelected, onItemSelect) {
              return MyLabel(
                text: item.title,
                align: widget.centerHeader ? TextAlign.center : TextAlign.left,
                color:
                    item.firstElement
                        ? (context.isDarkMode()
                            ? AppTheme.textUnselectedColorDark
                            : AppTheme.textUnselectedColorLight)
                        : null,
              );
            },
            items: widget.items,
            onChanged: widget.onChanged,
            canCloseOutsideBounds: true,
            excludeSelected: widget.excludeSelected,
          ),
        ),
      ],
    );
  }
}
