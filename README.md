# shimmering_text

Lightweight animated **shimmer** effects for Flutter. A shimmering `Text`
widget for loading / streaming labels, plus a generic `Shimmer` wrapper you can
put around any widget. Pure Flutter — no extra dependencies.

The effect is a moving gradient sweep clipped to the opaque pixels of the child
via `ShaderMask`, so it looks best on text and icons.

## Install

Once published to pub.dev:

```sh
flutter pub add shimmering_text
```

To use it from a local checkout or Git (before it's published):

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

## License

MIT © Akshay CM
