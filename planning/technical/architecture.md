# Technical Architecture

## Technology Stack

### Game Engine: **Godot 4.2+**

**Rationale**:
- ✅ Python-like GDScript (easy learning curve)
- ✅ Excellent 2D support with tilemap system
- ✅ Built-in networking (high-level multiplayer API)
- ✅ Web export (HTML5/WebAssembly)
- ✅ Free and open source
- ✅ Active community, good documentation
- ✅ Cross-platform (Windows, Linux, macOS, Web)

**Alternatives Considered**:
- Python + Pygame: Familiar but limited multiplayer/web support
- Unity: Powerful but C# less aligned with user skills
- Custom C++: Too much boilerplate for MVP

### Version Control: **Git + GitHub**

**Repository**: https://github.com/JeromeDuboisPro/Miroirs.git

**Branch Strategy**:
- `main`: Stable releases only
- `develop`: Active development branch
- `feature/*`: Feature-specific branches
- `hotfix/*`: Critical bug fixes

### Development Tools

**Code Editor**: VS Code with Godot Tools extension
**Asset Creation**:
- Aseprite (pixel art)
- GIMP (image editing)
- Audacity (sound effects)

**Testing**: Godot's built-in debugger + GUT (Godot Unit Test)

## System Architecture

### Phase 1: Single-Player Architecture

```
┌─────────────────────────────────┐
│     Miroirs Game (Godot)        │
├─────────────────────────────────┤
│                                 │
│  ┌──────────┐   ┌────────────┐ │
│  │  Player  │   │   World    │ │
│  │  State   │←→ │   State    │ │
│  └──────────┘   └────────────┘ │
│       ↓               ↓         │
│  ┌──────────────────────────┐  │
│  │  Game Systems Manager    │  │
│  ├──────────────────────────┤  │
│  │ • Combat System          │  │
│  │ • World Generator        │  │
│  │ • Inventory Manager      │  │
│  │ • Building System        │  │
│  │ • Resource Transformer   │  │
│  └──────────────────────────┘  │
│       ↓                         │
│  ┌──────────────────────────┐  │
│  │  Rendering & UI          │  │
│  └──────────────────────────┘  │
└─────────────────────────────────┘
         ↓
    Local Save File
```

**Key Components**:
- **Player State**: Health, inventory, position, equipped items
- **World State**: Tile data, structures, enemy spawns, resource nodes
- **Game Systems Manager**: Coordinates all game logic
- **Rendering**: Godot's 2D rendering engine

### Phase 3: Multiplayer Architecture (Future)

```
┌──────────────┐      ┌──────────────┐      ┌──────────────┐
│  Client A    │      │    Server    │      │  Client B    │
│  (Player 1)  │◄────►│ (Authority)  │◄────►│  (Player 2)  │
└──────────────┘      └──────────────┘      └──────────────┘
      │                     │                       │
      │                     ↓                       │
      │              ┌─────────────┐                │
      │              │ World State │                │
      │              │   (Server)  │                │
      │              └─────────────┘                │
      │                     │                       │
      └─────────────────────┼───────────────────────┘
                           │
                    ┌──────▼──────┐
                    │  Database   │
                    │ (Persistent │
                    │   Storage)  │
                    └─────────────┘
```

**Networking Model**: Client-Server (Authoritative Server)
- Server simulates world physics and game state
- Clients send inputs, receive state updates
- Server validates all actions (anti-cheat)
- Interpolation/prediction for smooth client experience

**Protocol**: Godot's high-level multiplayer (RPC over ENet/WebRTC)

## Core Systems Design

### 1. World Generation System

**Responsibilities**:
- Generate procedural terrain for both worlds
- Place resources, enemies, portals
- Ensure spatial consistency between worlds

**Algorithm**: Perlin/Simplex noise-based generation

```gdscript
class WorldGenerator:
    func generate_world(seed: int, size: int) -> World:
        # Generate base terrain using noise
        var light_terrain = generate_terrain(seed, LIGHT_PARAMS)
        var dark_terrain = generate_terrain(seed + 1, DARK_PARAMS)

        # Place resources and structures
        place_resources(light_terrain, LIGHT_RESOURCES)
        place_resources(dark_terrain, DARK_RESOURCES)

        # Place portals at same coordinates in both worlds
        var portal_positions = generate_portal_positions(size)
        place_portals(light_terrain, portal_positions)
        place_portals(dark_terrain, portal_positions)

        return World.new(light_terrain, dark_terrain)
```

**Data Structure**:
```gdscript
class World:
    var light_terrain: TileMap
    var dark_terrain: TileMap
    var active_world: WorldType  # LIGHT or DARK
    var seed: int
    var size: Vector2i
```

### 2. World Transformation System

**Responsibilities**:
- Track spatial correspondence between worlds
- Transform resources when world switches
- Update terrain based on cross-world actions

**Transformation Mapping**:
```gdscript
const RESOURCE_TRANSFORM = {
    "wood": "metal",
    "food": "energy",
    "creature_parts": "robot_parts",
    "metal": "wood",
    "energy": "food",
    "robot_parts": "creature_parts"
}

func transform_inventory(inventory: Array, loss_rate: float) -> Array:
    var transformed = []
    for item in inventory:
        var new_type = RESOURCE_TRANSFORM[item.type]
        var new_quantity = int(item.quantity * (1.0 - loss_rate))
        transformed.append(Item.new(new_type, new_quantity, item.rarity))
    return transformed
```

**Spatial Mirroring**:
```gdscript
func harvest_resource(world: WorldType, position: Vector2i):
    var opposite_world = get_opposite_world(world)
    var resource_type = get_resource_at(world, position)

    # Remove from current world
    remove_resource(world, position)

    # Add transformed resource to opposite world
    var transformed_type = RESOURCE_TRANSFORM[resource_type]
    spawn_resource(opposite_world, position, transformed_type)
```

### 3. Combat System

**Responsibilities**:
- Handle attack input and timing
- Calculate damage based on RPS system
- Trigger finisher animations
- Manage enemy AI

**Combat State Machine**:
```gdscript
enum CombatState { IDLE, ATTACK_STARTUP, ATTACK_ACTIVE, ATTACK_RECOVERY, FINISHER }

class CombatSystem:
    var state: CombatState = IDLE
    var combo_count: int = 0
    var timing_window: float = 0.3  # seconds

    func process_attack_input():
        if state == IDLE:
            start_attack()
        elif state == ATTACK_ACTIVE:
            var timing = check_timing()
            if timing == PERFECT:
                combo_count += 1
                apply_damage(base_damage * 1.5)
                if combo_count >= 3:
                    trigger_finisher()
            elif timing == GOOD:
                combo_count += 1
                apply_damage(base_damage)
            else:  # MISS
                combo_count = 0
                apply_damage(base_damage * 0.5)
```

### 4. Building System

**Responsibilities**:
- Place structures in world grid
- Validate placement (collision, resources)
- Create echoes in opposite world
- Persist building data

**Building Manager**:
```gdscript
class BuildingSystem:
    var structures: Dictionary = {}  # position -> Structure

    func place_structure(type: String, position: Vector2i, world: WorldType) -> bool:
        # Validate placement
        if not is_valid_placement(position, world):
            return false

        # Check resources
        if not player.has_resources(STRUCTURE_COSTS[type]):
            return false

        # Place structure
        var structure = Structure.new(type, position, world)
        structures[position] = structure

        # Create echo in opposite world
        create_echo(structure, get_opposite_world(world))

        # Consume resources
        player.consume_resources(STRUCTURE_COSTS[type])
        return true
```

### 5. Save System

**Responsibilities**:
- Serialize game state to disk
- Load game state on launch
- Handle save file versioning

**Save Data Structure**:
```json
{
    "version": "0.1.0",
    "world": {
        "seed": 123456,
        "size": [256, 256],
        "current_world": "light"
    },
    "player": {
        "position": [128, 128],
        "health": 100,
        "inventory": [
            {"type": "wood", "quantity": 45, "rarity": "common"},
            {"type": "sword", "quantity": 1, "rarity": "rare"}
        ],
        "equipped": {
            "weapon": "rare_sword_001",
            "armor": "common_vest_001"
        }
    },
    "structures": [
        {"type": "campfire", "position": [130, 125], "world": "light"},
        {"type": "chest", "position": [135, 125], "world": "dark"}
    ],
    "bosses_defeated": ["ancient_treant"]
}
```

**Save/Load Implementation**:
```gdscript
func save_game(path: String):
    var save_data = {
        "version": VERSION,
        "world": world.serialize(),
        "player": player.serialize(),
        "structures": building_system.serialize(),
        "bosses_defeated": progression.bosses_defeated
    }

    var file = FileAccess.open(path, FileAccess.WRITE)
    file.store_string(JSON.stringify(save_data))
    file.close()

func load_game(path: String) -> bool:
    if not FileAccess.file_exists(path):
        return false

    var file = FileAccess.open(path, FileAccess.READ)
    var json = JSON.parse_string(file.get_as_text())
    file.close()

    # Deserialize components
    world.deserialize(json["world"])
    player.deserialize(json["player"])
    building_system.deserialize(json["structures"])
    progression.bosses_defeated = json["bosses_defeated"]

    return true
```

## Performance Considerations

### Optimization Strategies

**1. Chunk-Based Loading**
- Divide world into chunks (32x32 tiles)
- Only load/update visible chunks + 1 chunk radius
- Unload distant chunks from memory

**2. Object Pooling**
- Reuse enemy/projectile objects instead of creating/destroying
- Pool sizes: 50 enemies, 100 projectiles, 50 particles

**3. Rendering Optimization**
- Use Godot's tilemap autotiling
- Batch sprite rendering
- Cull off-screen entities

**4. Network Optimization** (Phase 3)
- Delta compression for state updates
- Interest management (only send nearby entity updates)
- Snapshot interpolation on clients

### Target Performance

**MVP (Phase 1)**:
- 60 FPS on mid-range hardware (GTX 1050, i5 CPU)
- 1000 tiles visible on screen
- 50 active enemies simultaneously
- < 200 MB RAM usage
- < 50 MB save file size

**Web Export**:
- 30-60 FPS on modern browsers
- < 100 MB download size
- < 300 MB RAM usage in browser

## Error Handling

### Graceful Degradation
- Save corruption → Load backup save or start new game
- Resource missing → Use placeholder asset
- Network timeout → Disconnect gracefully, save progress

### Logging
- Debug builds: Verbose logging to console
- Release builds: Error-only logging to file
- Log rotation (keep last 5 log files)

## Security Considerations (Phase 3 Multiplayer)

### Client-Side
- No sensitive data in client code
- Input validation on client (user experience)
- Don't trust client timing/position

### Server-Side
- Validate all client inputs
- Rate limiting (prevent spam/DoS)
- Position/movement validation (anti-cheat)
- Save file encryption (prevent cheating)

## Development Workflow

### Local Development
1. Make changes in Godot editor
2. Run game in editor (F5) for testing
3. Iterate quickly

### Testing
1. Unit tests for core systems (GUT framework)
2. Manual playtesting for game feel
3. Save/load testing (corruption prevention)

### Deployment
1. Export builds (Windows, Linux, Web)
2. Test exported builds on clean systems
3. Package with installer (future)
4. Upload to itch.io / GitHub releases

## Scalability Plan

### Phase 1: Single-Player
- Local save files
- No networking code
- Simple architecture

### Phase 2: Local Co-op
- Shared world state in memory
- Split-screen or hot-seat
- No network complexity

### Phase 3: Online Multiplayer
- Add server component
- Implement networking layer
- Client-server architecture
- Dedicated server support

### Phase 4: MMO (Future)
- Persistent world servers
- Database for player accounts
- Load balancing
- Sharding by region

## Technology Risks & Mitigations

| Risk | Impact | Mitigation |
|------|--------|------------|
| Godot learning curve | Medium | Use docs, tutorials, community |
| Web export performance | Medium | Optimize assets, test early |
| Multiplayer complexity | High | Start single-player, add later |
| Procedural generation bugs | Medium | Extensive testing, seed logging |
| Save corruption | High | Backup saves, versioning |

## MVP Implementation Checklist

### Phase 1 (Weeks 1-4)
- [ ] Set up Godot project structure
- [ ] Implement basic player movement
- [ ] Create Light/Dark world tilemaps
- [ ] Basic resource gathering
- [ ] Simple death/world-switch mechanic
- [ ] Inventory system
- [ ] Save/load functionality

### Phase 2 (Weeks 5-8)
- [ ] Combat system with RPS mechanics
- [ ] Enemy AI (basic patrol + attack)
- [ ] Building placement system
- [ ] Crafting menu and recipes
- [ ] Boss fight (one per world)
- [ ] UI polish (symbol-based icons)
- [ ] Victory condition

### Phase 3 (Weeks 9-12)
- [ ] Polish combat (timing windows, finishers)
- [ ] Procedural world generation
- [ ] Loot system (rarity tiers, drops)
- [ ] Balance tuning
- [ ] Audio (music, SFX)
- [ ] Playtesting and bug fixes
