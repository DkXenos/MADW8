import SwiftUI

struct SpringEffectView: View {
    @ObservedObject var viewModel: PhysicsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Spring Effect", systemImage: "spring.brakesystem")
                .font(.headline)

            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            colors: [.purple.opacity(0.3), .pink.opacity(0.3)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(height: 8)

                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [.pink, .purple]),
                            center: .center,
                            startRadius: 2,
                            endRadius: 20
                        )
                    )
                    .frame(width: 40, height: 40)
                    .offset(x: viewModel.springOffset)
            }
            .frame(height: 40)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let newX = max(0, value.location.x - 20)
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
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(
                        LinearGradient(
                            colors: [.purple, .pink],
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
