+++
title = "SSH keys on Roar"
+++

We'll setup ssh keys to connect your Roar account to GitHub.  
- Browse to [portal.hpc.psu.edu](https://portal.hpc.psu.edu).  Using "guest" or "incognito" mode is recommended. 
- Login and authenticate (as necessary).
- Click _Clusters_ and select _>RC Shell Access_.  
- Login with your Penn State password.  You'll likely need to complete the two-factor authentication process.  
- You'll now have a terminal where you can enter commands.  Type (or copy and paste)
```shell
bash /storage/group/dsa2astro/default/astro_416/scripts/gitkeys_setup
```
once at the beginning of the semester.  

Note that the script above should be active starting Monday, January 13.  Any students wanting to start before then, can instead use 
```shell
source /storage/group/RISE/classroom/astro_416/scripts/gitkeys_setup
```

Once you run this script, then you'll need to add the new ssh key to the list of authorized keys for your github account in order to push code from Roar to GitHub.
- Follow the link to your github repository for Lab 1 (the one like https://github.com/PsuAstro416/lab1-yourgithubid),
- Look for the green "Code" button near the top.  There will be a message about not having SSH keys setup.  Click "add a new public key".  
- In the Title box enter "ICDS RC key"
- For Key Type, select "Authentication key"
- In the "Key" box paste the contents of the line after "Key:" (starting with ssh) 
- Click "Add SSH Key".  

If you want to use this same SSH key again, you can find your public key in the file `~/.ssh/id_ed25519.pub` on the Roar Collab system.  You can get your ssh public key by running `cat  ~/.ssh/id_ed25519.pub` from the command line while logged into Roar Collab.  
If you'd like more information about setting up SSH keys for Git, see the [documentation at GitHub](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/#platform-linux). 

The next step is to [configure git on Roar](../git/)