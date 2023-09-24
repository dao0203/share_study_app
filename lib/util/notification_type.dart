enum NotificationType {
  answer(value: 'answer'),
  bestAnswer(value: 'best_answer'),
  newRegistration(value: 'new_registration'),
  follow(value: 'follow');

  const NotificationType({
    required this.value,
  });
  final String value;
}
