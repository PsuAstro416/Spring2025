~~~
<!-- PlutoStaticHTML.Begin -->
<!--
    # This information is used for caching.
    [PlutoStaticHTML.State]
    input_sha = "eb3f9c8dfed5275e649a58916e5df0cb37ee4d2cc9c9a3a1bcb87bf5d4f09db0"
    julia_version = "1.11.4"
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
<p>Built with Julia 1.11.4 and</p>
DataFrames 1.7.0<br>
HypertextLiteral 0.9.5<br>
PlutoTeachingTools 0.3.1<br>
PlutoUI 0.7.61
</div>

<!-- PlutoStaticHTML.End -->
~~~