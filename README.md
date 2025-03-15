# PathSense-System-Releases
Public releases for PathSense System and PathSense Daemon

### PathSense System
- Executes core operations related to PathSense functionality.
- Interfaces with camera and other peripherals.
- Connect to PathSense cloud services.

### PathSense Daemon
- A Systemd service that controls the PathSense System.
- Start and stop PathSense System based on power signal.
- Dynamically disconnects some peripherals, and reduces CPU frequency to minimize power comsumption.
- Keep PathSense System up to date.

## Install
Download the latest release.
```sh
curl https://raw.githubusercontent.com/CMKL-PathSense/PathSense-System-Releases/refs/heads/main/download.sh | sh
```

In the same directory, run the following command to install.
```sh
curl https://raw.githubusercontent.com/CMKL-PathSense/PathSense-System-Releases/refs/heads/main/install.sh | sh
```

For non-systemd devices, run `./install-legacy.sh` instead
```sh
curl https://raw.githubusercontent.com/CMKL-PathSense/PathSense-System-Releases/refs/heads/main/install-legacy.sh | sh
```

## Uninstall
Run the following command anywhere to uninstall.
```sh
curl https://raw.githubusercontent.com/CMKL-PathSense/PathSense-System-Releases/refs/heads/main/remove.sh | sh
```
