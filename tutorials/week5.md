~~~
<!-- PlutoStaticHTML.Begin -->
<!--
    # This information is used for caching.
    [PlutoStaticHTML.State]
    input_sha = "c55889c7897f642ba92796c44fe3c523d7318ccb8027a7053205915cd2f33155"
    julia_version = "1.11.4"
-->







<div class="markdown"><h4>Data Science Applications to Astronomy</h4><h1>Week 5: Data Wrangling:</h1><h2>Databases &amp; Queries</h2></div>





<div class="markdown"><h1>Databases</h1></div>


<div class="markdown"><h3>Simplest form</h3><ul><li><p>Store data </p></li><li><p>Retrieve data</p></li><li><p>Commonly implemented as a set of <strong>tables</strong></p><ul><li><p><strong>Columns</strong> contain different fields (e.g., ID, magnitude, RA, Dec)</p></li><li><p><strong>Rows</strong> contain entries (e.g., 51 Pegasi, Kepler-10, HAT-P-13,... )</p></li></ul></li></ul><h3>Value-added features</h3><ul><li><p>Return subset of data <em>efficiently</em></p></li><li><p>Many strategies for how to filter data (e.g., order of operations)</p></li><li><p>Database server can use heuristics to pick good strategy</p></li><li><p>Allow for transactions to update database</p></li></ul></div>


<div class="markdown"><h3>Fundamental properties of databases</h3><ul><li><p>Atomicity:  All part of a transaction succeed, or the database is rolled back to its previous state</p></li><li><p>Consistency:  Data in database always satisfies its validation rules</p></li><li><p>Isolation: Even if multiple transactions are made concurrently, there is no interference between transactions</p></li><li><p>Durability:  Once a transaction is committed, it will remain committed</p></li></ul></div>


<div class="markdown"><h3>SQL-based Database Servers</h3><p>Open-source:</p><ul><li><p>MySQL</p></li><li><p>PostgreSQL &amp; Greenplum</p></li></ul><p>Commercial:</p><ul><li><p>Microsoft SQL Server: </p></li><li><p>IBM DB2</p></li><li><p>Oracle Database</p></li><li><p>...</p></li></ul></div>


<div class="markdown"><h4>Continuing innovation in database systems</h4><ul><li><p>SciDB (array &amp; disk based database)</p></li><li><p>MonetDB (column store)</p></li><li><p>JuliaDB (pure Julia, for persistent data)</p></li></ul><p>When selecting a database for a project, consider:</p><ul><li><p>How much data is to be stored?</p></li><li><p>How frequent/large will transactions be?</p></li><li><p>Are there specific hardware or OS requirements?</p></li><li><p>Does the team have someone dedicated to supporting database?</p></li></ul></div>


<div class="markdown"><h3>Database Clients</h3><ul><li><p>One database server many clients simultaneously</p></li><li><p>Different clients can use different interfaces</p><ul><li><p>Command line</p></li><li><p>Webpage</p></li><li><p>URL-based</p></li><li><p>Custom Graphical user interface (GUI)</p><ul><li><p>TopCat</p></li></ul></li></ul></li></ul></div>


<div class="markdown"><h1>Queries</h1></div>


<div class="markdown"><p><strong>Query</strong>:  An expression that requests database to return a specific subset of data.  </p><h4>Query languages:</h4><ul><li><p>Structured Query Language (SQL):  Dated, but by far the most common</p></li><li><p>Astronomical Data Query Language (ADQL):  Astronomy-specific</p></li><li><p>Language Integrated Query (LINQ):  Microsoft-supported</p></li><li><p>Many more</p></li></ul></div>


<div class="markdown"><h2>SQL essentials</h2><ul><li><p>Selecting (columns)</p></li><li><p>Filtering (for rows)</p></li><li><p>Joining (multiple tables)</p></li><li><p>Aggregating (rows within a table)</p></li></ul><h3>SQL programming</h3><ul><li><p>Variables</p></li><li><p>Functions</p></li><li><p>Procedures</p></li><li><p>Data management</p></li><li><p>Transactions</p></li></ul></div>


<div class="markdown"><h2>Virtual Observatory (VO)</h2><p>Defines standards that help astronomers to collaborate effectively, emphasizing working with multiple data sources.  </p><ul><li><p>Astronomical Data Query Language (ADQL) </p></li><li><p>Table Access Protocol (TAP)</p></li></ul></div>


<div class="markdown"><h2>Astronomy-specific functions in ADQL</h2><ul><li><p>AREA</p></li><li><p>BOX</p></li><li><p>CENTROID</p></li><li><p>CIRCLE</p></li><li><p>CONTAINS</p></li><li><p>COORD1</p></li><li><p>COORD2</p></li><li><p>COORDSYS</p></li><li><p>DISTANCE</p></li><li><p>INTERSECTS</p></li><li><p>POINT</p></li><li><p>POLYGON</p></li><li><p>REGION</p></li></ul></div>


<div class="markdown"><h2>Example Bad SQL Query</h2><h4>Do not send</h4><pre><code class="language-sql">select * from SomeTable</code></pre><p>Why?</p></div>


<div class="markdown"><h2>Example SQL Queries</h2></div>


<div class="markdown"><h3>Take a quick peak two columns data for first few entries</h3><pre><code class="language-sql">select top 10 X, Y from SomeTable </code></pre></div>


<div class="markdown"><h2>Find extreme values of X</h2><pre><code class="language-sql">select top 10 X, Y 
from SomeTable 
order by X</code></pre></div>


<div class="markdown"><h2>Filter which rows are returned using expression</h2><pre><code class="language-sql">select top 10 x,y
from SomeTable 
where x*x+y*y between 0 and 1
order by x </code></pre></div>


<div class="markdown"><h2>Check how many rows are in a table</h2><pre><code class="language-sql">select COUNT(designation) as N from gaiadr2.gaia_source</code></pre></div>


<div class="markdown"><h4><a href="https://gea.esac.esa.int/archive/">Gaia Archive</a></h4></div>


<div class="markdown"><h2>Check how many rows satisfy a filter</h2><pre><code class="language-sql">select COUNT(designation) as n, AVG(astrometric_n_good_obs_al) as astrometric_n_good_obs_al_ave
from gaiadr2.gaia_source
where phot_g_mean_mag &lt; 14</code></pre></div>


<div class="markdown"><h2>Grouping data to make a histogram</h2><pre><code class="language-sql">select COUNT(designation) as N, 
       AVG(astrometric_n_good_obs_al) as astrometric_n_good_obs_al_ave,  
       AVG(phot_g_mean_mag) as phot_g_mean_mag_ave,
       ROUND(phot_g_mean_mag,1) as bin
from gaiadr2.gaia_source
where phot_g_mean_mag &lt; 14
group by bin 
order by bin</code></pre></div>


<div class="markdown"><h1>Table Access Protocol (TAP)</h1></div>


<div class="markdown"><p>Start with ADQL </p><pre><code class="language-sql">SELECT &lt;column list&gt; FROM &lt;table&gt; WHERE &lt;constraints&gt;</code></pre><p>but transform it into a url, by</p><ol><li><p>Prepend a base service url</p></li><li><p>convert spaces to <code>+</code>'s</p></li><li><p>Deal with other special characters (e.g., +, quotes)</p></li><li><p>Optionally, specify format for results</p></li></ol><p>e.g., </p><pre><code class="language-url">https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,pl_masse,ra,dec+from+ps</code></pre></div>

<pre class='language-julia'><code class='language-julia'>url_ex1 = make_tap_query_url(nexsci_query_base_url, "ps", select_cols="pl_name,gaia_id,sy_kepmag,ra,dec", where="default_flag=1")</code></pre>
<pre class="code-output documenter-example-output" id="var-url_ex1">"https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,gaia_id,sy_kepmag,ra,dec+from+ps+where+default_flag=1&amp;format=tsv"</pre>

<pre class='language-julia'><code class='language-julia'>df_ex1 = query_to_df(url_ex1)</code></pre>
<table><tbody><tr><th></th><th>pl_name</th><th>gaia_id</th><th>sy_kepmag</th><th>ra</th><th>dec</th></tr><tr><td>1</td><td>"Kepler-6 b"</td><td>"Gaia DR2 2086636884980514304"</td><td>13.303</td><td>296.837</td><td>48.24</td></tr><tr><td>2</td><td>"Kepler-491 b"</td><td>"Gaia DR2 2102468134431912064"</td><td>14.014</td><td>287.131</td><td>42.3502</td></tr><tr><td>3</td><td>"Kepler-257 b"</td><td>"Gaia DR2 2080246282881778048"</td><td>15.471</td><td>297.316</td><td>46.0233</td></tr><tr><td>4</td><td>"Kepler-216 b"</td><td>"Gaia DR2 2128067720065692672"</td><td>13.998</td><td>293.728</td><td>46.1291</td></tr><tr><td>5</td><td>"Kepler-32 c"</td><td>"Gaia DR2 2080287892525359872"</td><td>15.801</td><td>297.842</td><td>46.5744</td></tr><tr><td>6</td><td>"Kepler-259 c"</td><td>"Gaia DR2 2130405041264941184"</td><td>15.219</td><td>288.212</td><td>46.615</td></tr><tr><td>7</td><td>"Kepler-148 c"</td><td>"Gaia DR2 2127828988601389440"</td><td>15.342</td><td>289.786</td><td>46.8588</td></tr><tr><td>8</td><td>"Kepler-222 d"</td><td>"Gaia DR2 2130460394803778816"</td><td>15.063</td><td>287.906</td><td>46.9377</td></tr><tr><td>9</td><td>"Kepler-29 c"</td><td>"Gaia DR2 2086435189017387264"</td><td>15.282</td><td>298.348</td><td>47.4913</td></tr><tr><td>10</td><td>"Kepler-179 b"</td><td>"Gaia DR2 2086468453545432960"</td><td>14.613</td><td>298.664</td><td>47.7619</td></tr><tr><td>...</td></tr><tr><td>5856</td><td>"Kepler-33 f"</td><td>"Gaia DR2 2127355923723254272"</td><td>13.988</td><td>289.078</td><td>46.0052</td></tr></tbody></table>

<pre class='language-julia'><code class='language-julia'>row_to_study = 7</code></pre>
<pre class="code-output documenter-example-output" id="var-row_to_study">7</pre>

<pre class='language-julia'><code class='language-julia'>desig = replace_spaces_for_tap(df_ex1.gaia_id[row_to_study])</code></pre>
<pre class="code-output documenter-example-output" id="var-desig">"Gaia+DR2+2127828988601389440"</pre>

<pre class='language-julia'><code class='language-julia'>url_ex2 = make_tap_query_url(gaia_query_base_url, "gaiadr2.gaia_source", where="designation='$(desig)'",select_cols="*",max_rows=5,format="csv")</code></pre>
<pre class="code-output documenter-example-output" id="var-url_ex2">"https://gea.esac.esa.int/tap-server/tap/sync?REQUEST=doQuery&amp;LANG=ADQL&amp;FORMAT=csv&amp;QUERY=select+top+5+*+from+gaiadr2.gaia_source+where+designation='Gaia+DR2+2127828988601389440'&amp;format=csv"</pre>

<pre class='language-julia'><code class='language-julia'>df_ex2 = query_to_df(url_ex2)</code></pre>
<table><tbody><tr><th></th><th>solution_id</th><th>designation</th><th>source_id</th><th>random_index</th><th>ref_epoch</th><th>ra</th><th>ra_error</th><th>dec</th><th>...</th></tr><tr><td>1</td><td>1635721458409799680</td><td>"Gaia DR2 2127828988601389440"</td><td>2127828988601389440</td><td>1561046905</td><td>2015.5</td><td>289.786</td><td>0.0212007</td><td>46.8588</td><td></td></tr></tbody></table>


<div class="markdown"><h1>Joins</h1></div>


<div class="markdown"><p>Joining tables is a fundamental concept that can be applied either to DataFrames stored locally or as part of SQL/ADQL queries.</p></div>


<div class="markdown"><ul><li><p><code>innerjoin</code> &amp; <code>semijoin</code>:  Return rows for values of the key that exist <strong>in both tables</strong></p></li><li><p><code>outerjoin</code>: Return rows for values of the key that exist <strong>in either table</strong></p></li><li><p><code>leftjoin</code>: Return rows for values of the key that exist <strong>in first table</strong></p></li><li><p><code>rightjoin</code>: Return rows for values of the key that exist <strong>in second table</strong></p></li></ul><ul><li><p><code>antijoin</code>: Return rows Return rows for values of the key that exist <strong>in first table but not the second table</strong></p></li></ul><ul><li><p><code>crossjoin</code>: Return table with every row from first table as rows and every row from second table as columns</p></li></ul></div>


<div class="markdown"><h1>Examples</h1></div>


<div class="markdown"><h2>Join on Gaia ID</h2></div>

<pre class='language-julia'><code class='language-julia'>df_ex3_inner = innerjoin(df_ex1,df_ex2, on=:gaia_id=&gt;:designation, matchmissing=:notequal, makeunique=true )</code></pre>
<table><tbody><tr><th></th><th>pl_name</th><th>gaia_id</th><th>sy_kepmag</th><th>ra</th><th>dec</th><th>solution_id</th><th>source_id</th><th>random_index</th><th>...</th></tr><tr><td>1</td><td>"Kepler-148 c"</td><td>"Gaia DR2 2127828988601389440"</td><td>15.342</td><td>289.786</td><td>46.8588</td><td>1635721458409799680</td><td>2127828988601389440</td><td>1561046905</td><td></td></tr><tr><td>2</td><td>"Kepler-148 b"</td><td>"Gaia DR2 2127828988601389440"</td><td>15.342</td><td>289.786</td><td>46.8588</td><td>1635721458409799680</td><td>2127828988601389440</td><td>1561046905</td><td></td></tr><tr><td>3</td><td>"Kepler-148 d"</td><td>"Gaia DR2 2127828988601389440"</td><td>15.342</td><td>289.786</td><td>46.8588</td><td>1635721458409799680</td><td>2127828988601389440</td><td>1561046905</td><td></td></tr></tbody></table>

<pre class='language-julia'><code class='language-julia'>names(df_ex3_inner)</code></pre>
<pre class="code-output documenter-example-output" id="var-hash479675">100-element Vector{String}:
 "pl_name"
 "gaia_id"
 "sy_kepmag"
 "ra"
 "dec"
 "solution_id"
 "source_id"
 ⋮
 "radius_percentile_upper"
 "lum_val"
 "lum_percentile_lower"
 "lum_percentile_upper"
 "datalink_url"
 "epoch_photometry_url"</pre>


<div class="markdown"><div class="admonition is-tip"><header class="admonition-header">Tip</header><div class="admonition-body"><p>Originally, both tables contained columns named <code>ra</code> and <code>dec</code>.  The joined table contains columns <code>ra</code> and <code>ra_1</code> (and <code>dec</code> and <code>dec_1</code>) because we set <code>makeunique</code>.</p></div></div></div>

<pre class='language-julia'><code class='language-julia'>df_ex3_left = leftjoin(df_ex1,df_ex2, on=:gaia_id=&gt;:designation, matchmissing=:notequal, makeunique=true )</code></pre>
<table><tbody><tr><th></th><th>pl_name</th><th>gaia_id</th><th>sy_kepmag</th><th>ra</th><th>dec</th><th>solution_id</th><th>source_id</th><th>random_index</th><th>...</th></tr><tr><td>1</td><td>"Kepler-148 c"</td><td>"Gaia DR2 2127828988601389440"</td><td>15.342</td><td>289.786</td><td>46.8588</td><td>1635721458409799680</td><td>2127828988601389440</td><td>1561046905</td><td></td></tr><tr><td>2</td><td>"Kepler-148 b"</td><td>"Gaia DR2 2127828988601389440"</td><td>15.342</td><td>289.786</td><td>46.8588</td><td>1635721458409799680</td><td>2127828988601389440</td><td>1561046905</td><td></td></tr><tr><td>3</td><td>"Kepler-148 d"</td><td>"Gaia DR2 2127828988601389440"</td><td>15.342</td><td>289.786</td><td>46.8588</td><td>1635721458409799680</td><td>2127828988601389440</td><td>1561046905</td><td></td></tr><tr><td>4</td><td>"Kepler-6 b"</td><td>"Gaia DR2 2086636884980514304"</td><td>13.303</td><td>296.837</td><td>48.24</td><td>missing</td><td>missing</td><td>missing</td><td></td></tr><tr><td>5</td><td>"Kepler-491 b"</td><td>"Gaia DR2 2102468134431912064"</td><td>14.014</td><td>287.131</td><td>42.3502</td><td>missing</td><td>missing</td><td>missing</td><td></td></tr><tr><td>6</td><td>"Kepler-257 b"</td><td>"Gaia DR2 2080246282881778048"</td><td>15.471</td><td>297.316</td><td>46.0233</td><td>missing</td><td>missing</td><td>missing</td><td></td></tr><tr><td>7</td><td>"Kepler-216 b"</td><td>"Gaia DR2 2128067720065692672"</td><td>13.998</td><td>293.728</td><td>46.1291</td><td>missing</td><td>missing</td><td>missing</td><td></td></tr><tr><td>8</td><td>"Kepler-32 c"</td><td>"Gaia DR2 2080287892525359872"</td><td>15.801</td><td>297.842</td><td>46.5744</td><td>missing</td><td>missing</td><td>missing</td><td></td></tr><tr><td>9</td><td>"Kepler-259 c"</td><td>"Gaia DR2 2130405041264941184"</td><td>15.219</td><td>288.212</td><td>46.615</td><td>missing</td><td>missing</td><td>missing</td><td></td></tr><tr><td>10</td><td>"Kepler-222 d"</td><td>"Gaia DR2 2130460394803778816"</td><td>15.063</td><td>287.906</td><td>46.9377</td><td>missing</td><td>missing</td><td>missing</td><td></td></tr><tr><td>...</td></tr><tr><td>5856</td><td>"Kepler-33 f"</td><td>"Gaia DR2 2127355923723254272"</td><td>13.988</td><td>289.078</td><td>46.0052</td><td>missing</td><td>missing</td><td>missing</td><td></td></tr></tbody></table>

<pre class='language-julia'><code class='language-julia'>df_ex3_right = rightjoin(df_ex1,df_ex2, on=:gaia_id=&gt;:designation, matchmissing=:notequal, makeunique=true )</code></pre>
<table><tbody><tr><th></th><th>pl_name</th><th>gaia_id</th><th>sy_kepmag</th><th>ra</th><th>dec</th><th>solution_id</th><th>source_id</th><th>random_index</th><th>...</th></tr><tr><td>1</td><td>"Kepler-148 c"</td><td>"Gaia DR2 2127828988601389440"</td><td>15.342</td><td>289.786</td><td>46.8588</td><td>1635721458409799680</td><td>2127828988601389440</td><td>1561046905</td><td></td></tr><tr><td>2</td><td>"Kepler-148 b"</td><td>"Gaia DR2 2127828988601389440"</td><td>15.342</td><td>289.786</td><td>46.8588</td><td>1635721458409799680</td><td>2127828988601389440</td><td>1561046905</td><td></td></tr><tr><td>3</td><td>"Kepler-148 d"</td><td>"Gaia DR2 2127828988601389440"</td><td>15.342</td><td>289.786</td><td>46.8588</td><td>1635721458409799680</td><td>2127828988601389440</td><td>1561046905</td><td></td></tr></tbody></table>

<pre class='language-julia'><code class='language-julia'>try
    df_ex3_outer_fails = outerjoin(df_ex1,df_ex2, on=:gaia_id=&gt;:designation, matchmissing=:notequal, makeunique=true )
catch ex
    warning_box(ex.msg)
end</code></pre>
<div class="markdown"><div class="admonition is-warning"><header class="admonition-header">Warning:</header><div class="admonition-body">"matchmissing == :notequal for `outerjoin` is not allowed"
</div></div></div>

<pre class='language-julia'><code class='language-julia'>df_ex3_outer = outerjoin(filter(r-&gt;!ismissing(r.gaia_id),df_ex1),df_ex2, on=:gaia_id=&gt;:designation, makeunique=true )</code></pre>
<table><tbody><tr><th></th><th>pl_name</th><th>gaia_id</th><th>sy_kepmag</th><th>ra</th><th>dec</th><th>solution_id</th><th>source_id</th><th>random_index</th><th>...</th></tr><tr><td>1</td><td>"Kepler-148 c"</td><td>"Gaia DR2 2127828988601389440"</td><td>15.342</td><td>289.786</td><td>46.8588</td><td>1635721458409799680</td><td>2127828988601389440</td><td>1561046905</td><td></td></tr><tr><td>2</td><td>"Kepler-148 b"</td><td>"Gaia DR2 2127828988601389440"</td><td>15.342</td><td>289.786</td><td>46.8588</td><td>1635721458409799680</td><td>2127828988601389440</td><td>1561046905</td><td></td></tr><tr><td>3</td><td>"Kepler-148 d"</td><td>"Gaia DR2 2127828988601389440"</td><td>15.342</td><td>289.786</td><td>46.8588</td><td>1635721458409799680</td><td>2127828988601389440</td><td>1561046905</td><td></td></tr><tr><td>4</td><td>"Kepler-6 b"</td><td>"Gaia DR2 2086636884980514304"</td><td>13.303</td><td>296.837</td><td>48.24</td><td>missing</td><td>missing</td><td>missing</td><td></td></tr><tr><td>5</td><td>"Kepler-491 b"</td><td>"Gaia DR2 2102468134431912064"</td><td>14.014</td><td>287.131</td><td>42.3502</td><td>missing</td><td>missing</td><td>missing</td><td></td></tr><tr><td>6</td><td>"Kepler-257 b"</td><td>"Gaia DR2 2080246282881778048"</td><td>15.471</td><td>297.316</td><td>46.0233</td><td>missing</td><td>missing</td><td>missing</td><td></td></tr><tr><td>7</td><td>"Kepler-216 b"</td><td>"Gaia DR2 2128067720065692672"</td><td>13.998</td><td>293.728</td><td>46.1291</td><td>missing</td><td>missing</td><td>missing</td><td></td></tr><tr><td>8</td><td>"Kepler-32 c"</td><td>"Gaia DR2 2080287892525359872"</td><td>15.801</td><td>297.842</td><td>46.5744</td><td>missing</td><td>missing</td><td>missing</td><td></td></tr><tr><td>9</td><td>"Kepler-259 c"</td><td>"Gaia DR2 2130405041264941184"</td><td>15.219</td><td>288.212</td><td>46.615</td><td>missing</td><td>missing</td><td>missing</td><td></td></tr><tr><td>10</td><td>"Kepler-222 d"</td><td>"Gaia DR2 2130460394803778816"</td><td>15.063</td><td>287.906</td><td>46.9377</td><td>missing</td><td>missing</td><td>missing</td><td></td></tr><tr><td>...</td></tr><tr><td>5560</td><td>"Kepler-33 f"</td><td>"Gaia DR2 2127355923723254272"</td><td>13.988</td><td>289.078</td><td>46.0052</td><td>missing</td><td>missing</td><td>missing</td><td></td></tr></tbody></table>

<pre class='language-julia'><code class='language-julia'>df_ex3_anti = antijoin(df_ex1,df_ex2, on=:gaia_id=&gt;:designation, matchmissing=:notequal, makeunique=true )</code></pre>
<table><tbody><tr><th></th><th>pl_name</th><th>gaia_id</th><th>sy_kepmag</th><th>ra</th><th>dec</th></tr><tr><td>1</td><td>"Kepler-6 b"</td><td>"Gaia DR2 2086636884980514304"</td><td>13.303</td><td>296.837</td><td>48.24</td></tr><tr><td>2</td><td>"Kepler-491 b"</td><td>"Gaia DR2 2102468134431912064"</td><td>14.014</td><td>287.131</td><td>42.3502</td></tr><tr><td>3</td><td>"Kepler-257 b"</td><td>"Gaia DR2 2080246282881778048"</td><td>15.471</td><td>297.316</td><td>46.0233</td></tr><tr><td>4</td><td>"Kepler-216 b"</td><td>"Gaia DR2 2128067720065692672"</td><td>13.998</td><td>293.728</td><td>46.1291</td></tr><tr><td>5</td><td>"Kepler-32 c"</td><td>"Gaia DR2 2080287892525359872"</td><td>15.801</td><td>297.842</td><td>46.5744</td></tr><tr><td>6</td><td>"Kepler-259 c"</td><td>"Gaia DR2 2130405041264941184"</td><td>15.219</td><td>288.212</td><td>46.615</td></tr><tr><td>7</td><td>"Kepler-222 d"</td><td>"Gaia DR2 2130460394803778816"</td><td>15.063</td><td>287.906</td><td>46.9377</td></tr><tr><td>8</td><td>"Kepler-29 c"</td><td>"Gaia DR2 2086435189017387264"</td><td>15.282</td><td>298.348</td><td>47.4913</td></tr><tr><td>9</td><td>"Kepler-179 b"</td><td>"Gaia DR2 2086468453545432960"</td><td>14.613</td><td>298.664</td><td>47.7619</td></tr><tr><td>10</td><td>"Kepler-165 c"</td><td>"Gaia DR2 2119814820141727232"</td><td>14.802</td><td>280.691</td><td>47.8097</td></tr><tr><td>...</td></tr><tr><td>5853</td><td>"Kepler-33 f"</td><td>"Gaia DR2 2127355923723254272"</td><td>13.988</td><td>289.078</td><td>46.0052</td></tr></tbody></table>

<pre class='language-julia'><code class='language-julia'>ncol(df_ex1), ncol(df_ex2), ncol(df_ex3_inner), ncol(df_ex3_outer), ncol(df_ex3_left), ncol(df_ex3_anti)</code></pre>
<pre class="code-output documenter-example-output" id="var-hash148704">(5, 96, 100, 100, 100, 5)</pre>

<pre class='language-julia'><code class='language-julia'>nrow(df_ex1), nrow(df_ex2)</code></pre>
<pre class="code-output documenter-example-output" id="var-hash603567">(5856, 1)</pre>

<pre class='language-julia'><code class='language-julia'>nrow(df_ex3_inner), nrow(df_ex3_outer), nrow(filter(r-&gt;!ismissing(r.gaia_id),df_ex1))</code></pre>
<pre class="code-output documenter-example-output" id="var-hash147719">(3, 5560, 5560)</pre>

<pre class='language-julia'><code class='language-julia'>nrow(df_ex3_left), nrow(df_ex3_right)</code></pre>
<pre class="code-output documenter-example-output" id="var-hash200107">(5856, 3)</pre>


<div class="markdown"><h2>Find by position</h2></div>

<pre class='language-julia'><code class='language-julia'>targetpos = (; ra = df_ex1.ra[1], dec = df_ex1.dec[1] )</code></pre>
<pre class="code-output documenter-example-output" id="var-targetpos">(ra = 296.8372475, dec = 48.2399695)</pre>

<pre class='language-julia'><code class='language-julia'>url_ex4 = make_tap_query_url(gaia_query_base_url, "gaiadr3.gaia_source", where="1=contains(POINT($(targetpos.ra),$(targetpos.dec)),CIRCLE(ra,dec,30./3600.))", select_cols="*,DISTANCE(POINT($(targetpos.ra),$(targetpos.dec)),POINT(ra,dec))+AS+ang_sep",order_by_cols="ang_sep",max_rows=100, format="csv")</code></pre>
<pre class="code-output documenter-example-output" id="var-url_ex4">"https://gea.esac.esa.int/tap-server/tap/sync?REQUEST=doQuery&amp;LANG=ADQL&amp;FORMAT=csv&amp;QUERY=select+top+100+*,DISTANCE(POINT(296.8372475,48.2399695),POINT(ra,dec))+AS+ang_sep+from+gaiadr3.gaia_source+where+1=contains(POINT(296.8372475,48.2399695),CIRCLE(ra,dec,30./3600.))+order+by+ang_sep&amp;format=csv"</pre>

<pre class='language-julia'><code class='language-julia'>df_ex4 = query_to_df(url_ex4)</code></pre>
<table><tbody><tr><th></th><th>solution_id</th><th>designation</th><th>source_id</th><th>random_index</th><th>ref_epoch</th><th>ra</th><th>ra_error</th><th>dec</th><th>...</th></tr><tr><td>1</td><td>1636148068921376768</td><td>"Gaia DR3 2086636884980514304"</td><td>2086636884980514304</td><td>532958314</td><td>2016.0</td><td>296.837</td><td>0.00817684</td><td>48.24</td><td></td></tr><tr><td>2</td><td>1636148068921376768</td><td>"Gaia DR3 2086636884980516352"</td><td>2086636884980516352</td><td>1256249484</td><td>2016.0</td><td>296.838</td><td>0.0385658</td><td>48.2408</td><td></td></tr><tr><td>3</td><td>1636148068921376768</td><td>"Gaia DR3 2086636880679498368"</td><td>2086636880679498368</td><td>350382143</td><td>2016.0</td><td>296.838</td><td>0.159155</td><td>48.2367</td><td></td></tr><tr><td>4</td><td>1636148068921376768</td><td>"Gaia DR3 2086636781896286848"</td><td>2086636781896286848</td><td>1712521478</td><td>2016.0</td><td>296.831</td><td>2.01941</td><td>48.2371</td><td></td></tr><tr><td>5</td><td>1636148068921376768</td><td>"Gaia DR3 2086636781896284032"</td><td>2086636781896284032</td><td>946525236</td><td>2016.0</td><td>296.831</td><td>0.907897</td><td>48.2354</td><td></td></tr><tr><td>6</td><td>1636148068921376768</td><td>"Gaia DR3 2086636781896289920"</td><td>2086636781896289920</td><td>1488728871</td><td>2016.0</td><td>296.835</td><td>0.477052</td><td>48.2331</td><td></td></tr><tr><td>7</td><td>1636148068921376768</td><td>"Gaia DR3 2086636983758720384"</td><td>2086636983758720384</td><td>120967208</td><td>2016.0</td><td>296.825</td><td>0.390007</td><td>48.2397</td><td></td></tr><tr><td>8</td><td>1636148068921376768</td><td>"Gaia DR3 2086636919335289344"</td><td>2086636919335289344</td><td>3695350</td><td>2016.0</td><td>296.844</td><td>1.27651</td><td>48.2468</td><td></td></tr></tbody></table>


<div class="markdown"><h2>Which row is the best match?</h2></div>

<pre class='language-julia'><code class='language-julia'>sort(df_ex4[!,[:designation,:ang_sep,:phot_g_mean_mag] ], :ang_sep)</code></pre>
<table><tbody><tr><th></th><th>designation</th><th>ang_sep</th><th>phot_g_mean_mag</th></tr><tr><td>1</td><td>"Gaia DR3 2086636884980514304"</td><td>1.16249e-6</td><td>13.1585</td></tr><tr><td>2</td><td>"Gaia DR3 2086636884980516352"</td><td>0.00113298</td><td>16.9005</td></tr><tr><td>3</td><td>"Gaia DR3 2086636880679498368"</td><td>0.00329465</td><td>19.2201</td></tr><tr><td>4</td><td>"Gaia DR3 2086636781896286848"</td><td>0.00522366</td><td>20.9022</td></tr><tr><td>5</td><td>"Gaia DR3 2086636781896284032"</td><td>0.00640138</td><td>20.8635</td></tr><tr><td>6</td><td>"Gaia DR3 2086636781896289920"</td><td>0.00698751</td><td>20.3478</td></tr><tr><td>7</td><td>"Gaia DR3 2086636983758720384"</td><td>0.00789561</td><td>20.3366</td></tr><tr><td>8</td><td>"Gaia DR3 2086636919335289344"</td><td>0.00821842</td><td>20.8711</td></tr></tbody></table>

<pre class='language-julia'><code class='language-julia'>df_ex1.sy_kepmag[row_to_study]</code></pre>
<pre class="code-output documenter-example-output" id="var-hash125620">15.342</pre>


<div class="markdown"><h2>Questions?</h2></div>





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




<pre class='language-julia'><code class='language-julia'>begin
    nexsci_query_base_url = "https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query="
    gaia_query_base_url = 
    "https://gea.esac.esa.int/tap-server/tap/sync?REQUEST=doQuery&LANG=ADQL&FORMAT=csv&QUERY="
end;</code></pre>












<div class="markdown"><p><code>select_cols_for_tap(cols)</code></p><p>Returns a string of comma-separated columns names from a vector of columns names (as either strings or symbols), for using in a TAP query.</p></div>
<div class='manifest-versions'>
<p>Built with Julia 1.11.4 and</p>
CSV 0.10.15<br>
DataFrames 1.7.0<br>
HTTP 1.10.15<br>
PlutoTeachingTools 0.3.1<br>
PlutoUI 0.7.61<br>
Query 1.0.0
</div>

<!-- PlutoStaticHTML.End -->
~~~