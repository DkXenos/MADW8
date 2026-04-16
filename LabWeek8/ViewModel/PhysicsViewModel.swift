import Foundation
import SwiftUI
import Combine

class PhysicsViewModel: ObservableObject {
    @Published var springOffset: CGFloat = 0.0
    @Published var particles: [Particle] = []
    @Published var staggerCards: [StaggerCard] = []
    @Published var cardsVisible: Bool = false
    @Published var morphProgress: Double = 0.0
    @Published var isFlipped: Bool = false

    var springTrackWidth: CGFloat = 300
    var particleAreaSize: CGSize = CGSize(width: 300, height: 250)

    private let gridColors: [[Color]] = [
        [.red, .orange, .yellow],
        [.green, .cyan, .blue],
        [.indigo, .purple, .pink]
    ]

    init() {
        buildStaggerCards()
    }

    private func buildStaggerCards() {
        var cards: [StaggerCard] = []
        for row in 0..<3 {
            for col in 0..<3 {
                cards.append(StaggerCard(row: row, col: col, color: gridColors[row][col]))
            }
        }
        staggerCards = cards
    }

    func launchSpring() {
        withAnimation(.linear(duration: 0.15)) {
            springOffset = 1.0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            withAnimation(.interpolatingSpring(stiffness: 40, damping: 5, initialVelocity: 8)) {
                self.springOffset = 0.0
            }
        }
    }

    func burstParticles() {
        let colors: [Color] = [.red, .blue, .green, .yellow, .purple, .orange, .pink, .teal, .cyan, .mint]
        let w = particleAreaSize.width
        let h = particleAreaSize.height

        for _ in 0..<15 {
            let randX = CGFloat.random(in: 15...(w - 15))
            let randY = CGFloat.random(in: 15...(h - 15))
            let randSize = CGFloat.random(in: 8...35)
            let randColor = colors.randomElement() ?? .red

            let particle = Particle(x: randX, y: randY, size: randSize, color: randColor)
            particles.append(particle)

            let id = particle.id
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation(.easeOut(duration: 0.5)) {
                    if let index = self.particles.firstIndex(where: { $0.id == id }) {
                        self.particles.remove(at: index)
                    }
                }
            }
        }
    }

    func revealCards() {
        cardsVisible = true
    }

    func hideCards() {
        cardsVisible = false
    }

    func toggleFlip() {
        withAnimation(.easeInOut(duration: 0.6)) {
            isFlipped.toggle()
        }
    }
}
