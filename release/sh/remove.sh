echo "Removing PathSense-system..."

# Remove ./pathsense-system from root
sudo rm -d -r /pathsense-system
echo "PathSense-System files is removed"

# Check if pathsense-system is in boot
if grep -Fxq "/pathsense-system/run.sh &" /etc/rc.local; then
	# Remove pathsense-system from boot
	sudo sed -i '\/pathsense-system\/run.sh &/d' /etc/rc.local
	echo "PathSense-system is removed from boot"
fi
echo "PathSense-System removal complete"
