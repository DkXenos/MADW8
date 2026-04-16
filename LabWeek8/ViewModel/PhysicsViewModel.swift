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
        withAnimation(.linear(duration: 0.1)) {
            springOffset = 150
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.interpolatingSpring(stiffness: 50, damping: 5, initialVelocity: 10)) {
                self.springOffset = 0
            }
        }
    }

    func burstParticles(screenSize: CGSize) {
        let colors: [Color] = [.red, .blue, .green, .yellow, .purple, .orange, .pink, .teal]

        for _ in 0..<15 {
            let randX = CGFloat.random(in: 40...(screenSize.width - 40))
            let randY = CGFloat.random(in: 40...(screenSize.height - 150))
            let randSize = CGFloat.random(in: 10...30)
            let randColor = colors.randomElement() ?? .red

            let particle = Particle(x: randX, y: randY, size: randSize, color: randColor)
            particles.append(particle)

            let id = particle.id
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                if let index = self.particles.firstIndex(where: { $0.id == id }) {
                    self.particles.remove(at: index)
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
