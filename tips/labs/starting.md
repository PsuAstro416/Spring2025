+++
title = "Starting Labs on Roar"
tags = ["tips","labs","git","pluto"]
+++

# Starting Labs on Roar

\toc


## Start a new Roar Session
- Request a "**Jupyter Lab server**" session via the [Roar Collab portal](https://portal.hpc.psu.edu/) using our class's custom environment (see [starting Pluto Server](../../roar/pluto/)).
- You can proceed to the section on cloning your github repositorystep, while you're waiting for it to start.
- When it and you are ready, click the _Connect to Jupyter Server_ button. 

## Clone your github repository to begin a new assignment
- Lookup the url for the repo to be cloned (from email, Canvas announcement, or Canvas lab page).
    + If you haven't followed the link to create your repo for this week's assignment yet, then do that now.  Following that link should trigger GitHub to create a private git repository named labN-GITHUBID (where N is the week number and GITHUBID is the GitHub username that you're logged in as at the time you follow the link).
    + Navigate to the github repository you'll be using in your browser.
    + Click _Clone or download_.
    + If it says "Clone with https", click "Use ssh".
    + Click the clipboard icon to copy the url onto your clipboard
- Open a tab with a JupyterLab server.  If you don't have one open yet, then
    + Return to your browser tab with "My Interactive Sessions".
    + Hopefully, there's now a _Connect to Jupyter Server_ button. Click it.
    + Go to the newly opened tab, where you'll have a Jupyter Lab Server.
- If you don't see tiles for Python, Julia and Pluto Notebooks, then click _File.NewLauncher_.
- Find the _Terminal_ tile or in the menu system, _File.New.Terminal_.
- In the new terminal tab, clone your github repo by running

```shell
git clone REPO_URL  
```
where `REPO_URL` is what you'll paste from the clipboard

## Instantiate the lab's environemnt
- Change into the directory that was created for the repository (we'll call it REPO_DIR) and setup all the package dependencies required (as specified by the Project.toml or test/Project.toml file or embedded in Pluto notebooks) by running

```shell
cd REPO_DIR
julia --project -e 'using Pkg; Pkg.instantiate(); '
```
Each Pluto notebook contains its own Project.toml file embedded in the notebook.  Starting with Lab 4, I've created a script to  setup all the dependencies for each notebook outside of the JupyterLab environment.  You can run those by running 
```shell
cd REPO_DIR
cd deps ; julia --project=.. build.jl ; cd ..
```
---
## Open Pluto notebook

- Go back to the browser tab with your Jupyter Lab server running.
- If you do not see the a tile for Pluto, then go to _File.NewLauncher_.
- Most labs will contain one or more Pluto notebooks (their file names will end in .jl).  To open one in Pluto,
   + Click the Pluto tile.  A new tab will open in your browser for the Pluto session.
   + In the box labeled "Open from file" or "Open a notebook" (depending on Pluto version), type the path to the directory containing the repo, a forward slash and the name of the first notebook (e.g., 'lab1-yourgithubid/ex1.jl').  Tab completion is often helpful.
   + Click "Run notebook code" in the upper right.
- Do your work in the notebook.
- When you're done with a notebook, make sure it is saved (Ctrl+S) and close the tab.

---
## Commit your changes
Ideally, you'd commit small changes as you go.  I'd strongly suggest that you [commit your changes](../commit) each time you are wrapping up a coding session or about to take a break.  At a minimum, [commit your changes](../commit) before submitting your assignment.
