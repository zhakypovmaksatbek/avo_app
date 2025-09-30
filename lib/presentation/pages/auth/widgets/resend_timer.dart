import 'dart:async';

import 'package:avo/generated/locale_keys.g.dart';
import 'package:avo/presentation/const/app_dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ResendTimer extends StatefulWidget {
  final VoidCallback onResend;
  final bool isResendEnabled;

  const ResendTimer({
    super.key,
    required this.onResend,
    this.isResendEnabled = false,
  });

  @override
  State<ResendTimer> createState() => _ResendTimerState();
}

class _ResendTimerState extends State<ResendTimer> {
  Timer? _timer;
  static const int _defaultSeconds = 10;
  int _remainingSeconds = _defaultSeconds;
  bool _isTimerFinished = false;

  @override
  void initState() {
    super.initState();
    if (!widget.isResendEnabled) {
      _startTimer();
    } else {
      _isTimerFinished = true;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer?.cancel();
          _isTimerFinished = true;
        }
      });
    });
  }

  String _formatTime() {
    int minutes = _remainingSeconds ~/ 60;
    int seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _handleResend() {
    if (_isTimerFinished) {
      setState(() {
        _remainingSeconds = _defaultSeconds;
        _isTimerFinished = false;
        _startTimer();
      });
      widget.onResend();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (_isTimerFinished) {
      return ElevatedButton(
        onPressed: _handleResend,

        style: ElevatedButton.styleFrom(
          backgroundColor: theme.cardColor,
          foregroundColor: theme.iconTheme.color,
          minimumSize: Size(double.infinity, 48),
        ),
        child: Text(LocaleKeys.buttons_resend_code.tr()),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: AppDimens.paddingSmall),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: LocaleKeys.forms_resend_code_in.tr(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.disabledColor,
                ),
              ),
              TextSpan(
                text: " ${_formatTime()}",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
