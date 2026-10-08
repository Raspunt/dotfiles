#!/bin/bash
# Загрузка NVIDIA GPU для waybar (custom/gpu, return-type json)
out=$(nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.total,temperature.gpu,name \
      --format=csv,noheader,nounits 2>/dev/null | head -n1)
if [ -z "$out" ]; then
    echo '{"text":"󰢮 --","tooltip":"nvidia-smi недоступен"}'
    exit 0
fi
IFS=',' read -r util mem_used mem_total temp name <<<"$out"
printf '{"text":"󰢮 %s%%","tooltip":"%s\\nЗагрузка: %s%%\\nVRAM: %s / %s МБ\\nТемпература: %s°C"}\n' \
    "${util// /}" "${name# }" "${util// /}" "${mem_used// /}" "${mem_total// /}" "${temp// /}"
