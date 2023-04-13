public struct SwiftRDP {
    public private(set) var eps: Float = 1.0

    public init(eps: Float) {
        self.eps = eps
    }
    
    public func simplify<PointType: Point2DRepresentable>(points: [PointType]) -> [PointType] {
        let len = points.count
        if len <= 2 {
            return points
        }
        var d_max: Float = 0.0
        var dm_index: Int = -1
        for idx in 1...len - 2 {
            let point = points[idx]
            let d: Float = point.distanceToSegment(points[0], points[len - 1])
            if d > d_max {
                d_max = d
                dm_index = idx
            }
        }
                
        if d_max > self.eps {
            let left = self.simplify(points: Array(points.prefix(dm_index + 1)))
            let right = self.simplify(points: Array(points.suffix(from: dm_index)))
            return Array(left.prefix(left.count - 1)) + [points[dm_index]] + Array(right.suffix(right.count - 1))
        } else {
            return [points[0], points[len - 1]]
        }
    }
}
