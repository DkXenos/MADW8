import SwiftUI

struct ParticleView: View {
    let particle: Particle
    @State private var opac = 1.0
    
    var body: some View {
        Circle()
            .fill(particle.color)
            .frame(width: particle.size, height: particle.size)
            .position(x: particle.x, y: particle.y)
            .opacity(opac)
            .onAppear {
                withAnimation(.easeOut(duration: 1.5)) {
                    opac = 0.0
                }
            }
    }
}
