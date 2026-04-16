import Foundation
import SwiftUI

struct Particle: Identifiable {
    let id = UUID()
    let x: CGFloat
    let y: CGFloat
    let size: CGFloat
    let color: Color
}

struct StaggerCard: Identifiable {
    let id = UUID()
    let row: Int
    let col: Int
    let color: Color
}
