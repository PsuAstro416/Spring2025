~~~
<!-- PlutoStaticHTML.Begin -->
<!--
    # This information is used for caching.
    [PlutoStaticHTML.State]
    input_sha = "e3b4730cc9182ab6ff8c8549984e5cd8d0999cf90d565594d820e0a694a31469"
    julia_version = "1.11.4"
-->

<div class="markdown"><h3>Astro 416</h3><h1>Week 6:  Q&amp;A</h1></div>





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
<pre class="code-output documenter-example-output" id="var-hash273398">BenchmarkTools.Trial: 5011 samples with 1 evaluation per sample.
 Range (min … max):  925.269 μs …   6.989 ms  ┊ GC (min … max): 0.00% … 0.00%
 Time  (median):     942.091 μs               ┊ GC (median):    0.00%
 Time  (mean ± σ):   983.730 μs ± 359.838 μs  ┊ GC (mean ± σ):  0.00% ± 0.00%

  █▁                                                             
  ███▇▅▅▆▃▁▃▃▄▅▅▅▁▁▁▃▁▁▁▁▁▁▁▄▁▁▄▄▄▁▃▁▁▁▁▄▁▁▁▁▁▃▃▁▁▁▁▁▁▁▁▁▁▃▁▄▁▃ █
  925 μs        Histogram: log(frequency) by time       3.04 ms &lt;

 Memory estimate: 0 bytes, allocs estimate: 0.</pre>

<pre class='language-julia'><code class='language-julia'>@benchmark sum_array!($sum_heap, $x_heap, 10_000_000)</code></pre>
<pre class="code-output documenter-example-output" id="var-hash120226">BenchmarkTools.Trial: 293 samples with 1 evaluation per sample.
 Range (min … max):   9.398 ms … 35.487 ms  ┊ GC (min … max): 0.00% … 0.00%
 Time  (median):     18.435 ms              ┊ GC (median):    0.00%
 Time  (mean ± σ):   17.079 ms ±  6.305 ms  ┊ GC (mean ± σ):  0.00% ± 0.00%

  █             ▁       █      ▅              ▁                
  █▆▁▆▇▄▆█▄▄▄▄▆██▆▄▆▄▇█▇█▆▇▄▆▇▆██▁▆▁▆▄▆▄▁▄▄▆▆▄█▁▄▁▁▆▁▆▁▁▄▁▁▁█ ▆
  9.4 ms       Histogram: log(frequency) by time      33.5 ms &lt;

 Memory estimate: 0 bytes, allocs estimate: 0.</pre>


<div class="markdown"><h3>Sum of sqrt's</h3></div>

<pre class='language-julia'><code class='language-julia'>@benchmark sum_sqrt_stack!($sum_stack, $x_stack, 10_000_00)</code></pre>
<pre class="code-output documenter-example-output" id="var-hash433772">BenchmarkTools.Trial: 2986 samples with 1 evaluation per sample.
 Range (min … max):  925.340 μs … 18.417 ms  ┊ GC (min … max): 0.00% … 0.00%
 Time  (median):     945.538 μs              ┊ GC (median):    0.00%
 Time  (mean ± σ):     1.661 ms ±  1.410 ms  ┊ GC (mean ± σ):  0.00% ± 0.00%

  █                             ▅                               
  █▇▆▆▅▃▃▅▄▃▇▄▅▆▆▅▄▄▁▄▇▅▄▅▁▄▅▅▅▅█▆▁▃▃▄▄▁▃▃▆▁▁▁▁▃▃▃▃▁▆▁▁▁▁▁▁▃▁▃ █
  925 μs        Histogram: log(frequency) by time      6.87 ms &lt;

 Memory estimate: 0 bytes, allocs estimate: 0.</pre>

<pre class='language-julia'><code class='language-julia'>@benchmark sum_sqrt_array!($sum_heap, $x_heap, 10_000_000)</code></pre>
<pre class="code-output documenter-example-output" id="var-hash164123">BenchmarkTools.Trial: 90 samples with 1 evaluation per sample.
 Range (min … max):  28.273 ms … 88.285 ms  ┊ GC (min … max): 0.00% … 0.00%
 Time  (median):     55.812 ms              ┊ GC (median):    0.00%
 Time  (mean ± σ):   55.844 ms ± 11.856 ms  ┊ GC (mean ± σ):  0.00% ± 0.00%

                             █  ▆                              
  ▃▃▃▁▁▃▁▃▁▃▁▁▄▁▁▃▃▃▁▁▁▁▁▃▃▃▁█▄▁█▄▃▄▁▃▃▁▃▁▁▁▃▁▁▃▃▁▁▁▁▁▁▁▁▃▁▁▃ ▁
  28.3 ms         Histogram: frequency by time        86.3 ms &lt;

 Memory estimate: 0 bytes, allocs estimate: 0.</pre>


<div class="markdown"><h3>Using a fixed-size array (via StaticArrays.jl)</h3></div>

<pre class='language-julia'><code class='language-julia'>begin
    x_fixed_size = MVector{3,Float64}(5.0,6.0,7.0)
    sum_fixed_size = MVector{1,Float64}(0.0,)
end</code></pre>
<pre class="code-output documenter-example-output" id="var-sum_fixed_size">1-element MVector{1, Float64} with indices SOneTo(1):
 0.0</pre>

<pre class='language-julia'><code class='language-julia'>@benchmark sum_array!($sum_fixed_size, $x_fixed_size, 10_000_00)</code></pre>
<pre class="code-output documenter-example-output" id="var-hash168870">BenchmarkTools.Trial: 3462 samples with 1 evaluation per sample.
 Range (min … max):  925.750 μs … 8.972 ms  ┊ GC (min … max): 0.00% … 0.00%
 Time  (median):     945.227 μs             ┊ GC (median):    0.00%
 Time  (mean ± σ):     1.434 ms ± 1.152 ms  ┊ GC (mean ± σ):  0.00% ± 0.00%

  █                                              ▅             
  ██▄▅▆▄▄▄▃▁▄▅▁▁▃▃▆▄▃▄▄▁▅▅▄▃▃▄▄▁▄▁▅▃▁▄▃▃▄▃▄▃▃▄▁▃▄██▄▄▄▄▄▁▃▁▁▃ █
  926 μs       Histogram: log(frequency) by time      4.65 ms &lt;

 Memory estimate: 0 bytes, allocs estimate: 0.</pre>

<pre class='language-julia'><code class='language-julia'>@benchmark sum_sqrt_array!($sum_fixed_size, $x_fixed_size, 10_000_00)</code></pre>
<pre class="code-output documenter-example-output" id="var-hash964623">BenchmarkTools.Trial: 1320 samples with 1 evaluation per sample.
 Range (min … max):  2.802 ms … 16.464 ms  ┊ GC (min … max): 0.00% … 0.00%
 Time  (median):     2.839 ms              ┊ GC (median):    0.00%
 Time  (mean ± σ):   3.781 ms ±  1.838 ms  ┊ GC (mean ± σ):  0.00% ± 0.00%

  █                ▃  ▄                                       
  █▆▇▄▄▃▄▇▅▆▅▃▅▅▅▄▄█▆▆█▃▁▃▃▁▃▅▄▄▄▁▁▅▅▆▄▆▃▃▁▁▃▁▁▁▃▁▁▁▃▄▁▃▃▃▁█ ▇
  2.8 ms       Histogram: log(frequency) by time     11.5 ms &lt;

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
<p>Built with Julia 1.11.4 and</p>
BenchmarkTools 1.6.0<br>
PlutoTeachingTools 0.3.1<br>
PlutoUI 0.7.61<br>
StaticArrays 1.9.11
</div>

<!-- PlutoStaticHTML.End -->
~~~