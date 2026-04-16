import SwiftUI

struct SpringEffectView: View {
    @ObservedObject var viewModel: PhysicsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Spring Effect", systemImage: "wand.and.stars")
                .font(.headline)

            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray6))
                    .frame(height: 120)

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
                    .offset(y: viewModel.springOffset)
            }

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
