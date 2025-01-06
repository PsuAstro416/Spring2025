+++
title = "Setup Script on Roar"
+++

### Run Setup Script on Roar

To initially set up the users environment for ASTRO 416's use of Julia and Pluto, a user must run a setup script. 
This initial setup step should only be performed once all semester. 
(If you're curious, the setup script loads modules providing access to julia, python, and anaconda.
It sets some environment variables that we'll use later in the class and moves the current .julia directory (if it exists) from home to work. 
It then creates a symlink ~/.julia -> ~/work/julia_astro416.  Finally, it installs the Pluto and IJulia packages in Julia, so you can use Julia inside the JupyterLab and Pluto servers.)  


To make all those steps easy, ICDS has provided a script that you can easily run from a terminal window on Roar.
To run this script, first, make sure you have an account on ACI and have completed the [initial setup](../tips/create_account/) steps.
Then, 
- Browse to [portal.hpc.psu.edu](https://portal.hpc.psu.edu).  Using "guest" or "incognito" mode is recommended. 
- Login and authenticate (as necessary).
- Click _Clusters_ and select _>RC Shell Access_.  
- Login with your Penn State password.  You'll likely need to complete the two-factor authentication process.  
- You'll now have a terminal where you can enter commands.  Type (or copy and paste)
```shell
bash /storage/group/dsa2astro/default/astro_416/scripts/class_setup
```
If you already have customized your Roar environment for your research, then you may get a warning message and need to ask for help configuring your account.
Note that the script above should be active starting Monday, January 13.  Any students wanting to start before then, can instead use 
```shell
bash /storage/group/RISE/classroom/astro_416/scripts/class_setup 
```

- When the script has finished running and you have a new command prompt, exit the terminal by typeing 
```shell
exit
```
Your next Roar session will automatically use those settings.

\\
Now you're ready to move on to [starting Pluto](../pluto/)
