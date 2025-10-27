# Building & Construction System

## Design Goals

- **World Persistence**: Buildings remain across sessions and world switches
- **Cross-World Impact**: Structures in one world affect the other
- **Strategic Placement**: Location matters for gameplay benefits
- **Progression Gating**: More complex structures require better resources
- **Collaborative Potential**: Multiple players can build in same area

## Building Categories

### Utility Structures
**Purpose**: Provide functional gameplay benefits

| Structure | Cost | Effect | Size |
|-----------|------|--------|------|
| **Campfire** | 10 Wood / 5 Metal | Spawn point, healing over time | 2x2 tiles |
| **Storage Chest** | 20 Wood / 15 Metal | Shared inventory (50 slots) | 2x2 tiles |
| **Crafting Bench** | 30 Wood + 20 Metal | Unlock advanced crafting | 3x3 tiles |
| **Resource Node** | 50 resources of type | Slow passive generation | 4x4 tiles |

### Defensive Structures
**Purpose**: Protect against enemies, control territory

| Structure | Cost | Effect | Size |
|-----------|------|--------|------|
| **Wooden Wall** | 15 Wood / 10 Metal | Blocks enemy pathing | 1x3 tiles |
| **Spike Trap** | 25 Wood + Parts / 20 Metal + Parts | Damages enemies | 2x2 tiles |
| **Watchtower** | 100 Wood / 75 Metal | Increases visible area | 4x4 tiles |
| **Shield Generator** | 150 resources | Damage reduction zone | 5x5 tiles |

### Aesthetic Structures
**Purpose**: Personalization, community landmarks

| Structure | Cost | Effect | Size |
|-----------|------|--------|------|
| **Decorative Tree** | 30 Wood + 10 Food | Visual only | 2x2 tiles |
| **Monument** | 200 mixed resources | Server landmark | 6x6 tiles |
| **Banner** | 10 of any resource | Customizable flag | 1x2 tiles |

## Construction Mechanics

### Building Process
1. **Open Build Menu**: Player opens crafting interface (Tab key)
2. **Select Structure**: Choose from unlocked building recipes
3. **Ghost Placement**: Transparent preview shows placement
   - Green = valid placement
   - Red = invalid (terrain blocked, too close to other structure)
4. **Resource Check**: Automatically consumes resources from inventory
5. **Build Animation**: 2-3 second construction visual
6. **Structure Active**: Immediately functional

### Placement Rules
- **Grid-Based**: Structures snap to world grid (not free-form)
- **Collision Check**: Can't overlap with existing structures or terrain features
- **World Boundary**: Can't build outside generated world bounds
- **Height Limits**: Single-level structures only (no vertical stacking in MVP)

### Destruction
- **Player Demolition**: Hold interact button (3 sec) → 75% resource refund
- **Enemy Damage**: Structures have HP, can be destroyed by enemies
- **No Refund**: Enemy-destroyed structures drop 25% resources as loot

## Cross-World Building Effects

### Light World Building → Dark World Echo

When player builds in Light world, Dark world shows "echo" at same coordinates:

| Light Structure | Dark Echo |
|----------------|-----------|
| Wooden Cabin | Metal foundation outline |
| Tree Fort | Circuit pattern in ground |
| Garden Plot | Energy node cluster |
| Campfire | Glowing heat signature |

**Echo Properties**:
- Visible but non-solid (players walk through)
- Provides visual context ("someone built here in other world")
- Cannot be interacted with from echo side
- Destroyed if source structure destroyed

### Dark World Building → Light World Echo

When player builds in Dark world, Light world shows "echo" at same coordinates:

| Dark Structure | Light Echo |
|---------------|------------|
| Metal Structure | Wood framework outline |
| Generator | Crystal growth cluster |
| Turret | Flowering tree |
| Power Node | Luminescent moss patch |

### Complementary Building (Future Feature)

**Advanced mechanic for Phase 2+**:
- Players can build "complementary" structures at same coordinates
- Light player builds tower → Dark player builds underground base
- Combined effect provides bonus (e.g., +50% resource generation)
- Encourages cross-world cooperation

## Construction Tiers

### Tier 1: Basic (Available from start)
- **Unlocked**: Automatically available
- **Recipes**: Campfire, Storage Chest, Wooden Wall, Spike Trap
- **Cost**: Low (10-30 resources)

### Tier 2: Advanced (Requires Crafting Bench)
- **Unlock**: Build Tier 1 Crafting Bench
- **Recipes**: Watchtower, Resource Node, Shield Generator
- **Cost**: Medium (50-100 resources)

### Tier 3: Rare (Requires Rare Materials)
- **Unlock**: Find rare materials from bosses or events
- **Recipes**: Monuments, Advanced Generators, Teleporters (future)
- **Cost**: High (200+ resources, rare components)

## Shared vs Personal Building

### Personal Mode (Single-Player / Co-op)
- All structures belong to player/group
- Only builders can modify/destroy
- Saved with player's world save file

### Shared Mode (Future - MMO Servers)
- Structures have ownership tags
- Owner + Friends can modify
- Decay system if owner inactive >30 days
- Public structures (anyone can use, only owner modifies)

## Strategic Building Locations

### Near Portals
- **Advantage**: Safe world-switching with nearby spawn
- **Risk**: High-traffic area, enemy spawn points nearby

### Near Resources
- **Advantage**: Reduced travel time for gathering
- **Risk**: Resource nodes attract enemies

### Central Locations
- **Advantage**: Equal distance to all biomes
- **Risk**: Open terrain, hard to defend

### Hidden Locations
- **Advantage**: Low enemy traffic, surprise factor
- **Risk**: Difficult to find again, far from resources

## Building Events & Mechanics

### Construction Event (Future)
- Triggered by high building activity in region
- NPCs arrive offering rare building materials
- Temporary boost to construction speed
- Encourages collaborative building

### Siege Event
- Random enemy waves target player structures
- Structures take damage, must be defended
- Rewards for successful defense (rare materials)
- Creates dynamic PvE challenge

## Crafting Recipes

### Basic Recipes (Tier 1)

**Campfire**
- 10 Wood (Light) / 5 Metal + 5 Energy (Dark)
- Effect: Spawn point, +1 HP/sec healing within 5 tile radius

**Storage Chest**
- 20 Wood (Light) / 15 Metal (Dark)
- Effect: 50-slot shared inventory, persists across world switches

**Wooden Wall**
- 15 Wood (Light) / 10 Metal (Dark)
- Effect: 100 HP, blocks enemy pathing, 1x3 tiles

**Crafting Bench**
- 30 Wood + 20 Metal (requires both worlds or transformation)
- Effect: Unlocks Tier 2 recipes

### Advanced Recipes (Tier 2)

**Watchtower**
- 100 Wood (Light) / 75 Metal (Dark)
- Effect: +50% visible area, reveals enemy positions on minimap

**Resource Node**
- 50 Wood → Generates 5 Wood per hour
- 50 Metal → Generates 5 Metal per hour
- Passive income while online

**Shield Generator**
- 150 mixed resources + 1 Rare Component
- Effect: 50% damage reduction in 5-tile radius

## MVP Implementation (Phase 1)

**Included**:
- ✅ 4 basic structures (Campfire, Chest, Wall, Crafting Bench)
- ✅ Simple placement system (grid-based, collision detection)
- ✅ Echo system (visual representation in opposite world)
- ✅ Persistent storage (structures save with world)
- ✅ Basic demolition (player can remove structures)

**Excluded** (Future phases):
- ❌ Complementary building bonuses
- ❌ Structure HP/combat damage
- ❌ Tier 2-3 advanced structures
- ❌ Decay system
- ❌ Building events

## UI/UX Design

### Build Menu
```
┌─────────────────────────────┐
│     BUILD MENU              │
├─────────────────────────────┤
│ [🏕️] Campfire      10🌳    │ <- Selected
│ [📦] Storage       20🌳    │
│ [🧱] Wall          15🌳    │
│ [🔨] Craft Bench   30🌳20🔩│
├─────────────────────────────┤
│ Press ESC to close          │
└─────────────────────────────┘
```

- Symbol-based icons (no text required)
- Resource cost shown with icons + numbers
- Green highlight when player has resources
- Red/grayed when insufficient resources

### Placement Ghost
- Transparent preview of structure at cursor position
- Green tint = valid placement
- Red tint = invalid (shows reason icon: ⛔ collision, ⚠️ terrain)

### Confirmation
- Instant build (no confirmation prompt for speed)
- Audio feedback: Construction sound
- Visual feedback: Particle effect (dust cloud, sparks)

## Accessibility

- **Grid Snapping**: Makes precise placement easy
- **Color-Blind Mode**: Alternative indication for valid/invalid (pattern overlay)
- **Auto-Build**: Option to place multiple structures rapidly
- **Blueprint Mode** (Future): Save/load structure layouts

## Performance Considerations

- **Max Structures Per Region**: 100 structures per loaded chunk
- **LOD System**: Distant structures use low-poly models
- **Occlusion**: Structures behind terrain/other structures don't render
- **Batch Rendering**: All same-type structures rendered in single draw call

## Testing & Success Metrics

**Goals**:
- ✅ Building feels intuitive (players build first structure within 2 minutes)
- ✅ Cross-world echo is noticeable and meaningful
- ✅ Strategic placement creates gameplay advantages
- ✅ No performance issues with 50+ structures on screen
- ✅ Shared storage feels natural for co-op

**Balance Targets**:
- Players spend 20-30% of gameplay time building
- Average 10-15 structures per run (tiny world)
- Resources for basic structures gathered in 5-10 minutes
