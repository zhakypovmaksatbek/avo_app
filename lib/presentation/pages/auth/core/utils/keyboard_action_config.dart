import 'package:avo/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class KeyboardActionConfig {
  KeyboardActionsConfig buildConfig(
    BuildContext context,
    List<FocusNode> focusNodes, {
    bool nextFocus = false,
  }) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: CupertinoColors.systemGrey5,
      nextFocus: nextFocus,

      actions: focusNodes.map((node) {
        return KeyboardActionsItem(
          focusNode: node,
          toolbarButtons: [
            (focusNode) {
              return GestureDetector(
                onTap: () => focusNode.nextFocus(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    LocaleKeys.buttons_done.tr(),
                    style: const TextStyle(
                      color: CupertinoColors.activeBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            },
          ],
        );
      }).toList(),
    );
  }
}
