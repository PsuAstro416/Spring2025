+++
title = "Pluto Notebooks on Roar"
+++

# Start Roar Session with Pluto Server

If this is your first time to run Pluto on Roar, then first make sure you have an account on ACI and have completed the [initial setup](../tips/roar/) steps.
Then, each time you want to start a Jupyter notebook session on Roar, you'll follow the instructions below:
1. Browse to [portal.hpc.psu.edu](https://portal.hpc.psu.edu).
Using "guest" or "incognito" mode is recommended.
Login and authenticate (as necessary).

1. Under _Interactive Apps_, choose _Jupyter_ (under Server Applications).
2. Select:
   - Jupyter Interface: "Jupyter Lab"
   - Environment Setup:  `source /storage/group/RISE/classroom/astro_416/scripts/env_setup`
   - Account:  `dsa2astro_bc` (if that's not avaliable choose _open_)
   - Partition: `dsa2astro_bc` (if that's not avaliable choose _open_; this option might not be displayed) 
   - Number of hours: 2 hours  (can choose longer if you plan to continue after class or outside of class)
   - Number of cores: 3
   - Memory per core: 6 GB
   - Enable advanced Slurm options: Leave unchecked
   - I would like to receive an email when the session starts: Your choice of whether to check or not.
3. Click _Launch_.  And wait while your job starts.
4. Once the _Connect to Jupyter Server_ button appears, click it.
   + The top row of tiles (labeled "Notebook") should include a tile labeled "Pluto.jl".  Click it.  
   + A new browser tab should open with a Pluto session.
   + The first time you open Pluto it will take a few minutes and is likely to time out.  Just wait five minutes and try again.  (Behind the scenes, it's installing a lot of packages.  It will start promptly in the future.)
   + For a blank notebook, click "new notebook", or enter the path to a notebook you'd like to open in the text box under "Open from file" and click the "Open" button.
   + Do your work, remembering to save your notebook before you quit.
5. See [Starting & Submitting Assignments](/tips/labs/) for more information on accessing and submitting assignments.
6. When you're done using Roar:
- From your Pluto notebook, click the _Ctrl+S/Save all changes_ icon (or press Ctrl+S) to save your changes.
- From the Jupyter server, close notebook tabs and click the logout icon in in upper right.
- In the Roar Collab Portal, click the "My Interactive Sessions" icon (to the right of Interactive Apps) and click "Delete" for this session and confirm.
