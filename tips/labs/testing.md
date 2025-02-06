+++
title = "Testing your labs"
+++

<a id="run-tests"></a>
### Test your code

- Make sure you've saved all your changes (Ctrl+S)
- Make sure you've [committed your changes to your local repository](../commit).
- Check that your code passes any tests embedded in each notebook as you go.  
- Some labs include a set of (often very simple) tests.  If there is a test subdirectory in the lab, then you can run these either for one lab at a time or for To test a single exercise, you can use a terminal window, change into your repo directory, and run
```julia
julia --project=test test/runtests.jl
```

<!-- 
- Once you've pushed your changes, it's also good to double check that your lab passes the same test via the continuous integration testing provided by GitHub actions.
-->

- If you get an error message about packages not being installed, then run
```julia
julia --project=test -e 'using Pkg; Pkg.instantiate(); '
```
to make sure all the packages specified in test/Project.toml are installed before running your tests.

<!-- in a separate test notebook like test_myself.ipynb:

```julia
using NBInclude
@nbinclude("exercise1.ipynb")
include("test/test1.jl")
```
- If using a Jupyer notebook, if you make changes and retest, then restart the kernel for the test notebook to be sure there aren't unintended carryover effects.
- Once you think you're done, you are encouraged to test your full repository even more similarly to how it will be tested by the continuous integration testing by opening a terminal window and running `julia test/runtests.jl`
-->
