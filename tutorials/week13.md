~~~
<!-- PlutoStaticHTML.Begin -->
<!--
    # This information is used for caching.
    [PlutoStaticHTML.State]
    input_sha = "5bb8aa83eed8059745ccf404a26b4b5c73946cdea6c7ded2d5a5e1f22f4bf1b6"
    julia_version = "1.11.5"
-->







<div class="markdown"><h4>Data Science Applications for Astronomy</h4><h1>Week 13: Reproducible Research:</h1><h4></h4></div>








<div class="markdown"><h2>What should we expect of science?</h2><ul><li><p>Reproducible</p></li><li><p>Replicable</p></li><li><p>Valid</p></li></ul><p>Historically, different fields of science have used these terms in different ways.   As their importance became more widely recognized, the National Academies produced a <a href="https://www.nationalacademies.org/our-work/reproducibility-and-replicability-in-science">report</a> that attempts to standardize language.  </p></div>


<div class="markdown"><h2>Reproduciblity</h2><blockquote><p>"obtaining consistent results using the same input data, computational steps, methods, and code, and conditions of analysis."</p><p>–- <a href="https://www.nationalacademies.org/our-work/reproducibility-and-replicability-in-science">Reproducibility &amp; Replicability in Science (2019)</a></p></blockquote><ul><li><p>Focuses on the reliability of the <strong>computations</strong> and their <strong>implementation</strong></p></li><li><p>If a study isn't reproducible, then there are likely errors that should be corrected.  </p></li><li><p>(Some subtleties in the context of stochastic algorithms)</p></li><li><p>Minimal requirement for a study to be trusted.</p></li></ul></div>


<div class="markdown"><h2>Replicablility</h2><blockquote><p>"obtaining consistent results across studies aimed at answering the same scientific question, each of which has obtained its own data” </p><p>–- <a href="https://www.nationalacademies.org/our-work/reproducibility-and-replicability-in-science">Reproducibility &amp; Replicability in Science (2019)</a></p></blockquote><ul><li><p>Robustness of a scientific conclusion...   given the researcher's choices (e.g., definition of sample, analysis method), but allowing for natural variations in data.</p></li><li><p>Even if a study isn't replicable, the results could still be of high-quality and the study could still be a valuable contribution to the scientific literature.  E.g., </p><ul><li><p>Collecting data is hard/expensive.  An initial study based on a small sample size may hint at a finding that is not supported once a larger dataset is collected.</p></li><li><p>If two studies initially appear to be in disagreement, then a detailed reading of their methods could help someone figure  out what choices led to the difference.</p></li></ul></li></ul></div>


<div class="markdown"><h2>Validity</h2><blockquote><p>"obtaining consistent results across studies aimed at answering the same scientific question, each of which has obtained its own data” </p><p>–- <a href="https://www.nationalacademies.org/our-work/reproducibility-and-replicability-in-science">Reproducibility &amp; Replicability in Science (2019)</a></p></blockquote><ul><li><p>Robustness of a scientific conclusion</p></li></ul></div>


<div class="markdown"><h3>Making research replicabile &amp; valid is very hard!</h3><blockquote><p>"when a researcher transparently reports a study and makes available the underlying digital artifacts, such as data and code, the results should be computationally reproducible.  In contrast, even when a study was rigorously conducted according to best practices, correctly analyzed, and transparently reported, it may fail to be replicated."</p><p>–- <a href="https://www.nationalacademies.org/our-work/reproducibility-and-replicability-in-science">Reproducibility &amp; Replicabilitiy in Science (2019)</a></p></blockquote></div>


<div class="markdown"><h2>Common Barriers to Reproducibility</h2><ul><li><p>Inadequate recordkeeping (e.g., failing to archive data &amp; metadata)</p></li><li><p>Availability of data &amp; metadata (e.g., not sharing data)</p></li><li><p>Obsolescence of data (e.g., glass plates, digital media, file formats,...)</p></li><li><p>Obsolescence of code (e.g., programs, libraries, compilers, OS,...)</p></li><li><p>Flaws in attempt to replicate (e.g., lack of expertise, failure to follow protocols)</p></li><li><p>Barriers in the culture of research:  resources &amp; incentives</p></li></ul></div>


<div class="markdown"><h3>How is astronomy doing?</h3><h4>Good</h4><ul><li><p>Federally funded observatories (and many larger private ones) have archives for their data. </p></li><li><p>Institutional &amp; discipline-specific services for archiving data products: </p><ul><li><p>ScholarSphere &amp; Data Comomons (Penn State)</p></li><li><p>Zenodo (CERN)</p></li><li><p>Dataverse (Harvard)</p></li><li><p>SciServer (JHU)</p></li></ul></li><li><p>FITS format around in 1970s and standardized since 1981.</p></li><li><p>Programming languages used for Data Science (e.g., Julia, Python, R) incorporate package managers</p></li><li><p>Funding agencies &amp; AAS journals increasingly encourage archiving data, providing and "data behind the figures".</p></li></ul><h4>Not-so-good</h4><ul><li><p>Smaller, private observatories less likely to have funding to archive data</p></li><li><p>Sharing and archiving of higher-level data products, metadata and documentation necessary to make use of them is largely dependent on effort/goodwill of individual research groups.</p></li><li><p>Large datasets often need performant file formats that have yet to prove their longevity (e.g., HDF5 became popular around ~2000) </p></li><li><p>Package managers are great when everything works smoothly, but can be painful when different dependancies have conflicting requirements.  </p><ul><li><p>Most packages are maintained by a single research group.  If one person is busy/graduates/changes fields, then packages not be maintaned.</p></li><li><p>Most computational R and Python rely on C/C++ or Fortran code underneath that rely on Makefiles that are customized for different architectures by hand.</p></li></ul></li><li><p>Making research reproducible takes serious time and funding.  When there are finite resources, difficult choices have to be made. </p></li></ul></div>


<div class="markdown"><h4>Challenges</h4><ul><li><p>When funding gets tight, following "best-practices" is often first thing to go.</p></li><li><p>Open-source software was built in culture of trust.  An environment of constant security threats discourages sharing.</p></li></ul></div>


<div class="markdown"><h2>Common Barriers to Replicability</h2><ul><li><p>Human error (typically unintentional)</p></li><li><p>Misuse of statistical methods</p></li><li><p>Publication bias</p></li><li><p>Inadequate experimental design</p></li><li><p>Inadequate reporting of study protocols</p></li><li><p>Incentive system that encourages "significant" results</p></li></ul></div>


<div class="markdown"><h3>Failure to Replicate can lead to Scientific Progress!</h3><ul><li><p>Different research groups can make different, reasonable choices</p></li><li><p>One (or more) choices affect results</p></li><li><p>Subsequent investigation identifies which choice(s) were responsible for the different outcomes</p></li><li><p>Only works if both groups precisely document their choices.</p></li></ul></div>


<div class="markdown"><h2>Who is reproducing &amp; replicating research?</h2><ul><li><p>Original investigator(s) reproducing their own results to convince themselves (most common)</p></li><li><p>Original investigator(s) reproducing their own results to convince others (e.g., collaborators, other scientists in the field, or industry/government), particularly if a result is highly surprising or has significant ramifications</p></li><li><p>Different investigators (potentially from same or different lab) may attempt to replicate a study using a data set they are collecting as a stepping stone in their research process.</p></li><li><p>Different investigators may try to build on a previous study, not succeed, and then decide to try to replicate the previous study to identify why they didn't succeed.</p></li><li><p><a href="https://web.sas.upenn.edu/adcollabproject/">"Adversarial Collaborations"</a> can be extremely effective.</p></li><li><p>Maybe no one.</p></li></ul></div>


<div class="markdown"><h3>Publication bias</h3><ul><li><p>Publishing practices varry substantially by field</p></li><li><p>Astronomy is unusual:</p><ul><li><p>Relatively few well-respected astronomy journals</p></li><li><p>Each of those has a high acceptance rate.</p></li><li><p>Sometime astronomer publish in multi-disciplinary journals (Nature, Science, Publication of Nataional Academies of Science) with a lower acceptance rate. </p></li></ul></li><li><p>Many other fields (e.g., biology, economics) have many repsected journals, most with low acceptance rates  </p></li></ul></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>How do difference in acceptance rates affect incentives and lead to publication biases?</p></div></div></div>


<div class="markdown"><h2>Strategies to make your work reproducible</h2><ul><li><p>Make input data publically available (when allowed &amp; ethical)</p></li><li><p>Use open-source software for analysis</p></li><li><p>Use package manager to completely specify languages, libraries &amp; packages used.</p></li><li><p>Provide <strong>container</strong></p></li><li><p>Version control source code and scripts</p></li><li><p>Publish results, tables &amp; figures that were generated by scripts </p></li><li><p>For complex calculations, use workflow management software</p></li><li><p>Make code used to generate results public</p></li><li><p>Archive code &amp; data</p></li><li><p>Provide sufficient documentation for others to reproduce calculations.</p></li><li><p>Encourage a team to replicate your results from the documentation you've provided.</p></li></ul></div>


<div class="markdown"><h2>Tools to automate workflows</h2><ul><li><p>Build tools: make, cmake</p></li><li><p>Package managers</p></li><li><p>Scientific workflows: <a href="https://snakemake.readthedocs.io/en/stable/">Snakemake</a>, Galaxy, Nextflow, BigDataScript, ...</p></li><li><p>Containers: <a href="https://www.docker.com/resources/what-container/#:~:text=A%20Docker%20container%20image%20is,tools%2C%20system%20libraries%20and%20settings.">Docker</a>, <a href="https://apptainer.org/">Apptainer</a>,... </p></li><li><p>Example scripts for code/data behind figures in AAS journals: <a href="https://luger.dev/showyourwork.html">Showyourwork</a></p></li></ul></div>


<div class="markdown"><h2>Dangers of Big Data</h2><ul><li><p>Multiple testing:  Perform many possible tests (explicitly or "by eye") and then report one that appears to be significant in isolation</p></li><li><p><span class="tex">\(p\)</span>-hacking:  "the practice of collecting, selecting, or analyzing data until a result of statistical significance is found"  (RRiS 2019)</p></li><li><p>Overfitting:  Over confidence in model performance, especially when applied to out-of-sample data</p></li><li><p>Machine learning models:  Overreliance on optimizing predictive performance using complex models, rather than prioritizing, interpretability and explainability</p></li></ul></div>


<div class="markdown"><h2>Other relevant terms:</h2><h3>Rigor</h3><blockquote><p>"the strict application of the scientific method to ensure robust and unbiased experimental design"</p><p>NIH 2018 via <a href="https://www.nationalacademies.org/our-work/reproducibility-and-replicability-in-science">Reproducibility &amp; Replicabilitiy in Science (2019)</a></p></blockquote><h3>Reliability</h3><blockquote><p>"A predominant focus on the replicability of individual studies is an inefficient way to assure the reliability of scientific knowledge. Rather, reviews of cumulative evidence on a subject, to assess both the overall effect size and generalizability, is often a more useful way to gain confidence in the state of scientific knowledge." </p><p>–- <a href="https://www.nationalacademies.org/our-work/reproducibility-and-replicability-in-science">Reproducibility &amp; Replicabilitiy in Science (2019)</a></p></blockquote><h3>Generalizability</h3><blockquote><p>"Generalizability, another term frequently used in science, refers to the extent that results of a study apply in other contexts or populations that differ from the original one."</p><p>–- <a href="https://www.nationalacademies.org/our-work/reproducibility-and-replicability-in-science">Reproducibility &amp; Replicabilitiy in Science (2019)</a></p></blockquote><h4>Transparency</h4></div>


<div class="markdown"><h1>Q&amp;A</h1></div>


<div class="markdown"><h2>Reproducibility</h2></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>How many astronomers focus on replicating results? Most astronomy papers I see published are on novel research? </p><p>Should more astronomers focus on replicating results?</p><p>Or do they just not achieve the front page of sites often?</p></div><p>Should more astronomers focus on replicating results?</p><p>Or do they just not achieve the front page of sites often?</p></div></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>How can a researcher assess the validity of a study that has not been replicated yet?</p></div></div></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>For reproducibility, replicability, and validity of research, is it the same standards across all of astronomy/astrophysics?  Do you know if it extends into physics too?</p></div></div></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>Does a more complex model mean more parameters or a firmer scientific model?</p></div></div></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>Does knowing two parameters for a basic model serve as a good prior to use when analyzing our data with a more complex model?</p></div></div></div>


<div class="markdown"><h2>Project</h2></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>What are some ways that we can make our dashboard look cleaner and more user friendly?</p></div></div></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>How long have written reports typically been, historically?</p></div></div></div>


<div class="markdown"><p>The report/reflection will be graded based on:</p><ul><li><p>their contributions to the dashboard project and the contributions of their teammates (1 point),</p></li><li><p>what the next steps would be if there were more time to make improvements to the dashboard (1 point),</p></li><li><p>reflecting on what they learned from the experience (2 points),</p></li><li><p>offering any suggestions for how to make a similar project more valuable in future semesters (1 point), and</p></li><li><p>offering any suggestions for how to make the course more valuable in future semesters (optional, 0 points).</p></li></ul></div>


<div class="markdown"><h1>Setup/Helper Code</h1></div>


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
PlutoUI 0.7.61
</div>

<!-- PlutoStaticHTML.End -->
~~~