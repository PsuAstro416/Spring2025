~~~
<!-- PlutoStaticHTML.Begin -->
<!--
    # This information is used for caching.
    [PlutoStaticHTML.State]
    input_sha = "0e7e8f9c4d55e60d5f061784d38ce0bb77973057a37bbe3be61eed491eab4959"
    julia_version = "1.11.5"
-->







<div class="markdown"><h4>Data Science Applications for Astronomy</h4><h1>Week 15: Course Reflections:</h1><h4>Putting the Pieces Together</h4></div>


<div class="markdown"><h1>Looking back</h1></div>


<div class="markdown"><h1>Course Overview</h1><p>Students will build practical data science skills (e.g., querying astronomical databases, data storage and manipulation, data visualization, exploratory and explanatory data analysis, Bayesian modeling workflows, and reproducible research practices) and apply these lessons to analyzing data from astronomical surveys.</p><h2>Goals</h2><ul><li><p>Increase their data acumen<a class="footnote" href="#footnote-data_acumen">[data_acumen]</a>, and</p></li><li><p>Appreciate how building data science skills can benefit astronomy &amp; astrophysics research.</p></li></ul></div>


<div class="markdown"><div class="footnote" id="footnote-data_acumen"><p class="footnote-title">data_acumen</p><p>"We define data acumen as the ability to make good judgements about the use of data to support problem solutions." (Keller et al. 2020)</p></div></div>


<div class="markdown"><h2>Objectives</h2><ul><li><p>Ingest and manipulate data from astronomical surveys.</p></li><li><p>Build, apply, assess and update astrophysically motivated models for astronomical observations.</p></li><li><p>Create visualizations for exploratory and explanatory data analyses of observations from astronomical surveys.</p></li><li><p>Synthesize the above into a dashboard to support the efficient analysis of astronomical observations.</p></li><li><p>Incorporate principles of reproducible research into their class project.</p></li></ul></div>


<div class="markdown"><h2>What Data Science skills have we developed?</h2></div>


<div class="markdown"><ul><li><p>Data Acumen</p></li><li><p>Databases, queries &amp; storage </p></li><li><p>Ingesting data &amp; Data wrangling</p></li><li><p>Exploratory data analysis</p></li><li><p>Model building &amp; assessment</p></li><li><p>Explanatory data analysis</p></li><li><p>Data visualization</p></li><li><p>Reproducible research</p></li><li><p>Scientific workflows</p></li><li><p>Technical collaboration (if teamed up for project)</p></li><li><p>Scientific communications</p></li></ul></div>


<div class="markdown"><h2>What Data Science skills have we skipped <br/> (or only skimmed the surface of)?</h2><ul><li><p>Probability &amp; Statistics</p></li><li><p>Machine Learning (ML)</p><ul><li><p>Non-parametric regression</p></li><li><p>Classification</p></li><li><p>Clustering</p></li><li><p>Density estimation</p></li><li><p>Anomaly detection</p></li><li><p>Image analysis</p></li></ul></li><li><p>Artificial Intelligence (AI)</p><ul><li><p>Deep learning</p></li></ul></li><li><p>Computing</p><ul><li><p>Data structures</p></li><li><p>Algorithms</p></li><li><p>Databases</p></li><li><p>Parallel computing</p></li></ul></li><li><p>Applications</p><ul><li><p>Hardware</p></li><li><p>Big Data frameworks</p></li><li><p>ML/AI tools</p></li><li><p>Software engineering</p></li><li><p>Deployment &amp; operations</p></li></ul></li></ul></div>


<div class="markdown"><h1>Looking forward</h1></div>


<div class="markdown"><h2>Foundational Classes to learn more about Data Sciences</h2><h4>Mathematics</h4><ul><li><p><strong>Linear Algebra</strong> (MATH 220)</p></li><li><p><strong>Probability</strong></p><ul><li><p>Elementary Probability (STAT 318)</p></li><li><p>Probability Theory (STAT/MATH 414)</p></li><li><p>Introduction to Probability and Stochastic Processes for Engineering (STAT/MATH 418)</p></li><li><p>Astrostatistics (ASTRO 415)</p></li></ul></li></ul><h4>Programming</h4><ul><li><p>Intro to Programming (e.g., CMPSC 121, 122)</p></li><li><p>Data management/databases (DS 220, but one DS or CMPSC preqreq beyond CMPSC 122)</p></li><li><p>Programming Models for Big Data (DS/CMPSC 410, but several CMPSC prereqs)</p></li><li><p>Information Retrieval and Organization (e.g., IST 441, but several IST prereqs)</p></li></ul><h4>Machine Learning/AI</h4><ul><li><p><strong>Machine Learning</strong> (DS 310; prereqs: (CMPSC 121 or CMPSC 131) and (STAT/MATH 318 or STAT/MATH 414 or STAT/MATH 418))</p></li><li><p>AI (e.g., DS/CMPSC 442, but several CMPSC prereqs)</p></li></ul></div>


<div class="markdown"><h2>Applied classes that connect to Data Sciences</h2><ul><li><p>Astrostatistics (ASTRO 415, Spring 2023)</p></li><li><p>Computational Astrophysics (ASTRO/PHYS 410, Spring 2023)</p></li><li><p>Astronomical Techniques? (ASTRO 451, Fall 2022)</p></li><li><p>Data Science Through Statistical Reasoning and Computation (STAT 380; but prereq STAT 184)</p></li><li><p>Visual Analytics for Data Sciences (DS 330; but prereq DS 220)</p></li><li><p>Research projects (e.g., ASTRO 496, summer project or thesis)</p></li></ul></div>


<div class="markdown"><h2>Project-based learning</h2><p>Pros:  </p><ul><li><p>Help to motivate why need to learn things</p></li><li><p>Emphasize practical problems</p></li></ul><p>Cons: </p><ul><li><p>Forces you to work through implementation details</p></li><li><p>Risk learning specific tools, rather than underlying mathematics/algorithms</p></li><li><p>Specific tools used are very likely certainly become obsolete soon</p></li></ul></div>


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