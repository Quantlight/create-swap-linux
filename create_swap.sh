SWAP_FILENAME=swap_file
SWAP_SIZE=20G

echo
echo "Showing the current details of swap"
sudo swapon --show
# sudo cat /proc/swaps
echo 
echo -----------------------------------------------
echo "Creating Swap File"
# Creating Swap File
sudo mkdir  $SWAP_FILENAME
echo "Setting up the Swap size to $SWAP_SIZE"
# Setting up swap size
sudo fallocate -l $SWAP_SIZE  /$SWAP_FILENAME
echo "Setting up the permissions of Swap File"
# Setting only perrmission to user to only read and write the file.
sudo chmod 600 /$SWAP_FILENAME
echo "Enabing the Swap"
# Setting up swap file by creating necessary structure and header information
sudo mkswap /$SWAP_FILENAME
# Enable Swap FIle
sudo swapon /$SWAP_FILENAME
# Verify Enabled Swap File
echo -----------------------------------------------
echo "Check if the swap file is Created" 
sudo swapon --show

echo -----------------------------------------------
echo "Making Swap Permanent..."
sudo echo $SWAP_FILENAME swap swap defaults 0 0 >> /etc/fstab
echo -----------------------------------------------
sudo cat /etc/fstab  | grep "swap swap defaults 0 0"
echo "Your swap file is Succesfully Created you can Exit the terminal now."
echo "Thank you"
