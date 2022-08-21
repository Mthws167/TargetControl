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
              CounterApi counterApi = CounterApi(value: 0);
              counterApi.incrementCounter();
              expect(counterApi.value, 1);
            },
          );

          test(
            'Test "+" max counter ',
            () {
              CounterApi counterApi = CounterApi(value: 100);
              counterApi.incrementCounter();
              expect(counterApi.value, 101);
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
              CounterApi counterApi = CounterApi(value: 1);
              counterApi.decrementCounter();
              expect(counterApi.value, 0);
            },
          );

          test(
            'Test "-" max counter ',
            () {
              CounterApi counterApi = CounterApi(value: 0);
              counterApi.decrementCounter();
              expect(counterApi.value, -1);
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
                  CounterApi counterApi = CounterApi(value: 4);
                  counterApi.incrementCounter();
                  expect(counterApi.value, 5);
                },
              );

              test(
                'Test "+" max counter ',
                () {
                  CounterApi counterApi = CounterApi(value: 100);
                  counterApi.incrementCounter();
                  expect(counterApi.value, 101);
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
                  CounterApi counterApi = CounterApi(value: 3);
                  counterApi.decrementCounter();
                  expect(counterApi.value, 2);
                },
              );

              test(
                'Test "-" max counter ',
                () {
                  CounterApi counterApi = CounterApi(value: 0);
                  counterApi.decrementCounter();
                  expect(counterApi.value, -1);
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
                      CounterApi counterApi = CounterApi(value: 10);
                      counterApi.incrementCounter();
                      expect(counterApi.value, 11);
                    },
                  );

                  test(
                    'Test "+" max counter ',
                    () {
                      CounterApi counterApi = CounterApi(value: 100);
                      counterApi.incrementCounter();
                      expect(counterApi.value, 101);
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
                      CounterApi counterApi = CounterApi(value: 11);
                      counterApi.decrementCounter();
                      expect(counterApi.value, 10);
                    },
                  );

                  test(
                    'Test "-" max counter ',
                    () {
                      CounterApi counterApi = CounterApi(value: 0);
                      counterApi.decrementCounter();
                      expect(counterApi.value, -1);
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
