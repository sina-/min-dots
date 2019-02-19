# min-dots

Collection of configurations

# Debian gnome setup
* Base packages
 ```
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install 	 		\
	terminator 	 		\
	git		 		\
	tmux		 		\
	vim-athena 	 		\
	gnome-tweak-tool 		\
	htop				\
	silversearcher-ag		\
	gnome-shell-extension-redshift  \
	libdrm2:i386			\
	libx11-6:i386
	steam		
```
* Download nvidia drivers and use the installer after installing any mesa library. 
* *IMPORTANT*: Always install nvidia drivers after steam installation otherwise 32-bit drivers will be corrupted and steam will crash with seg fault at start up!
