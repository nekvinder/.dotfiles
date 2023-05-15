sudo fallocate -l 16G /swapfile1
sudo chmod 600 /swapfile1
sudo mkswap /swapfile1
sudo swapon /swapfile1
sudo swapon --show
free -h
