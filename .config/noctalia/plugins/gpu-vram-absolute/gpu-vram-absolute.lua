-- gpu-vram-absolute: Displays GPU VRAM usage in GiB (not percentage)
-- Noctalia v5+ Runtime API plugin

local M = {}

function M.init()
    -- Register widget type
    return {
        name = "gpu-vram-absolute",
        version = "1.0.0",
        description = "GPU VRAM usage in GiB (absolute value)",
    }
end

function M.create_widget(config)
    local widget = {}
    
    -- Get initial stats
    local function update_stats()
        local stats = noctalia.systemStats()
        if stats and stats.gpu then
            local vram_used_bytes = stats.gpu.vramUsedBytes or 0
            local vram_total_bytes = stats.gpu.vramTotalBytes or 1
        
            -- Convert to GiB (binary: 1 GiB = 1024^3 bytes)
            local vram_used_gib = vram_used_bytes / (1024 * 1024 * 1024)
            
            return string.format("%.2f", vram_used_gib) .. " GiB"
        end
        
        return "N/A"
    end
    
    -- Initial update
    widget.text = update_stats()
    
    -- Update on stats refresh (Noctalia calls this when system monitor updates)
    widget.on_update = function()
        widget.text = update_stats()
    end
    
    return widget
end

return M
