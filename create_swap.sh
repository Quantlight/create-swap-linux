

SWAP_FILENAME=swap_file
SWAP_SIZE=20G

sudo swapon --show
sudo cat /proc/swaps
# Creating Swap File
sudo mkdir  $SWAP_FILENAME
# Setting up swap size
sudo fallocate -l $SWAP_SIZE  /$SWAP_FILENAME
# Setting only perrmission to user to only read and write the file.
sudo chmod 600 /$SWAP_FILENAME
# Setting up swap file by creating necessary structure and header information
sudo mkswap /$SWAP_FILENAME
# Enable Swap FIle
sudo swapon /$SWAP_FILENAME
# Verify Enabled Swap File
sudo swapon --show

echo
echo "Making Swap Permanent "
sudo echo $SWAP_FILENAME swap swap defaults 0 0 >> /etc/fstab
sudo cat /etc/fstab
