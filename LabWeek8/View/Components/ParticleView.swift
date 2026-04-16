import SwiftUI

struct ParticleView: View {
    let particle: Particle
    @State private var opac = 1.0
    @State private var currentX: CGFloat
    @State private var currentY: CGFloat
    @State private var currentScale: CGFloat = 0.1

    init(particle: Particle) {
        self.particle = particle
        _currentX = State(initialValue: particle.x)
        _currentY = State(initialValue: particle.y)
    }

    var body: some View {
        Circle()
            .fill(particle.color)
            .frame(width: particle.size, height: particle.size)
            .scaleEffect(currentScale)
            .position(x: currentX, y: currentY)
            .opacity(opac)
            .onAppear {
                withAnimation(.easeOut(duration: 0.6)) {
                    currentX = particle.targetX
                    currentY = particle.targetY
                    currentScale = 1.0
                }
                withAnimation(.easeIn(duration: 0.8).delay(1.2)) {
                    opac = 0.0
                }
            }
    }
}
