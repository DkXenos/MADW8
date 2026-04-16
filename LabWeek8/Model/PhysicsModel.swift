import Foundation
import SwiftUI

struct Particle: Identifiable {
    let id = UUID()
    var x: CGFloat
    var y: CGFloat
    let targetX: CGFloat
    let targetY: CGFloat
    let size: CGFloat
    let color: Color
}

struct StaggerCard: Identifiable {
    let id = UUID()
    let row: Int
    let col: Int
    let color: Color
}
