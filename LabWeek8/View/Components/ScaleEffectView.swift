import SwiftUI

struct ScaleEffectView: View {
    @ObservedObject var viewModel: TransformViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                    .foregroundColor(.purple)
                Text("Scale")
                    .font(.subheadline)
                    .fontWeight(.medium)
                Spacer()
                Toggle("", isOn: $viewModel.model.isScaling)
                    .labelsHidden()
            }

            Text("Scale: \(viewModel.model.scale, specifier: "%.2f")")
                .font(.caption)
                .foregroundColor(.secondary)

            Slider(value: $viewModel.model.scale, in: 0.5...2.0)
                .tint(.purple)
        }
        .padding(.horizontal)
    }
}
