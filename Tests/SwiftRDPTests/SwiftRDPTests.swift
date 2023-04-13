import XCTest
@testable import SwiftRDP

final class SwiftRDPTests: XCTestCase {
    func test2Points() throws {
        let points = [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 1)]
        let processed = SwiftRDP(eps: 1.0).simplify(points: points)
        XCTAssertEqual(points, processed)
    }
    
    func test3Points() throws {
        let points = [CGPoint(x: 0, y: 0), CGPoint(x: 0.6, y: 0.5), CGPoint(x: 0, y: 1)]
        let processed1 = SwiftRDP(eps: 0.7).simplify(points: points)
        XCTAssertEqual([points[0], points[2]], processed1)
        let processed2 = SwiftRDP(eps: 0.5).simplify(points: points)
        XCTAssertEqual(points, processed2)
    }
}
