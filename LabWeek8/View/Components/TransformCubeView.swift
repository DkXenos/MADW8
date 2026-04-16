import SwiftUI

struct TransformCubeView: View {
    @ObservedObject var viewModel: TransformViewModel

    @State private var displayScale: CGFloat = 1.0
    @State private var displayRotation: Double = 0.0
    @State private var displayOpacity: Double = 1.0
    @State private var displayHue: Double = 0.0

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(
                    LinearGradient(
                        colors: [Color(red: 0.35, green: 0.25, blue: 0.85), Color(red: 0.45, green: 0.35, blue: 0.95)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 150, height: 150)
                .shadow(color: .purple.opacity(0.3), radius: 10, y: 5)

            Image(systemName: "star.fill")
                .font(.system(size: 60))
                .foregroundColor(.white)
        }
        .scaleEffect(displayScale)
        .rotationEffect(.degrees(displayRotation))
        .opacity(displayOpacity)
        .hueRotation(.degrees(displayHue))
        .padding(.vertical, 20)
        .onChange(of: viewModel.model.scale) { _, newValue in
            if !viewModel.model.isScaling {
                withAnimation(.easeInOut(duration: 0.2)) {
                    displayScale = newValue
                }
            }
        }
        .onChange(of: viewModel.model.isScaling) { _, newValue in
            if newValue {
                displayScale = 1.0
                withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                    displayScale = 1.2
                }
            } else {
                withAnimation(.easeInOut(duration: 0.3)) {
                    displayScale = viewModel.model.scale
                }
            }
        }
        .onChange(of: viewModel.model.rotation) { _, newValue in
            if !viewModel.model.isRotating {
                withAnimation(.easeInOut(duration: 0.2)) {
                    displayRotation = newValue
                }
            }
        }
        .onChange(of: viewModel.model.isRotating) { _, newValue in
            if newValue {
                displayRotation = 0
                withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: false)) {
                    displayRotation = 360
                }
            } else {
                withAnimation(.easeOut(duration: 0.3)) {
                    displayRotation = viewModel.model.rotation
                }
            }
        }
        .onChange(of: viewModel.model.opacity) { _, newValue in
            if !viewModel.model.isOpacityBreathing {
                withAnimation(.easeInOut(duration: 0.2)) {
                    displayOpacity = newValue
                }
            }
        }
        .onChange(of: viewModel.model.isOpacityBreathing) { _, newValue in
            if newValue {
                displayOpacity = 1.0
                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                    displayOpacity = 0.0
                }
            } else {
                withAnimation(.easeInOut(duration: 0.3)) {
                    displayOpacity = viewModel.model.opacity
                }
            }
        }
        .onChange(of: viewModel.model.hue) { _, newValue in
            if !viewModel.model.isHueBreathing {
                withAnimation(.easeInOut(duration: 0.2)) {
                    displayHue = newValue
                }
            }
        }
        .onChange(of: viewModel.model.isHueBreathing) { _, newValue in
            if newValue {
                displayHue = 0
                withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: false)) {
                    displayHue = 360
                }
            } else {
                withAnimation(.easeOut(duration: 0.3)) {
                    displayHue = viewModel.model.hue
                }
            }
        }
    }
}
