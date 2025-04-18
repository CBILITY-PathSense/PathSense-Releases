# PathSense-Releases

Public releases for PathSense System and PathSense Daemon

## Overview

### PathSense System

- Executes core operations related to PathSense functionality.
- Interfaces with camera and other peripherals.
- Connect to PathSense cloud services.

### PathSense Daemon

- A Systemd service that controls the PathSense System.
- Start and stop PathSense System based on power signal.
- Dynamically disconnects some peripherals, and reduces CPU frequency to minimize power comsumption.
- Keep PathSense System up to date.

## Installation

Run the following command anywhere:s

```sh
curl https://raw.githubusercontent.com/CMKL-PathSense/PathSense-System-Releases/refs/heads/main/install.sh | sh
```

You can also download the release without installing using:

```sh
curl https://raw.githubusercontent.com/CMKL-PathSense/PathSense-System-Releases/refs/heads/main/download.sh | sh
```

## Uninstallation

Run the following command **next to the downloaded release directory** to uninstall:

```sh
curl https://raw.githubusercontent.com/CMKL-PathSense/PathSense-System-Releases/refs/heads/main/remove.sh | sh
```
