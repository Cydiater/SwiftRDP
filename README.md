# SwiftRDP

Standard implemenation of [Ramer–Douglas–Peucker algorithm](https://en.wikipedia.org/wiki/Ramer–Douglas–Peucker_algorithm) in Swift.

## Usage

```swift
import SwiftRDP

let eps = 0.7
let points = [CGPoint(x: 0, y: 0), CGPoint(x: 0.5, y: 0.6), CGPoint(x: 1, y: 0)]
let simplified = SwiftRDP(eps: eps).simplify(points)
XCTAssertEqual(simplified, [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0)])
```
