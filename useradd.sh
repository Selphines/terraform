#!/bin/bash
newuser=maxim1
pass=1q2w3e4r
sudo useradd $newuser -m -s /bin/bash
echo "$newuser:$pass" | chpasswd
sudo usermod -aG sudo $newuser
sudo usermod -aG root $newuser
sudo mkdir /home/$newuser/.ssh
sudo chmod -R 777 /home/$newuser/.ssh
touch /home/$newuser/.ssh/authorized_keys
sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDpQ0AONO8EiLILSTFxy78m3cJHDA5mGLCoB8rxQ+XhcH4IE+FLjFxmfrqm5IMLkMfOsi3MhIaTyuNZI9BmgPonnd9gJiYKZnzD8Z0n/DOCwr7z6cSg9Y8KCVNbTh2wFBpaiZbU50xe2gGCPKPuLIYWFIM84FxQZVQIKEhqivg1/c62DQmGXF7IQPv3HtnDN7B9SUbjdg7RqgQKg2D6i3xPwo6qnHR9DQVqMBX8smiVXiebO88XPew5O1X3mViRZwLieOYSlM5CUI8AfbMGC1ZztnluF7u+sRXyEYxLiiKLp4+R8R7brqTB8edN4qeLZy9ETzIvEFCv0f3f6WNSpH7IW8weZ0GUfNhZ5eyBm9JG91qA/FDRcEwTOzyFMPofe7N/OEHXp/YVmhG/L7/fhazZ390My53Z8PjR+wl0/hfxUJoPflMKD0lqGpyI+bbQy0dzZ3DJq75DswRqGfhRDva6hVjfXGO5D4lDlwCj8PI0OQjmT89zNcRHjawDMyfeggE=" > /home/$newuser/.ssh/authorized_keys
sudo chown -R $newuser:$newuser /home/$newuser/.ssh
sudo chmod 740 /home/$newuser/.ssh
sudo service ssh restart
