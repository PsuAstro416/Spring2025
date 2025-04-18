~~~
<!-- PlutoStaticHTML.Begin -->
<!--
    # This information is used for caching.
    [PlutoStaticHTML.State]
    input_sha = "0a71e56a6051a2272bc2e02119c4db91da9e59e243b3f50f18507c2c2fd5c195"
    julia_version = "1.11.5"
-->

<div class="markdown"><h3>Astro 416</h3><h1>Week 7: Review for Exam</h1></div>





<div class="markdown"><h1>Stack/Heap</h1></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>How does a programmer specify whether their variables are stored in stack or heap? What programming techniques/constructs allow for this control?</p></div></div></div>

<pre class='language-julia'><code class='language-julia'>begin
    # Type is Float64, size is fixed and known at compile time
    x_stack = 5.0      
    sum_stack = 0.0
    
    # Type is Vector{Float64}, size is variable
    x_heap = fill(5.0, 1)   
    sum_heap = fill(0.0, 1)
end</code></pre>
<pre class="code-output documenter-example-output" id="var-x_stack">1-element Vector{Float64}:
 0.0</pre>

<pre class='language-julia'><code class='language-julia'>function sum_stack!(sum, x, n)
    sum = 0
    for i in 1:n sum += x end
    sum
end</code></pre>
<pre class="code-output documenter-example-output" id="var-sum_stack!">sum_stack! (generic function with 1 method)</pre>

<pre class='language-julia'><code class='language-julia'>function sum_sqrt_stack!(sum, x, n)
    sum = 0
    for i in 1:n sum += sqrt(x) end
    sum
end</code></pre>
<pre class="code-output documenter-example-output" id="var-sum_sqrt_stack!">sum_sqrt_stack! (generic function with 1 method)</pre>

<pre class='language-julia'><code class='language-julia'>function sum_array!(sum, x, n)
    sum[1] = 0
    for i in 1:n sum[1] += x[1] end
    sum[1]
end</code></pre>
<pre class="code-output documenter-example-output" id="var-sum_array!">sum_array! (generic function with 1 method)</pre>

<pre class='language-julia'><code class='language-julia'>function sum_sqrt_array!(sum, x, n)
    sum[1] = 0
    for i in 1:n sum[1] += sqrt(x[1]) end
    sum[1]
end</code></pre>
<pre class="code-output documenter-example-output" id="var-sum_sqrt_array!">sum_sqrt_array! (generic function with 1 method)</pre>


<div class="markdown"><h3>Sum of values</h3></div>

<pre class='language-julia'><code class='language-julia'>@benchmark sum_stack!($sum_stack, $x_stack, 10_000_00)</code></pre>
<pre class="code-output documenter-example-output" id="var-hash273398">BenchmarkTools.Trial: 2820 samples with 1 evaluation per sample.
 Range (min … max):  925.262 μs … 10.955 ms  ┊ GC (min … max): 0.00% … 0.00%
 Time  (median):     945.340 μs              ┊ GC (median):    0.00%
 Time  (mean ± σ):     1.727 ms ±  1.504 ms  ┊ GC (mean ± σ):  0.00% ± 0.00%

  █                             ▅                            ▁  
  █▇▅▅▅▄▅▆▄▇█▆▆▆▆▆▆▆▆▆█▆▆▆▆▅▇▆▆▆█▅▅▄▅▅▅▃▃▅█▄▄▅▁▁▃▁▄▅▆▄▁▃▁▃▄▄▁█ █
  925 μs        Histogram: log(frequency) by time      6.95 ms &lt;

 Memory estimate: 0 bytes, allocs estimate: 0.</pre>

<pre class='language-julia'><code class='language-julia'>@benchmark sum_array!($sum_heap, $x_heap, 10_000_000)</code></pre>
<pre class="code-output documenter-example-output" id="var-hash120226">BenchmarkTools.Trial: 289 samples with 1 evaluation per sample.
 Range (min … max):   9.408 ms … 34.128 ms  ┊ GC (min … max): 0.00% … 0.00%
 Time  (median):     18.472 ms              ┊ GC (median):    0.00%
 Time  (mean ± σ):   17.287 ms ±  5.395 ms  ┊ GC (mean ± σ):  0.00% ± 0.00%

  ▇             ▁       █▁▁    ▅              ▁                
  █▆▄▁▁▅▁█▄▁▁▁▅▅█▆▁▆▁▆▅████▄▅███▇▄▄▄▄▄▄▅▄▁▁▁▁▄█▁▄▁▁▁▁▄▁▁▁▄▁▁▄ ▅
  9.41 ms      Histogram: log(frequency) by time      33.4 ms &lt;

 Memory estimate: 0 bytes, allocs estimate: 0.</pre>


<div class="markdown"><h3>Sum of sqrt's</h3></div>

<pre class='language-julia'><code class='language-julia'>@benchmark sum_sqrt_stack!($sum_stack, $x_stack, 10_000_00)</code></pre>
<pre class="code-output documenter-example-output" id="var-hash433772">BenchmarkTools.Trial: 3077 samples with 1 evaluation per sample.
 Range (min … max):  925.282 μs … 9.970 ms  ┊ GC (min … max): 0.00% … 0.00%
 Time  (median):     946.412 μs             ┊ GC (median):    0.00%
 Time  (mean ± σ):     1.612 ms ± 1.310 ms  ┊ GC (mean ± σ):  0.00% ± 0.00%

  █                                        ▅▂                  
  █▇▄▄▁▄▃▄▃▄▄▄▃▃▄▃▃▃▄▄▄▃▄▃▃▄▁▄▆▄▁▄▃▁▅▄▅▅▅▄▆██▄▄▃▃▄▄▃▁▁▃▃▁▆▃▃▃ █
  925 μs       Histogram: log(frequency) by time      5.18 ms &lt;

 Memory estimate: 0 bytes, allocs estimate: 0.</pre>

<pre class='language-julia'><code class='language-julia'>@benchmark sum_sqrt_array!($sum_heap, $x_heap, 10_000_000)</code></pre>
<pre class="code-output documenter-example-output" id="var-hash164123">BenchmarkTools.Trial: 108 samples with 1 evaluation per sample.
 Range (min … max):  28.189 ms … 89.031 ms  ┊ GC (min … max): 0.00% … 0.00%
 Time  (median):     47.693 ms              ┊ GC (median):    0.00%
 Time  (mean ± σ):   46.326 ms ± 14.597 ms  ┊ GC (mean ± σ):  0.00% ± 0.00%

  █                            ▂                               
  █▁▁▄▃▃▃▃▁▄▃▃▁▄▃▃▄▁▁▃▁▄▃▄▁▃▃▁▃█▄▃▆▄▃▃▁▁▁▃▃▁▁▃▁▁▁▃▃▃▁▃▁▁▁▁▁▁▃ ▃
  28.2 ms         Histogram: frequency by time        82.3 ms &lt;

 Memory estimate: 0 bytes, allocs estimate: 0.</pre>


<div class="markdown"><h3>Using a fixed-size array (via StaticArrays.jl)</h3></div>

<pre class='language-julia'><code class='language-julia'>begin
    x_fixed_size = MVector{3,Float64}(5.0,6.0,7.0)
    sum_fixed_size = MVector{1,Float64}(0.0,)
end</code></pre>
<pre class="code-output documenter-example-output" id="var-sum_fixed_size">1-element MVector{1, Float64} with indices SOneTo(1):
 0.0</pre>

<pre class='language-julia'><code class='language-julia'>@benchmark sum_array!($sum_fixed_size, $x_fixed_size, 10_000_00)</code></pre>
<pre class="code-output documenter-example-output" id="var-hash168870">BenchmarkTools.Trial: 4737 samples with 1 evaluation per sample.
 Range (min … max):  925.764 μs …   6.951 ms  ┊ GC (min … max): 0.00% … 0.00%
 Time  (median):     944.758 μs               ┊ GC (median):    0.00%
 Time  (mean ± σ):     1.049 ms ± 573.071 μs  ┊ GC (mean ± σ):  0.00% ± 0.00%

  █▁                                                          ▁  
  ██▇▆▆▅▁▃▄▁▄▃▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▄▁▃▁▁▁▃▁▁▃▃▅▁▃▁▁▄▁▄▁▄▃▁▁▁▃▃▃▄▅█ █
  926 μs        Histogram: log(frequency) by time       3.95 ms &lt;

 Memory estimate: 0 bytes, allocs estimate: 0.</pre>

<pre class='language-julia'><code class='language-julia'>@benchmark sum_sqrt_array!($sum_fixed_size, $x_fixed_size, 10_000_00)</code></pre>
<pre class="code-output documenter-example-output" id="var-hash964623">BenchmarkTools.Trial: 1147 samples with 1 evaluation per sample.
 Range (min … max):  2.803 ms … 11.852 ms  ┊ GC (min … max): 0.00% … 0.00%
 Time  (median):     2.911 ms              ┊ GC (median):    0.00%
 Time  (mean ± σ):   4.341 ms ±  1.680 ms  ┊ GC (mean ± σ):  0.00% ± 0.00%

  █▁                          ▂▇                              
  ██▅▅▆▅▄▁▄▆▆▄▁▄▁▄▁▄▁▆▅▄▁▄▄▄▁▅██▄▆▄▅▄▄▄▁█▄▄▁▄▄▄▁▄▄▆▁▁▄▆▁▁▁▁█ ▇
  2.8 ms       Histogram: log(frequency) by time     8.85 ms &lt;

 Memory estimate: 0 bytes, allocs estimate: 0.</pre>


<div class="markdown"><h1>Lab</h1></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>Could you please explain why the benchmark numbers at the start of the lab keep changing so much, and by big margins?If these numbers are not static, how should we go about calculating and estimating the read and write times?</p></div></div></div>


<div class="markdown"><h1>File formats</h1></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>Besides CSV, JLD2, and FITS, are there any other popular/commonly used file formats in physics/astro/data science?</p></div></div></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>Are there many others that can streamline different data types?</p></div></div></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>How can HDF5/JLD2 files have the same size as CSV files if they also store all the metadata info?</p></div></div></div>


<div class="markdown"><h1>Queries</h1></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>What’s the best practice in Julia for handling errors or timeouts when querying an ADQL service? </p><p>Should I use Julia’s try-catch blocks, or are there any more efficient methods for managing these cases?</p></div><p>Should I use Julia’s try-catch blocks, or are there any more efficient methods for managing these cases?</p></div></div>


<div class="markdown"><h1>Exam</h1></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>Until what point in the course content will the test cover?</p></div></div></div>


<div class="markdown"><ul><li><p>Lessons from Weeks 1-6</p></li><li><p>Labs 1-5</p></li></ul></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>What types of question would be asked - theory or coding?</p></div></div></div>


<div class="markdown"><ul><li><p>I won't ask you to write code.</p></li><li><p>I will likely ask you to read code, figure out what it does, and explain choices/alternatives.</p></li></ul></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>What types of questions will be on the exam? In particular, is it going to include multiple choice, short answer, true/false, etc?</p></div></div></div>


<div class="markdown"><p>Some short answer (1-3 sentances), some multiple choice.</p></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>Should I study the notes from lectures as well as the past labs?</p></div></div></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>Should you focus more on studying the labs or the lessons?</p></div></div></div>


<div class="markdown"><ul><li><p>I'll try to draw from both.  </p></li><li><p>If you've already spent several times longer thinking about the labs than the lessons, then it might make sense to spend more time review your notes from Mondays.</p></li></ul></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>Are there any specific topics that I should focus on while studying?</p></div></div></div>


<div class="markdown"><ul><li><p>Topics that I planned more than the less structured questions from you all.</p></li><li><p>When a student asked to clarify something I already discussed, then that's probably a sign it's both important and potentially confusing.</p></li></ul></div>


<div class="markdown"><h1>New questions for Monday</h1></div>


<div class="markdown"><h2>First-principles vs Machine learning approaches</h2></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>Could you compare the first principles approach with the machine learning approach, and explain when it is appropriate to use each?</p></div></div></div>


<div class="nice-blockquote nice-blockquote__bordered nice-blockquote--quoted"><p class="nice-blockquote__text"></p><div class="markdown"><p>Are the specific values of  model parameters more likely to be of scientific interest when applying a first-principles approach or a machine learning approach to modeling data?  Explain your reasoning.</p></div><p></p><div class="nice-blockquote__text nice-blockquote__text--author"></div></div>
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


<div class="nice-blockquote nice-blockquote__bordered nice-blockquote--quoted"><p class="nice-blockquote__text"></p><div class="markdown"><p>Imagine that you would like to predict the trajectory of a newly discovered Kuiper belt object based on 6 previous observations, so that you can schedule observations next year.  Would this problem be better suited to a first-principles or machine learning approach?  Explain your reasoning.</p></div><p></p><div class="nice-blockquote__text nice-blockquote__text--author"></div></div>
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


<div class="nice-blockquote nice-blockquote__bordered nice-blockquote--quoted"><p class="nice-blockquote__text"></p><div class="markdown"><p>Imagine that you would like to predict the absolute magnitude of the brightest galaxy in a galaxy cluster using its surface brightness, effective radius and redshift and data on similar galaxies from the Sloan Digital Sky Survey (SDSS).  Would this problem be better suited to a first-principles or machine learning approach?  Explain your reasoning.</p></div><p></p><div class="nice-blockquote__text nice-blockquote__text--author"></div></div>
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


<div class="markdown"><h2>Bayesian inference</h2></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>Can we do a quick 2 minute review on Bayesian statistics?</p></div></div></div>


<div class="markdown"><p class="tex">$$p( \theta| M, D) = \frac{p(\theta | M) p(D | \theta, M )}{p(D | M )}$$</p></div>


<div class="markdown"><div class="admonition is-hint"><header class="admonition-header">Hint</header><div class="admonition-body"><p class="tex">$$\mathrm{(Posterior)} = \mathrm{(Prior)} \times \mathrm{(Likelihood)} / \mathrm{(Evidence)}$$</p></div></div></div>


<div class="nice-blockquote nice-blockquote__bordered nice-blockquote--quoted"><p class="nice-blockquote__text"></p><div class="markdown"><p>When applying an explanatory model in a Bayesian statistical framework, inferences about the values of model parameters are primarily based on the:</p><ol><li><p>Prior PDF</p></li><li><p>Likelihood function</p></li><li><p>Posterior PDF</p></li><li><p>Posterior predictive PDF</p></li><li><p>Fully marginalized likelihood</p></li><li><p>Evidence</p></li><li><p>Bayes Factor</p></li></ol></div><p></p><div class="nice-blockquote__text nice-blockquote__text--author"></div></div>
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


<div class="markdown"><p>The next questions will be about the following Turing model:</p><pre><code class="language-julia">@model function model(v, d_obs, σ_d_obs)
    @assert size(v) == size(d_obs) == size(σ_d_obs)
    H₀ ~ LogNormal(log(100), 1.0)
    d_true = v / H₀
    d_obs ~ MvNormal(d_true, σ_d_obs)
end
model_given_data = model(v, dₗ, σ_dₗ)
chain = sample(model_given_data, NUTS(0.65))</code></pre></div>


<div class="nice-blockquote nice-blockquote__bordered nice-blockquote--quoted"><p class="nice-blockquote__text"></p><div class="markdown"><p>Explain this model in your own words, including the function of each line of code (except ‘end’). Which line(s) specify the likelihood function? What line(s) specify prior distribution(s)?</p></div><p></p><div class="nice-blockquote__text nice-blockquote__text--author"></div></div>
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


<div class="nice-blockquote nice-blockquote__bordered nice-blockquote--quoted"><p class="nice-blockquote__text"></p><div class="markdown"><p>If you wanted to evaluate the sensitivity of results to different choices for the prior, what changes would you make?  Be sure to specify the line number(s) of code that you’d change.</p></div><p></p><div class="nice-blockquote__text nice-blockquote__text--author"></div></div>
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


<div class="nice-blockquote nice-blockquote__bordered nice-blockquote--quoted"><p class="nice-blockquote__text"></p><div class="markdown"><p>In the statistical modeling of astronomical observations, which one(s) of the following could be a reasonable choice for the prior probability density function:</p><ul><li><p>A very broad probability distribution that only excludes physically impossible combinations of model parameters. </p></li><li><p>A probability distribution summarizing one’s state of knowledge of model parameters prior to analyzing the most recent set of observations.</p></li><li><p>A probability distribution for the outcome of an experiment/observation.</p></li><li><p>A function of the data that maximizes the a priori probability.</p></li><li><p>The ratio of the posterior probability distribution function over the prior probability distribution function.</p></li></ul></div><p></p><div class="nice-blockquote__text nice-blockquote__text--author"></div></div>
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


<div class="nice-blockquote nice-blockquote__bordered nice-blockquote--quoted"><p class="nice-blockquote__text"></p><div class="markdown"><p>Explain the meaning of the posterior predictive distribution in a Bayesian model.</p></div><p></p><div class="nice-blockquote__text nice-blockquote__text--author"></div></div>
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


<div class="markdown"><h2>Miscellaneous</h2></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>How does the size of data change the models we choose? Most of the time we use giant data sets and then make them smaller but use different approaches. So does size ever play a role?</p></div></div></div>


<div class="nice-blockquote nice-blockquote__bordered nice-blockquote--quoted"><p class="nice-blockquote__text"></p><div class="markdown"><p>Is having a very large dataset typically more important when applying a first-principles approach or a machine learning approach to modeling data?  Explain your reasoning.</p></div><p></p><div class="nice-blockquote__text nice-blockquote__text--author"></div></div>
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


<div class="markdown"><h1>Pick from list of practice exam questions</h1></div>


<div class="markdown"><h1>Project</h1></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>How do we choose how much data to download at first if there’s a lot of data but we don’t want to loose too much information?</p></div></div></div>


<div class="markdown"><ul><li><p>Start small for speed.</p></li><li><p>When you realize you need more, increase it.</p></li><li><p>Compare results if you double/half the data size</p></li><li><p>When selecting the top rows, make sure that the order of the data doesn't create a bias.</p></li></ul></div>


<div class="markdown"><div class="admonition is-question"><header class="admonition-header">Question:</header><div class="admonition-body"><p>How much time should we spend optimizing the dashboard for speed and memory?</p></div></div></div>


<div class="markdown"><p>If things run in a few seconds, then the only reason to optimize is to gain experience doing so.  If it takes 30 minutes, then there's more motivation to look for opportunities to improve performance.</p></div>


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
BenchmarkTools 1.6.0<br>
PlutoTeachingTools 0.3.1<br>
PlutoUI 0.7.61<br>
StaticArrays 1.9.11
</div>

<!-- PlutoStaticHTML.End -->
~~~