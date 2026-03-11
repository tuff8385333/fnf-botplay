# fnf-botplay
botplay
# Universal FNF Botplay Mod Pack

This repo provides a **drop-in Botplay mod** you can reuse across multiple Friday Night Funkin' engines/mod apps.

## What you get

- `universal-botplay/lua/UniversalBotplay.lua`  
  A compatibility Lua script for engines that support Lua modcharts/scripts (Psych Engine forks, many modern forks).
- `universal-botplay/hscript/UniversalBotplay.hx`  
  A compatibility HScript/Haxe script for engines that expose PlayState scripting.
- `universal-botplay/source/UniversalBotplay.hx`  
  Source-level helper for source-based engines (Kade/Forever/custom forks) where you can edit Haxe code.

## Quick start

### Option A: Lua engine mods (recommended)

1. Copy `universal-botplay/lua/UniversalBotplay.lua` into your mod's script folder.
2. Load it globally (or include it per-song depending on your engine's script loading rules).
3. Launch a song: Botplay should auto-enable and keep itself enabled.

### Option B: HScript-capable engines

1. Copy `universal-botplay/hscript/UniversalBotplay.hx` into your script folder.
2. Load it as a global script.
3. Botplay will force-enable every frame.

### Option C: Source edit (maximum compatibility)

1. Copy `universal-botplay/source/UniversalBotplay.hx` into your source tree.
2. In your `PlayState` `create()` and `update()` methods, call:

```hx
UniversalBotplay.apply(this);
```

3. Rebuild the game.

## Notes

- There is no single API shared by *every* FNF engine, so this pack ships multiple implementations with defensive checks.
- If your engine uses different field names than common forks, edit the alias lists in each script.
- This mod intentionally re-applies botplay every frame so it survives scripts/events that try to disable it.
