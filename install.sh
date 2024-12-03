# install shared packages
sudo apt update
sudo apt install -y \
  pkg-config \
  build-essential \
  libopencv-dev \
  libclang-dev \
  libbluetooth-dev \
  libdbus-1-dev \
  bluez \
  v4l-utils \
  libssl-dev \
  clang \
  wget

# download the latest release and extreact it
rm -d -r ~/PathSenseInstaller
wget -O ~/release.tar.gz https://github.com/CMKL-PathSense/PathSense-System-Releases/releases/download/beta/release.tar.gz
tar -xvf ~/release.tar.gz
rm ~/release.tar.gz
mv ~/release ~/PathSenseInstaller

# install the release
cd ~/PathSenseInstaller
chmod +x pathsense-system
./pathsense-system install
