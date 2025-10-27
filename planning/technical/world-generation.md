# Procedural World Generation

## Overview

Miroirs uses procedural generation to create infinite variety of dual worlds. Each world is generated from a seed, ensuring reproducibility while providing unique experiences.

## Generation Algorithm

### Seed-Based Generation

**Input**: Integer seed (user-specified or random)
**Output**: Two spatially-linked worlds (Light + Dark)

**Key Principle**: Same coordinates in both worlds, different content

```gdscript
class WorldGenerator:
    var seed: int
    var light_seed: int  # seed
    var dark_seed: int   # seed + 1

    func _init(base_seed: int):
        seed = base_seed
        light_seed = seed
        dark_seed = seed + 1
```

### Noise-Based Terrain Generation

**Algorithm**: Perlin/Simplex noise for organic terrain patterns

**Parameters**:
```gdscript
const TERRAIN_PARAMS = {
    "light": {
        "frequency": 0.05,    # Smooth, flowing terrain
        "octaves": 4,         # Detail layers
        "persistence": 0.5,   # Detail falloff
        "lacunarity": 2.0     # Detail frequency multiplier
    },
    "dark": {
        "frequency": 0.08,    # More angular, geometric
        "octaves": 3,
        "persistence": 0.4,
        "lacunarity": 2.5
    }
}
```

### Generation Pipeline

**Step 1: Terrain Height Map**
```gdscript
func generate_heightmap(width: int, height: int, noise_seed: int) -> Array:
    var noise = FastNoiseLite.new()
    noise.seed = noise_seed
    noise.frequency = TERRAIN_PARAMS["frequency"]

    var heightmap = []
    for y in range(height):
        var row = []
        for x in range(width):
            var value = noise.get_noise_2d(x, y)
            # Normalize to 0.0 - 1.0
            value = (value + 1.0) / 2.0
            row.append(value)
        heightmap.append(row)

    return heightmap
```

**Step 2: Biome Assignment**
```gdscript
func assign_biomes(heightmap: Array) -> Array:
    var biome_map = []
    for y in range(heightmap.size()):
        var row = []
        for x in range(heightmap[y].size()):
            var height = heightmap[y][x]
            var biome = get_biome_from_height(height)
            row.append(biome)
        biome_map.append(row)
    return biome_map

func get_biome_from_height(height: float) -> String:
    if height < 0.3:
        return "water"  # Light: rivers, Dark: energy pools
    elif height < 0.6:
        return "plains"  # Light: grass, Dark: metal plains
    elif height < 0.8:
        return "hills"  # Light: forests, Dark: structures
    else:
        return "mountains"  # Light: peaks, Dark: towers
```

**Step 3: Resource Placement**
```gdscript
func place_resources(biome_map: Array, resource_seed: int):
    var rng = RandomNumberGenerator.new()
    rng.seed = resource_seed

    for y in range(biome_map.size()):
        for x in range(biome_map[y].size()):
            var biome = biome_map[y][x]
            var spawn_chance = RESOURCE_SPAWN_RATES[biome]

            if rng.randf() < spawn_chance:
                var resource_type = pick_resource_for_biome(biome, rng)
                place_resource_node(Vector2i(x, y), resource_type)
```

**Step 4: Portal Placement**
```gdscript
func place_portals(world_size: Vector2i, portal_count: int, portal_seed: int):
    var rng = RandomNumberGenerator.new()
    rng.seed = portal_seed

    var portal_positions = []
    var min_distance = world_size.x / portal_count  # Spread out evenly

    for i in range(portal_count):
        var valid = false
        var attempts = 0

        while not valid and attempts < 100:
            var pos = Vector2i(
                rng.randi_range(10, world_size.x - 10),
                rng.randi_range(10, world_size.y - 10)
            )

            # Check distance from other portals
            valid = true
            for other_pos in portal_positions:
                if pos.distance_to(other_pos) < min_distance:
                    valid = false
                    break

            attempts += 1
            if valid:
                portal_positions.append(pos)
                place_portal_at(pos)  # Place in BOTH worlds
```

**Step 5: Enemy Spawner Placement**
```gdscript
func place_enemy_spawners(biome_map: Array, spawner_seed: int):
    var rng = RandomNumberGenerator.new()
    rng.seed = spawner_seed

    var spawner_count = int(biome_map.size() * biome_map[0].size() * 0.01)  # 1% of tiles

    for i in range(spawner_count):
        var pos = Vector2i(
            rng.randi_range(5, biome_map[0].size() - 5),
            rng.randi_range(5, biome_map.size() - 5)
        )

        var biome = biome_map[pos.y][pos.x]
        var enemy_type = pick_enemy_for_biome(biome, rng)
        create_spawner(pos, enemy_type)
```

## World Size Configurations

### Tiny World (15-30 minute run)
```gdscript
const TINY_WORLD = {
    "size": Vector2i(128, 128),  # tiles
    "portal_count": 3,
    "boss_count": 1,
    "biome_count": 1,
    "resource_density": 1.5,  # More resources for faster progression
    "enemy_density": 0.8
}
```

### Small World (1-2 hour run)
```gdscript
const SMALL_WORLD = {
    "size": Vector2i(256, 256),
    "portal_count": 5,
    "boss_count": 2,
    "biome_count": 2,
    "resource_density": 1.0,
    "enemy_density": 1.0
}
```

### Epic World (200+ hour run)
```gdscript
const EPIC_WORLD = {
    "size": Vector2i(2048, 2048),
    "portal_count": 20,
    "boss_count": 10,
    "biome_count": 5,
    "resource_density": 0.7,  # Scarcity creates challenge
    "enemy_density": 1.3
}
```

## Biome Definitions

### Light World Biomes

**Forest (Starter)**
- Height Range: 0.3 - 0.6
- Tile Types: Grass, trees, bushes
- Resources: Wood (abundant), Food (common), Creature Parts (uncommon)
- Enemies: Forest Fox, Cave Bear
- Visual: Bright greens, browns, yellows

**Crystal Beach**
- Height Range: 0.0 - 0.3
- Tile Types: Sand, water, crystals
- Resources: Food (fish), Magic Crystals (rare)
- Enemies: Storm Wisp, Water Elemental
- Visual: Blues, whites, sparkling effects

**Mountain Peaks**
- Height Range: 0.8 - 1.0
- Tile Types: Rock, snow, rare herbs
- Resources: Rare Plants (epic quality), Creature Parts (rare)
- Enemies: Mountain Predator, Ice Golem
- Visual: Grays, whites, purple accents

### Dark World Biomes

**Industrial Sector (Starter)**
- Height Range: 0.3 - 0.6
- Tile Types: Metal floors, machinery, vents
- Resources: Metal (abundant), Energy (common), Robot Parts (uncommon)
- Enemies: Scout Bot, Tank Bot
- Visual: Grays, dark blues, orange lights

**Power Plant**
- Height Range: 0.0 - 0.3
- Tile Types: Energy pools, generators, cables
- Resources: Energy (abundant), Advanced Tech (rare)
- Enemies: Energy Anomaly, Malfunctioning Generator
- Visual: Blacks, electric blues, pulsing lights

**Abandoned City**
- Height Range: 0.8 - 1.0
- Tile Types: Ruins, skyscrapers, rubble
- Resources: Rare Tech (epic quality), Robot Parts (rare)
- Enemies: Elite Bot, Defense Turret
- Visual: Dark grays, neon accents, fog

## Spatial Correspondence Rules

### Resource Mirroring

**Rule**: Resources at position (X, Y) in Light have corresponding transformed resources at (X, Y) in Dark

**Example**:
```
Light World (128, 64): Tree cluster (10 wood)
Dark World (128, 64): Scrap pile (10 metal)

Player chops tree in Light at (128, 64)
→ Tree removed from Light
→ Scrap pile spawns in Dark at (128, 64)

Player harvests scrap in Dark at (128, 64)
→ Scrap removed from Dark
→ New tree grows in Light at (128, 64)
```

### Terrain Correspondence

**Rule**: Terrain types at same coordinates should be "equivalent" in gameplay function

**Mapping**:
```gdscript
const TERRAIN_CORRESPONDENCE = {
    "light_grass": "dark_metal_floor",     # Walkable
    "light_water": "dark_energy_pool",     # Hazard/slow
    "light_tree": "dark_structure",        # Obstacle
    "light_rock": "dark_wall",             # Obstacle
    "light_path": "dark_corridor"          # Walkable, easy navigation
}
```

### Portal Correspondence

**Rule**: Portals exist at EXACT same coordinates in both worlds

**Appearance**:
- Light World: Glowing stone archway with natural vines
- Dark World: Metallic portal frame with energy field
- Both: Pulsing visual effect, interaction prompt

## Dynamic World Changes

### Resource Regeneration

**Natural Regeneration**:
- Resources slowly regenerate over time
- Regeneration rate: 1 unit per 60 seconds (configurable)
- Only regenerates if opposite world has "received" the transformed resource

**Example Flow**:
```
T=0: Light tree exists, Dark has no scrap
T=10: Player chops Light tree
T=10: Light tree gone, Dark scrap spawns
T=15: Player harvests Dark scrap
T=15: Dark scrap gone, Light tree begins regenerating
T=75: Light tree fully regenerated
```

### Enemy Spawning

**Spawner System**:
- Fixed spawner locations (placed during world gen)
- Spawners activate every 120 seconds
- Spawn 1-3 enemies of appropriate type
- Max 5 enemies per spawner (prevents overwhelming)

**Dynamic Spawning** (Hidden Balance System):
- When world balance shifts, spawn rates change
- Over-harvested world: +50% spawn rate, +20% enemy aggression
- Balanced world: Normal spawn rate
- Under-harvested world: -30% spawn rate

## Boss Room Generation

**Special Areas**: Boss arenas are pre-defined areas within generated world

**Generation**:
1. Identify suitable location (flat terrain, away from portals)
2. Clear area of resources and obstacles
3. Place boss spawner at center
4. Create perimeter markers (visible boundaries)
5. Add thematic decorations (trees for Light, machines for Dark)

**Boss Arena Properties**:
- Size: 50x50 tiles
- Spawn: Boss only spawns when player enters arena
- Exit: Locked until boss defeated (invisible barriers)
- Loot: Boss drops guaranteed rare loot at center

## Save & Load Considerations

**Saved World Data**:
```json
{
    "seed": 123456,
    "size": [256, 256],
    "generation_params": {
        "light_seed": 123456,
        "dark_seed": 123457
    },
    "modified_tiles": [
        {"pos": [120, 64], "world": "light", "type": "harvested_tree"},
        {"pos": [120, 64], "world": "dark", "type": "spawned_scrap"}
    ],
    "portals": [
        {"pos": [50, 50]},
        {"pos": [200, 200]}
    ]
}
```

**Regeneration on Load**:
- World regenerates from seed
- Apply modified_tiles to reflect player actions
- Restore portal states
- Recalculate enemy spawners

## Performance Optimization

### Chunk-Based Generation

**Chunk System**:
- Divide world into 32x32 chunks
- Generate chunks on-demand (lazy loading)
- Cache generated chunks in memory
- Save only modified chunks to disk

**LOD (Level of Detail)**:
- Visible chunks: Full detail (all resources, enemies, decorations)
- Adjacent chunks: Medium detail (resources and structures only)
- Distant chunks: Unloaded (save memory)

### Generation Threading

**Background Generation**:
- Generate chunks on separate thread to prevent frame drops
- Display loading indicator while generating
- Prioritize chunks near player position

## Testing & Validation

**Seed Testing**:
- Test multiple seeds for world variety
- Ensure no impossible-to-complete worlds (unreachable portals, etc.)
- Verify resource distribution is playable

**Balance Testing**:
- Track resource gather rate per world size
- Ensure portal density feels right (not too far, not too close)
- Validate enemy density doesn't overwhelm players

## MVP Implementation (Phase 1)

**Simplified Generation**:
- ✅ Fixed world size (TINY_WORLD only)
- ✅ Single biome per world (Forest / Industrial)
- ✅ Simple noise-based terrain
- ✅ Fixed portal count (3 portals)
- ✅ Basic resource placement
- ✅ No dynamic world changes (static after generation)

**Future Enhancements**:
- Multiple biomes with smooth transitions
- Dynamic world events (meteor strikes, system failures)
- Player-influenced world changes (building affects terrain)
- Advanced decorations and visual variety
