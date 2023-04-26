// Для прикладу з інтерпретатором в погодному додатку ми можемо створити
// можливість введення користувачем мовного опису погоди, наприклад
// "сонячно та тепло". Для цього нам потрібно буде створити елементи мови
// запитів для опису погоди, а потім використати інтерпретатор для перетворення
// цього опису в конкретний прогноз погоди.

// Ось як ми можемо визначити елементи мови запитів для опису погоди у вигляді класів:

abstract class WeatherExpression {
  // створюємо метод interpret, який буде перевизначений в класах реалізації
  void interpret(WeatherContext context);
}

// Далі, ми можемо використати клас WeatherExpressionParser, який буде
// аналізувати введення користувача та створювати об'єкти елементів мови
// запитів на основі цього введення. Цей клас може виглядати наступним чином:

// У цьому класі ми визначили список елементів мови запитів _expressions, який
// буде заповнюватись на основі введення користувача. Кожен з токенів введення
// буде перевірено на належність до погодних умов та відповідний елемент мови
// запитів буде доданий до списку _expressions.

// Нарешті, ми можемо створити екземпляр WeatherExpressionParser, передати йому
// введення користувача для аналізу та використовувати інтерпретатор для
// перетворення опису погоди в прогноз погоди за допомогою об'єкта WeatherContext.

class WeatherExpressionParser {
  final List<WeatherExpression> _expressions = [];

  void parse(String input) {
    final tokens = input.split(' '); // розбиваємо строчку на окремі слова

    for (final token in tokens) {
      if (token == 'sunny') {
        _expressions.add(SunnyExpression());
      } else if (token == 'cloudy') {
        _expressions.add(CloudyExpression());
      } else if (token == 'rainy') {
        _expressions.add(RainyExpression());
      } else if (token == 'windy') {
        _expressions.add(WindyExpression());
      } else if (token == 'warm') {
        _expressions.add(WarmExpression());
      } else if (token == 'cold') {
        _expressions.add(ColdExpression());
      }
    }
  }

  void interpret(WeatherContext context) {
    for (final expression in _expressions) {
      expression.interpret(context);
    }
  }
}

// Ми також визначили клас WeatherContext, який містить стани погодних умов,
// що можуть бути описані за допомогою мови запитів, та строкове представлення
// прогнозу погоди.

class WeatherContext {
  bool isSunny = false;
  bool isCloudy = false;
  bool isRainy = false;
  bool isWindy = false;
  bool isWarm = false;
  bool isCold = false;
  String forecast = '';
}

// ми визначили елементи мови запитів для опису погоди у
// вигляді класів SunnyExpression, CloudyExpression, RainyExpression,
// WindyExpression, WarmExpression, та ColdExpression. Кожен з цих класів
// реалізує інтерфейс WeatherExpression, який містить метод interpret()
// для обробки запитів.

class SunnyExpression implements WeatherExpression {
  // перевизначаємо метод interpret

  @override
  void interpret(WeatherContext context) {
    context.isSunny = true;
    context.forecast += 'sunny ';
  }
}

class CloudyExpression implements WeatherExpression {
  // перевизначаємо метод interpret

  @override
  void interpret(WeatherContext context) {
    context.isCloudy = true;
    context.forecast += 'cloudy ';
  }
}

class RainyExpression implements WeatherExpression {
  // перевизначаємо метод interpret

  @override
  void interpret(WeatherContext context) {
    context.isRainy = true;
    context.forecast += 'rainy ';
  }
}

class WindyExpression implements WeatherExpression {
  // перевизначаємо метод interpret

  @override
  void interpret(WeatherContext context) {
    context.isWindy = true;
    context.forecast += 'windy ';
  }
}

class WarmExpression implements WeatherExpression {
  // перевизначаємо метод interpret

  @override
  void interpret(WeatherContext context) {
    context.isWarm = true;
    context.forecast += 'warm ';
  }
}

class ColdExpression implements WeatherExpression {
  // перевизначаємо метод interpret

  @override
  void interpret(WeatherContext context) {
    context.isCold = true;
    context.forecast += 'cold ';
  }
}

// Тепер, ми можемо використати ці елементи мови запитів для створення опису
// погоди та перетворення його в прогноз погоди за допомогою інтерпретатора:

void main() {
  final context = WeatherContext();
  // final input = 'sunny and warm and windy and cold';
  final input = 'sunny and windy and cold';

  final parser = WeatherExpressionParser();
  parser.parse(input);
  parser.interpret(context);

  final forecast = context.forecast; // 'sunny windy cold '

  print(forecast);
}
