import 'package:dotmap/dotmap.dart';
import 'package:test/test.dart';

void main() {
  group('[DotMap]', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('pathValue', () {
      final pathValue = DotMap.pathValue('1.2.3', 4);
      expect(
          pathValue.path,
          equals('1.2.3'));
      expect(
          pathValue.value,
          equals(4));
    });

    test('create()', () {
      final map = DotMap.create([
        PathValue(path: '1.2', value: {'3': 4}),
      ]);
      expect(
          map,
          containsPair('1', {
            '2': {'3': 4}
          }));
    });
    test('set()', () {
      final map = DotMap.create([
        PathValue(
          path: '1.2',
          value: {'3': 4},
        ),
      ]);

      expect(
          DotMap.set(map, '1.2.3', 4),
          containsPair('1', {
            '2': {'3': 4}
          }));
    });
    test('merge()', () {
      final map = DotMap.create([
        PathValue(
          path: '1.2',
          value: 3,
        ),
        PathValue(
          path: '4.5',
          value: 6,
        ),
      ]);

      expect(map, {
        '1': {'2': 3},
        '4': {'5': 6}
      });
    });
    test('get()', () {
      final map = DotMap.create([
        PathValue(
          path: '1.2',
          value: {'3': 4},
        ),
      ]);

      expect(
        DotMap.get(map, '1.2.3'),
        4,
      );
    });
  });
}
