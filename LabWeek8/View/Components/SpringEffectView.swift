import SwiftUI

struct SpringEffectView: View {
    @ObservedObject var viewModel: PhysicsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Spring Effect", systemImage: "spring.brakesystem")
                .font(.headline)

            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color(.systemGray4))
                    .frame(height: 6)

                Capsule()
                    .fill(
                        LinearGradient(
                            colors: [.purple, .purple.opacity(0.4)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: max(0, viewModel.springOffset + 20), height: 6)

                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [.pink, .purple]),
                            center: .center,
                            startRadius: 2,
                            endRadius: 18
                        )
                    )
                    .frame(width: 36, height: 36)
                    .shadow(color: .purple.opacity(0.3), radius: 4, y: 2)
                    .offset(x: viewModel.springOffset)
            }
            .padding(.vertical, 4)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let newX = max(0, value.location.x - 18)
                        viewModel.springOffset = newX
                    }
            )

            Button(action: {
                viewModel.launchSpring()
            }) {
                Text("Launch Spring")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 28)
                    .padding(.vertical, 12)
                    .background(
                        LinearGradient(
                            colors: [.purple, .purple.opacity(0.7)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(25)
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.06), radius: 8, y: 2)
        )
        .padding(.horizontal)
    }
}
