# LabWeek8 — Animation Playground

A SwiftUI application demonstrating advanced animation and transformation techniques using MVVM architecture.

## Prerequisites

- **Xcode 15+** (any version supporting SwiftUI and iOS 17+)
- **iOS 17.0+** deployment target
- No external packages or dependencies — everything uses native SwiftUI

## Project Structure (MVVM)

```
LabWeek8/
├── Model/
│   ├── PhysicsModel.swift        (Particle, StaggerCard)
│   └── TransformModel.swift      (Scale, Rotation, Opacity, Hue + toggle states)
├── View/
│   ├── SplashView.swift          (Animated splash screen)
│   ├── MainTabView.swift         (Tab navigation)
│   ├── PhysicsLabView.swift      (Spring + Particle + Stagger + Morph + Flip)
│   ├── TransformLabView.swift    (Cube + Scale + Rotation + Opacity + Hue)
│   └── Components/
│       ├── TransformCubeView.swift   (Purple star object with all effects)
│       ├── ScaleEffectView.swift     (Scale slider + toggle)
│       ├── RotationEffectView.swift  (Rotation slider + toggle)
│       ├── OpacityEffectView.swift   (Opacity slider + toggle)
│       ├── HueEffectView.swift       (Hue slider + toggle)
│       ├── SpringEffectView.swift    (Spring ball animation)
│       ├── ParticleView.swift        (Single particle circle)
│       ├── ParticleBurstView.swift   (Burst container + button)
│       ├── StaggerRevealView.swift   (3x3 grid + reveal/hide)
│       ├── StaggerCardView.swift     (Individual stagger card)
│       ├── MorphShapeView.swift      (Octagon-to-diamond morph)
│       ├── MorphableOctagon.swift    (Custom Shape)
│       ├── FlipCardView.swift        (3D y-axis flip)
│       ├── CardFrontView.swift       (Front card face)
│       └── CardBackView.swift        (Back card face)
├── ViewModel/
│   ├── PhysicsViewModel.swift    (Spring, particles, stagger, morph, flip)
│   └── TransformViewModel.swift  (Scale, rotation, opacity, hue state)
├── ContentView.swift             (Splash → MainTabView transition)
└── LabWeek8App.swift             (App entry point)
```

## App Flow

```
App Launch → Splash Screen → [Enter Playground] → Tab View
                                                    ├── Transform Lab
                                                    │   ├── Purple Star Cube (all effects applied)
                                                    │   ├── Scale (slider + toggle)
                                                    │   ├── Rotation (slider + toggle)
                                                    │   ├── Opacity (slider + toggle)
                                                    │   └── Hue (slider + toggle)
                                                    └── Physics Lab
                                                        ├── Spring Effect
                                                        ├── Particle Burst
                                                        ├── Stagger Reveal
                                                        ├── Morph Shape
                                                        └── 3D Card Flip
```

## Features

### 1. Splash Screen
- Rotating angular gradient background (dark blues/teals/purples, infinite)
- Sparkle icon pops up + spins with spring animation, then settles
- Cyan glow effect behind the sparkle icon
- "Animation" title and "Playground" subtitle fade in after logo
- "Enter Playground" button appears with pulsing scale + glow animation
- Tapping the button transitions to the main app with a fade

### 2. Scaling Effect (Transform Lab)
- Slider adjusts the star cube's scale from 0.5x to 2.0x
- Toggle enables breathing animation: scale pulses between 1.0x and 1.2x
- Can be combined with other toggle effects simultaneously

### 3. Rotating Effect (Transform Lab)
- Slider rotates the star cube from 0° to 360°
- Toggle enables continuous clockwise spinning
- Can be combined with other toggle effects simultaneously

### 4. Opacity Effect (Transform Lab)
- Slider adjusts the star cube's opacity from 0.0 to 1.0
- Toggle enables breathing opacity: fades between fully visible and fully transparent
- Can be combined with other toggle effects simultaneously

### 5. Hue Effect (Transform Lab)
- Slider rotates the star cube's hue from 0° to 360°
- Toggle enables continuous hue cycling through all colors
- Can be combined with other toggle effects simultaneously

### 6. Spring Effect (Physics Lab)
- Purple-pink gradient ball with spring physics
- Press "Launch Spring" to shoot the ball down and have it bounce back

### 7. Particle Burst (Physics Lab)
- Press "Burst!" to spawn 15 random particles
- Each particle has random position, size (10-30pt), and color
- Particles fade out over 1.5 seconds

### 8. Stagger Reveal (Physics Lab)
- 3x3 grid of 9 colorful cards
- "Reveal" shows all cards with diagonal stagger animation (row+col delay)
- "Hide" removes cards with the same stagger pattern

### 9. Morph Shape (Physics Lab)
- Octagon shape with purple-blue gradient
- Slider morphs from octagon (0%) to diamond (100%) by pulling even corners inward

### 10. 3D Card Flip (Physics Lab)
- Front: purple-blue gradient with credit card icon
- Back: orange-red gradient with checkmark icon
- "Flip Card" / "Flip Back" button triggers y-axis 3D rotation

## How to Run

1. Open `LabWeek8.xcodeproj` in Xcode
2. Select an iOS Simulator (e.g., iPhone 17 Pro)
3. Press **Cmd + R** to build and run
4. The app launches with the animated splash screen
5. Tap "Enter Playground" to enter the main app
6. Use the bottom tab bar to switch between Transform Lab and Physics Lab
