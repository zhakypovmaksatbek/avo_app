import 'package:avo/generated/locale_keys.g.dart';
import 'package:avo/presentation/pages/auth/core/models/country_model.dart';
import 'package:avo/presentation/pages/auth/core/utils/phone_number_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPhoneInput extends StatefulWidget {
  final TextEditingController controller;
  final Function(CountryModel country, String phoneNumber) onInputChanged;
  final String initialCountryIsoCode;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;

  const CustomPhoneInput({
    super.key,
    required this.controller,
    required this.onInputChanged,
    this.initialCountryIsoCode = 'KG',
    this.focusNode,
    this.onEditingComplete,
  });

  @override
  State<CustomPhoneInput> createState() => _CustomPhoneInputState();
}

class _CustomPhoneInputState extends State<CustomPhoneInput> {
  late CountryModel _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = countries.firstWhere(
      (c) => c.isoCode == widget.initialCountryIsoCode,
      orElse: () => countries.first,
    );
  }

  // void _showCountryPicker() {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Theme.of(context).colorScheme.surface,
  //     isScrollControlled: true,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
  //     ),
  //     builder: (context) => DraggableScrollableSheet(
  //       initialChildSize: 0.5,
  //       minChildSize: 0.3,
  //       maxChildSize: 0.9,
  //       expand: false,
  //       snapAnimationDuration: const Duration(seconds: 2),

  //       builder: (context, scrollController) {
  //         final theme = Theme.of(context);
  //         return Column(
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.symmetric(
  //                 horizontal: AppDimens.paddingLarge,
  //                 vertical: AppDimens.paddingSmall,
  //               ),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Flexible(
  //                     child: Text(
  //                       "LocaleKeys.titles_select_region_code.tr()",
  //                       style: theme.textTheme.titleMedium?.copyWith(
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                     ),
  //                   ),
  //                   CloseButton(),
  //                 ],
  //               ),
  //             ),
  //             Expanded(
  //               child: _CountryPickerDialog(
  //                 countries: countries,
  //                 scrollController: scrollController,
  //                 onCountrySelected: (country) {
  //                   setState(() {
  //                     _selectedCountry = country;
  //                   });
  //                   widget.controller.clear();
  //                   widget.onInputChanged(country, '');
  //                   router.maybePop();
  //                 },
  //                 selectedCountry: _selectedCountry,
  //               ),
  //             ),
  //           ],
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme;

    final int maxLength = _selectedCountry.format.length;
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      focusNode: widget.focusNode,
      style: textStyle.titleMedium?.copyWith(letterSpacing: 1.5),
      textInputAction: TextInputAction.done,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        PhoneNumberFormatter(format: _selectedCountry.format),
      ],
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      autofillHints: [AutofillHints.telephoneNumber],
      maxLength: maxLength,
      buildCounter:
          (
            context, {
            required currentLength,
            required isFocused,
            required maxLength,
          }) {
            return null;
          },
      decoration: InputDecoration(
        filled: true,

        hintText: _selectedCountry.format.replaceAll('#', '0'),
        hintStyle: textStyle.titleMedium?.copyWith(
          letterSpacing: 1.5,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
        ),

        prefixIcon: _buildCombinedPrefix(),
      ),
      onChanged: (value) {
        widget.onInputChanged(_selectedCountry, value);

        if (value.length == maxLength) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.focusNode?.unfocus();
          });
        }
      },

      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.warning_please_enter_a_number.tr();
        }
        final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');
        final expectedLength = _selectedCountry.format
            .replaceAll(RegExp(r'[^#]'), '')
            .length;
        if (digitsOnly.length != expectedLength) {
          return LocaleKeys.warning_please_enter_a_valid_number.tr();
        }
        return null;
      },
      onEditingComplete: widget.onEditingComplete,
    );
  }

  Widget _buildCombinedPrefix() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 6.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_selectedCountry.flag, style: const TextStyle(fontSize: 24)),
          // const SizedBox(width: 4),
          // const Icon(Icons.arrow_drop_down, size: 20),
          const SizedBox(width: 8),
          Text(
            _selectedCountry.dialCode,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

// class _CountryPickerDialog extends StatelessWidget {
//   final List<CountryModel> countries;
//   final ValueChanged<CountryModel> onCountrySelected;
//   final CountryModel selectedCountry;
//   final ScrollController scrollController;

//   const _CountryPickerDialog({
//     required this.countries,
//     required this.onCountrySelected,
//     required this.scrollController,
//     required this.selectedCountry,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return RadioGroup<CountryModel>(
//       onChanged: (value) => onCountrySelected(value!),
//       groupValue: selectedCountry,
//       child: ListView.builder(
//         controller: scrollController,
//         itemCount: countries.length,
//         padding: const EdgeInsets.symmetric(
//           horizontal: AppDimens.paddingLarge,
//           vertical: AppDimens.paddingLarge,
//         ),
//         itemBuilder: (context, index) {
//           final country = countries[index];
//           return RadioListTile(
//             value: country,
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Flexible(
//                   child: Text(
//                     country.name,
//                     style: theme.textTheme.bodyMedium,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 Text(
//                   country.dialCode,
//                   style: theme.textTheme.bodyMedium,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//             secondary: Text(country.flag, style: theme.textTheme.titleMedium),
//             visualDensity: VisualDensity.compact,
//             contentPadding: EdgeInsets.zero,
//             controlAffinity: ListTileControlAffinity.trailing,
//             radioScaleFactor: 1.2,
//             dense: true,
//           );
//         },
//       ),
//     );
//   }
// }
