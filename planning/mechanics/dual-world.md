# Dual-World Transformation System

## Core Concept

Two parallel worlds exist at the same spatial coordinates but with different content. Actions in one world create transformed effects in the other, creating a bidirectional resource economy.

## World Definitions

### 🌞 Light World (Organic/Chaotic)
**Theme**: Nature, growth, abundance, life

**Visual**:
- Lush forests with varied tree types
- Living creatures (deer, birds, insects)
- Flowing water, natural caves
- Bright, saturated colors
- Organic, curved shapes

**Resources**:
- 🌳 Wood (organic material)
- 🍓 Food (berries, fruits, plants)
- 🦌 Creature parts (hides, bones, essences)

**Challenges**:
- Aggressive predators
- Environmental hazards (poison plants, thorns)
- Weather events (storms, floods)

### 🌙 Dark World (Technological/Ordered)
**Theme**: Technology, precision, structure, industry

**Visual**:
- Geometric structures, circuit patterns
- Mechanical entities (robots, drones, turrets)
- Neon lighting, energy fields
- Dark base with bright accent colors
- Angular, precise shapes

**Resources**:
- 🔩 Metal (scrap, alloys, components)
- ⚡ Energy (cells, batteries, cores)
- 🤖 Tech parts (circuits, processors, modules)

**Challenges**:
- Malfunctioning robots
- Environmental hazards (electrical fields, toxic waste)
- System events (power surges, shutdowns)

## Transformation Mechanics

### Resource Transformation Table

| Light World | → | Dark World |
|-------------|---|------------|
| 🌳 Wood (10 units) | → | 🔩 Scrap Metal (10 units) |
| 🍓 Berries (5 units) | → | ⚡ Energy Cells (5 units) |
| 🦌 Creature Parts (1 unit) | → | 🤖 Robot Components (1 unit) |

| Dark World | → | Light World |
|------------|---|-------------|
| 🔩 Scrap Metal (10 units) | → | 🌳 Wood (10 units) |
| ⚡ Energy Cells (5 units) | → | 🍓 Berries (5 units) |
| 🤖 Robot Components (1 unit) | → | 🦌 Creature Parts (1 unit) |

**Key Rule**: Transformation maintains resource quantity but changes type.

### Spatial Mirroring

**Same coordinates = Connected effects**

Example scenario:
1. Player A in Light chops tree at position (150, 200)
2. Tree vanishes from Light world
3. Scrap metal pile spawns in Dark world at (150, 200)
4. Player B in Dark arrives at (150, 200), harvests scrap
5. Scrap vanishes from Dark world
6. New tree grows in Light world at (150, 200)
7. Cycle can repeat

**Result**: Resource "ping-pong" between worlds creates emergent cooperation.

## World-Switching Mechanisms

### Method 1: Death (Risky)
**Trigger**: Player health reaches 0

**Process**:
1. Death animation plays
2. Screen fades to transition effect
3. Respawn in opposite world at last spawn point
4. Inventory transforms with 70% conversion rate

**Penalties**:
- 30% resource loss during transformation
- Respawn at spawn point (not death location)
- 10-second respawn delay

**Strategic Use**:
- Emergency world switch when needed
- Intentional death to transform inventory
- Risk/reward decision making

### Method 2: Static Portals (Safe)
**Trigger**: Player interacts with pre-placed portal

**Process**:
1. Player enters portal activation zone
2. Short channeling animation (2 seconds)
3. World switches with visual effect
4. Player maintains exact position
5. Inventory transforms with 100% conversion rate

**Benefits**:
- No resource loss
- No position reset
- No time penalty
- Predictable transformation

**Portal Placement**:
- Procedurally placed during world generation
- Typically near important landmarks
- Rarity: ~1 portal per major biome region
- Visual cues (glowing pillars, energy effects)

## World Balance System (Hidden)

**Purpose**: Prevent infinite resource exploitation, create dynamic world events

### Balance Meter (Hidden from Player)
Each world tracks harvesting vs regeneration ratio:
- Balance = (Resources Regenerated) / (Resources Harvested)
- Target equilibrium: Balance ≈ 0.8 - 1.2
- Imbalance triggers when Balance < 0.5 or > 1.5

### Imbalance Effects

#### Light World Over-Harvested (Balance < 0.5)
**"Depletion Crisis"**
- Resource spawn rate decreases by 30%
- Creatures become more aggressive (+20% damage)
- Dark world shows effects:
  - Energy fields become unstable
  - Robots move erratically
  - Warning visual cues (flickering lights)

#### Dark World Over-Harvested (Balance < 0.5)
**"System Failure"**
- Tech resource spawn rate decreases by 30%
- Robots become hostile even when idle
- Light world shows effects:
  - Plants grow too aggressively (thorns, poison)
  - Predators spawn more frequently
  - Warning visual cues (red-tinted fog)

#### Restoration Mechanics
Balance slowly recovers naturally (0.1 per minute):
- Let world regenerate passively
- Players can speed up by switching harvest focus to other world
- Events provide restoration opportunities

## Building Across Worlds

### Complementary Construction

**Rule**: Buildings in one world create "echoes" in the other world

**Light World Building → Dark World Effect**:
- Wooden cabin → Metal foundation visible
- Tree fort → Circuit pattern in ground
- Garden → Energy node cluster

**Dark World Building → Light World Effect**:
- Metal structure → Wood framework visible
- Generator → Crystal growth point
- Turret → Flowering tree

**Mechanical Effect**:
- Buildings don't fully occupy space in opposite world
- "Echo" serves as visual indicator
- Players can build complementary structures at same coordinates
- Example: Light tower + Dark underground base = Combined stronghold

### Building Persistence
- Buildings persist across world switches
- Damage in one world doesn't affect echo in other world
- Destruction requires removing building in its native world

## MVP Simplifications (Phase 1)

For initial prototype, reduce scope:
- **Single biome** per world (Forest / Factory)
- **3 resource types** only (Organic/Metal, Energy/Food, Parts/Components)
- **No building echoes** (buildings only exist in one world)
- **Fixed portal locations** (2-3 portals in tiny world)
- **Simplified balance** (no hidden meter, events triggered by time instead)

## Advanced Features (Future Phases)

### Phase 2+:
- Multiple biome types with unique transformation rules
- Rare "hybrid" resources that exist in both worlds
- Portal customization (players can modify portal effects)
- "Convergence zones" where both worlds overlap temporarily
- Cross-world building synergies (bonuses for complementary structures)

### Phase 3+:
- Player-built portals (requires rare resources from both worlds)
- World balance meter becomes visible UI element (optional difficulty)
- "Balance events" with unique mechanics and rewards
- Seasonal world transformations affecting both worlds simultaneously
