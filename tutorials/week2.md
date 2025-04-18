~~~
<!-- PlutoStaticHTML.Begin -->
<!--
    # This information is used for caching.
    [PlutoStaticHTML.State]
    input_sha = "65be2f1cf3e20815c75968a7f53a4f2a5a8a6d9b5edf2bf9267e9d43f5dff77e"
    julia_version = "1.11.5"
-->







<div class="markdown"><h4>Data Science Applications to Astronomy</h4><h1>Week 2: Exploratory Data Analysis</h1></div>


<div class="markdown"><h1>Exploratory Data Analysis</h1><h2>Overview</h2><ol><li><p>Choose data to explore </p></li><li><p>Ingest data</p></li><li><p>Validate data</p></li><li><p>Clean data</p></li><li><p>Describe/Visualize data</p></li><li><p>Identify potential relationships in data</p></li><li><p>Make a plan for investigating potential relationships quantiatively</p></li></ol></div>


<div class="markdown"><h2>Choose data to Explore</h2><h3>Classical Astronomy approach:</h3><ol><li><p>Idenitfy a scientific problem</p></li><li><p>Decide what data is needed</p></li><li><p>Request telescope time</p></li><li><p>Keep revising and resubmitting until your proposal is selected</p></li><li><p>Conduct observations</p></li><li><p>Ingest data you collect</p></li></ol><h2>Can you think of another approach to astronomy research?</h2><ul><li><p>pause</p></li></ul><h2>Other styles of Astronomy Research</h2><h3>Classical archival science approach:</h3><ol><li><p>Idenitfy a scientific problem</p></li><li><p>Decide what data is needed</p></li><li><p>Learn about/query multiple surveys/datasets that might have data to address your question. </p></li><li><p>Prioritize which to consider first</p></li><li><p>Query archive(s) to ingest data others collected.</p></li></ol><h3>Survey-science key-project approach:</h3><ol><li><p>Idenitfy a scientific problem</p></li><li><p>Decide what data is needed</p></li><li><p>Obtain funding</p></li><li><p>Build observatory, telescope, detector, software pipeline, archive, etc. to meet your specifications</p></li><li><p>Conduct survey (observations, calibration, data reduction, archiving, etc.)</p></li><li><p>Query database(s) to ingest data from survey</p></li><li><p>Release data to public</p></li></ol><h3>Survey-science ancillary science approach:</h3><ol><li><p>Identify exciting dataset(s)</p></li><li><p>Learn about how they were collected, limitations, uncertainties, biases, etc.</p></li><li><p>Decide if they has the potential to addres your science question</p></li><li><p>Query database(s) to ingest data being collected for other reasons</p></li></ol><h3>Many variations</h3><ul><li><p>Spectrum of approaches for how to identify questions/datasets</p></li><li><p>Combine survey, archival and targeted approaches to address a common question.</p></li></ul></div>


<div class="markdown"><h1>Stages of Exploratory Data Analysis</h1><h2>Ingest Data</h2><ul><li><p>Construct a query</p></li><li><p>Download the results of that query</p></li><li><p>Store the data locally</p></li><li><p>Read the data into memory.</p></li></ul></div>


<div class="markdown"><div class="admonition is-tip"><header class="admonition-header">Tip</header><div class="admonition-body"><p><strong>Options for storing/organizing your data</strong></p><ul><li><p>Vectors, Matrices and higher-dimensional arrays</p><ul><li><p>Storing many entries (e.g., targets, observation times) that are of the same type and have similar meaning that you'll want to keep together. </p></li></ul></li><li><p>DataFrames &amp; Tables: </p><ul><li><p>Store multiple types of data for a common set of entries (i.e., same length).</p></li><li><p>Allow efficiently adding/removing columns of data during your analysis.</p></li><li><p>Reduce risk of bookkeeping errors when </p></li></ul></li><li><p>Databases </p><ul><li><p>Contain multiple tables/dataframes of different lengths</p></li></ul></li></ul></div><ul><li><p>Vectors, Matrices and higher-dimensional arrays</p><ul><li><p>Storing many entries (e.g., targets, observation times) that are of the same type and have similar meaning that you'll want to keep together. </p></li></ul></li><li><p>DataFrames &amp; Tables: </p><ul><li><p>Store multiple types of data for a common set of entries (i.e., same length).</p></li><li><p>Allow efficiently adding/removing columns of data during your analysis.</p></li><li><p>Reduce risk of bookkeeping errors when </p></li></ul></li><li><p>Databases </p><ul><li><p>Contain multiple tables/dataframes of different lengths</p></li></ul></li></ul></div></div>


<div class="markdown"><h2>Validate Data</h2><ul><li><p>What is the size and shape of the data?</p></li><li><p>What are the types of data?</p></li><li><p>What are the ranges of values?</p></li><li><p>Is there missing data?</p></li><li><p>Check if a representative subset of the data is consistent with expectations.</p></li><li><p>Are some entries suspiciously discrepant from expectations/other data?</p></li><li><p>What is the approximate empirical distribution of value?</p></li><li><p>Are values self-consistent?</p></li></ul></div>


<div class="markdown"><h2>Clean Data</h2><p>Are some data values:</p><ul><li><p>missing?</p></li><li><p>clearly erroneous? </p></li><li><p>susipicously discrepant from expectations?</p></li><li><p>susipicously discrepant from other data?</p></li></ul></div>


<div class="markdown"><div class="admonition is-tip"><header class="admonition-header">Tip</header><div class="admonition-body"><p><strong>Any large dataset is likely to have some suspicious data!</strong></p><ul><li><p>Could these issues affect my analysis?</p></li><li><p>Could these values interfere even exploratory data analysis?</p></li><li><p>Should I try to understand my data source better before I proceed?</p></li><li><p>Should I fix the issues now or proceed with caution?</p><ul><li><p>80%/20% rule</p></li></ul></li><li><p>If proceeding, how will I make sure that I (and my team) don't forget these concerns?</p></li></ul></div><ul><li><p>Could these issues affect my analysis?</p></li><li><p>Could these values interfere even exploratory data analysis?</p></li><li><p>Should I try to understand my data source better before I proceed?</p></li><li><p>Should I fix the issues now or proceed with caution?</p><ul><li><p>80%/20% rule</p></li></ul></li><li><p>If proceeding, how will I make sure that I (and my team) don't forget these concerns?</p></li></ul></div></div>


<div class="markdown"><h2>Describe/Visualize Data</h2><ul><li><p>Location: mean, median, mode</p></li><li><p>Scale: standard deviation, quantiles, bounds</p></li><li><p>Higher-order moments:  skewness, kurtosis, behavior of tails</p></li><li><p>Transformations </p><ul><li><p>Linear transformations (shift, scale, rotate)</p></li><li><p>Non-linear transformations for visualization (e.g., log, sqrt)</p></li><li><p>Power transforms to standardize distributions (e.g., Box-Cox transform)  </p></li></ul></li><li><p>Ohter strategies</p><ul><li><p>Clamping data to limit effects of outliers</p></li><li><p>Imputing missing data to allow for fast exploratory analysis</p></li></ul></li><li><p>Statistical tests</p><ul><li><p>Test for normality</p></li></ul></li></ul></div>


<div class="markdown"><div class="admonition is-tip"><header class="admonition-header">Tip</header><div class="admonition-body"><ul><li><p>Do you see the qualitative patterns that you're expecting?</p></li><li><p>Are there additional patterns that you didn't anticipate?</p></li><li><p>Do you really understand the data you're about to analyze?</p></li></ul></div></div></div>


<div class="markdown"><h2>Identify potential relationships in Data</h2><p>Look for relationships between values:</p><ul><li><p>For each object</p></li><li><p>Across objects</p></li><li><p>In space</p></li><li><p>In time</p></li></ul><h3>Statistics</h3><ul><li><p>Correlation coefficients</p></li><li><p>Rank correlation coefficient</p></li><li><p>Dangers of statistics</p></li></ul><h3>Visualizations</h3><ul><li><p>Scatter plot </p></li><li><p>2-d histograms or density estimates</p></li><li><p>Limitations of visualizations</p></li></ul></div>


<div class="markdown"><h2>Make a Plan</h2><ul><li><p>Is this question/dataset combination worthy of more of my time?</p></li><li><p>Should I consider combining with other dataset(s) to fill gaps?</p></li><li><p>What needs to done before begining quantiative analysis?</p></li><li><p>What apparent relationships should be evaluted quantiatively?</p></li><li><p>What potential concerns should be kept in mind? </p></li></ul></div>


<div class="markdown"><h1>Big Data</h1><ul><li><p>What counts as "big"?</p></li></ul><h2>What are examples of “Big Data” in Astronomy?</h2><ul><li><p>pause for ideas from class</p></li></ul><h2>Forms of “Big Data” in Astronomy</h2><ul><li><p>Many observations of your target</p><ul><li><p>(e.g., flux measured every minute for years)</p></li></ul></li><li><p>Many targets in your survey</p><ul><li><p>(e.g., 5 band photometry of <span class="tex">\(\sim10^7\)</span> galaxies)</p></li></ul></li><li><p>Many types of measurement for each target</p><ul><li><p>(e.g., modest number of spectra)</p></li></ul></li><li><p>Computationally expensive physical model</p><ul><li><p>(e.g., CMB, cosmic structure)</p></li></ul></li><li><p>Many parameters in models</p><ul><li><p>(e.g., neural network)</p></li></ul></li></ul></div>


<div class="markdown"><h3>Finding Middle Ground</h3><p>This course aims to prepare you to combine the power of:</p><ul><li><p>Astronomical surveys</p></li><li><p>Astrophysical knowledge, and</p></li><li><p>Modern data science tools</p></li></ul></div>


<div class="markdown"><h1>Questions</h1></div>


<div class="markdown"><h3>Git</h3></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>I understand that <code>git commit</code> is a type of save command, but does it save locally to my computer? Or in some sort of “middle-ground” computer space? Or does it send it to github to store without publishing until git push is used?</p></div></div></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>What exactly is a local repository? </p></div></div></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>What is the difference between saving to a local repository and pushing to github? </p></div></div></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>Why are there two separate terminal commands to commit and push to GitHub? I don't quite understand the nuances between them.</p></div></div></div>


<div class="markdown"><h3>Julia</h3></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>Why was Julia in particular chosen as the language for this class?</p></div></div></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>In python, I can look up functions that are part of libraries pretty easily - there are websites dedicated to numpy, matplotlib, etc.. Does this same thing exist with Julia libraries or is it a little more underground?python, I can look up functions that are part of libraries pretty easily - there are websites dedicated to numpy, matplotlib, etc.. Does this same thing exist with Julia libraries or is it a little more underground?</p></div></div></div>


<div class="markdown"><h3>Julia Resources</h3><ul><li><p><a href="http://docs.julialang.org/en/v1/">Julia Manual</a></p></li><li><p><a href="https://benlauwens.github.io/ThinkJulia.jl/latest/book.html">Think Julia</a> (Lauwens &amp; Downey; online version available for free)</p></li><li><p><a href="https://learnxinyminutes.com/docs/julia/">Learn Julia in Y Minutes</a></p></li><li><p><a href="https://cheatsheet.juliadocs.org/">The Fasttrack to Julia</a></p></li><li><p><a href="https://cheatsheets.quantecon.org/">Julia&lt;-&gt;Python&lt;-&gt;Matlap Cheatsheet</a></p></li><li><p><a href="https://discourse.julialang.org/">Julia Language Discourse</a></p></li><li><p><a href="https://julialang.org/slack/">The Julia Language Slack</a></p></li></ul></div>


<div class="markdown"><p>Now there's also an AI package (<a href="AIHelpMe.jl">https://github.com/svilupp/AIHelpMe.jl</a>) trained on Julia manual and Discourse content</p><ul><li><p>Can access without installing via <a href="https://juliahub.com/ui/Home">JuliaHub</a></p></li><li><p>But first need to create an account there</p></li><li><p>Or can install and add an API key from a LLM provider (see <a href="README">https://github.com/svilupp/AIHelpMe.jl</a> for details)</p></li><li><p>Or can setup your own local LLM server (e.g., <a href="https://ollama.com/">Ollama</a>), but this is only for the brave/people with time to mess around</p></li></ul></div>


<div class="nice-blockquote nice-blockquote__bordered nice-blockquote--quoted"><p class="nice-blockquote__text"></p><div class="markdown"><p>Please read the lists of goals and objectives from students in the attached document, Astro 416 Lab 1 Goals.docx .  Then summarize the most common goals.</p></div><p></p><div class="nice-blockquote__text nice-blockquote__text--author"></div></div>
<style> 
.nice-blockquote{
padding: 25px;
background: light grey;
border: 0.5px solid #ccc;
color: black;
box-sizing:border-box;
overflow-y:hidden;
}
.nice-blockquote__bordered{
border-left-width: 14px;
}
.nice-blockquote--quoted::before{
content:open-quote;
font-size:70px;
font-family: Arial;
font-weight:bold;
color:#ccc;
display:block;
margin-top:-20px;
margin-bottom:-40px;
font-family: Arial;
}
.nice-blockquote__text{
font-family: Arial;
font-style: italic;
fontsize: 1.5em;	
margin:0;
line height: 1.5;
text-align:left;
}
.nice-blockquote__text:not(:last_child){
margin-bottom:10px;
}
.nice-blockquote__text--author{
font-weight:bold;
font-style: normal;
text-align:right;
fontsize: 2em;
}
.nice-blockquote__text--author::before{
content:close-quote;
font-size:70px;
font-family: Arial;
font-weight:bold;
color:#ccc;
display:block;
margin-top:-28px;
margin-bottom:-40px;
}
</style>


<div class="markdown"><p>I reviewed the goals and objectives listed by students in the document. Here are the most common goals:</p><h4>Learning Data Science Techniques:</h4><p>Many students aim to develop strong foundational skills in data science, including methodologies and techniques commonly used in the field.</p><h4>Programming Proficiency:</h4><p>A significant number of students want to become proficient in programming languages such as Julia and Python, and improve their coding skills.</p><h4>GitHub and Version Control:</h4><p>Several students mentioned the goal of becoming more familiar with GitHub, learning its commands, and using it effectively for version control.</p><h4>Data Handling and Analysis:</h4><p>Students expressed a desire to handle large datasets, improve data modeling skills, and apply statistical tests for data analysis.</p><h4>Visualization and Presentation:</h4><p>Improving the ability to create effective data visualizations and making plots that are clear and compelling is a common objective.</p><h4>Application to Research:</h4><p>Many students want to apply the skills learned in the course to their own research projects, bridging the gap between coursework and practical applications.</p><h4>Efficiency and Best Practices:</h4><p>Goals include learning best practices for data documentation, reproducible research, and writing cleaner, more efficient code.</p><h4>Confidence and Independence:</h4><p>Increasing confidence in coding, especially in new languages, and learning to solve problems independently were also frequently mentioned.</p><p>These goals reflect a strong focus on practical skills and their application in both academic and professional contexts. Is there anything specific you would like to delve deeper into?</p></div>


<div class="markdown"><h3>Lab</h3></div>


<div class="markdown"><h2>What’s hard about Big Data?</h2><ul><li><p>Pause for input from class</p></li></ul><h2>Examples of challenges applying Big Data to Astronomy</h2><h3>Domain Scientist (e.g., Astronomer):</h3><ul><li><p>Collecting large &amp; high-quality dataset</p></li><li><p>Understanding what processes affect data significantly</p></li></ul><h3>Computer Scientist/IT Professional:</h3><ul><li><p>Storing large volume of data</p></li><li><p>Accessing data efficiently</p></li><li><p>Computing resources to process large dataset</p></li><li><p>Harnessing modern computing capabilities</p></li></ul><h3>Statistician/Data Scientist:</h3><ul><li><p>Usually, simple model are not adequate.</p></li><li><p>Correlation does not imply causation (even if it could have been used for prediction)</p></li><li><p>Is training data representative of production data?</p></li><li><p>Many model parameters</p></li><li><p>Potential sensitivity of results to choices for prior, regularization, features, loss function, etc.</p></li></ul><h3>Everyone:</h3><ul><li><p>Data-driven models can be hard to interpret (&amp; explain)</p></li><li><p>Communicating results (and their limitations)</p></li><li><p>Rapidly evolving toolkits</p></li></ul></div>


<div class="markdown"><h1>Setup &amp; Helper Code</h1></div>


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
PlutoTeachingTools 0.3.1<br>
PlutoUI 0.7.60
</div>

<!-- PlutoStaticHTML.End -->
~~~