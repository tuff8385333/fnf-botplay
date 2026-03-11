UniversalBotplay.lua
-- Drop-in botplay enabler for Lua-capable FNF engines/forks.

local BOTPLAY_TEXT = 'BOTPLAY (UNIVERSAL MOD)'

local function safeCall(fn, ...)
    local ok, result = pcall(fn, ...)
    if ok then return result end
    return nil
end

local function safeSetProperty(name, value)
    safeCall(setProperty, name, value)
end

local function safeSetTextString(name, value)
    safeCall(setTextString, name, value)
end

local function safeSetPropertyFromClass(className, property, value)
    safeCall(setPropertyFromClass, className, property, value)
end

local function applyBotplay()
    -- Common property names across Psych-like forks.
    safeSetProperty('cpuControlled', true)
    safeSetProperty('botPlay', true)
    safeSetProperty('botplay', true)

    -- Common UI text object names.
    safeSetProperty('botplayTxt.visible', true)
    safeSetProperty('botPlayTxt.visible', true)
    safeSetTextString('botplayTxt', BOTPLAY_TEXT)
    safeSetTextString('botPlayTxt', BOTPLAY_TEXT)

    -- Some forks expose flags on classes/state.
    safeSetPropertyFromClass('PlayState', 'cpuControlled', true)
    safeSetPropertyFromClass('PlayState', 'botPlay', true)
    safeSetPropertyFromClass('PlayState', 'botplay', true)
end

function onCreatePost()
    applyBotplay()
end

function onSongStart()
    applyBotplay()
end

function onUpdatePost(elapsed)
    applyBotplay()
end
