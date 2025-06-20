#!/bin/bash

echo "=== MEMORY USAGE ==="
free -h
echo
# Memory percentage calculation
free | grep Mem | awk '{printf("Memory Usage: %.1f%% (%s used of %s total)\n", $3*100/$2, $3, $2)}'

echo
echo "=== DISK USAGE ==="
df -h --total

echo
echo "=== TOP 5 PROCESSES BY CPU USAGE ==="
printf "%-8s %-6s %-6s %-6s %s\n" "PID" "USER" "CPU%" "MEM%" "COMMAND"
ps aux --sort=-%cpu | awk 'NR>=2 && NR<=6{printf "%-8s %-6s %-6s %-6s %s\n", $2, $1, $3"%", $4"%", $11}'

echo
echo "=== TOP 5 PROCESSES BY MEMORY USAGE ==="
printf "%-8s %-6s %-6s %-6s %s\n" "PID" "USER" "CPU%" "MEM%" "COMMAND"
ps aux --sort=-%mem | awk 'NR>=2 && NR<=6{printf "%-8s %-6s %-6s %-6s %s\n", $2, $1, $3"%", $4"%", $11}'

echo
echo "=== SUMMARY ==="
# Memory summary
MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
MEM_USED=$(free -m | grep Mem | awk '{print $3}')
MEM_PERCENT=$(free | grep Mem | awk '{printf "%.1f", $3*100/$2}')
echo "Memory: ${MEM_USED}MB/${MEM_TOTAL}MB (${MEM_PERCENT}%)"

# Disk summary for root filesystem
DISK_INFO=$(df -h / | tail -1)
echo "Disk (/):" $(echo $DISK_INFO | awk '{print $3"/"$2" ("$5")"}')
