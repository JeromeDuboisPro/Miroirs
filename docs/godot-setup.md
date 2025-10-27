# Godot Installation & Setup Guide

## Installing Godot 4.2+

### For Linux (Fedora)

**Option 1: Flatpak (Recommended)**

```bash
# Install Flatpak if not already installed
sudo dnf install flatpak

# Add Flathub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Godot
flatpak install flathub org.godotengine.Godot

# Run Godot
flatpak run org.godotengine.Godot
```

**Option 2: Official Binary (More Control)**

```bash
# Download latest Godot 4.x from official website
# Visit: https://godotengine.org/download/linux/

# Download the Standard version (not .NET)
wget https://github.com/godotengine/godot/releases/download/4.2-stable/Godot_v4.2-stable_linux.x86_64.zip

# Extract
unzip Godot_v4.2-stable_linux.x86_64.zip

# Make executable
chmod +x Godot_v4.2-stable_linux.x86_64

# Optional: Move to /usr/local/bin for system-wide access
sudo mv Godot_v4.2-stable_linux.x86_64 /usr/local/bin/godot4

# Create desktop entry
cat > ~/.local/share/applications/godot4.desktop << EOF
[Desktop Entry]
Name=Godot Engine
Comment=Multi-platform 2D and 3D game engine
Exec=/usr/local/bin/godot4 %f
Icon=godot
Terminal=false
Type=Application
Categories=Development;IDE;
EOF

# Now you can run from terminal
godot4
```

**Option 3: DNF Repository (if available)**

```bash
# Check if Godot is in repositories
sudo dnf search godot

# Install if available (may be older version)
sudo dnf install godot
```

### For Windows

1. Visit https://godotengine.org/download/windows/
2. Download **Godot Engine - Standard Version** (not .NET)
3. Extract ZIP file
4. Run `Godot_v4.x.exe`
5. Optional: Pin to taskbar for easy access

### For macOS

1. Visit https://godotengine.org/download/macos/
2. Download **Godot.app**
3. Move to Applications folder
4. Open Godot.app (may need to allow in Security settings)

## Verifying Installation

```bash
# Check version (if installed to PATH)
godot4 --version

# Should output: 4.2.stable.official [somehash]
```

Or open Godot and check **Help > About**

## First-Time Setup

### 1. Configure Editor

**On first launch:**
- Choose language: English (or your preference)
- Accept default editor settings
- Select theme: **Godot Dark** (recommended for pixel art visibility)

**Recommended Settings**:
- **Editor > Editor Settings > Interface > Theme > Preset**: Godot Dark
- **Editor > Editor Settings > Interface > Editor Scale**: 100% (adjust for your display)
- **Editor > Editor Settings > Text Editor > Behavior > Indent Type**: Tabs (Python-style)

### 2. Install VS Code Integration (Optional)

**For external code editing:**

```bash
# Install VS Code (if not installed)
sudo dnf install code  # Fedora
# Or download from https://code.visualstudio.com/

# Install Godot Tools extension
code --install-extension geequlim.godot-tools
```

**Configure Godot to use VS Code:**
1. Godot: **Editor > Editor Settings**
2. Navigate to **Text Editor > External**
3. Check **Use External Editor**
4. **Exec Path**: `/usr/bin/code` (or `code` on Windows)
5. **Exec Flags**: `{project} --goto {file}:{line}:{col}`

### 3. Configure Git Integration

```bash
# Set up Git user (if not done)
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Recommended: Set Godot-friendly .gitignore
cat > .gitignore << EOF
# Godot
.import/
export.cfg
export_presets.cfg
*.import

# OS
.DS_Store
Thumbs.db

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# Logs
*.log
EOF
```

## Creating the Miroirs Project

### Step 1: Initialize Godot Project

**Option A: Through Godot Editor**
1. Launch Godot
2. Click **New Project**
3. **Project Name**: Miroirs
4. **Project Path**: `/home/jerome/devs/miroir` (use Browse to select)
5. **Renderer**: **Forward+** (best for 2D with effects)
6. Click **Create & Edit**

**Option B: From Existing Git Repo**
1. Clone repository (already done)
2. Launch Godot
3. Click **Import**
4. Navigate to `/home/jerome/devs/miroir`
5. Click **Import & Edit**

### Step 2: Project Structure

Create initial folder structure in Godot:

```
res://               (Project root)
├── scenes/          (Scene files)
│   ├── player/
│   ├── worlds/
│   ├── enemies/
│   └── ui/
├── scripts/         (GDScript files)
│   ├── player/
│   ├── systems/
│   └── utils/
├── assets/          (Art, audio, data)
│   ├── sprites/
│   ├── tiles/
│   ├── audio/
│   └── data/
└── addons/          (Third-party plugins)
```

**Create folders in Godot:**
1. Right-click in **FileSystem** panel
2. Select **New Folder**
3. Create structure above

### Step 3: Project Settings

**Essential configurations:**

**Display Settings**:
- **Project > Project Settings > Display > Window**
- **Size > Viewport Width**: 320
- **Size > Viewport Height**: 180
- **Size > Mode**: Windowed (testing)
- **Stretch > Mode**: canvas_items
- **Stretch > Aspect**: expand

**Rendering**:
- **Project > Project Settings > Rendering > Textures**
- **Canvas Textures > Default Texture Filter**: Nearest (pixel-perfect)

**Input Map** (we'll configure keys later):
- **Project > Project Settings > Input Map**
- Add actions: move_left, move_right, move_up, move_down, attack, interact, etc.

## Learning Resources

### Essential Tutorials

**Godot Official Docs** (highly recommended):
1. [Your First 2D Game](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/index.html)
2. [GDScript Basics](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html)
3. [2D Movement](https://docs.godotengine.org/en/stable/tutorials/2d/2d_movement.html)

**Video Tutorials**:
- [Brackeys - How to make a Video Game](https://www.youtube.com/watch?v=LOhfqjmasi0) (Godot 4 intro)
- [GDQuest - Learn GDScript From Zero](https://www.gdquest.com/tutorial/godot/learning-paths/getting-started-in-2021/)
- [HeartBeast - Godot RPG Tutorial](https://www.youtube.com/playlist?list=PL9FzW-m48fn2SlrW0KoLT4n5egNdX-W9a)

### Recommended Order

**Week 1: Fundamentals**
1. Complete "Your First 2D Game" (2-3 hours)
2. Read GDScript Basics (1 hour)
3. Experiment with player movement (2-3 hours)

**Week 2: Project Start**
1. Create player character with WASD movement
2. Set up tilemap for Light world
3. Implement world-switching (key press)

## Useful Godot Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `F5` | Run project |
| `F6` | Run current scene |
| `Ctrl+S` | Save scene |
| `Ctrl+Shift+S` | Save scene as |
| `Ctrl+D` | Duplicate node |
| `Ctrl+X/C/V` | Cut/Copy/Paste nodes |
| `Ctrl+Z/Y` | Undo/Redo |
| `Ctrl+F` | Search in script |
| `F1` | Open documentation |
| `Space` (2D view) | Pan camera |
| `Scroll` | Zoom |

## Troubleshooting

### Issue: Godot won't start

**Solution**:
```bash
# Check if Vulkan drivers are installed (required for Godot 4)
vulkaninfo | grep "Vulkan Instance"

# If missing, install Vulkan drivers
sudo dnf install vulkan-loader mesa-vulkan-drivers

# For NVIDIA:
sudo dnf install xorg-x11-drv-nvidia-cuda
```

### Issue: Blurry pixel art

**Solution**:
- **Project Settings > Rendering > Textures > Default Texture Filter**: Nearest
- In sprite properties: **Texture > Filter**: Nearest

### Issue: Git conflicts with .import files

**Solution**:
- Add `.import/` to `.gitignore`
- Import files are auto-generated, don't commit them

### Issue: Project won't open after clone

**Solution**:
```bash
# Godot needs project.godot file
# If missing, create new project and reimport assets
# Or ensure project.godot is not in .gitignore
```

## Next Steps

After setup:
1. ✅ Complete "Your First 2D Game" tutorial
2. ✅ Create simple player movement test
3. ✅ Experiment with TileMap nodes
4. ✅ Test build/export process
5. ✅ Start Phase 1 Week 1 tasks from roadmap

## Additional Tools (Optional)

### Pixel Art Editor: Aseprite

```bash
# Option 1: Buy on Steam/Itch.io ($20)
# https://www.aseprite.org/

# Option 2: Compile from source (free, but time-consuming)
# https://github.com/aseprite/aseprite/blob/main/INSTALL.md

# Alternative: Use GIMP (free)
sudo dnf install gimp
```

### Audio Tools

```bash
# Audacity (sound effects)
sudo dnf install audacity

# LMMS (music creation - optional)
sudo dnf install lmms
```

## Community & Support

- **Godot Docs**: https://docs.godotengine.org/
- **Godot Forum**: https://forum.godotengine.org/
- **Godot Discord**: https://discord.gg/godot
- **Godot Reddit**: https://reddit.com/r/godot
- **Q&A**: https://ask.godotengine.org/

## Quick Reference Card

Keep this handy while developing:

**GDScript Basics**:
```gdscript
# Variables
var health = 100
var player_name := "Hero"  # Type inference

# Functions
func _ready():
    print("Game started!")

func _process(delta):
    # Called every frame
    pass

# Signals
signal health_changed(new_health)

# Nodes
$PlayerSprite.visible = false
get_node("PlayerSprite").visible = false
```

**Common Node Types**:
- **Node2D**: Base 2D node
- **Sprite2D**: Display images
- **AnimatedSprite2D**: Animated sprites
- **TileMap**: Grid-based levels
- **CharacterBody2D**: Player/enemy with physics
- **Area2D**: Detection zones
- **CollisionShape2D**: Collision detection

---

**You're ready to start development!** 🚀

Proceed to [Roadmap Week 1](../planning/roadmap.md#weeks-1-2-project-setup--learning)
