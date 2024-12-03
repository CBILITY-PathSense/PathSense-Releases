sudo systemctl enable bluetooth
sudo systemctl restart bluetooth
export RUST_LOG=info
cd /pathsense-system && ./pathsense_system
