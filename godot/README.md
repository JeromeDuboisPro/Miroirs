# Miroirs - Godot Project

This is the main Godot 4.5 project for Miroirs.

## Project Structure

```
godot/
├── scenes/              # Scene files (.tscn)
│   ├── player/          # Player character scenes
│   ├── worlds/          # Light/Dark world scenes
│   ├── enemies/         # Enemy character scenes
│   ├── ui/              # UI scenes (menus, HUD)
│   └── buildings/       # Building/structure scenes
├── scripts/             # GDScript files (.gd)
│   ├── player/          # Player logic
│   ├── systems/         # Core game systems
│   ├── enemies/         # Enemy AI
│   ├── ui/              # UI controllers
│   └── utils/           # Helper functions
├── assets/              # Game assets
│   ├── sprites/         # Character/object sprites
│   ├── tiles/           # Tilemap textures
│   ├── audio/           # Sound effects & music
│   └── data/            # JSON/configuration files
├── .godot/              # Godot internal (gitignored)
├── project.godot        # Main project configuration
└── icon.svg             # Project icon
```

## Getting Started

1. **Open Project**:
   ```bash
   godot4 -e /home/jerome/devs/miroir/godot/project.godot
   ```

2. **Project Settings**:
   - Display: 320x180 (scaled up)
   - Renderer: Forward+
   - Texture Filter: Nearest (pixel-perfect)

3. **First Scene**:
   - Create `scenes/player/player.tscn`
   - Add CharacterBody2D node
   - Attach `scripts/player/player.gd`

## Development Workflow

**Scene Creation**:
1. Create scene in appropriate `scenes/` subfolder
2. Create corresponding script in `scripts/` subfolder
3. Keep scenes small and focused (single responsibility)

**Asset Naming**:
- Scenes: `snake_case.tscn` (e.g., `player_character.tscn`)
- Scripts: `snake_case.gd` (e.g., `player_movement.gd`)
- Sprites: `category_name_variant.png` (e.g., `player_idle_01.png`)

## Key Godot Concepts

**Node Types We'll Use**:
- `CharacterBody2D`: Player, enemies (physics-based)
- `Sprite2D`: Static sprites
- `AnimatedSprite2D`: Animated sprites
- `TileMap`: World terrain
- `Area2D`: Triggers, detection zones
- `CollisionShape2D`: Collision detection

**Resource Paths**:
- Use `res://` for all paths (e.g., `res://scenes/player/player.tscn`)
- Godot automatically handles relative paths from project root

## Current Phase

**Phase 1, Week 1-2**: Project Setup
- [x] Initialize Godot project
- [x] Create folder structure
- [ ] Basic player movement
- [ ] Dual-world toggle

See [main roadmap](../planning/roadmap.md) for full development plan.

## Useful Commands

```bash
# Run project
godot4 --path /home/jerome/devs/miroir/godot

# Run specific scene
godot4 --path /home/jerome/devs/miroir/godot scenes/test.tscn

# Export project (future)
godot4 --headless --export-release "Linux/X11" ../builds/miroir-linux.x86_64
```

## Next Steps

Follow [Week 1 tasks](../planning/roadmap.md#weeks-1-2-project-setup--learning):
1. Complete Godot tutorials
2. Create player sprite
3. Implement WASD movement
4. Create Light/Dark tilemaps
5. Add world-switching

---

**Happy coding!** 🎮✨
