#!/bin/bash

# This is the main installer for basic software
echo "**************Installation starts******************"
sleep 2s

# Installation of SSH
echo "----------SSH installation starts----------"
sudo apt-get install openssh-server -y
sudo systemctl status ssh
sleep 2s
sudo systemctl start ssh
sudo systemctl enable ssh
sudo systemctl status ssh
echo "----------SSH installation ends----------"
sleep 2s

# Installation of Fail2Ban 
echo "----------Fail2Ban installation starts----------"
sudo apt-get install fail2ban -y
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo sed -i '243G' /etc/fail2ban/jail.local
sudo sed -i '244s/^/enabled = true/' /etc/fail2ban/jail.local
sudo sed -i '245G' /etc/fail2ban/jail.local
sudo sed -i '246s/^/filter = sshd/' /etc/fail2ban/jail.local
sudo sed -i '246G' /etc/fail2ban/jail.local
sudo sed -i '247s/^/banaction = iptables-multiport/' /etc/fail2ban/jail.local
sudo sed -i '247G' /etc/fail2ban/jail.local
sudo sed -i '248s/^/bantime = -1/' /etc/fail2ban/jail.local
sudo sed -i '248G' /etc/fail2ban/jail.local
sudo sed -i '249s/^/maxretry = 5/' /etc/fail2ban/jail.local
sudo service fail2ban restart
echo "----------Fail2Ban installation ends----------"
sleep 2s

# Installation of Locate
echo "----------Locate installation starts----------"
sudo apt-get install locate -y
echo "----------Locate installation ends----------"
sleep 2s

# Installation of Vim
echo "----------Vim installation starts----------"
sudo apt-get install vim -y
# Add numbers on the left and match color scheme with normal terminal
sudo sed -i -e '$aset number' /etc/vim/vimrc
sudo sed -i -e '$asyntax on' /etc/vim/vimrc
sudo sed -i -e '$aset background=dark' /etc/vim/vimrc
echo "----------Vim installation ends----------"
sleep 2s

# Install Tmux
echo "----------Tmux installation start----------"
sudo apt-get install tmux -y
echo "----------Tmux installation ended----------"
sleep 2s

# Installation of Ranger
echo "----------Ranger installation starts----------"
sudo apt-get install ranger -y
echo "----------Ranger installation ends----------"
sleep 2s

# Installation of exfat
echo "----------exfat installation starts----------"
sudo apt-get install exfat-fuse -y
sudo apt-get install exfat-utils -y
echo "----------exfat installation ends----------"
sleep 2s

# Installation of at
echo "----------exfat installation starts----------"
sudo apt-get install at -y
echo "----------exfat installation ends----------"
sleep 2s

# Installation of Firewall UFW 
echo "----------Firewall installation starts----------"
sudo apt-get install ufw -y
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw status verbose
sleep 2s
sudo ufw allow ssh
sudo apt-get install gufw -y
echo "----------Firewall installation ends----------"
sleep 2s

# Installation of Git and GitHub
echo "----------GitHub installation starts----------"
sudo apt-get install git -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh -y
sleep 2s
echo "----------GitHub installation starts----------"

# Installation of bc (calculator language)
# sudo apt-get install bc -y
echo "**************Installation completed******************"
