<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Allows you to create, set and get Map rows using dot notated strings.


## Features
Using dot notated strings we can easily:
- Create a nest of maps and specify the value of the last key.
- Set the value of a key in a deeply nested map.
- Get the value of a key in a deeply nested map.
- Merge a list of maps (for convinience).

## Usage

##### PathValue
Before we can create a row in a `Map` we need to create `PathValue` objects.
```dart
final row1 = PathValue(path: '1.2', value: {'3': 4}),
final row2 = PathValue(path: '5.6', value: {'7': 8}),
```

##### create()
We can create a single or multi dimensional row(s) inside a `Map` by supplying
the `create()` method with a single or multiple `PathValue` objects.

```dart
// Simply supply a list of `PathValue` objects.
final row1 = PathValue(path: '1.2', value: {'3': 4}),
final row2 = PathValue(path: '5.6', value: {'7': 8}),

final map = MapPaths.create([row1, row2]);

// Gives us a `Map` as:
{
  {'1': {'2': {'3': 4}}},
  {'5': {'6': {'7': 8}}}
}
```

##### set()
We can set the value of a path by supplying a
dot notated `String` and a value of `dynamic` type.

```dart
// The value at the end of the path is 4.
final map = {'1': {'2': {'3': 4}}};

// Now we set the end value to 5.
final modifiedMap = MapPaths.set(map, '1.2.3', 5);
```

##### get()
We can get the value of a key by using a dot notated `String`.

```dart
// The value at the end of the path is 4.
final map = {'1': {'2': {'3': 4}}};

// Will return 4.
final keyValue = MapPaths.get(map, '1.2.3');
```

## Additional information
Feel free to direct issues and suggestions on the Github page.

**Author:**
Paurini Wiringi
