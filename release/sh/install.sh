echo "Installing PathSense-system..."

# Install the required packages
sudo apt -y update
sudo apt -y install \
  build-essential \
  libopencv-dev \
  libclang-dev \
  libbluetooth-dev \
  libc6-dev \
  libdbus-1-dev \
  bluez \
  v4l-utils \
  pkg-config \
  libssl-dev \
  clang

# Copy the bin folder to the .pathsense-system directory
sudo mkdir -p /pathsense-system
sudo cp -r bin/* /pathsense-system/
sudo cp sh/run.sh /pathsense-system/run.sh
sudo chmod +x /pathsense-system/run.sh
echo "PathSense-System files are copied to /pathsense-system"

# Check if run command is already in the boot file
if grep -Fxq "/pathsense-system/run.sh &" /etc/rc.local; then
  echo "PathSense-System is already set to run on boot"
else
  # If not, add the command to the boot file
  sudo sed -i -e '$i \/pathsense-system\/run.sh &' /etc/rc.local
  echo "PathSense-System is now set to run on boot"
fi

echo "PathSense-System installation complete"
echo "Reboot to start the system"
