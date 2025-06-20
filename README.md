# server_stats_project
# Server Stats Monitor

A comprehensive bash script to monitor server system statistics including memory usage, disk usage, and top processes by CPU and memory consumption.

## Features

- **Memory Usage**: Display total, used, and free memory with percentage
- **Disk Usage**: Show disk space utilization for all mounted filesystems
- **Top 5 CPU Processes**: List processes consuming the most CPU resources
- **Top 5 Memory Processes**: List processes using the most memory
- **Clean Summary**: Consolidated system overview with key metrics

## Prerequisites

- Linux/Ubuntu system
- Bash shell
- Standard system utilities (`ps`, `free`, `df`)

## Installation

1. Clone the repository:
```bash
git clone https://github.com/hamza12225/server_stats_project.git
cd server_stats_project
```

2. Make the script executable:
```bash
chmod +x server-stats.sh
```

## Usage

Run the script directly:
```bash
./server-stats.sh
```

Or execute with bash:
```bash
bash server-stats.sh
```

## Sample Output

```
=== MEMORY USAGE ===
               total        used        free      shared  buff/cache   available
Mem:            16Gi       4.2Gi       8.1Gi       234Mi       3.7Gi        11Gi
Swap:          2.0Gi          0B       2.0Gi

Memory Usage: 26.3% (4300 used of 16384 total)

=== DISK USAGE ===
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        20G  8.5G   11G  45% /
/dev/sda2       100G   45G   50G  48% /home
total           120G   54G   61G  47% -

=== TOP 5 PROCESSES BY CPU USAGE ===
PID      USER   CPU%   MEM%   COMMAND
1234     hamza  15.2%  8.1%   chrome
5678     root   12.3%  2.4%   systemd
9012     hamza  8.7%   5.2%   code
3456     hamza  5.1%   3.8%   firefox
7890     root   3.2%   1.1%   kworker

=== TOP 5 PROCESSES BY MEMORY USAGE ===
PID      USER   CPU%   MEM%   COMMAND
1234     hamza  15.2%  18.1%  chrome
9012     hamza  8.7%   12.2%  code
3456     hamza  5.1%   8.8%   firefox
2468     hamza  2.1%   6.4%   slack
1357     root   1.8%   4.2%   mysql

=== SUMMARY ===
Memory: 4300MB/16384MB (26.3%)
Disk (/): 8.5G/20G (45%)
```

## Script Components

### Memory Monitoring
- Uses `free -h` command for human-readable memory statistics
- Calculates memory usage percentage
- Shows both physical memory and swap usage

### Disk Monitoring
- Uses `df -h` command for disk space information
- Displays all mounted filesystems
- Shows total disk usage summary

### Process Monitoring  
- Uses `ps aux` with sorting options
- `--sort=-%cpu` for CPU usage ranking
- `--sort=-%mem` for memory usage ranking
- Displays PID, user, CPU%, memory%, and command name

## Customization

You can modify the script to:
- Change the number of top processes displayed (currently top 5)
- Add additional system metrics
- Filter specific processes or users
- Export results to a file
- Schedule automatic execution via cron

## Scheduling (Optional)

To run the script automatically, add it to your crontab:

```bash
# Edit crontab
crontab -e

# Add line to run every hour
0 * * * * /path/to/server_stats_project/server-stats.sh >> /var/log/server-stats.log
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/enhancement`)
3. Commit your changes (`git commit -m 'Add enhancement'`)
4. Push to the branch (`git push origin feature/enhancement`)
5. Open a Pull Request

## License

This project is open source and available under the [MIT License](LICENSE).

## Author

**Hamza** - [hamza12225](https://github.com/hamza12225)

## Support

If you encounter any issues or have questions, please open an issue on the GitHub repository.

---

**Note**: This script requires standard Linux utilities and may need modifications for other Unix-like systems.
