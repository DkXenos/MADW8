import SwiftUI

struct SplashView: View {
    var onEnter: () -> Void

    @State private var backgroundColorIndex = 0
    @State private var logoScale: CGFloat = 0.5
    @State private var logoRotation: Double = 0
    @State private var isTextVisible = false
    @State private var isButtonVisible = false
    @State private var buttonScale: CGFloat = 1.0
    @State private var buttonGlow: CGFloat = 0.0

    let colors: [Color] = [
        Color(red: 0.05, green: 0.15, blue: 0.35),
        Color(red: 0.35, green: 0.08, blue: 0.35),
        Color(red: 0.1, green: 0.35, blue: 0.45),
        Color(red: 0.25, green: 0.15, blue: 0.45)
    ]

    var body: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: colors), center: .center, angle: .degrees(Double(backgroundColorIndex) * 90))
                .ignoresSafeArea()
                .animation(.linear(duration: 5.0).repeatForever(autoreverses: false), value: backgroundColorIndex)
                .onAppear {
                    backgroundColorIndex = 4
                }

            VStack(spacing: 20) {
                Spacer()

                ZStack {
                    Circle()
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: [.cyan.opacity(0.4), .clear]),
                                center: .center,
                                startRadius: 5,
                                endRadius: 80
                            )
                        )
                        .frame(width: 160, height: 160)

                    Image(systemName: "sparkles")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                }
                .scaleEffect(logoScale)
                .rotationEffect(.degrees(logoRotation))
                .onAppear {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 0)) {
                        logoScale = 1.0
                        logoRotation = 360
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation(.easeIn) {
                            isTextVisible = true
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(.easeIn) {
                            isButtonVisible = true
                        }
                        withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                            buttonScale = 1.1
                            buttonGlow = 10
                        }
                    }
                }

                if isTextVisible {
                    VStack(spacing: 5) {
                        Text("Animation")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.cyan)
                        Text("Playground")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    .transition(.scale.combined(with: .opacity))
                }

                Spacer()

                if isButtonVisible {
                    Button(action: onEnter) {
                        HStack {
                            Text("Enter Playground")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right.circle.fill")
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(25)
                        .scaleEffect(buttonScale)
                        .shadow(color: .cyan.opacity(0.5), radius: buttonGlow)
                    }
                    .padding(.bottom, 60)
                    .transition(.scale.combined(with: .opacity))
                }
            }
        }
    }
}
