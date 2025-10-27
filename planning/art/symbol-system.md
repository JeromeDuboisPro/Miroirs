# Symbol-Based UI System

## Design Philosophy

**Universal Language**: Icons and symbols replace text for language-agnostic gameplay

**Principles**:
- ✅ **Clarity**: Symbols immediately recognizable at small sizes
- ✅ **Consistency**: Same symbol always means same thing
- ✅ **Context**: Combined symbols tell complete stories
- ✅ **Color-Coding**: Colors reinforce meaning without requiring text

## Core Symbol Library

### Resources

| Symbol | Meaning | Light World | Dark World |
|--------|---------|-------------|------------|
| 🌳 | Organic Material | Wood, branches | - |
| 🔩 | Tech Material | - | Metal, scrap |
| 🍓 | Food/Energy | Berries, fruits | - |
| ⚡ | Power/Energy | - | Energy cells |
| 🦌 | Creature Parts | Hides, bones | - |
| 🤖 | Tech Parts | - | Circuits, robot parts |
| 💎 | Rare Resources | Crystals, gems | Data cores |

**Design Notes**:
- Use 16x16 or 32x32 pixel sprites
- High contrast for visibility
- Simple shapes (pixel art style)
- Animated sparkle for rare items

### Actions

| Symbol | Meaning | Usage Context |
|--------|---------|---------------|
| 🔨 | Build/Craft | Construction menu |
| ⚔️ | Attack/Combat | Combat mode indicator |
| 🏃 | Movement | Sprint/dodge ability |
| ✋ | Interact | Prompt near interactable objects |
| 📦 | Storage | Inventory/chest access |
| 🔄 | Transform | World switch, portal interaction |
| 🎯 | Target | Enemy lock-on |
| ❤️ | Health | Player health bar |
| 🛡️ | Defense | Armor/shield indicator |

### World States

| Symbol | Meaning | Visual Representation |
|--------|---------|----------------------|
| 🌞 | Light World Active | Bright background, sun icon in corner |
| 🌙 | Dark World Active | Dark background, moon icon in corner |
| ⚖️ | Balance | Hidden system (no direct symbol) |
| 🌀 | Portal | Swirling energy effect |
| 💀 | Death/Respawn | Skull icon briefly on death |

### Rarity Tiers

**No text needed - color-coding + glow effects**:

| Tier | Color | Visual Effect |
|------|-------|---------------|
| ⚪ Common | White/Gray | No glow |
| 🟢 Uncommon | Green | Faint glow |
| 🔵 Rare | Blue | Moderate glow |
| 🟣 Epic | Purple | Strong glow + particles |
| 🟠 Legendary | Orange | Intense glow + stars |

**In-Game Representation**:
- Item icon has colored border
- Background glow matches tier color
- Legendary items have animated sparkle effect
- Rarity instantly visible without reading

## UI Layouts

### Heads-Up Display (HUD)

```
┌────────────────────────────────────┐
│ 🌞 (world)   ❤️❤️❤️ (health)     │ <- Top bar
│                                    │
│                                    │
│                                    │
│                                    │
│                    [Enemy HP bar]  │ <- Combat overlay
│         Player                     │
│           @                        │
│                     Enemy          │
│                       👾           │
│                                    │
│ 🔨 🌳x10 🔩x5 (hotbar)            │ <- Bottom bar
└────────────────────────────────────┘
```

**Components**:
- **Top Left**: Current world indicator (sun/moon icon)
- **Top Center**: Health hearts (visual, no numbers)
- **Top Right**: Reserved for future (stamina, buffs)
- **Bottom Center**: Hotbar with item icons + quantities
- **Center**: Combat timing indicators (when fighting)

### Inventory Screen

```
┌─────────────────────────────────────┐
│  📦 INVENTORY                       │
├──────────────┬──────────────────────┤
│              │                      │
│   [⚔️ WEAPON]│   🌳 x45            │
│   [🛡️ ARMOR] │   🍓 x23            │
│              │   🦌 x7             │
│              │   ⚔️ (rare sword)   │
│              │   🛡️ (common vest)  │
│              │                      │
│  Equipment   │    Resources         │
├──────────────┴──────────────────────┤
│  Stats:                             │
│  💪 ATK: ||||||||                  │
│  🛡️  DEF: ||||                     │
└─────────────────────────────────────┘
```

**Features**:
- Left panel: Equipment slots (visual silhouettes)
- Right panel: Resource list with icons + quantities
- Bottom: Character stats as visual bars
- No text except numbers (quantities, stats)

### Build Menu

```
┌─────────────────────────────────────┐
│  🔨 BUILD                           │
├─────────────────────────────────────┤
│                                     │
│  [🏕️]  🌳x10          ✅          │ <- Can build
│  Campfire                          │
│                                     │
│  [📦]  🌳x20          ✅          │
│  Storage                           │
│                                     │
│  [🧱]  🌳x15          ❌          │ <- Can't build
│  Wall               (need 5 more)  │
│                                     │
│  [🔨]  🌳x30 🔩x20    ❌          │
│  Craft Bench                       │
└─────────────────────────────────────┘
```

**Features**:
- Structure icon + name (minimal text, just identifier)
- Cost shown as resource icons + quantities
- Checkmark (✅) or X (❌) for affordability
- Ghost preview appears when hovering structure

### Combat UI

```
┌─────────────────────────────────────┐
│                                     │
│            BOSS HP ████████░░       │
│                                     │
│              [Timing Window]        │
│              ────🎯────           │
│            PERFECT ZONE             │
│                                     │
│           ⚔️ Nature vs 🤖 Tech     │
│              ADVANTAGE!             │
│                                     │
│          COMBO: ⭐⭐⭐            │
└─────────────────────────────────────┘
```

**Features**:
- Enemy health bar at top (visual only, no numbers)
- Timing indicator during combos (green/yellow/red zones)
- Type matchup shown with icons + "ADVANTAGE" text
- Combo counter with stars

### World Switch Transition

```
┌─────────────────────────────────────┐
│                                     │
│                                     │
│            🌀                       │
│       TRANSFORMING                  │
│                                     │
│    🌳 → 🔩    Resources             │
│    🍓 → ⚡    Converted             │
│    🦌 → 🤖    70% Kept              │
│                                     │
└─────────────────────────────────────┘
```

**Features**:
- Center swirl effect
- Resource transformation shown with arrows
- Conversion rate displayed (70% kept / 30% lost)
- Brief (1-2 second) transition screen

## Contextual Symbol Combinations

### Crafting Recipes

**Formula Display**:
```
🌳 + 🌳 + 🔩 = ⚔️ (sword)
🌳 + 🌳 + 🌳 = 🏕️ (campfire)
🔩 + ⚡ + 🤖 = 🛡️ (tech armor)
```

**Player sees**:
- Input resources on left
- Plus signs between inputs
- Equals sign
- Output item on right
- All visual, no text required

### Tooltips (Minimal)

**On hover/select**:
```
┌──────────────────┐
│   ⚔️ (weapon)    │
│                  │
│   💪 ATK: ||||| │
│   🌿 Nature     │
│   🔵 Rare       │
│                  │
│   Effect:        │
│   🔥 +burn      │
└──────────────────┘
```

**Features**:
- Item icon at top
- Stat bars (visual, no numbers)
- Type shown with icon
- Rarity shown with color
- Effects shown with icons + minimal text

### Status Effects

**Visual Indicators**:
- 🔥 Burning: Red particle effect, damage over time
- ❄️ Frozen: Blue tint, movement slowed
- ⚡ Shocked: Yellow flicker, attacks interrupted
- 🛡️ Shielded: Blue bubble, damage reduced
- 💪 Buffed: Golden glow, stats increased

**Display**: Icons appear above character with duration bar

## Accessibility Features

### Color-Blind Modes

**Option 1: Deuteranopia (Red-Green)**
- Common: White → Same
- Uncommon: Green → Blue
- Rare: Blue → Purple
- Epic: Purple → Yellow
- Legendary: Orange → Cyan

**Option 2: Protanopia**
- Similar adjustments with different hue shifts

**Option 3: Tritanopia (Blue-Yellow)**
- Rare: Blue → Green
- Epic: Purple → Red

**Universal Fallback**:
- Add shape indicators in addition to colors
- Common: □ (square)
- Uncommon: ○ (circle)
- Rare: △ (triangle)
- Epic: ◇ (diamond)
- Legendary: ★ (star)

### Size Options

**Small (Default)**: 16x16px icons
**Medium**: 24x24px icons
**Large**: 32x32px icons

**High-Contrast Mode**:
- Increase border thickness
- Add black outlines to all icons
- Boost color saturation

## Icon Design Guidelines

### Pixel Art Style

**Resolution**: 16x16 or 32x32 base size
**Color Palette**: Limited palette (8-16 colors per icon)
**Style**: 8-bit/16-bit retro aesthetic

**Example: Wood Icon**
```
  ████
 ██████
████████
 ██████
  ████
```
- Brown fill (#6B4423)
- Dark brown outline (#3D2814)
- Simple tree stump shape

**Example: Metal Icon**
```
████████
██░░░░██
██░░░░██
████████
```
- Gray fill (#CCCCCC)
- Dark gray outline (#666666)
- Bolt/gear shape

### Animation Guidelines

**Idle Icons**: Mostly static, subtle pulse
**Active Icons**: 2-4 frame loop animation
**Legendary Items**: 8-frame sparkle animation

**Frame Rate**: 10 FPS (slow enough for pixel art clarity)

### Visual Hierarchy

**Size Priority**:
1. Health/vitals (largest)
2. Current action prompts
3. Inventory/resources
4. Background information

**Color Priority**:
1. Danger/critical (red/orange)
2. Success/positive (green)
3. Neutral information (white/gray)
4. Decorative (muted colors)

## Localization Support (Future)

**Phase 1**: Pure symbol-based (no text)
**Phase 2**: Optional text labels (toggle in settings)
**Phase 3**: Full localization for text labels

**Translation Points** (minimal):
- Item names (for tooltips)
- Tutorial messages
- Menu options
- Story text (if added)

**Keep Text-Free**:
- HUD elements
- Combat indicators
- Resource icons
- Status effects

## Testing & Validation

**Usability Tests**:
- ✅ New players understand resource types within 30 seconds
- ✅ Rarity tiers recognizable from 5+ feet away
- ✅ Action prompts clear without reading text
- ✅ Combat timing indicators understandable in first fight

**Accessibility Tests**:
- ✅ Color-blind modes tested with simulations
- ✅ Icon clarity at different sizes
- ✅ High-contrast mode legible in bright/dark environments

## MVP Implementation (Phase 1)

**Included Icons**:
- ✅ 6 resource types (Wood, Metal, Food, Energy, Parts x2)
- ✅ 5 action icons (Build, Attack, Interact, Inventory, Portal)
- ✅ 2 world indicators (Sun, Moon)
- ✅ Health hearts
- ✅ Rarity colors (Common → Epic)

**Excluded** (Future):
- ❌ Legendary tier (no legendary items in MVP)
- ❌ Status effect icons
- ❌ Advanced tooltips
- ❌ Accessibility modes (color-blind support)
- ❌ Animated icons (static only)

**Asset Creation Pipeline**:
1. Sketch icon concepts on paper
2. Create in Aseprite (pixel art tool)
3. Export as PNG (with transparency)
4. Import to Godot as TextureRect resources
5. Test in-game visibility and clarity
