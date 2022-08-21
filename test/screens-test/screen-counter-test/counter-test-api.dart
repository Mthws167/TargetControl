import 'package:flutter_test/flutter_test.dart';
import '../../../lib/screens/screen-counter/counter-api.dart';

void main() {
  group(
    'Male',
    () {
      group(
        'Increments Counter',
        () {
          test(
            'Test "+" counter ',
            () {
              CounterApi counterApi = CounterApi(valueMale: 0);
              counterApi.incrementCounter();
              expect(counterApi.valueMale, 1);
            },
          );

          test(
            'Test "+" max counter ',
            () {
              CounterApi counterApi = CounterApi(valueMale: 100);
              counterApi.incrementCounter();
              expect(counterApi.valueMale, 101);
            },
          );
        },
      );

      group(
        'Decrements Counter',
        () {
          test(
            'Test "-" counter ',
            () {
              CounterApi counterApi = CounterApi(valueMale: 1);
              counterApi.decrementCounter();
              expect(counterApi.valueMale, 0);
            },
          );

          test(
            'Test "-" max counter ',
            () {
              CounterApi counterApi = CounterApi(valueMale: 0);
              counterApi.decrementCounter();
              expect(counterApi.valueMale, -1);
            },
          );
        },
      );

      group(
        'Female',
        () {
          group(
            'Increments Counter',
            () {
              test(
                'Test "+" counter ',
                () {
                  CounterApi counterApi = CounterApi(valueFemale: 4);
                  counterApi.incrementCounter();
                  expect(counterApi.valueFemale, 5);
                },
              );

              test(
                'Test "+" max counter ',
                () {
                  CounterApi counterApi = CounterApi(valueFemale: 100);
                  counterApi.incrementCounter();
                  expect(counterApi.valueFemale, 101);
                },
              );
            },
          );

          group(
            'Decrements Counter',
            () {
              test(
                'Test "-" counter ',
                () {
                  CounterApi counterApi = CounterApi(valueFemale: 3);
                  counterApi.decrementCounter();
                  expect(counterApi.valueFemale, 2);
                },
              );

              test(
                'Test "-" max counter ',
                () {
                  CounterApi counterApi = CounterApi(valueFemale: 0);
                  counterApi.decrementCounter();
                  expect(counterApi.valueFemale, -1);
                },
              );
            },
          );

          group(
            'Chield',
            () {
              group(
                'Increments Counter',
                () {
                  test(
                    'Test "+" counter ',
                    () {
                      CounterApi counterApi = CounterApi(valueChield: 10);
                      counterApi.incrementCounter();
                      expect(counterApi.valueChield, 11);
                    },
                  );

                  test(
                    'Test "+" max counter ',
                    () {
                      CounterApi counterApi = CounterApi(valueChield: 100);
                      counterApi.incrementCounter();
                      expect(counterApi.valueChield, 101);
                    },
                  );
                },
              );

              group(
                'Decrements Counter',
                () {
                  test(
                    'Test "-" counter ',
                    () {
                      CounterApi counterApi = CounterApi(valueChield: 11);
                      counterApi.decrementCounter();
                      expect(counterApi.valueChield, 10);
                    },
                  );

                  test(
                    'Test "-" max counter ',
                    () {
                      CounterApi counterApi = CounterApi(valueChield: 0);
                      counterApi.decrementCounter();
                      expect(counterApi.valueChield, -1);
                    },
                  );
                },
              );
            },
          );
        },
      );
    },
  );
}
