# shimmering_text

[![pub package](https://img.shields.io/pub/v/shimmering_text.svg)](https://pub.dev/packages/shimmering_text)
[![pub points](https://img.shields.io/pub/points/shimmering_text)](https://pub.dev/packages/shimmering_text/score)
[![popularity](https://img.shields.io/pub/popularity/shimmering_text)](https://pub.dev/packages/shimmering_text/score)
[![likes](https://img.shields.io/pub/likes/shimmering_text)](https://pub.dev/packages/shimmering_text/score)
[![license: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-%3E%3D3.16-02569B?logo=flutter)](https://flutter.dev)

Lightweight animated **shimmer** effects for Flutter. A shimmering `Text`
widget for loading / streaming labels, plus a generic `Shimmer` wrapper you can
put around any widget. **Pure Flutter — zero extra dependencies.**

The effect is a moving gradient sweep clipped to the opaque pixels of the child
via `ShaderMask`, so it looks best on text and icons.

![shimmering_text preview](https://raw.githubusercontent.com/akshaynexus/shimmering_text/main/preview.gif)

## Features

- ✨ **`ShimmeringText`** — a drop-in `Text` replacement with an animated shimmer sweep.
- 🎁 **`Shimmer`** — wrap *any* widget (icons, rows, custom shapes) in the same effect.
- 🎨 Fully configurable base/highlight colors, sweep `duration`, and gradient `stops`.
- 🔀 Toggle the animation on/off with a single `enabled` flag — great for streaming UI.
- 🪶 No third-party dependencies. Just Flutter.

## Install

```sh
flutter pub add shimmering_text
```

Or add it to your `pubspec.yaml`:

```yaml
dependencies:
  shimmering_text: ^0.1.0
```

Prefer a local checkout or Git source (before publishing / for a fork):

```sh
flutter pub add shimmering_text --path ../shimmering_text
# or from Git:
flutter pub add shimmering_text --git-url https://github.com/akshaynexus/shimmering_text.git
```

## Usage

### Shimmering text

```dart
import 'package:shimmering_text/shimmering_text.dart';

ShimmeringText(
  'Thinking…',
  baseColor: Colors.grey.shade500,
  highlightColor: Colors.white,
  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
)
```

Toggle the animation with `enabled` (e.g. only while content is streaming):

```dart
ShimmeringText('Done', enabled: isStreaming)
```

### Shimmer over any widget

```dart
Shimmer(
  baseColor: Colors.grey.shade400,
  highlightColor: Colors.white,
  child: const Icon(Icons.auto_awesome, size: 32),
)
```

## Parameters

| Parameter         | Default                      | Description                                   |
| ----------------- | ---------------------------- | --------------------------------------------- |
| `baseColor`       | `Color(0xFF475569)`          | Dimmed color at both ends of the gradient.    |
| `highlightColor`  | `Color(0xFFFFFFFF)`          | Bright color that sweeps across.              |
| `duration`        | `1450ms`                     | Length of one sweep before it repeats.        |
| `stops`           | `[0.25, 0.5, 0.75]`          | Gradient stops (must be exactly three).       |
| `enabled`         | `true`                       | When `false`, renders statically, no animation. |

`ShimmeringText` adds the usual text knobs: `style`, `maxLines`, `overflow`,
`textAlign`, `textDirection`. The `color` on `style` is ignored — color comes
from `baseColor` / `highlightColor`.

## Example

A runnable example lives in [`example/`](example). Run it with:

```sh
cd example
flutter run
```

## License

MIT © Akshay CM
