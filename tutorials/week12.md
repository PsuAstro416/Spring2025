~~~
<!-- PlutoStaticHTML.Begin -->
<!--
    # This information is used for caching.
    [PlutoStaticHTML.State]
    input_sha = "e5c7ce13d567b56e64f6d4fe5c2b7361ef1a8a7ca1da4f4f5e35f0b9b7c3d6f1"
    julia_version = "1.11.5"
-->







<div class="markdown"><h4>Data Science Applications for Astronomy</h4><h1>Week 12: Data Lifecycle:</h1><h4>Data Science Workflow</h4></div>


<div class="markdown"><h1>Data Science Lifecycle</h1></div>


<div class="markdown"><h2>Example of a Data Science Lifecycle</h2><p>(This is just one of many.)</p><ol><li><p>Ask an interesting question</p><ul><li><p>What is the scientific goal?</p></li><li><p>What would you do if you had all the data?</p></li><li><p>What do you want to predict or estimate?</p></li></ul></li><li><p>Get the data</p><ul><li><p>How were the data sampled?</p></li><li><p>Which data are relevant?</p></li><li><p>Are there privacy issues?</p></li></ul></li><li><p>Explore the data</p><ul><li><p>Plot the data.</p></li><li><p>Are there anomalies?</p></li><li><p>Are there patterns?</p></li></ul></li><li><p>Model the data</p><ul><li><p>Build a model.</p></li><li><p>Fit the model.</p></li><li><p>Validate the model.</p></li></ul></li><li><p>Communicate and visualize the results</p><ul><li><p>What did we learn?</p></li><li><p>Do the results make sense?</p></li><li><p>Can we tell a story?</p></li></ul></li></ol><p>–- Blitzstein &amp; Pfister for <a href="https://cs109.github.io/2015/">Harvard CS109</a></p></div>


<div class="markdown"><h4>What's missing?</h4></div>


<div class="markdown"><div class="admonition is-hint"><header class="admonition-header">Hint</header><div class="admonition-body"><ul><li><p>Making iterative process/loops explicit</p></li><li><p>Interpreting results for oneself</p></li><li><p>Deploying model to work for future data</p></li></ul></div></div></div>


<div class="markdown"><h3>Some workflows common in industry</h3><h4>OSEMN (pronounced <em>awesome</em>)</h4><ul><li><p>Obtain</p></li><li><p>Scrub</p></li><li><p>Explore</p></li><li><p>Model</p></li><li><p>iNterpret</p></li></ul><h4>CRoss-Industry Standard Process for Data Mining (CRISP-DM)</h4><ul><li><p>Business Understanding</p></li><li><p>Data Understanding</p></li><li><p>Data Preparation</p></li><li><p>Modeling</p></li><li><p>Evaluation</p></li><li><p>Deployment</p></li></ul><p>Emphasizes loops and deployment</p><h3><a href="https://scrumguides.org/scrum-guide.html">SCRUM</a></h3><p>Three pillars:</p><ul><li><p>Transparency: Make emergent work visible.</p></li><li><p>Inspection: Look out for variances.</p></li><li><p>Adaption: Adapt your processes to minimize adverse variances and maximize beneficial opportunities.</p></li></ul><p>SCRUM build on <strong>sprints</strong>: Divide the larger project into a series of <strong>sprints</strong>, each consisting of:</p><ul><li><p>Sprint Planning</p></li><li><p>Daily Scrum (Standup)</p></li><li><p>Sprint Review: </p></li><li><p>Sprint Retrospective</p></li></ul><h4>Team Data Science Process (TDSP)</h4><p>Combines a workflow with project templates and recommendations for infrastructure and tools.  Favors MS products.</p></div>


<div class="markdown"><h4>Domino’s data science life cycle is founded on three guiding principles</h4><p>that emphasizes frequest iteration, collaboration and reproducibility.</p><ol><li><p>Ideation</p></li><li><p>Data Acquisition and Exploration</p></li><li><p>Research &amp; Development</p></li><li><p>Validation</p></li><li><p>Delivery</p></li><li><p>Monitoring</p></li></ol></div>


<div class="markdown"><h2>Adapting Data Science Workflows from Industry to Scientific Setting</h2><ul><li><p>Reinterpret terms like "business case" and "customer"</p></li><li><p>Often don't know to quantify success when we start a project</p></li><li><p>Generally, place more value on interpretability </p></li><li><p>Can accommodate projects requiring longer timescales</p></li><li><p>Increasingly, plan to make data &amp; codes public</p></li><li><p>In academia communication is often primarily with other scientists</p></li></ul></div>





<div class="markdown"><h1>Collaborating</h1></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>How do you currently collaborate on projects requiring coding?</p></div></div></div>


<div class="markdown"><h2>Asynchronous</h2><ul><li><p>Write separate files/functions/modules</p></li><li><p>Maintain independent repositories</p></li><li><p>Merge changes via git</p></li><li><p>Create branches for new features, so main branch is always usable</p></li></ul><h2>Synchronous</h2><ul><li><p>Like asynchronous, but ask questions as you go</p></li><li><p>Pair Coding: Driver &amp; Navigator</p></li><li><p>Debugging: Explainer &amp; Audience</p></li><li><p>Beware of using shared filesystem</p></li></ul></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>What tools do you use for collaborating on coding projects?</p></div></div></div>


<div class="markdown"><h2>Tools</h2><ul><li><p>Merging updates: Git</p></li><li><p>Sharing screen: Zoom, Teams, Virtual Desktop</p></li><li><p>Collaborative coding:  <a href="https://www.julia-vscode.org/docs/stable/userguide/remote/">VS Code</a>/<a href="https://vscodium.com/">VS Codium</a>,  <a href="https://colab.research.google.com/">Google Colab</a>, <a href="https://juliahub.com/https://juliahub.com/">Julia Hub</a>, <a href="https://replit.com/">Repl.it</a>,...</p></li><li><p>Collaborative writing:  <a href="https://overleaf.com/">Overleaf</a>, <a href="http://docs.google.com/">Google Docs</a>, <a href="https://office365.psu.edu/">MS Office 365</a>, ...</p></li></ul></div>


<div class="markdown"><h1>Q&amp;A</h1></div>


<div class="markdown"><h2>Project</h2></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>Should the presentation be more focused on a demo of the dashboard or on detailed explanations of the fitting equations/models?</p></div></div></div>


<div class="markdown"><h4>Presentation Rubric</h4><ul><li><p>Clarity of explanation of purpose of the dashboard and data set(s) used (1 point)</p></li><li><p>Clarity of explanation of the models fit to data and their motivation (1 point)</p></li><li><p>Effective demonstration of the dashboard in action (1 point)</p></li><li><p>Clarity of explanation of how dashboard performs model assessment and of any potential failure modes that are not reliably recognized by the dashboard (1 point)</p></li><li><p>Thoughtful discussion of challenges encountered during project and lessons learned (1 point)</p></li></ul></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>When is the individual write up due?</p></div></div></div>


<div class="markdown"><ul><li><p>April 21 (Dashboard itself)</p></li><li><p>May 2 (Report &amp; Reflection)</p></li></ul></div>


<div class="markdown"><h4>Report/Reflection Rubric</h4><ul><li><p>their contributions to the dashboard project and the contributions of their teammates (1 point),</p></li><li><p>what the next steps would be if there were more time to make improvements to the dashboard (1 point),</p></li><li><p>reflecting on what they learned from the experience (2 points),</p></li><li><p>offering any suggestions for how to make a similar project more valuable in future semesters (1 point), and</p></li><li><p>offering any suggestions for how to make the course more valuable in future semesters (optional, 0 points).</p></li></ul></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>I would love a small rundown of the best packages you reccommend [for interactivity].</p></div></div></div>


<div class="markdown"><ul><li><p><a href="https://featured.plutojl.org/basic/plutoui.jl">PlutoUI.jl</a></p></li><li><p><a href="https://github.com/JuliaPluto/PlutoPlotly.jl">PlutoPlotly.jl</a></p></li><li><p><a href="https://juliapluto.github.io/PlutoTeachingTools.jl/example.html">PlutoTeachingTools.jl</a>:  Formatting like labs</p></li></ul></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>What are some ways that we can make them look cleaner and more user friendly</p></div></div></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>What is a good process for trying to speed up code run time?</p></div></div></div>


<div class="markdown"><h2>Big picture steps to efficiency:</h2><ul><li><p>Use a compiled language</p></li><li><p>Use a strongly-typed language</p></li><li><p>Choose of algorithms wisely</p></li><li><p>Choose data types wisely</p></li><li><p>Avoid unnecessary memory allocations</p></li><li><p>Arrange memory accesses to reduce cache misses</p></li></ul></div>


<div class="markdown"><h2>Implementation details for code efficiency (assuming JIT language like Julia or JAX)</h2><ul><li><p>Organize code into small functions</p></li><li><p>Avoid type instability</p><ul><li><p>Untyped global variables</p></li><li><p>Containers (e.g., arrays) of abstract types</p></li><li><p>struct's with abstract types</p></li></ul></li><li><p>Avoid unnecessary memory allocations</p><ul><li><p>Not taking advantage of fusing and broadcasting</p></li><li><p>Making copies instead of using a view (<code>array[1:5,:] instead of view(array,1:5,:)</code>)</p></li><li><p>Many small allocations on heap (instead use StaticArrays.jl)</p></li></ul></li><li><p>Organize functions into a package (so it only needs to be precompiled once)</p></li><li><p>Adding annotations that allow for compiler optimizations (e.g., @inbounds, @fastmath, @simd, @turbo) but only when appropriate</p></li><li><p>Avoid unnecessary use of strings or string interpolation</p></li><li><p>Write code so that it can be parallelized in the future </p></li><li><p>See <a href="https://docs.julialang.org/en/v1/manual/performance-tips/">Performance Tips</a> for more details.</p></li></ul></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>Is there a good way to verify the effectiveness of a classification model aside from checking which points it identifies correctly?</p></div></div></div>


<div class="markdown"><h4>Random</h4></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>Does Scrum stand for anything?</p></div></div></div>


<div class="markdown"><p>No</p></div>


<div class="markdown"><h1>Setup</h1></div>





<input id="width-over-livedocs" name="width-over-livedocs" onclick="window.plutoOptIns.toggle_width(this)" type="checkbox"/>
<label for="width-over-livedocs">
	Full Width Mode
</label>
<style>
	body.width-over-docs #helpbox-wrapper {
    	display: none !important;
	}
	body.width-over-docs main {
               max-width: none !important;
               margin: 0 !important;
	       # max-width: calc(100% - 4rem);
               # margin-right: 2rem;
	}
</style>
<script>
	const toggle_width = function(t) {
		t.checked
		? document.body.classList.add("width-over-docs")
		: document.body.classList.remove("width-over-docs") }
	window.plutoOptIns = window.plutoOptIns || {}
	window.plutoOptIns.toggle_width = toggle_width
	
</script>






<div class='manifest-versions'>
<p>Built with Julia 1.11.5 and</p>
DataFrames 1.7.0<br>
HypertextLiteral 0.9.5<br>
PlutoTeachingTools 0.3.1<br>
PlutoUI 0.7.61
</div>

<!-- PlutoStaticHTML.End -->
~~~