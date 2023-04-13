// Code snippets stolen from https://github.com/malcommac/SwiftSimplify/blob/master/Sources/SwiftSimplify/Point2DRepresentable.swift

import UIKit
import CoreLocation

public protocol Point2DRepresentable {
    var xValue: Float { get }
    var yValue: Float { get }
    
    var cgPoint: CGPoint { get }
    
    func distanceFrom(_ otherPoint: Self) -> Float
    func distanceToSegment(_ p1: Self, _ p2: Self) -> Float
    
    func equalsTo(_ compare: Self) -> Bool
}

public extension Point2DRepresentable {
    
    func equalsTo(_ compare: Self) -> Bool {
        xValue == compare.xValue && yValue == compare.yValue
    }
    
    func distanceFrom(_ otherPoint: Self) -> Float {
        let dx = xValue - otherPoint.xValue
        let dy = yValue - otherPoint.yValue
        return (dx * dx) + (dy * dy)
    }
    
    func distanceToSegment(_ p1: Self, _ p2: Self) -> Float {
        var x = p1.xValue
        var y = p1.yValue
        var dx = p2.xValue - x
        var dy = p2.yValue - y
        
        if dx != 0 || dy != 0 {
            let t = ((xValue - x) * dx + (yValue - y) * dy) / (dx * dx + dy * dy)
            if t > 1 {
                x = p2.xValue
                y = p2.yValue
            } else if t > 0 {
                x += dx * t
                y += dy * t
            }
        }
                
        dx = xValue - x
        dy = yValue - y
        
        return sqrt(dx * dx + dy * dy)
    }
    
}

extension CLLocationCoordinate2D: Point2DRepresentable {
    public var xValue: Float { Float(latitude) }
    public var yValue: Float { Float(longitude) }
    
    public var cgPoint: CGPoint { CGPoint(x: latitude, y: longitude) }
}

extension CGPoint: Point2DRepresentable {
    public var xValue: Float { Float(x) }
    public var yValue: Float { Float(y) }
    
    public var cgPoint: CGPoint { self }
}
