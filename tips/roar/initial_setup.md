+++
title = "Setup Script on Roar"
+++

### Run Setup Script on Roar

We'll want to make a few updates to your Roar environment.  To make this easy, Justin has provided a script that you can easily run from a terminal window on Roar,
```shell
bash /gpfs/group/RISE/classroom/astro_497/scripts/julia_setup
```
<!--
If you’re curious, this will update your .bashrc startup script so that it automatically loads a module (so software for the course is in your path; `module use /gpfs/group/RISE/sw7/modules`), and move your .julia and .conda directories from the home filesystem to the work filesystem (since those can get rather large).  
-->
If you already have customized your Roar environment for your research, then you may get a warning message and need to ask for help configuring your account.  
<!--
If something does break, you can run `/gpfs/group/RISE/classroom/astro_528/scripts/class_setup restore` to undo the setup changes above.  
-->
After you exit the terminal, your next Roar session will automatically use those settings.

\\

Now you're ready to move on to [starting Pluto](../pluto/)
