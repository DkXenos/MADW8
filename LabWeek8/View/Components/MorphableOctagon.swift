import SwiftUI

struct MorphableOctagon: Shape {
    var morphProgress: Double

    var animatableData: Double {
        get { morphProgress }
        set { morphProgress = newValue }
    }

    func path(in rect: CGRect) -> Path {
        let w = rect.width
        let h = rect.height
        let cx = rect.midX
        let cy = rect.midY

        let angleStep = .pi / 4.0

        var path = Path()

        for i in 0..<8 {
            let angle = angleStep * Double(i) - .pi / 2.0

            let baseRadius: Double
            if i % 2 == 0 {
                baseRadius = Double(min(w, h)) / 2.0
                let morphedRadius = baseRadius * (1.0 - morphProgress * 0.55)
                let x = cx + CGFloat(cos(angle) * morphedRadius)
                let y = cy + CGFloat(sin(angle) * morphedRadius)
                if i == 0 {
                    path.move(to: CGPoint(x: x, y: y))
                } else {
                    path.addLine(to: CGPoint(x: x, y: y))
                }
            } else {
                baseRadius = Double(min(w, h)) / 2.0
                let x = cx + CGFloat(cos(angle) * baseRadius)
                let y = cy + CGFloat(sin(angle) * baseRadius)
                if i == 0 {
                    path.move(to: CGPoint(x: x, y: y))
                } else {
                    path.addLine(to: CGPoint(x: x, y: y))
                }
            }
        }

        path.closeSubpath()
        return path
    }
}
