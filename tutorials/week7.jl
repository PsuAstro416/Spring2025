### A Pluto.jl notebook ###
# v0.20.1

using Markdown
using InteractiveUtils

# ╔═╡ 77b4bba0-f05e-11ef-229b-61ef4b690f5e
# hideall 
begin
	using PlutoUI, PlutoTeachingTools
	using BenchmarkTools
	using StaticArrays
end

# ╔═╡ 4b11c897-b45f-4852-bf85-caed6d1e79dc
md"""
### Astro 416
# Week 7: Review for Exam 
"""

# ╔═╡ a4b4d437-420d-439e-8c1a-13115b3a5dc7
# hideall 
TableOfContents()

# ╔═╡ 01565ff9-05d2-478a-9711-9c998fcd0ee8
md"# Stack/Heap"

# ╔═╡ 53c5d63f-4a1b-4bea-a3a9-26a4ad73324f
question_box(md"""How does a programmer specify whether their variables are stored in stack or heap? What programming techniques/constructs allow for this control?""")

# ╔═╡ 49657f9a-5a81-4c50-929a-1502a2c560da
begin
	# Type is Float64, size is fixed and known at compile time
	x_stack = 5.0      
	sum_stack = 0.0
	
	# Type is Vector{Float64}, size is variable
	x_heap = fill(5.0, 1)   
	sum_heap = fill(0.0, 1)
end

# ╔═╡ 76a49969-70ad-4653-84d5-a3d8fd2af0f5
function sum_stack!(sum, x, n)
	sum = 0
	for i in 1:n sum += x end
	sum
end

# ╔═╡ edddea2c-0388-4f33-aa79-bcd1c28d84e2
function sum_sqrt_stack!(sum, x, n)
	sum = 0
	for i in 1:n sum += sqrt(x) end
	sum
end

# ╔═╡ d9d95dc5-ab88-4c2a-b316-593b0500d35b
function sum_array!(sum, x, n)
	sum[1] = 0
	for i in 1:n sum[1] += x[1] end
	sum[1]
end

# ╔═╡ bde7f7b8-3462-4841-b340-e6c5303a19eb
function sum_sqrt_array!(sum, x, n)
	sum[1] = 0
	for i in 1:n sum[1] += sqrt(x[1]) end
	sum[1]
end

# ╔═╡ 4178acc6-b255-4390-b249-72220034433f
md"""
### Sum of values
"""

# ╔═╡ 346c19ec-c946-441d-9d87-95ac711a07eb
@benchmark sum_stack!($sum_stack, $x_stack, 10_000_00)

# ╔═╡ aaf6f80d-f9a7-4197-90a3-ea23823f2dba
@benchmark sum_array!($sum_heap, $x_heap, 10_000_000)

# ╔═╡ 44eb6ff3-8d56-4b9d-b7a6-c39bcfcfc948
md"""
### Sum of sqrt's
"""

# ╔═╡ f0161220-18d8-4a76-9bc5-ad20e0f69bcd
@benchmark sum_sqrt_stack!($sum_stack, $x_stack, 10_000_00)

# ╔═╡ 8daf1bf7-a97e-45d2-a411-9ea593376edb
@benchmark sum_sqrt_array!($sum_heap, $x_heap, 10_000_000)

# ╔═╡ 1005c376-18bc-47c7-8d62-6f94e97aaa89
md"""
### Using a fixed-size array (via StaticArrays.jl)
"""

# ╔═╡ d33a68b8-b81e-48c3-9acc-87f2583cbf6e
begin
	x_fixed_size = MVector{3,Float64}(5.0,6.0,7.0)
	sum_fixed_size = MVector{1,Float64}(0.0,)
end

# ╔═╡ 157cbbcc-316c-4ebf-9834-5d476cb3ab1e
@benchmark sum_array!($sum_fixed_size, $x_fixed_size, 10_000_00)

# ╔═╡ 109dcdce-ff6c-416b-9e50-513d38c0939a
@benchmark sum_sqrt_array!($sum_fixed_size, $x_fixed_size, 10_000_00)

# ╔═╡ 97e2ef33-9767-4f93-8ffe-d091f63778d0
md"# Lab"

# ╔═╡ ae4ed451-2c15-4ffc-9c95-6ba4ca016ba1
question_box(md"""Could you please explain why the benchmark numbers at the start of the lab keep changing so much, and by big margins?If these numbers are not static, how should we go about calculating and estimating the read and write times?""")

# ╔═╡ 5c6a3c9e-ce66-409f-b152-9eabbbc6ce68
md"# File formats"

# ╔═╡ b055904a-6e5c-42a9-bd17-5dd4f9937669
question_box(md"Besides CSV, JLD2, and FITS, are there any other popular/commonly used file formats in physics/astro/data science?")

# ╔═╡ 5b07206e-e950-4847-a77e-cb28f40beb55
question_box(md"Are there many others that can streamline different data types?")

# ╔═╡ d8377520-42e4-4c8b-ac83-7599297be7f4
question_box(md"How can HDF5/JLD2 files have the same size as CSV files if they also store all the metadata info?")

# ╔═╡ 2b53030f-ec1f-4155-9271-e67704cdb324
md"# Queries"

# ╔═╡ 19df6054-2697-4c36-98bf-f7898600673b
question_box(md"""What’s the best practice in Julia for handling errors or timeouts when querying an ADQL service? 

Should I use Julia’s try-catch blocks, or are there any more efficient methods for managing these cases?""")

# ╔═╡ 8909bdbb-abf9-450e-9568-fb372503d6f5
md"# Exam"

# ╔═╡ 7c7d2fde-97d3-4cb6-a167-e3463b70d403
question_box(md"Until what point in the course content will the test cover?")

# ╔═╡ ed451d50-0c42-441d-9c1a-ca67e73e8c7b
md"""
- Lessons from Weeks 1-6
- Labs 1-5
"""

# ╔═╡ 33226f98-6c85-4224-ab14-e5474776dc10

question_box(md"""What types of question would be asked - theory or coding?
""")

# ╔═╡ 36bc1fde-2c23-42f6-9836-611dbc86bff5
md"""
- I won't ask you to write code.
- I will likely ask you to read code, figure out what it does, and explain choices/alternatives.
"""

# ╔═╡ cae588d9-4911-4497-95f8-6336bd15c034
question_box(md"What types of questions will be on the exam? In particular, is it going to include multiple choice, short answer, true/false, etc?")

# ╔═╡ 5bd36427-c226-42d5-b630-d701ffe4b3b2
md"Some short answer (1-3 sentances), some multiple choice."

# ╔═╡ 95bf5725-4acb-4a64-b18b-557f07f57854
question_box(md"Should I study the notes from lectures as well as the past labs?")

# ╔═╡ 4ea92490-e4f6-4099-9749-b9237e1c747a
question_box(md"Should you focus more on studying the labs or the lessons?")

# ╔═╡ 0dec150b-0ae5-4d51-8cc9-a2a226b37540
md"""
- I'll try to draw from both.  
- If you've already spent several times longer thinking about the labs than the lessons, then it might make sense to spend more time review your notes from Mondays.
"""

# ╔═╡ 0aa6eb92-70af-41ba-b3ef-8e075553dc8e
question_box(md"Are there any specific topics that I should focus on while studying?")

# ╔═╡ 78a3f9b8-e191-41b4-9059-c8c932885c76
md"""
- Topics that I planned more than the less structured questions from you all.
- When a student asked to clarify something I already discussed, then that's probably a sign it's both important and potentially confusing.
"""

# ╔═╡ 1dde318c-8714-4439-852b-aa42e8494cc3
md"""
# New questions for Monday
"""

# ╔═╡ 96b0d417-acdb-40c4-92c6-6ba973309c35
md"""
## First-principles vs Machine learning approaches
"""

# ╔═╡ 1e4f97ab-b656-4605-badf-9b8a6b73a976
question_box(md"""Could you compare the first principles approach with the machine learning approach, and explain when it is appropriate to use each?""")

# ╔═╡ 2c1f84c9-aac4-4e6b-b800-fbe6ff22f79c
blockquote(md"Are the specific values of  model parameters more likely to be of scientific interest when applying a first-principles approach or a machine learning approach to modeling data?  Explain your reasoning.")



# ╔═╡ 8de6edc1-d0bf-4dbb-a75b-db1367e0133b
blockquote(md"Imagine that you would like to predict the trajectory of a newly discovered Kuiper belt object based on 6 previous observations, so that you can schedule observations next year.  Would this problem be better suited to a first-principles or machine learning approach?  Explain your reasoning.")



# ╔═╡ a74938fa-a406-46d5-bac0-078c29ab6fc2
blockquote(md"Imagine that you would like to predict the absolute magnitude of the brightest galaxy in a galaxy cluster using its surface brightness, effective radius and redshift and data on similar galaxies from the Sloan Digital Sky Survey (SDSS).  Would this problem be better suited to a first-principles or machine learning approach?  Explain your reasoning.")

# ╔═╡ a86babfc-e061-4317-9bd3-3cbe39d666d0
md"""
## Bayesian inference
"""

# ╔═╡ 356667b7-cb2f-4b07-949f-18fa8f1ef91f
question_box(md"""Can we do a quick 2 minute review on Bayesian statistics?""")

# ╔═╡ 371771cd-7f36-42a1-bbce-12ea75362267
md"""
$p( \theta| M, D) = \frac{p(\theta | M) p(D | \theta, M )}{p(D | M )}$
"""

# ╔═╡ 983ae94d-8720-4989-87d1-006353fa3699
hint(md"""
$\mathrm{(Posterior)} = \mathrm{(Prior)} \times \mathrm{(Likelihood)} / \mathrm{(Evidence)}$
""")

# ╔═╡ 13becab2-f716-4384-b31e-c810f05e6ffe
blockquote(md"When applying an explanatory model in a Bayesian statistical framework, inferences about the values of model parameters are primarily based on the:
1. Prior PDF
2. Likelihood function
3. Posterior PDF
4. Posterior predictive PDF
5. Fully marginalized likelihood
6. Evidence
7. Bayes Factor
")

# ╔═╡ 81bceba6-75f7-4777-afda-22bc74b9f350
md"""
The next questions will be about the following Turing model:
```julia
@model function model(v, d_obs, σ_d_obs)
    @assert size(v) == size(d_obs) == size(σ_d_obs)
    H₀ ~ LogNormal(log(100), 1.0)
    d_true = v / H₀
    d_obs ~ MvNormal(d_true, σ_d_obs)
end
model_given_data = model(v, dₗ, σ_dₗ)
chain = sample(model_given_data, NUTS(0.65))
```
"""

# ╔═╡ 7213ee0c-aa27-42cc-a6e6-d50ad194d438
blockquote(md"Explain this model in your own words, including the function of each line of code (except ‘end’).
Which line(s) specify the likelihood function?
What line(s) specify prior distribution(s)?")

# ╔═╡ 1a95434c-d1a4-483f-a5b9-e870ec91eb4a
blockquote(md"If you wanted to evaluate the sensitivity of results to different choices for the prior, what changes would you make?  Be sure to specify the line number(s) of code that you’d change.")

# ╔═╡ 27ff3de8-4616-436d-97ef-b8fe612da70d
blockquote(md"""In the statistical modeling of astronomical observations, which one(s) of the following could be a reasonable choice for the prior probability density function:
- A very broad probability distribution that only excludes physically impossible combinations of model parameters. 
- A probability distribution summarizing one’s state of knowledge of model parameters prior to analyzing the most recent set of observations.
- A probability distribution for the outcome of an experiment/observation.
- A function of the data that maximizes the a priori probability.
- The ratio of the posterior probability distribution function over the prior probability distribution function.""")


# ╔═╡ 1af0bfaa-9687-4c2e-bc6c-d278afa36e18
blockquote(md"""Explain the meaning of the posterior predictive distribution in a Bayesian model.""")

# ╔═╡ af88827d-7c31-4a1f-a0b9-b479ff09e2c1
md"""
## Miscellaneous
"""

# ╔═╡ 0a614472-1d23-4c92-ac9e-398bb9204188
question_box(md"""How does the size of data change the models we choose? Most of the time we use giant data sets and then make them smaller but use different approaches. So does size ever play a role?""")

# ╔═╡ 61db28d5-926b-4638-9406-095c69a95a08
blockquote(md"Is having a very large dataset typically more important when applying a first-principles approach or a machine learning approach to modeling data?  Explain your reasoning.")

# ╔═╡ 2706b44c-283b-4cda-ad45-36b7bfa64e3b
md"""
# Pick from list of practice exam questions
"""

# ╔═╡ 9037225c-b08c-4c5d-b1bd-20ed347dfc70
md"# Project"

# ╔═╡ 94b46de7-e386-4d4f-b3a5-98dcceb18e55
question_box(md"How do we choose how much data to download at first if there’s a lot of data but we don’t want to loose too much information?")

# ╔═╡ 072f083c-d065-4f48-b964-f8177c578c30
md"""
- Start small for speed.
- When you realize you need more, increase it.
- Compare results if you double/half the data size
- When selecting the top rows, make sure that the order of the data doesn't create a bias.
"""

# ╔═╡ 978f9166-f992-4db2-b066-9e808d74bccf
question_box(md"How much time should we spend optimizing the dashboard for speed and memory?")

# ╔═╡ fa12c738-fac0-4907-af19-ce55244e2d9c
md"If things run in a few seconds, then the only reason to optimize is to gain experience doing so.  If it takes 30 minutes, then there's more motivation to look for opportunities to improve performance."

# ╔═╡ 374e968c-ccb2-4d10-9097-780c03b09740
md"""
# Setup
"""

# ╔═╡ e4c8eff5-f48d-426d-a908-3434c541327a
# hideall
WidthOverDocs()

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
BenchmarkTools = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
StaticArrays = "90137ffa-7385-5640-81b9-e52037218182"

[compat]
BenchmarkTools = "~1.6.0"
PlutoTeachingTools = "~0.3.1"
PlutoUI = "~0.7.61"
StaticArrays = "~1.9.11"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.2"
manifest_format = "2.0"
project_hash = "cf4d4ecb4383b19c109b7a5568a30e11fc73234d"

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

[[deps.BenchmarkTools]]
deps = ["Compat", "JSON", "Logging", "Printf", "Profile", "Statistics", "UUIDs"]
git-tree-sha1 = "e38fbc49a620f5d0b660d7f543db1009fe0f8336"
uuid = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"
version = "1.6.0"

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

[[deps.Compat]]
deps = ["TOML", "UUIDs"]
git-tree-sha1 = "8ae8d32e09f0dcf42a36b90d4e17f5dd2e4c4215"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.16.0"
weakdeps = ["Dates", "LinearAlgebra"]

    [deps.Compat.extensions]
    CompatLinearAlgebraExt = "LinearAlgebra"

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
git-tree-sha1 = "4bf4b400a8234cff0f177da4a160a90296159ce9"
uuid = "aa1ae85d-cabe-5617-a682-6adf51b2e16a"
version = "0.9.41"

[[deps.LaTeXStrings]]
git-tree-sha1 = "dda21b8cbd6a6c40d9d02a73230f9d70fed6918c"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.4.0"

[[deps.Latexify]]
deps = ["Format", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Requires"]
git-tree-sha1 = "cd714447457c660382fe634710fb56eb255ee42e"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.16.6"

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
git-tree-sha1 = "1833212fd6f580c20d4291da9c1b4e8a655b128e"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "1.0.0"

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
git-tree-sha1 = "cc4054e898b852042d7b503313f7ad03de99c3dd"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.8.0"

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
git-tree-sha1 = "7e71a55b87222942f0f9337be62e26b1f103d3e4"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.61"

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

[[deps.Profile]]
uuid = "9abbd945-dff8-562f-b5e8-e1ebf5ef1b79"
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
git-tree-sha1 = "9bb80533cb9769933954ea4ffbecb3025a783198"
uuid = "295af30f-e4ad-537b-8983-00126c2a3abe"
version = "3.7.2"

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

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "PrecompileTools", "Random", "StaticArraysCore"]
git-tree-sha1 = "02c8bd479d26dbeff8a7eb1d77edfc10dacabc01"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.9.11"

    [deps.StaticArrays.extensions]
    StaticArraysChainRulesCoreExt = "ChainRulesCore"
    StaticArraysStatisticsExt = "Statistics"

    [deps.StaticArrays.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StaticArraysCore]]
git-tree-sha1 = "192954ef1208c7019899fbf8049e717f92959682"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.4.3"

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
git-tree-sha1 = "6cae795a5a9313bbb4f60683f7263318fc7d1505"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.10"

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
# ╟─4b11c897-b45f-4852-bf85-caed6d1e79dc
# ╠═a4b4d437-420d-439e-8c1a-13115b3a5dc7
# ╟─01565ff9-05d2-478a-9711-9c998fcd0ee8
# ╟─53c5d63f-4a1b-4bea-a3a9-26a4ad73324f
# ╠═49657f9a-5a81-4c50-929a-1502a2c560da
# ╠═76a49969-70ad-4653-84d5-a3d8fd2af0f5
# ╠═edddea2c-0388-4f33-aa79-bcd1c28d84e2
# ╠═d9d95dc5-ab88-4c2a-b316-593b0500d35b
# ╠═bde7f7b8-3462-4841-b340-e6c5303a19eb
# ╟─4178acc6-b255-4390-b249-72220034433f
# ╠═346c19ec-c946-441d-9d87-95ac711a07eb
# ╠═aaf6f80d-f9a7-4197-90a3-ea23823f2dba
# ╟─44eb6ff3-8d56-4b9d-b7a6-c39bcfcfc948
# ╠═f0161220-18d8-4a76-9bc5-ad20e0f69bcd
# ╠═8daf1bf7-a97e-45d2-a411-9ea593376edb
# ╟─1005c376-18bc-47c7-8d62-6f94e97aaa89
# ╠═d33a68b8-b81e-48c3-9acc-87f2583cbf6e
# ╠═157cbbcc-316c-4ebf-9834-5d476cb3ab1e
# ╠═109dcdce-ff6c-416b-9e50-513d38c0939a
# ╟─97e2ef33-9767-4f93-8ffe-d091f63778d0
# ╟─ae4ed451-2c15-4ffc-9c95-6ba4ca016ba1
# ╟─5c6a3c9e-ce66-409f-b152-9eabbbc6ce68
# ╟─b055904a-6e5c-42a9-bd17-5dd4f9937669
# ╟─5b07206e-e950-4847-a77e-cb28f40beb55
# ╟─d8377520-42e4-4c8b-ac83-7599297be7f4
# ╟─2b53030f-ec1f-4155-9271-e67704cdb324
# ╟─19df6054-2697-4c36-98bf-f7898600673b
# ╟─8909bdbb-abf9-450e-9568-fb372503d6f5
# ╟─7c7d2fde-97d3-4cb6-a167-e3463b70d403
# ╟─ed451d50-0c42-441d-9c1a-ca67e73e8c7b
# ╟─33226f98-6c85-4224-ab14-e5474776dc10
# ╟─36bc1fde-2c23-42f6-9836-611dbc86bff5
# ╟─cae588d9-4911-4497-95f8-6336bd15c034
# ╟─5bd36427-c226-42d5-b630-d701ffe4b3b2
# ╟─95bf5725-4acb-4a64-b18b-557f07f57854
# ╟─4ea92490-e4f6-4099-9749-b9237e1c747a
# ╟─0dec150b-0ae5-4d51-8cc9-a2a226b37540
# ╟─0aa6eb92-70af-41ba-b3ef-8e075553dc8e
# ╟─78a3f9b8-e191-41b4-9059-c8c932885c76
# ╟─1dde318c-8714-4439-852b-aa42e8494cc3
# ╟─96b0d417-acdb-40c4-92c6-6ba973309c35
# ╟─1e4f97ab-b656-4605-badf-9b8a6b73a976
# ╟─2c1f84c9-aac4-4e6b-b800-fbe6ff22f79c
# ╟─8de6edc1-d0bf-4dbb-a75b-db1367e0133b
# ╟─a74938fa-a406-46d5-bac0-078c29ab6fc2
# ╟─a86babfc-e061-4317-9bd3-3cbe39d666d0
# ╟─356667b7-cb2f-4b07-949f-18fa8f1ef91f
# ╟─371771cd-7f36-42a1-bbce-12ea75362267
# ╟─983ae94d-8720-4989-87d1-006353fa3699
# ╟─13becab2-f716-4384-b31e-c810f05e6ffe
# ╟─81bceba6-75f7-4777-afda-22bc74b9f350
# ╟─7213ee0c-aa27-42cc-a6e6-d50ad194d438
# ╟─1a95434c-d1a4-483f-a5b9-e870ec91eb4a
# ╟─27ff3de8-4616-436d-97ef-b8fe612da70d
# ╟─1af0bfaa-9687-4c2e-bc6c-d278afa36e18
# ╟─af88827d-7c31-4a1f-a0b9-b479ff09e2c1
# ╟─0a614472-1d23-4c92-ac9e-398bb9204188
# ╟─61db28d5-926b-4638-9406-095c69a95a08
# ╟─2706b44c-283b-4cda-ad45-36b7bfa64e3b
# ╟─9037225c-b08c-4c5d-b1bd-20ed347dfc70
# ╟─94b46de7-e386-4d4f-b3a5-98dcceb18e55
# ╟─072f083c-d065-4f48-b964-f8177c578c30
# ╟─978f9166-f992-4db2-b066-9e808d74bccf
# ╟─fa12c738-fac0-4907-af19-ce55244e2d9c
# ╟─374e968c-ccb2-4d10-9097-780c03b09740
# ╟─e4c8eff5-f48d-426d-a908-3434c541327a
# ╠═77b4bba0-f05e-11ef-229b-61ef4b690f5e
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
