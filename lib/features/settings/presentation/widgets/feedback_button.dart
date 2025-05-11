import 'package:feedback_sentry/feedback_sentry.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/menu_button.dart';

final class FeedbackButton extends StatelessWidget {
  const FeedbackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuButton(
      text: 'Feedback',
      onPressed: () => BetterFeedback.of(context).showAndUploadToSentry(),
    );
  }
}
