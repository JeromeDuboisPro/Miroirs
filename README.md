# Miroirs 🌓

> *A dual-world 2D MMO where Light and Dark mirror each other*

![Status](https://img.shields.io/badge/status-in%20development-yellow)
![Phase](https://img.shields.io/badge/phase-planning-blue)
![Godot](https://img.shields.io/badge/godot-4.2+-blue)
![License](https://img.shields.io/badge/license-MIT-green)

## Overview

**Miroirs** is a 2D multiplayer exploration and survival game featuring two interconnected parallel worlds. Navigate between a vibrant **Light World** of nature and an industrial **Dark World** of technology, where every action in one world transforms the other.

### Core Hook

Two worlds, one coordinate system:
- 🌳 Cut a tree in Light → 🔩 Scrap metal appears in Dark
- ⚡ Harvest energy in Dark → 🍓 Berries grow in Light
- 💀 Death switches worlds + transforms your inventory
- 🌀 Portals provide safe transformation

**Result**: Emergent cooperation between players across worlds

## Key Features

- **⚖️ Dual-World Balance**: Resource transformation creates strategic economy
- **🎮 Simple Combat**: Rock-Paper-Scissors with epic finishers
- **🏗️ Cross-World Building**: Structures affect both worlds
- **🔄 Procedural Generation**: Every run is unique
- **🎨 Symbol-Based UI**: No language barriers, pure visual communication
- **⏱️ Configurable Duration**: 15-minute runs to 200+ hour epics

## Current Status

**Phase**: Planning & Design ✏️
**Next Milestone**: Phase 1 MVP - Single-player prototype

[View Full Roadmap →](planning/roadmap.md)

## Project Structure

```
miroirs/
├── planning/              # Design documents
│   ├── vision.md          # High-level concept
│   ├── mechanics/         # Game systems design
│   ├── technical/         # Architecture & tech specs
│   ├── art/               # Visual style guides
│   └── roadmap.md         # Development timeline
├── docs/                  # Technical documentation
├── src/                   # Source code (Godot project)
├── assets/                # Art, audio, data files
└── README.md              # This file
```

## Quick Start

### Prerequisites

- **Godot 4.2+** ([Installation Guide](docs/godot-setup.md))
- **Git** (for version control)
- **Aseprite** (optional, for creating pixel art)

### Running the Project

```bash
# Clone repository
git clone https://github.com/JeromeDuboisPro/Miroirs.git
cd miroirs

# Open in Godot
godot4 -e  # Opens Godot editor

# Or run directly (when available)
godot4 --main-pack game.pck
```

## Development

### Phase 1: MVP (Weeks 1-12)

**Goal**: Playable single-player prototype

- [x] Project setup
- [ ] Player movement
- [ ] Dual-world system
- [ ] Resource gathering
- [ ] Combat system
- [ ] Building mechanics
- [ ] Boss fights
- [ ] Save/load

[See detailed roadmap →](planning/roadmap.md)

### Contributing

Currently in early development. Contributions welcome after MVP!

**How to help**:
- Playtest builds and provide feedback
- Report bugs via Issues
- Suggest features in Discussions
- Create art assets (pixel art style)

## Technology Stack

| Component | Technology | Reason |
|-----------|-----------|---------|
| Engine | Godot 4.2+ | Free, 2D-focused, web export |
| Language | GDScript | Python-like, easy to learn |
| Art | Pixel Art (8-bit/16-bit) | Retro aesthetic, feasible for small team |
| Networking | Godot High-Level Multiplayer | Built-in, reliable |
| Version Control | Git + GitHub | Industry standard |

## Documentation

### Planning Documents
- [Vision & Concept](planning/vision.md)
- [Dual-World Mechanics](planning/mechanics/dual-world.md)
- [Combat System](planning/mechanics/combat.md)
- [Building System](planning/mechanics/building.md)
- [Progression](planning/mechanics/progression.md)

### Technical Docs
- [Architecture](planning/technical/architecture.md)
- [World Generation](planning/technical/world-generation.md)

### Art & Design
- [Symbol System](planning/art/symbol-system.md)
- [Style Guide](planning/art/style-guide.md)

## Community

- **GitHub**: [Issues](https://github.com/JeromeDuboisPro/Miroirs/issues) | [Discussions](https://github.com/JeromeDuboisPro/Miroirs/discussions)
- **Discord**: Coming soon (post-MVP)
- **Itch.io**: Coming soon (Phase 4)

## Inspirations

- **Valheim**: Procedural worlds, co-op building, discovery
- **Diablo**: Loot rarity system, addictive gameplay loop
- **Don't Starve**: Survival mechanics, resource management
- **One Punch Man**: Epic combat finishers in simple systems

## Design Pillars

1. **🌓 Dual-World Balance** - Every action has cross-world consequences
2. **🤝 Emergent Cooperation** - Players help each other without real-time coordination
3. **🌍 Universal Accessibility** - Symbol-based UI, no language barriers
4. **⚖️ Configurable Depth** - Quick sessions or epic campaigns, same mechanics
5. **💀 Strategic Death** - Death is a transformation tool, not just punishment

## Roadmap Highlights

| Phase | Timeline | Goal |
|-------|----------|------|
| **Phase 1** | Weeks 1-12 | Single-player MVP |
| **Phase 2** | Weeks 13-20 | Polish & depth |
| **Phase 3** | Weeks 21-32 | Online multiplayer |
| **Phase 4** | Months 9-12 | Content & 1.0 release |

**Total Development**: ~18-24 months (part-time)

[View Full Roadmap →](planning/roadmap.md)

## License

MIT License - See [LICENSE](LICENSE) for details

## Acknowledgments

- Godot Engine team for amazing open-source engine
- Community playtesters (post-MVP)
- Pixel art inspiration from retro game classics

---

**Status**: 🏗️ Early Development
**Last Updated**: 2025-10-27
**Version**: 0.0.1-planning

[⭐ Star this repo](https://github.com/JeromeDuboisPro/Miroirs) to follow development!
