import SwiftUI

struct MorphShapeView: View {
    @ObservedObject var viewModel: PhysicsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Morph Shape", systemImage: "circle.fill")
                .font(.headline)

            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray6))
                    .frame(height: 200)

                MorphableOctagon(morphProgress: viewModel.morphProgress)
                    .fill(
                        LinearGradient(
                            colors: [.purple, .blue.opacity(0.6)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 120, height: 120)
                    .animation(.easeInOut(duration: 0.3), value: viewModel.morphProgress)
            }

            Text("Morph: \(Int(viewModel.morphProgress * 100))%")
                .font(.caption)
                .foregroundColor(.secondary)

            Slider(value: $viewModel.morphProgress, in: 0...1)
                .tint(.blue)
        }
        .padding(.horizontal)
    }
}
