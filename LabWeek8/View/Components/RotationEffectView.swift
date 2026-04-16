import SwiftUI

struct RotationEffectView: View {
    @ObservedObject var viewModel: TransformViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "arrow.triangle.2.circlepath")
                    .foregroundColor(.purple)
                Text("Rotation")
                    .font(.subheadline)
                    .fontWeight(.medium)
                Spacer()
                Toggle("", isOn: $viewModel.model.isRotating)
                    .labelsHidden()
            }

            Text("Angle: \(Int(viewModel.model.rotation))°")
                .font(.caption)
                .foregroundColor(.secondary)

            Slider(value: $viewModel.model.rotation, in: 0...360)
                .tint(.purple)
        }
        .padding(.horizontal)
    }
}
