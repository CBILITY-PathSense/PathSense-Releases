# PathSense-System-Releases
Public releases for PathSense System and PathSense Daemon

### PathSense System
- Executes core operations related to PathSense functionality.
- Interfaces with sensors and manages system processes.

### PathSense Daemon
- A systemd service that controls the PathSense System based on GPIO power signals.
- Power signal `HIGH`: Starts and maintains the PathSense System.
- Power signal `LOW`: Stops the PathSense System, disconnects peripherals, and reduces CPU frequency to minimize power comsumption.

## Install
Run the following command anywhere to install.
```sh
curl https://raw.githubusercontent.com/CMKL-PathSense/PathSense-System-Releases/refs/heads/main/install.sh | sh
```

## Uninstall
Run the following command anywhere to uninstall.
```sh
curl https://raw.githubusercontent.com/CMKL-PathSense/PathSense-System-Releases/refs/heads/main/remove.sh | sh
```
