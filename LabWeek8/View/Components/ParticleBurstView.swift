import SwiftUI

struct ParticleBurstView: View {
    @ObservedObject var viewModel: PhysicsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Particle Burst", systemImage: "sparkle")
                .font(.headline)

            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray6))
                    .frame(height: 250)

                GeometryReader { geo in
                    ForEach(viewModel.particles) { particle in
                        ParticleView(particle: particle)
                    }
                    .onAppear {
                        viewModel.particleAreaSize = geo.size
                    }
                    .onChange(of: geo.size) { _, newSize in
                        viewModel.particleAreaSize = newSize
                    }
                }
                .frame(height: 250)
                .clipped()
            }

            Button(action: {
                viewModel.burstParticles()
            }) {
                HStack(spacing: 6) {
                    Image(systemName: "sparkles")
                    Text("Burst!")
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    LinearGradient(
                        colors: [.red, .pink],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(20)
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.horizontal)
    }
}
