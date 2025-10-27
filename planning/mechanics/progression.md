# Player Progression System

## Design Philosophy

**Multiple Progression Axes**:
- Equipment power (gear quality and rarity)
- Player skill (combat timing mastery, world knowledge)
- World exploration (map discovery, portal locations)
- Building advancement (structure complexity, base development)

**Configurable Depth**: Same systems scale from 15-minute runs to 200+ hour campaigns

## Equipment Progression

### Rarity Tiers (Diablo-Inspired)

| Tier | Color | Damage Multiplier | Special Effects | Drop Rate |
|------|-------|-------------------|-----------------|-----------|
| ⚪ Common | White | 1.0x | None | 60% |
| 🟢 Uncommon | Green | 1.3x | 1 minor effect | 25% |
| 🔵 Rare | Blue | 1.7x | 1 major effect | 10% |
| 🟣 Epic | Purple | 2.3x | 2 effects | 4% |
| 🟠 Legendary | Orange | 3.5x | 3 effects + unique | 1% |

### Special Effect Examples

**Minor Effects** (Uncommon tier):
- +10% attack speed
- +15% health
- 10% chance to stun (1 sec)

**Major Effects** (Rare tier):
- +30% attack speed
- +40% health
- 25% chance to stun (2 sec)
- Attacks chain to 1 nearby enemy (50% damage)

**Unique Effects** (Legendary tier):
- Transform into opposite world on hit (20% chance)
- Spawn temporary minion on kill
- Heal for 30% damage dealt
- Create portal on perfect combo finish

### Procedural Item Generation

**Name Generation Formula**:
```
[Prefix] + [Base Name] + [Suffix]
```

**Prefixes** (Define primary attribute):
- Whisper- (stealth/speed)
- Thunder- (power/electric)
- Ember- (fire/burn)
- Frost- (ice/slow)
- Void- (dark/drain)

**Base Names** (Define item type):
- -wood, -bark, -vine (Nature)
- -steel, -circuit, -plasma (Tech)
- -crystal, -essence, -spark (Magic)

**Suffixes** (Define secondary trait):
- -blade, -bow, -hammer (weapons)
- -guard, -shield, -ward (defense)
- -of Speed, -of Power, -of the Ancients (legendary modifiers)

**Example Generated Names**:
- ⚪ "Simple Wooden Blade"
- 🟢 "Emberwood Sword of Speed"
- 🔵 "Thunder-Steel Plasma Blade"
- 🟣 "Voidcrystal Essence Hammer of Power"
- 🟠 "Whisperwood Plasma Blade of the Ancients"

### Equipment Slots

**MVP (Phase 1)**:
- **Weapon**: Primary damage source
- **Armor**: Reduces incoming damage

**Future Phases**:
- **Accessory 1-2**: Stat modifiers, special abilities
- **Tool**: Mining/gathering efficiency boosts
- **Consumables** (hotbar): Healing potions, buffs

## Crafting Progression

### Crafting Tiers

**Tier 1: Basic Crafting** (No bench required)
- Available from game start
- Creates common-tier items
- Uses basic resources (Wood, Metal, Food, Energy)

**Tier 2: Advanced Crafting** (Requires Crafting Bench)
- Unlocked after building Crafting Bench
- Creates uncommon/rare items
- Requires processed resources (Planks, Alloys, Refined Energy)

**Tier 3: Master Crafting** (Requires rare materials)
- Unlocked after defeating first boss
- Creates epic/legendary items
- Requires boss drops + rare resources

### Recipe Discovery

**Methods to Learn Recipes**:
1. **Automatic**: Basic recipes unlocked at start
2. **Boss Drops**: Defeating bosses unlocks themed recipes
3. **World Exploration**: Find recipe scrolls at portals or landmarks
4. **Experimentation**: Combine resources to discover new recipes (future)

### Crafting Costs by Tier

| Tier | Resource Cost | Rarity Output | Crafting Time |
|------|---------------|---------------|---------------|
| 1 | 10-30 basic | Common-Uncommon | Instant |
| 2 | 50-100 processed | Uncommon-Rare | 5 seconds |
| 3 | 200+ rare | Rare-Legendary | 15 seconds |

## World Progression

### Exploration Milestones

**Discovery Rewards**:
- Find Portal → Map reveals surrounding area
- Enter New Biome → Unlock biome-specific resources
- Discover Landmark → Unlock fast-travel point (future)
- Uncover Secret → Rare loot chest spawns

### Map Expansion

**Tiny World** (15-30 min run):
- 1 biome per world (Forest / Factory)
- 3 portal locations
- 5 landmarks/secrets
- Single boss per world

**Epic World** (200+ hours):
- 5+ biomes per world
- 15+ portal locations
- 50+ landmarks/secrets
- Progressive boss chain (10+ bosses)

### Biome Examples

**Light World Biomes**:
- 🌳 **Verdant Forest**: Starter area, abundant wood
- 🏖️ **Crystal Beach**: Water resources, magic enemies
- 🏔️ **Mountain Peaks**: Rare herbs, flying creatures
- 🌋 **Volcanic Wastes**: Fire resources, tough enemies
- 🌌 **Ancient Grove**: Endgame, nature-magic fusion

**Dark World Biomes**:
- 🏭 **Industrial Sector**: Starter area, basic metal
- ⚡ **Power Plant**: Energy resources, electric hazards
- 🏙️ **Abandoned City**: Dense structures, robot patrols
- 🔬 **Research Labs**: Advanced tech, experimental enemies
- 🛸 **Core Facility**: Endgame, tech-magic fusion

## Boss Progression

### Boss Chain (Epic World)

**Linear Progression** (must defeat in order):

| Order | Light Boss | Dark Boss | Unlock |
|-------|-----------|-----------|--------|
| 1 | 🌲 Ancient Treant | 🏭 Core Colossus | Tier 2 crafting |
| 2 | 🌊 Tidal Leviathan | ⚡ Storm Reactor | Biome 3 access |
| 3 | 🔥 Ember Phoenix | 🔬 Quantum AI | Tier 3 crafting |
| 4 | 🌌 Void Dryad | 🛸 Prime Construct | Legendary recipes |
| 5 | 👑 World Guardian | 👑 System Overseer | True ending |

**Boss Rewards**:
- Guaranteed rare/epic loot drop
- Unique crafting material
- Recipe unlock
- Permanent stat bonus (+5% health, +3% damage, etc.)

### Mirror Boss Mechanic (Future)

**Advanced feature for multiplayer**:
- Boss spawns simultaneously in both worlds at same coordinates
- Shared HP pool across worlds
- Attacks in one world damage players in the other (weak AOE)
- Must be defeated collaboratively
- Epic tier rewards for both participants

## Skill Progression (Player Mastery)

**No Traditional XP/Levels**: Progression through practice and knowledge

### Combat Mastery
- **Timing Proficiency**: Getting Perfect hits more consistently
- **Combo Efficiency**: Longer chains without breaks
- **Type Matchup Knowledge**: Learning enemy weaknesses

### World Knowledge
- **Portal Memory**: Knowing portal locations without map
- **Resource Mapping**: Efficient gathering routes
- **Enemy Patterns**: Predicting spawns and behaviors

### Strategic Depth
- **Inventory Management**: When to transform resources
- **Death Timing**: Strategic deaths for world switching
- **Building Placement**: Optimal base locations

**Result**: Experienced players complete runs faster with same gear

## Run Completion & Resets

### Victory Conditions

**Tiny World**:
- Defeat 1 boss in each world
- OR survive for 30 minutes
- OR accumulate 1000 resource points

**Epic World**:
- Defeat final boss chain (both World Guardian and System Overseer)
- AND build monument structure
- AND discover all biomes

### Post-Completion Rewards

**Account-Level Unlocks** (carry across all runs):
- **Cosmetic Skins**: Character/weapon appearances
- **Starting Loadouts**: Begin new runs with basic gear
- **World Generation Options**: Unlock new biome combinations
- **Challenge Modes**: Harder variants for experienced players

### World Reset Options

**Soft Reset**:
- Keep account unlocks
- Reset world generation
- Reset inventory/equipment
- Keep skill/knowledge (player mastery)

**Hard Reset**:
- Fresh start, no unlocks
- For new challenge runs

## Seasonal Progression (Future - MMO)

**Season Structure** (3-month cycles):
- New biomes or events
- Seasonal-exclusive items
- Leaderboards (fastest completion, highest build score)
- Community goals (collective resource gathering)

**Season Rewards**:
- Exclusive cosmetics
- Permanent account bonuses
- Special titles/badges

## Pacing & Time Investment

### Quick Run (15-30 minutes)
- Focus: Combat and exploration
- Crafting: 2-3 item upgrades
- Building: 5-8 structures
- Boss: 1 per world
- Victory: Achievable for experienced players

### Normal Run (2-4 hours)
- Focus: Balanced gameplay
- Crafting: 5-10 item upgrades
- Building: 15-20 structures
- Bosses: 2-3 per world
- Victory: Requires strategic planning

### Epic Run (200+ hours)
- Focus: Long-term building and mastery
- Crafting: 50+ items, full legendary set
- Building: 100+ structures, sprawling base
- Bosses: All 5+ per world
- Victory: Community collaboration (MMO mode)

## MVP Implementation (Phase 1)

**Included**:
- ✅ Rarity tiers (Common → Epic, no legendary yet)
- ✅ Procedural name generation
- ✅ Basic crafting (Tier 1-2)
- ✅ 1 boss per world
- ✅ Tiny world option (15-30 min runs)
- ✅ Simple victory condition (defeat bosses)

**Excluded** (Future phases):
- ❌ Legendary tier items
- ❌ Multiple biomes
- ❌ Boss progression chains
- ❌ Account-level unlocks
- ❌ Seasonal content
- ❌ Mirror boss mechanics

## Success Metrics

**Engagement Goals**:
- ✅ Players complete first run within stated time (15-30 min for tiny world)
- ✅ Players attempt multiple runs (replayability)
- ✅ Gear upgrades feel meaningful (+30% power per rarity tier)
- ✅ Discovery moments create excitement (finding first rare drop)

**Balance Targets**:
- Common drops: Every 3-5 enemies
- Rare drops: Every 20-30 enemies
- Epic drops: 1-2 per boss
- Boss difficulty: 3-5 attempts to learn patterns
- Crafting costs: Achievable in 10-15 min of gathering (per item)
