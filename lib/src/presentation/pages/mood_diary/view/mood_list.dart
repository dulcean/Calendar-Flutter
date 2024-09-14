const List<String> happyMood = [
  'Возбуждение',
  'Восторг',
  'Игривость',
  'Наслаждение',
  'Очарование',
  'Осознанность',
  'Смелость',
  'Удовольствие',
  'Чувственность',
  'Энергичность',
  'Экстравагантность',
];

const List<String> creepyMood = [
  'Страх',
  'Тильт',
  'Ненависть',
  'Вас никто не слышит',
];

List<String> getMoodList(int index) {
  switch (index) {
    case 0:
      return happyMood;
    case 1:
      return creepyMood;
    default:
      return [];
  }
}
