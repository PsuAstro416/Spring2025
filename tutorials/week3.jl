### A Pluto.jl notebook ###
# v0.20.4

using Markdown
using InteractiveUtils

# ╔═╡ 1f4b4c8c-fee3-4e9b-a650-30b73db58a77
# hideall
using PlutoUI, PlutoTeachingTools

# ╔═╡ 24ac7416-ed2f-44ae-88b2-0b7944c46a6c
#hideall
begin
  title = "Data Science Applications to Astronomy";
  topic = "Model Building I"
  subtopic = "Probability"
  week = 3
end;

# ╔═╡ 7c5224a8-ab22-487a-8336-07e520f8c8f6
# hideall
md"""
+++
title =$topic
week_num = $week
+++
"""  |> Base.Text;

# ╔═╡ bf5a7be5-b5bb-4d2f-92b2-3f45528b94bf
md"""
#### $title
# Week $week: $topic
## $subtopic
"""

# ╔═╡ 6e391d26-008c-4dee-b0d6-5b031e1ea7c7
TableOfContents()

# ╔═╡ fe2f5bef-44b8-4b3b-9a53-f0de97e74018
md"""
# Terminology
"""

# ╔═╡ 235b2ed8-b82c-4697-a5c4-d06d69f173ea
md"""
# Model
## Scientific Model vs Statistical Model
- What are the differences?

## Scientific Model
- Describes what's happening, irrespective of our measurements
- Can be extremely well tested or highly uncertain

## Statistical Model
- Describes process for generating data
- Inevitably includes assumptions
- Reecognizes that uncertainy is inevitable
 
### Think of example sources of uncertainty
- pause
"""

# ╔═╡ 692dd077-6af8-46fb-aaac-bfdc9d35a3dd
md"""
## Example Scientific Models
- Newton's equation of motion & gravitation
- Keplerian motion of planets
- Salpeter initial mass function for stars
- ΛCMD model for growth of large scale structure

## Example Statistical Models
- Gaussian or Normal distribution for measurement uncertainties
- Poisson distribution for number of photons hitting detector given expected photon rate
- Binomial distribution for number of "successes" given number of trials and probability of success
"""

# ╔═╡ 0cb84e29-c874-4a30-aaea-bf2d57fa7bb0
blockquote(md"All models are wrong, but some are useful.", md"-- [George Box](https://en.wikipedia.org/wiki/All_models_are_wrong)")

# ╔═╡ 0a04bbbf-0a78-4b1e-8003-a7a5e12beace
md"""
### What is a (good) model useful for?
- Making predictions
- Incorporating new data to refine one's knowledge
- Planning future science
"""

# ╔═╡ 81d8f7ae-e579-429b-a1ca-f587183ed985
md"""
#### Why are all models wrong?
- pause
"""

# ╔═╡ de283d10-ce96-11ef-1f04-f35f70350b2b
md"""
# Probability
- Multiple definitions and use cases
- Surprisingly deep philosophical question
- We'll adopt a [Bayesian interpretation of probability](https://en.wikipedia.org/wiki/Bayesian_probability)
- We'll start with the Objective Bayesian interpretation of probability
- Later we'll discuss the Subjective Bayesian interpretation

Objective Bayesian
- Formalization of quantiative logic
- Results of statistical inference depend only on the model and the data
"""

# ╔═╡ d03b6a2c-ef53-481c-9284-75be3483b921
md"""
## Probability Function
- Assigns a weight to each possible event/outcome of an experiment or observation.
"""

# ╔═╡ c3573769-4b4b-4ff7-a293-7fc226b114d5
md"""
### Probability Mass Function
- For discrete events/outcomes
- Examples:  (pause to ask class)

## Examples of Probability Mass Functions
  - Flip coin:  heads (H) or tails (T).  P(H) = P(T) = ½ 
  - Roll an n-sided die:   P(V) = $\frac{1}{n}$
  - Inspect locations a globe asking land or water:  

$p(\mathrm{Water}) = w$ 

$p(\mathrm{Land}) = 1-w$
"""

# ╔═╡ f10bda05-aaa2-4ad3-95df-2966dea569fa
md"""
## Axioms of Probability
- Non-negativity: $p(E)\ge0$
- Sum to unity:  $\sum_i p(E_i) = 1$ for complete list of possible events
- Sum of probabilities of mutually exclusive events: $p(\bigcup_i E_i) = \sum_i p(E_i)$
"""

# ╔═╡ 77a3192e-97c3-4b5f-9c83-cb488e5f7a4c
md"""
## Probability Density Function (PDF)
- Allows for continuous events/outcomes
- Examples: (ask class)
"""

# ╔═╡ 64b6f9a8-be12-4fb1-b46b-7023e0fb28a8
md"""
## Examples of Probability Density Functions
- Fraction of a planet covered with water: $p(w)$
- Mass of a star:  $p(M_\star)$
- Luminosity of a star:  $p(L_\star)$
- Value of future measurement of flux from a star:  $p(f_{\star,obs})$ 
"""

# ╔═╡ 5d1ce928-4923-408c-9a0c-ccb6e5674616
md"""
## Probability function is about the state of knowledge. 
#### It is not an intrinsic property of the system.
"""

# ╔═╡ cb2de54f-2625-4a14-94d7-65b120c41995
md"""
## Likelihood function ($\mathcal{L(\theta)}$)
- Probability distribution for the outcome of an experiment/observation that was made in the past, ignoring any current knowledge about the actual outcome.
- A likelihood is a probability density function.  
- Not all PDFs are likelihoods.
- Likelihood function assumes a statistical model (commonly written $\mathcal{M}$).
- Models often have parameters (commonly written as $\theta$)
- Likelihood function often written: $\mathcal{L}(\theta)$ or $\mathcal{L_M}(\theta)$

####  Scientists often perform inference based on $\mathcal{L(\theta)}$
- E.g., Maximum Likelihood Estimate 
$\hat{\theta}_{\mathrm{MLE}} = \mathrm{argmax}_\theta \, \mathcal{L(\theta)}$
"""

# ╔═╡ 01f95803-6dea-4ebb-a614-967377fcb78b
tip(md"""
- The MLE is useful tool for your toolbox.  
- For some models there are very efficienct methods for computing $\hat{\theta}$.
- However, it is just a point estimate.
- Be careful when many parameters, few observations, large uncertainties.
- We'll use MLE as a short cut or starting point for more rigorous analysis.
""")

# ╔═╡ e7c929bf-2458-4056-8a77-ec04c2119d3d
md"""
# Conditional Probability
- Consider two events:                              $A$ & $B$
- Let each event have its own probability function: $p(A)$ & $p(B)$ 
- **[Joint probabilty](https://en.wikipedia.org/wiki/Joint_probability_distribution)** of both events:              $p(A,B)$   
- **[Conditional probability](https://en.wikipedia.org/wiki/Conditional_probability)** of $A$ given $B$:     $p(A|B)$ 
- Axiom of Conditional Probability:
  $p(A,B) = p(A) \, p(B|A)$ 
- Alternatively could write Conditional probability of $B$ given $A$:         $p(B|A) = p(B) \, p(A|B)$ 
   """

# ╔═╡ bdb9af02-ee4a-48a5-b58e-6a00308f1008
md"""
$(RobustLocalResource("https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Multivariate_normal_sample.svg/450px-Multivariate_normal_sample.svg.png","450px-Multivariate_normal_sample.svg.png",:width=>400))
-- Image Credit: [Wikipedia](https://en.wikipedia.org/wiki/Joint_probability_distribution#/media/File:Multivariate_normal_sample.svg) [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0)
"""

# ╔═╡ 02129b94-55ee-49e2-80b4-2a0fc27c7670
md"""
## Bayes Theorem
Start with Law of Conditional Probability:

$p(A,B) = p(A) p(B|A) = p(B) p(A|B)$

OR we might explicitly writeout the asumption of using model $M$:

$p(A,B|M) = p(A|M) p(B|A,M) = p(B|M) p(A|B,M)$

Substitute 
- A → $\theta$: model parameters
- B → $D$: observed data 
- [**Prior PDF**](https://en.wikipedia.org/wiki/Prior_probability) for model parameters $p(\theta|M)$ for $p(A)$ 
- Likelihood for observed data given model $\mathcal{L} = p(D|\theta, M)$ for $p(B)$
into joint probability for both model parameters and observed data given the model $M$
$p(D, \theta, M )$.
 
$p(\theta, D, M) = p(\theta | M) p(D | \theta, M ) =  p(D | M ) p( \theta| M, D)$ 

Solve for $p( \theta| M, D)$:

$p( \theta| M, D) = \frac{p(\theta | M) p(D | \theta, M )}{p(D | M )}$ 

#### Interpretation of Bayes Theorem:
$\mathrm{(Posterior)} = \mathrm{(Prior)} \times \mathrm{(Likelihood)} / \mathrm{(Evidence)}$
"""

# ╔═╡ d4cb86b5-5df5-49a3-ad2f-85d456084ee2
md"""
#### Evidence term is often hard to calculate
- Evidence is sometimes refered to as the "fully marginalized likelihood"
##### Discrete case:
$p(D | M ) = \sum_{i} p(\theta_i|M) p(D|\theta_i,M)$
##### Continuous case:
$p(D | M ) = \int d\theta \, p(\theta|M) p(D|\theta,M)$

"""

# ╔═╡ 93e8268d-13b3-40f0-ab4d-3cdc42d12464
md"""
## Bayesian Inference
- Bayesian inference about model parameters is based on the [**posterior probability distribution**](https://en.wikipedia.org/wiki/Posterior_probability). 
- Ideally, one uses the full posterior distribution.
- Often, is can be helpful to summarize the posterior:  
   + Approximate posterior distribution with a [**Normal Distribution**](https://en.wikipedia.org/wiki/Normal_distribution)
   + Maximunm *a posteriori* Estimator (MAP): $$\hat{\theta}_{\mathrm{MAP}} = \mathrm{argmax}_\theta \, p(\theta ) \, \mathcal{L(\theta )}$$ 
   + Fischer Information Matrix: Curvature of $p(\theta|D,M)$ evaluated at MAP

$I_{i,j} = \left. \frac{\partial}{\partial \theta_i} \frac{\partial}{\partial \theta_j} \log p(\theta|D,M) \right|_{\hat{\theta}_{MAP}}$ 
- For many cases if you have a large, high-quality datasets and a model with few parameters, then the posterior distribution may be well approximated by a Gaussian Distribution, and  $\hat{\theta}_{\mathrm{MAP}} \approx \hat{\theta}_{\mathrm{MLE}}$.
- However, there are also plenty of times when:
  + MAP & MLE differ
  + MAP & MLE throws away infortant information about uncertainties.
  + Posterior might not be well approximated by a Gaussian (e.g., skewed, not unimodal).
- We want to build a toolbox that can work in both regimes.
"""

# ╔═╡ 21c7ccc3-2bad-4d6e-b03f-3a78bb19ef16
md"""
# Simplified Bayesian Model Building
## Steps
1. Develop a statistical model describing how your data are generated.  This dictates the likelihood function and model parameters.
2. Choose prior distributions
3. Perform computations to estimate (or sample from) the posterior distribution.
4. Make decisions based on posterior distribution.
"""

# ╔═╡ 0044b980-d515-4ad1-be8f-cbc7393651bf
md"""
# Example Application
"""

# ╔═╡ 2c514d9f-3c1d-493f-9ec9-02cf523bbe57
md"""
## Bayesian vs Frequentist approaches
- What are pros/cons?
"""

# ╔═╡ ea483b33-2c65-4f6d-b27f-1a8cb1b2df4e
aside(question_box(md"Has anyone taken a course or been part of a project that emphasized Frequentist approach?"))

# ╔═╡ 7bd07b0e-5caa-45f6-a704-504a8eb6a9c4
#hideall
md"""
# Setup & Helper Functions
"""

# ╔═╡ 40419686-4d7e-4dea-8c29-735f04049f40
WidthOverDocs()

# ╔═╡ bb25b929-6f60-4a6c-b405-553edabb047a
md"""
## Axioms of Conditional Probability
$p(A|B)\ge0, \; \; \mathrm{if} \, p(B)>0$.

$\sum_i p(A_i|B) = p(B)$ 

$p(\bigcup_i A_i | B) = \sum_i p(A_i | B)$
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoTeachingTools = "~0.3.1"
PlutoUI = "~0.7.60"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.2"
manifest_format = "2.0"
project_hash = "4864acce42edfc17b8e3acfe1a812327b4e2b65e"

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
# ╟─24ac7416-ed2f-44ae-88b2-0b7944c46a6c
# ╟─7c5224a8-ab22-487a-8336-07e520f8c8f6
# ╟─bf5a7be5-b5bb-4d2f-92b2-3f45528b94bf
# ╟─6e391d26-008c-4dee-b0d6-5b031e1ea7c7
# ╟─fe2f5bef-44b8-4b3b-9a53-f0de97e74018
# ╟─235b2ed8-b82c-4697-a5c4-d06d69f173ea
# ╟─692dd077-6af8-46fb-aaac-bfdc9d35a3dd
# ╟─0cb84e29-c874-4a30-aaea-bf2d57fa7bb0
# ╟─0a04bbbf-0a78-4b1e-8003-a7a5e12beace
# ╟─81d8f7ae-e579-429b-a1ca-f587183ed985
# ╟─de283d10-ce96-11ef-1f04-f35f70350b2b
# ╟─d03b6a2c-ef53-481c-9284-75be3483b921
# ╟─c3573769-4b4b-4ff7-a293-7fc226b114d5
# ╟─f10bda05-aaa2-4ad3-95df-2966dea569fa
# ╟─77a3192e-97c3-4b5f-9c83-cb488e5f7a4c
# ╟─64b6f9a8-be12-4fb1-b46b-7023e0fb28a8
# ╟─5d1ce928-4923-408c-9a0c-ccb6e5674616
# ╟─cb2de54f-2625-4a14-94d7-65b120c41995
# ╟─01f95803-6dea-4ebb-a614-967377fcb78b
# ╟─e7c929bf-2458-4056-8a77-ec04c2119d3d
# ╟─bdb9af02-ee4a-48a5-b58e-6a00308f1008
# ╟─02129b94-55ee-49e2-80b4-2a0fc27c7670
# ╟─d4cb86b5-5df5-49a3-ad2f-85d456084ee2
# ╟─93e8268d-13b3-40f0-ab4d-3cdc42d12464
# ╟─21c7ccc3-2bad-4d6e-b03f-3a78bb19ef16
# ╟─0044b980-d515-4ad1-be8f-cbc7393651bf
# ╟─2c514d9f-3c1d-493f-9ec9-02cf523bbe57
# ╟─ea483b33-2c65-4f6d-b27f-1a8cb1b2df4e
# ╟─7bd07b0e-5caa-45f6-a704-504a8eb6a9c4
# ╟─40419686-4d7e-4dea-8c29-735f04049f40
# ╟─1f4b4c8c-fee3-4e9b-a650-30b73db58a77
# ╟─bb25b929-6f60-4a6c-b405-553edabb047a
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
