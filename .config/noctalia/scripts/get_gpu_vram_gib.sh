#!/usr/bin/env bash
# get_gpu_vram_gib.sh - Display AMD GPU VRAM usage in GiB (absolute value)
set -e

# Try rocm-smi first (most reliable for RX 7900 XTX on CachyOS/AMDGPU)
if command -v rocm-smi &> /dev/null; then
    vram_used=$(rocm-smi --query=gpu_name,vram_total,vram_used --csv 2>/dev/null |         awk -F',' 'NR==1 {print $3}' | tr -d ' ')
    
    if [ -n "$vram_used" ] && [ "$vram_used" != "0" ]; then
        echo "$(echo "scale=2; $vram_used / 1099511627776" | bc)" "GiB"
    else
        echo "N/A"
    fi
else
    # Fallback: read from sysfs (AMDGPU driver)
    vram_file="/sys/class/drm/card0/mem_info"
    
    if [ -f "$vram_file" ]; then
        vram_used=$(awk '/^gpu_vram_usage:/ {print $2}' "$vram_file")
        
        if [ -n "$vram_used" ] && [ "$vram_used" != "0" ]; then
            echo "$(echo "scale=2; $vram_used / 1099511627776" | bc)" "GiB"
        else
            echo "N/A"
        fi
    else
        echo "N/A"
    fi
fi
