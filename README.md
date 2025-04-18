# PathSense-Releases

Public releases for PathSense System and PathSense Daemon. This is designed to be installed on PathSense devices only. Other debian-based devices may work but are not officially supported and will require building from source.

## Overview

### PathSense System

- Executes core operations related to PathSense functionality.
- Interfaces with camera and other peripherals.
- Connects to PathSense cloud services.

### PathSense Daemon

- A Systemd service that controls the PathSense System.
- Starts and stops PathSense System based on power signal.
- Dynamically disconnects some peripherals, and reduces CPU frequency to minimize power comsumption.
- Keeps PathSense System up to date.

## Installation

Run the following command anywhere to install:

```sh
curl https://raw.githubusercontent.com/CMKL-PathSense/PathSense-Releases/refs/heads/main/install.sh | sh
```

You can also download the release without installing using:

```sh
curl https://raw.githubusercontent.com/CMKL-PathSense/PathSense-Releases/refs/heads/main/download.sh | sh
```

## Uninstallation

Run the following command **next to the downloaded release directory** to uninstall:

```sh
curl https://raw.githubusercontent.com/CMKL-PathSense/PathSense-Releases/refs/heads/main/remove.sh | sh
```
