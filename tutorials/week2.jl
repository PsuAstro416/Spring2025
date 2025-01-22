### A Pluto.jl notebook ###
# v0.20.4

#> [frontmatter]
#> license_url = "https://creativecommons.org/licenses/by/4.0/"
#> image = "https://avatars.githubusercontent.com/u/184952350"
#> title = "Course Logistics & Overview, Exploratory Data Analysis"
#> date = "2025-01-13"
#> tags = ["astro416", "logistics", "overview", " Exploratory Data Analysis"]
#> description = "Astro 416: Week 1"
#> license = "CC-BY-SA-4.0"
#> 
#>     [[frontmatter.author]]
#>     name = "Eric Ford"

using Markdown
using InteractiveUtils

# ╔═╡ 66eaf0bf-79e3-43b4-80a8-cb75971feceb
begin
	using PlutoUI, PlutoTeachingTools
end

# ╔═╡ 39aca95d-6e93-4e18-8789-0928e881d3d9
# hideall
begin
	title = "Data Science Applications to Astronomy";
	week = 2
	topic = "Exploratory Data Analysis"
end;

# ╔═╡ fd7a7050-3b8c-41e3-b75e-3a84d98e4a93
"""
+++
title = "$title"
week = "$week"
topic = "$topic"
+++
""" |> Base.Text;

# ╔═╡ 81a1258f-b31b-4356-aabc-5f9a0e831b39
md"""
#### $title
# Week $week: $topic
"""

# ╔═╡ 19d8ddbc-0ad0-4933-af0e-b970d1bb3a93
md"""
# Exploratory Data Analysis

## Overview
1.  Choose data to explore 
1.  Ingest data
1.  Validate data
1.  Clean data
1.  Describe/Visualize data
1.  Identify potential relationships in data
1.  Make a plan for investigating potential relationships quantiatively
"""

# ╔═╡ 596a20fb-b146-442f-b5ac-2d875c6390eb
md"""
## Choose data to Explore
### Classical Astronomy approach:
1.  Idenitfy a scientific problem
1.  Decide what data is needed
1.  Request telescope time
1.  Keep revising and resubmitting until your proposal is selected
1.  Conduct observations
1.  Ingest data you collect

## Can you think of another approach to astronomy research?
- pause

## Other styles of Astronomy Research
### Classical archival science approach:
1.  Idenitfy a scientific problem
1.  Decide what data is needed
1.  Learn about/query multiple surveys/datasets that might have data to address your question. 
1.  Prioritize which to consider first
1.  Query archive(s) to ingest data others collected.

### Survey-science key-project approach:
1.  Idenitfy a scientific problem
1.  Decide what data is needed
1.  Obtain funding
1.  Build observatory, telescope, detector, software pipeline, archive, etc. to meet your specifications
1.  Conduct survey (observations, calibration, data reduction, archiving, etc.)
1.  Query database(s) to ingest data from survey
1.  Release data to public

### Survey-science ancillary science approach:
1.  Identify exciting dataset(s)
1.  Learn about how they were collected, limitations, uncertainties, biases, etc.
1.  Decide if they has the potential to addres your science question
1.  Query database(s) to ingest data being collected for other reasons

### Many variations
-  Spectrum of approaches for how to identify questions/datasets
-  Combine survey, archival and targeted approaches to address a common question.
"""

# ╔═╡ 2f43220d-18ff-45fd-a699-b56f10c2da2b
md"""
# Stages of Exploratory Data Analysis
## Ingest Data
- Construct a query
- Download the results of that query
- Store the data locally
- Read the data into memory.
"""

# ╔═╡ 7b27022f-7c38-4747-871e-8c5877e72a6c
tip(md"""
**Options for storing/organizing your data**
- Vectors, Matrices and higher-dimensional arrays
  - Storing many entries (e.g., targets, observation times) that are of the same type and have similar meaning that you'll want to keep together. 
- DataFrames & Tables: 
  - Store multiple types of data for a common set of entries (i.e., same length).
  - Allow efficiently adding/removing columns of data during your analysis.
  - Reduce risk of bookkeeping errors when 
- Databases 
  - Contain multiple tables/dataframes of different lengths
""")

# ╔═╡ e3bb00f4-309f-4818-a153-1ddf2ed31c10
md"""
## Validate Data
- What is the size and shape of the data?
- What are the types of data?
- What are the ranges of values?
- Is there missing data?
- Check if a representative subset of the data is consistent with expectations.
- Are some entries suspiciously discrepant from expectations/other data?
- What is the approximate empirical distribution of value?
- Are values self-consistent?

"""

# ╔═╡ efa904dd-cbac-440e-89cb-e09a9123599c
md"""
## Clean Data
Are some data values:
- missing?
- clearly erroneous? 
- susipicously discrepant from expectations?
- susipicously discrepant from other data?
"""

# ╔═╡ a6452f97-4b5d-4ded-9c6b-75d13975e7b8
tip(md"""
**Any large dataset is likely to have some suspicious data!**
- Could these issues affect my analysis?
- Could these values interfere even exploratory data analysis?
- Should I try to understand my data source better before I proceed?
- Should I fix the issues now or proceed with caution?
   - 80%/20% rule
- If proceeding, how will I make sure that I (and my team) don't forget these concerns?
""")

# ╔═╡ 81c4ed8e-7e3e-42bb-9c70-a95b4dfe0ce1
md"""
## Describe/Visualize Data
- Location: mean, median, mode
- Scale: standard deviation, quantiles, bounds
- Higher-order moments:  skewness, kurtosis, behavior of tails

- Transformations 
  - Linear transformations (shift, scale, rotate)
  - Non-linear transformations for visualization (e.g., log, sqrt)
  - Power transforms to standardize distributions (e.g., Box-Cox transform)  

- Ohter strategies
  - Clamping data to limit effects of outliers
  - Imputing missing data to allow for fast exploratory analysis

- Statistical tests
  - Test for normality
"""

# ╔═╡ 4c1959ab-2695-46c9-84c5-0c3217edf3f5
tip(md"""
- Do you see the qualitative patterns that you're expecting?
- Are there additional patterns that you didn't anticipate?
- Do you really understand the data you're about to analyze?
""")

# ╔═╡ fe1b9315-355f-4641-988d-9fdcef4af440
md"""
## Identify potential relationships in Data

Look for relationships between values:
- For each object
- Across objects
- In space
- In time

### Statistics
- Correlation coefficients
- Rank correlation coefficient
- Dangers of statistics

### Visualizations
- Scatter plot 
- 2-d histograms or density estimates
- Limitations of visualizations
"""

# ╔═╡ 82e983be-5ebf-49d7-875f-a6985a10adb8
md"""## Make a Plan
- Is this question/dataset combination worthy of more of my time?
- Should I consider combining with other dataset(s) to fill gaps?
- What needs to done before begining quantiative analysis?
- What apparent relationships should be evaluted quantiatively?
- What potential concerns should be kept in mind? 
"""

# ╔═╡ bf102453-2a18-4c44-a09b-2ca8fda59833
md"""
# Big Data 
- What counts as "big"?

## What are examples of “Big Data” in Astronomy?
- pause for ideas from class

## Forms of “Big Data” in Astronomy
- Many observations of your target
  + (e.g., flux measured every minute for years)
- Many targets in your survey
  + (e.g., 5 band photometry of $\sim10^7$ galaxies)
- Many types of measurement for each target
  + (e.g., modest number of spectra)
- Computationally expensive physical model
  + (e.g., CMB, cosmic structure)
- Many parameters in models
  + (e.g., neural network)
"""

# ╔═╡ c87c0610-5d5b-4760-ba5b-a8cdda19b144
md"""
## What’s hard about Big Data?
- Pause for input from class

## Examples of challenges applying Big Data to Astronomy
### Domain Scientist (e.g., Astronomer):
- Collecting large & high-quality dataset
- Understanding what processes affect data significantly
### Computer Scientist/IT Professional:
- Storing large volume of data
- Accessing data efficiently
- Computing resources to process large dataset
- Harnessing modern computing capabilities
### Statistician/Data Scientist:
- Usually, simple model are not adequate.
- Correlation does not imply causation (even if it could have been used for prediction)
- Is training data representative of production data?
- Many model parameters
- Potential sensitivity of results to choices for prior, regularization, features, loss function, etc.
### Everyone:
- Data-driven models can be hard to interpret (& explain)
- Communicating results (and their limitations)
- Rapidly evolving toolkits
"""

# ╔═╡ 705acbf3-24e5-449b-97e8-07e2039b8371
md"""
### Finding Middle Ground
This course aims to prepare you to combine the power of:
- Astronomical surveys
- Astrophysical knowledge, and
- Modern data science tools
"""

# ╔═╡ 02a0991e-8ebe-4307-b277-59d39d612c78
md"# Setup & Helper Code"

# ╔═╡ 9a4a6761-8c60-4a7d-92d3-cdfbc85c76d9
WidthOverDocs()

# ╔═╡ ffd38b51-b872-432b-a9bf-7568681d3aa1
TableOfContents(aside=true)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.39"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.2"
manifest_format = "2.0"
project_hash = "40d695968c60ba138af023bee7f9e69c6d7905ed"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.2"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[deps.CodeTracking]]
deps = ["InteractiveUtils", "UUIDs"]
git-tree-sha1 = "7eee164f122511d3e4e1ebadb7956939ea7e1c77"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.3.6"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "b10d0b65641d57b8b4d5e234446582de5047050d"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.5"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"
version = "1.11.0"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.Format]]
git-tree-sha1 = "9c68794ef81b08086aeb32eeaf33531668d5f5fc"
uuid = "1fa38f19-a742-5d3f-a2b9-30dd87b9d5f8"
version = "1.3.7"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "b6d6bfdd7ce25b0f9b2f6b3dd56b2673a66c8770"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.5"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.JuliaInterpreter]]
deps = ["CodeTracking", "InteractiveUtils", "Random", "UUIDs"]
git-tree-sha1 = "10da5154188682e5c0726823c2b5125957ec3778"
uuid = "aa1ae85d-cabe-5617-a682-6adf51b2e16a"
version = "0.9.38"

[[deps.LaTeXStrings]]
git-tree-sha1 = "dda21b8cbd6a6c40d9d02a73230f9d70fed6918c"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.4.0"

[[deps.Latexify]]
deps = ["Format", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Requires"]
git-tree-sha1 = "ce5f5621cac23a86011836badfedf664a612cee4"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.16.5"

    [deps.Latexify.extensions]
    DataFramesExt = "DataFrames"
    SparseArraysExt = "SparseArrays"
    SymEngineExt = "SymEngine"

    [deps.Latexify.weakdeps]
    DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    SymEngine = "123dc426-2d89-5057-bbad-38513e3affd8"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.6.0+0"

[[deps.LibGit2]]
deps = ["Base64", "LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"
version = "1.11.0"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.7.2+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"
version = "1.11.0"

[[deps.LoweredCodeUtils]]
deps = ["JuliaInterpreter"]
git-tree-sha1 = "688d6d9e098109051ae33d126fcfc88c4ce4a021"
uuid = "6f1432cf-f94c-5a45-995e-cdbf5db27b0b"
version = "3.1.0"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.MacroTools]]
git-tree-sha1 = "72aebe0b5051e5143a079a4685a46da330a40472"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.15"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.6+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
version = "1.11.0"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.12.12"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[deps.OrderedCollections]]
git-tree-sha1 = "12f1439c4f986bb868acda6ea33ebc78e19b95ad"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.7.0"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "8489905bcdbcfac64d1daa51ca07c0d8f0283821"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "Random", "SHA", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.11.0"
weakdeps = ["REPL"]

    [deps.Pkg.extensions]
    REPLExt = "REPL"

[[deps.PlutoHooks]]
deps = ["InteractiveUtils", "Markdown", "UUIDs"]
git-tree-sha1 = "072cdf20c9b0507fdd977d7d246d90030609674b"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0774"
version = "0.0.5"

[[deps.PlutoLinks]]
deps = ["FileWatching", "InteractiveUtils", "Markdown", "PlutoHooks", "Revise", "UUIDs"]
git-tree-sha1 = "8f5fa7056e6dcfb23ac5211de38e6c03f6367794"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0420"
version = "0.1.6"

[[deps.PlutoTeachingTools]]
deps = ["Downloads", "HypertextLiteral", "Latexify", "Markdown", "PlutoLinks", "PlutoUI"]
git-tree-sha1 = "8252b5de1f81dc103eb0293523ddf917695adea1"
uuid = "661c6b06-c737-4d37-b85c-46df65de6f69"
version = "0.3.1"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "eba4810d5e6a01f612b948c9fa94f905b49087b0"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.60"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "5aa36f7049a63a1528fe8f7c3f2113413ffd4e1f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.1"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "9306f6085165d270f7e3db02af26a400d580f5c6"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.3"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "StyledStrings", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.Revise]]
deps = ["CodeTracking", "FileWatching", "JuliaInterpreter", "LibGit2", "LoweredCodeUtils", "OrderedCollections", "REPL", "Requires", "UUIDs", "Unicode"]
git-tree-sha1 = "b5e7c125687aa818de948ef8a0b9dc59f043342c"
uuid = "295af30f-e4ad-537b-8983-00126c2a3abe"
version = "3.7.1"

    [deps.Revise.extensions]
    DistributedExt = "Distributed"

    [deps.Revise.weakdeps]
    Distributed = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"
version = "1.11.0"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.1"

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

    [deps.Statistics.weakdeps]
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.StyledStrings]]
uuid = "f489334b-da3d-4c2e-b8f0-e476e12c162b"
version = "1.11.0"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
version = "1.11.0"

[[deps.Tricks]]
git-tree-sha1 = "7822b97e99a1672bfb1b49b668a6d46d58d8cbcb"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.9"

[[deps.URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.59.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+2"
"""

# ╔═╡ Cell order:
# ╟─39aca95d-6e93-4e18-8789-0928e881d3d9
# ╟─fd7a7050-3b8c-41e3-b75e-3a84d98e4a93
# ╟─81a1258f-b31b-4356-aabc-5f9a0e831b39
# ╟─19d8ddbc-0ad0-4933-af0e-b970d1bb3a93
# ╟─596a20fb-b146-442f-b5ac-2d875c6390eb
# ╟─2f43220d-18ff-45fd-a699-b56f10c2da2b
# ╟─7b27022f-7c38-4747-871e-8c5877e72a6c
# ╟─e3bb00f4-309f-4818-a153-1ddf2ed31c10
# ╟─efa904dd-cbac-440e-89cb-e09a9123599c
# ╟─a6452f97-4b5d-4ded-9c6b-75d13975e7b8
# ╟─81c4ed8e-7e3e-42bb-9c70-a95b4dfe0ce1
# ╟─4c1959ab-2695-46c9-84c5-0c3217edf3f5
# ╟─fe1b9315-355f-4641-988d-9fdcef4af440
# ╟─82e983be-5ebf-49d7-875f-a6985a10adb8
# ╟─bf102453-2a18-4c44-a09b-2ca8fda59833
# ╟─c87c0610-5d5b-4760-ba5b-a8cdda19b144
# ╟─705acbf3-24e5-449b-97e8-07e2039b8371
# ╟─02a0991e-8ebe-4307-b277-59d39d612c78
# ╟─9a4a6761-8c60-4a7d-92d3-cdfbc85c76d9
# ╟─ffd38b51-b872-432b-a9bf-7568681d3aa1
# ╟─66eaf0bf-79e3-43b4-80a8-cb75971feceb
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
