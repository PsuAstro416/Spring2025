### A Pluto.jl notebook ###
# v0.20.1

using Markdown
using InteractiveUtils

# ╔═╡ 27a55fd4-5c0d-4b5f-9dd8-3dd04a36dc68
using PlutoUI, PlutoTeachingTools

# ╔═╡ 0131302e-76e6-46fa-89e3-835976588d49
# hideall
begin
  title = "Data Science Applications for Astronomy";
  topic = "Reproducible Research"
  subtitle = ""
  week = 13
end;

# ╔═╡ ac045af9-45d3-4526-8dfd-f3144ba8f89b
# hideall
md"""
+++
title = $topic
subtitle = $subtitle
week_num = $week
+++
"""  |> Base.Text;

# ╔═╡ d1f35ba4-a2da-4d2e-9db9-6b85ba552974
md"""
#### $title
# Week $week: $topic:
#### $subtitle
"""

# ╔═╡ f63b98e1-097d-4a77-a5e8-a66107b9d745
TableOfContents()

# ╔═╡ f6a868cc-90d5-4b8b-b61d-07ec539daa1f
md"""
## What should we expect of science?
- Reproducible
- Replicable
- Valid

Historically, different fields of science have used these terms in different ways.  
As their importance became more widely recognized, the National Academies produced a [report](https://www.nationalacademies.org/our-work/reproducibility-and-replicability-in-science) that attempts to standardize language.  
"""

# ╔═╡ bb1b2266-01e7-4991-ad6e-924309f8d1b5
md"""
## Reproduciblity
> "obtaining consistent results using the same input data, computational steps, methods, and code, and conditions of analysis."
> 
> --- [Reproducibility & Replicability in Science (2019)](https://www.nationalacademies.org/our-work/reproducibility-and-replicability-in-science) 
- Focuses on the reliability of the **computations** and their **implementation**
- If a study isn't reproducible, then there are likely errors that should be corrected.  
- (Some subtleties in the context of stochastic algorithms)
- Minimal requirement for a study to be trusted.
"""

# ╔═╡ 85202f76-d0df-43e8-88e4-0018f1b4ef35
md"""
## Replicablility
> "obtaining consistent results across studies aimed at answering the same scientific question, each of which has obtained its own data” 
>
> --- [Reproducibility & Replicability in Science (2019)](https://www.nationalacademies.org/our-work/reproducibility-and-replicability-in-science) 
- Robustness of a scientific conclusion...   given the researcher's choices (e.g., definition of sample, analysis method), but allowing for natural variations in data.
- Even if a study isn't replicable, the results could still be of high-quality and the study could still be a valuable contribution to the scientific literature.  E.g., 
   - Collecting data is hard/expensive.  An initial study based on a small sample size may hint at a finding that is not supported once a larger dataset is collected.
   - If two studies initially appear to be in disagreement, then a detailed reading of their methods could help someone figure  out what choices led to the difference.
"""

# ╔═╡ 5abc1e1f-3d26-4d7c-881b-d1a17cef69a2
md"""
## Validity
> "obtaining consistent results across studies aimed at answering the same scientific question, each of which has obtained its own data” 
>
> --- [Reproducibility & Replicability in Science (2019)](https://www.nationalacademies.org/our-work/reproducibility-and-replicability-in-science) 
- Robustness of a scientific conclusion

"""

# ╔═╡ 9a8b10b8-5d87-4a5d-96e4-53278dc9b337
md"""
### Making research replicabile & valid is very hard!
> "when a researcher transparently reports a study and makes available the underlying digital artifacts, such as data and code, the results should be computationally reproducible. 
> In contrast, even when a study was rigorously conducted according to best practices, correctly analyzed, and transparently reported, it may fail to be replicated."
>
> --- [Reproducibility & Replicabilitiy in Science (2019)](https://www.nationalacademies.org/our-work/reproducibility-and-replicability-in-science)

"""

# ╔═╡ 708e1d38-1f96-4330-b698-829e2680b4aa
md"""
## Common Barriers to Reproducibility
- Inadequate recordkeeping (e.g., failing to archive data & metadata)
- Availability of data & metadata (e.g., not sharing data)
- Obsolescence of data (e.g., glass plates, digital media, file formats,...)
- Obsolescence of code (e.g., programs, libraries, compilers, OS,...)
- Flaws in attempt to replicate (e.g., lack of expertise, failure to follow protocols)
- Barriers in the culture of research:  resources & incentives
"""

# ╔═╡ 21967ce3-ab1c-4a3e-9740-bac624befbca
md"""
### How is astronomy doing?
#### Good
- Federally funded observatories (and many larger private ones) have archives for their data. 
- Institutional & discipline-specific services for archiving data products: 
  - ScholarSphere & Data Comomons (Penn State)
  - Zenodo (CERN)
  - Dataverse (Harvard)
  - SciServer (JHU)
- FITS format around in 1970s and standardized since 1981.
- Programming languages used for Data Science (e.g., Julia, Python, R) incorporate package managers
- Funding agencies & AAS journals increasingly encourage archiving data, providing and "data behind the figures".

#### Not-so-good
- Smaller, private observatories less likely to have funding to archive data
- Sharing and archiving of higher-level data products, metadata and documentation necessary to make use of them is largely dependent on effort/goodwill of individual research groups.
- Large datasets often need performant file formats that have yet to prove their longevity (e.g., HDF5 became popular around ~2000) 
- Package managers are great when everything works smoothly, but can be painful when different dependancies have conflicting requirements.  
  - Most packages are maintained by a single research group.  If one person is busy/graduates/changes fields, then packages not be maintaned.
  - Most computational R and Python rely on C/C++ or Fortran code underneath that rely on Makefiles that are customized for different architectures by hand.
- Making research reproducible takes serious time and funding.  When there are finite resources, difficult choices have to be made. 
"""

# ╔═╡ c1552a91-2f86-4490-958c-8afa2c00ab2b
md"""
#### Challenges
- When funding gets tight, following "best-practices" is often first thing to go.
- Open-source software was built in culture of trust.  An environment of constant security threats discourages sharing.
"""

# ╔═╡ 86c4afa6-1606-4dd7-a82b-86b08e30b41c
md"""
## Common Barriers to Replicability
- Human error (typically unintentional)
- Misuse of statistical methods
- Publication bias
- Inadequate experimental design
- Inadequate reporting of study protocols
- Incentive system that encourages "significant" results
"""

# ╔═╡ bb7a19f8-8449-46a0-b4fd-fdf1c2589150
md"""
### Failure to Replicate can lead to Scientific Progress! 
- Different research groups can make different, reasonable choices
- One (or more) choices affect results
- Subsequent investigation identifies which choice(s) were responsible for the different outcomes
- Only works if both groups precisely document their choices.
"""

# ╔═╡ 4b139332-bb44-4ac3-8dd9-2090600a3449
md"""
## Who is reproducing & replicating research?
- Original investigator(s) reproducing their own results to convince themselves (most common)
- Original investigator(s) reproducing their own results to convince others (e.g., collaborators, other scientists in the field, or industry/government), particularly if a result is highly surprising or has significant ramifications
- Different investigators (potentially from same or different lab) may attempt to replicate a study using a data set they are collecting as a stepping stone in their research process.
- Different investigators may try to build on a previous study, not succeed, and then decide to try to replicate the previous study to identify why they didn't succeed.
- ["Adversarial Collaborations"](https://web.sas.upenn.edu/adcollabproject/) can be extremely effective.
- Maybe no one.
"""

# ╔═╡ 6eb940bb-365a-4bad-9a75-ce22935211a9
md"""
### Publication bias
- Publishing practices varry substantially by field
- Astronomy is unusual:
   - Relatively few well-respected astronomy journals
   - Each of those has a high acceptance rate.
   - Sometime astronomer publish in multi-disciplinary journals (Nature, Science, Publication of Nataional Academies of Science) with a lower acceptance rate. 
- Many other fields (e.g., biology, economics) have many repsected journals, most with low acceptance rates  
"""

# ╔═╡ 4c909df7-538f-4c0f-9c8e-4f277445afae
question_box(md"How do difference in acceptance rates affect incentives and lead to publication biases?")

# ╔═╡ 2848f7a7-1878-4c7e-a509-af3eece7c0ca
md"""
## Strategies to make your work reproducible
- Make input data publically available (when allowed & ethical)
- Use open-source software for analysis
- Use package manager to completely specify languages, libraries & packages used.
- Provide **container** 
- Version control source code and scripts
- Publish results, tables & figures that were generated by scripts 
- For complex calculations, use workflow management software
- Make code used to generate results public
- Archive code & data
- Provide sufficient documentation for others to reproduce calculations.
- Encourage a team to replicate your results from the documentation you've provided.
"""

# ╔═╡ 8265dc36-55a6-4420-a063-ff5b3c53b088
md"""
### Tools to automate workflows
- Build tools: make, cmake
- Package managers
- Scientific workflows: [Snakemake](https://snakemake.readthedocs.io/en/stable/), Galaxy, Nextflow, BigDataScript, ...
- Containers: [Docker](https://www.docker.com/resources/what-container/#:~:text=A%20Docker%20container%20image%20is,tools%2C%20system%20libraries%20and%20settings.), [Apptainer](https://apptainer.org/),... 
- Example scripts for code/data behind figures in AAS journals: [Showyourwork](https://luger.dev/showyourwork.html)
"""

# ╔═╡ 1048e2eb-37a8-41bb-9f4b-72ad85243e37
md"""
## Dangers of Big Data
-  Multiple testing:  Perform many possible tests (explicitly or "by eye") and then report one that appears to be significant in isolation
-  $p$-hacking:  "the practice of collecting, selecting, or analyzing data until a result of statistical significance is found"  (RRiS 2019)
-  Overfitting:  Over confidence in model performance, especially when applied to out-of-sample data
-  Machine learning models:  Overreliance on optimizing predictive performance using complex models, rather than prioritizing, interpretability and explainability
"""

# ╔═╡ a74af3c1-48e3-4a10-9a99-b473de53e0c2
md"""
## Other relevant terms:
### Rigor
> "the strict application of the scientific method to ensure robust and unbiased experimental design"
>
> NIH 2018 via [Reproducibility & Replicabilitiy in Science (2019)](https://www.nationalacademies.org/our-work/reproducibility-and-replicability-in-science)

### Reliability
> "A predominant focus on the replicability of individual studies is an inefficient way to assure the reliability of scientific knowledge. Rather, reviews of cumulative evidence on a subject, to assess both the overall effect size and generalizability, is often a more useful way to gain confidence in the state of scientific knowledge." 
>
> --- [Reproducibility & Replicabilitiy in Science (2019)](https://www.nationalacademies.org/our-work/reproducibility-and-replicability-in-science)

### Generalizability
> "Generalizability, another term frequently used in science, refers to the extent that results of a study apply in other contexts or populations that differ from the original one."
>
> --- [Reproducibility & Replicabilitiy in Science (2019)](https://www.nationalacademies.org/our-work/reproducibility-and-replicability-in-science)

#### Transparency
"""

# ╔═╡ 6a6f159b-09b1-4a53-bfa9-ffcbe20b94dd
md"""
# Setup/Helper Code
"""

# ╔═╡ a4574030-1a50-4988-a46b-becf718148a5
ChooseDisplayMode()

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.2"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[CodeTracking]]
deps = ["InteractiveUtils", "UUIDs"]
git-tree-sha1 = "7eee164f122511d3e4e1ebadb7956939ea7e1c77"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.3.6"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "b10d0b65641d57b8b4d5e234446582de5047050d"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.5"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"
version = "1.11.0"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[Format]]
git-tree-sha1 = "9c68794ef81b08086aeb32eeaf33531668d5f5fc"
uuid = "1fa38f19-a742-5d3f-a2b9-30dd87b9d5f8"
version = "1.3.7"

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "b6d6bfdd7ce25b0f9b2f6b3dd56b2673a66c8770"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.5"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[JuliaInterpreter]]
deps = ["CodeTracking", "InteractiveUtils", "Random", "UUIDs"]
git-tree-sha1 = "a434e811d10e7cbf4f0674285542e697dca605d0"
uuid = "aa1ae85d-cabe-5617-a682-6adf51b2e16a"
version = "0.9.42"

[[LaTeXStrings]]
git-tree-sha1 = "dda21b8cbd6a6c40d9d02a73230f9d70fed6918c"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.4.0"

[[Latexify]]
deps = ["Format", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Requires"]
git-tree-sha1 = "cd714447457c660382fe634710fb56eb255ee42e"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.16.6"

    [Latexify.extensions]
    DataFramesExt = "DataFrames"
    SparseArraysExt = "SparseArrays"
    SymEngineExt = "SymEngine"

    [Latexify.weakdeps]
    DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    SymEngine = "123dc426-2d89-5057-bbad-38513e3affd8"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.6.0+0"

[[LibGit2]]
deps = ["Base64", "LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"
version = "1.11.0"

[[LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.7.2+0"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"
version = "1.11.0"

[[LoweredCodeUtils]]
deps = ["JuliaInterpreter"]
git-tree-sha1 = "688d6d9e098109051ae33d126fcfc88c4ce4a021"
uuid = "6f1432cf-f94c-5a45-995e-cdbf5db27b0b"
version = "3.1.0"

[[MIMEs]]
git-tree-sha1 = "c64d943587f7187e751162b3b84445bbbd79f691"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "1.1.0"

[[MacroTools]]
git-tree-sha1 = "72aebe0b5051e5143a079a4685a46da330a40472"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.15"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.6+0"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
version = "1.11.0"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.12.12"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[OrderedCollections]]
git-tree-sha1 = "cc4054e898b852042d7b503313f7ad03de99c3dd"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.8.0"

[[Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "8489905bcdbcfac64d1daa51ca07c0d8f0283821"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.1"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "Random", "SHA", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.11.0"
weakdeps = ["REPL"]

    [Pkg.extensions]
    REPLExt = "REPL"

[[PlutoHooks]]
deps = ["InteractiveUtils", "Markdown", "UUIDs"]
git-tree-sha1 = "072cdf20c9b0507fdd977d7d246d90030609674b"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0774"
version = "0.0.5"

[[PlutoLinks]]
deps = ["FileWatching", "InteractiveUtils", "Markdown", "PlutoHooks", "Revise", "UUIDs"]
git-tree-sha1 = "8f5fa7056e6dcfb23ac5211de38e6c03f6367794"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0420"
version = "0.1.6"

[[PlutoTeachingTools]]
deps = ["Downloads", "HypertextLiteral", "Latexify", "Markdown", "PlutoLinks", "PlutoUI"]
git-tree-sha1 = "8252b5de1f81dc103eb0293523ddf917695adea1"
uuid = "661c6b06-c737-4d37-b85c-46df65de6f69"
version = "0.3.1"

[[PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "7e71a55b87222942f0f9337be62e26b1f103d3e4"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.61"

[[PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "5aa36f7049a63a1528fe8f7c3f2113413ffd4e1f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.1"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "9306f6085165d270f7e3db02af26a400d580f5c6"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.3"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "StyledStrings", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"
version = "1.11.0"

[[Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "62389eeff14780bfe55195b7204c0d8738436d64"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.1"

[[Revise]]
deps = ["CodeTracking", "FileWatching", "JuliaInterpreter", "LibGit2", "LoweredCodeUtils", "OrderedCollections", "REPL", "Requires", "UUIDs", "Unicode"]
git-tree-sha1 = "9bb80533cb9769933954ea4ffbecb3025a783198"
uuid = "295af30f-e4ad-537b-8983-00126c2a3abe"
version = "3.7.2"

    [Revise.extensions]
    DistributedExt = "Distributed"

    [Revise.weakdeps]
    Distributed = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"
version = "1.11.0"

[[Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.1"

    [Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

    [Statistics.weakdeps]
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[StyledStrings]]
uuid = "f489334b-da3d-4c2e-b8f0-e476e12c162b"
version = "1.11.0"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
version = "1.11.0"

[[Tricks]]
git-tree-sha1 = "6cae795a5a9313bbb4f60683f7263318fc7d1505"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.10"

[[URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.59.0+0"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+2"
"""

# ╔═╡ Cell order:
# ╟─0131302e-76e6-46fa-89e3-835976588d49
# ╟─ac045af9-45d3-4526-8dfd-f3144ba8f89b
# ╟─d1f35ba4-a2da-4d2e-9db9-6b85ba552974
# ╟─f63b98e1-097d-4a77-a5e8-a66107b9d745
# ╟─f6a868cc-90d5-4b8b-b61d-07ec539daa1f
# ╟─bb1b2266-01e7-4991-ad6e-924309f8d1b5
# ╟─85202f76-d0df-43e8-88e4-0018f1b4ef35
# ╟─5abc1e1f-3d26-4d7c-881b-d1a17cef69a2
# ╟─9a8b10b8-5d87-4a5d-96e4-53278dc9b337
# ╟─708e1d38-1f96-4330-b698-829e2680b4aa
# ╟─21967ce3-ab1c-4a3e-9740-bac624befbca
# ╟─c1552a91-2f86-4490-958c-8afa2c00ab2b
# ╟─86c4afa6-1606-4dd7-a82b-86b08e30b41c
# ╟─bb7a19f8-8449-46a0-b4fd-fdf1c2589150
# ╟─4b139332-bb44-4ac3-8dd9-2090600a3449
# ╟─6eb940bb-365a-4bad-9a75-ce22935211a9
# ╟─4c909df7-538f-4c0f-9c8e-4f277445afae
# ╟─2848f7a7-1878-4c7e-a509-af3eece7c0ca
# ╟─8265dc36-55a6-4420-a063-ff5b3c53b088
# ╟─1048e2eb-37a8-41bb-9f4b-72ad85243e37
# ╟─a74af3c1-48e3-4a10-9a99-b473de53e0c2
# ╟─6a6f159b-09b1-4a53-bfa9-ffcbe20b94dd
# ╟─a4574030-1a50-4988-a46b-becf718148a5
# ╠═27a55fd4-5c0d-4b5f-9dd8-3dd04a36dc68
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
