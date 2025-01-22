### A Pluto.jl notebook ###
# v0.20.1

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
	week = 1
end;

# ╔═╡ fd7a7050-3b8c-41e3-b75e-3a84d98e4a93
"""
+++
title = "$title"
week = "$week"
topic = "Course Overview"
+++
""" |> Base.Text;

# ╔═╡ 81a1258f-b31b-4356-aabc-5f9a0e831b39
md"""
### Welcome to Astro 416: 
# $title
#### Week $week
### $topic
"""

# ╔═╡ ef24c3ba-e027-465d-995f-efc5941843a2
md"""
# Course Logistics
"""

# ╔═╡ d3c6dede-be22-467f-8c81-698ec3448684
#TwoColumn(
md"""
$(RobustLocalResource("https://ecos-appdev-production.s3.amazonaws.com/science_site/s3fs-public/styles/f_story_image/public/2021-01/astro_ford_2.jpg?h=9b93ffa5&itok=BnJbMiNK","../_assets/week1/Ford.jpg", :width=>"50%"))
Instructor: [Eric Ford](https://science.psu.edu/astro/people/ebf11) (Davey Lab 408A) 
"""
#)


# ╔═╡ 8408e3e3-1794-48a4-8ddc-2a393e47cb50
md"""

$(RobustLocalResource("https://ecos-appdev-production.s3.amazonaws.com/science_site/s3fs-public/styles/f_story_image/public/2019-12/astro_pellegrino.jpg?h=97d9446b&itok=yjDNcByF","../_assets/week1/Pellegrino.jpg",:width=>"50%"))
TA: [Andrew Pellegrino](https://science.psu.edu/astro/people/axp1175) (Davey Lab 532C)
"""

# ╔═╡ 2a9bf396-c7a7-4e39-82d9-724b66923510
md"""
## Class workflow (for a typical week) 
- Mondays:  Introduce topic
- Wednesdays:  Start computer lab (bring laptop)
- Fridays:  Discussion (submit question before class)
- Following Monday: (deadline for previous lab)
- Watch Canvas for deivations 
  + e.g., First lab due Wednesday due to MLK day, etc.
"""

# ╔═╡ 19575253-08f8-48f8-b1ec-89b4074b8108
md"""
## Website 
#### [https://psuastro416.github.io/Spring2025/](https://psuastro416.github.io/Spring2025) contains:
- Syllabus
- Info for each week's lessons (e.g., goals, readings & links to additional resources)
- Links & info for to labs/homework exercises.
- Info for class project (e..g, explanation, key due dates, rubric) 
- Practical Tips (e.g., step-by-step instructions for accessing Roar Collab)

### Canvas
- Announcements
- Deadlines for assignments
- Space to upload some assignments (e.g. project checkpoints)
- Links to create your personal GitHub repository for each lab
- Links for TopHat Questions
- Grades
- Most info via embedded version of website 
  + Canvas doesn't allow some pages to be embedded
  + If you get an error, try following that link in a separate window/tab.

### Zoom 
- Backup plan avliable for classes if I'm sick, snowstorm, etc.
"""

# ╔═╡ db79a1cc-0cec-4cae-a24b-d2f4e256eb2c
md"""
## Creating Accounts:
### Roar Collab: 
- Penn State's supercomputer (for non-sensitive data)
- We will use Roar Collab for running labs/homework exercises starting Wednesday (& for class projects)
- Please [request Roar Collab account](http://psuastro416.github.io/Spring2025/tips/roar/create_account/) by end of today.
- Please create a [GitHub account](https://github.com/) (if you don't have one or want to use a separate account for this class)
- I'll walk people through the setup steps for Roar Collab and starting labs this Wednesday, so you need your account to be active _before class on Wednesday_.
"""

# ╔═╡ 6c9684cd-3952-4e01-b3bc-d111d47b48ff
md"""
## TopHat:
- Mostly for you to submit your questions (e.g., "Muddiest point")
- Might also include some short questions about reading or previous class.
- Submit TopHat responces by 9am on day of relevant class.
- Aim for at least 1 question a week.  
- I'll drop a few from grade no questions asked.
- [Create TopHat account](https://success.tophat.com/s/article/Student-Top-Hat-Overview-and-Getting-Started-Guide#accountcreation) in time to submit reading question before class on Friday
   - No need to give them phone number or credit card info.
"""

# ╔═╡ dba2b51e-0dc7-48f2-a975-ead2280dca54
md"""
## Textbook & Readings
- No need to buy a physical textbook.

Several readings from online sources, e.g.: 
- [Julia Data Science](https://www.amazon.com/dp/B09KMRKQ96/) (Storopoli & Huljzer; ISBN-13: 979-8489859165) or [online](https://juliadatascience.io/)
- [Think Julia](https://www.amazon.com/Think-Julia-Like-Computer-Scientist/dp/1492045039) (Lauwens; ISBN: 1492045039) or [online](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html)
- [Bayesian Statistics using Julia and Turing](https://storopoli.github.io/Bayesian-Julia/)
- [Statistical Rethinking](https://www.amazon.com/Statistical-Rethinking-Bayesian-Examples-Chapman/dp/036713991X/ref=sr_1_1?crid=JO8TIWJDRM3S&dib=eyJ2IjoiMSJ9.Mu7bPKmEvkNfw_6ElyUdt2qi8i-8SmH8RIu5GTgt24iKbUl9uYQIpMvYgLFSUrM2V6Pf22PO6NRexuMinM6tUq7KhNfYahpRoyEUsJvBqXc.wHgA4Z-o-84ZOMxDEVyCrTrAk-ssBYTcaGoigWaBs-s&dib_tag=se&keywords=statistical+rethinking+mcelreath&qid=1736349871&sprefix=statistical+reth%2Caps%2C96&sr=8-1) (McElreath ; ISBN-13: 978-0367139919) (free [PDF of Ch 1 & 2](https://xcelab.net/rm/) online) 
"""

# ╔═╡ 4ead033d-0001-4479-86ac-f420ecbf15d3
RobustLocalResource("https://images-na.ssl-images-amazon.com/images/I/41IR7AhnnpL._SX348_BO1,204,203,200_.jpg", "../_assets/week1/JuliaDataScienceCover.jpg", :width=>"50%")

# ╔═╡ 37f0e64b-fc92-4351-8ebb-ae318de7d447
RobustLocalResource("https://images-na.ssl-images-amazon.com/images/I/51IsffDG4jL._SX379_BO1,204,203,200_.jpg","../_assets/week1/ThinkJuliaCover.jpg",:width=>"50%")

# ╔═╡ e9dfdedc-2d04-4f0a-b3c7-707628ab3580
RobustLocalResource("https://xcelab.net/rm/sr2edcover-1-187x300.png","../_assets/week1/StatisticalRethinkingCover.png",:width=>"50%")

# ╔═╡ 502d38bd-8b97-484d-9618-bed479bf648a
md"""
## Safety

- Please err on side of caution 
- Let me know if you'll be missing several classes for health reasons.
- You can still submit TopHat questions, labs, etc.  
- Follow university policy.  As of January 2025:

> Stay home and away from others if you are experiencing fever or respiratory symptoms such as but not limited to cough, sore throat, runny nose, chills, fatigue, headache, body aches. Return to normal activities when, for at least 24 hours, both are true:
> - Your symptoms are getting better overall, AND
> - You have not had a fever (and are not using fever-reducing medication)
> Then, take these additional precautions for the next five days to limit the spread of infection:
> - Wear a well-fitting mask
> - Keep a distance from others and/or
> - Get tested to inform your actions to prevent the spread to others
> If you begin feeling worse and/or fever returns, stay home and away from others for at least 24 hours until both are true:
> - Your symptoms are getting better overall, and
> - You have not had a fever (and are not using fever-reducing medication)


"""

# ╔═╡ bb7cda4e-2876-403f-8194-baa0f33e2ada
md"""
## Academic Integrity
### Collaboration
- Exams/quizzes:  No collaboration.
- Labs:  
  + Collaboration with classmates is encouraged.  
  + Each student should respond to questions individually.
  + Make liberal use of acknowledgments. 
- Project:  
  + Working in teams in strongly encouraged.  
  + Present/submit most parts of project jointly.
  + In separate final reports/reflections, each students describes their contributions to the project accurately and to give credit to teammates for their contributions.
"""

# ╔═╡ 3b7dd562-9db1-40bb-bb06-9476694e14ec
#TwoColumn(
md"""
### Artifical Intelligence (AI) 
- Exams/quizzes:  No AI.
- Limited AI Use:  Using an AI-based grammar checker is acceptible and does not need to be disclosed for the labs or project in this course. 
- Disclose AI Use:  Otherwise, students must fully disclose any and all use of AI in completing their assignemnts at the time of submission. 
- Students may receive reduced credit for assignments where AI tools were used. If you're unsure what's appropriate, then ask in advance of submission.
$(LocalResource("../_assets/week1/Limited_AI_Use_290x300.png"))
"""
#""", LocalResource("../_assets/week1/Limited_AI_Use_290x300.png"))

# ╔═╡ d2f1789a-3d21-40e9-8d98-bdd52e54554e
md"""
# Introduction to Course

## What is Data Science?

### What do you think?
- pause 
## One oversimplified take...
"""

# ╔═╡ b2376e4d-4d13-42d6-a484-217f1dbcabb7
RobustLocalResource("https://images.squarespace-cdn.com/content/v1/5150aec6e4b0e340ec52710a/1364352051365-HZAS3CLBF7ABLE3F5OBY/Data_Science_VD.png?format=750w","../_assets/week1/Data_Science_VD.png")

# ╔═╡ a12f0d4d-12d9-4c13-81c1-69889e7aabf4
md"The Data Science Venn Diagram is from Drew Conway and is licensed as [Creative Commons Attribution-NonCommercial](http://creativecommons.org/licenses/by-nc/3.0/legalcode)"

# ╔═╡ 07851600-44d6-4b44-9839-8bf19c647884
md"""
## This class is *not* meant to teach:
- Programming (e.g., CMPSC 121, 122)
- Numerical Methods (see ASTRO 410)
- Linear Algebra (see MATH 220)
- Statistics (e.g., ASTRO 415)
- Machine Learning (e.g., DS 310)
- Astronomical Techniques (see ASTOR 451)
- How to conduct Astronomy Research (e.g., a summer project or thesis)
"""

# ╔═╡ 75eecba2-fb5f-4dfc-b2af-b3041c9357b0
md"""
## So what does this class do?
### Data Science:
- Develop *Data Acumen*[^1]
  - Model building
  - Data visualization
  - Reproducible research
- Practice "soft skills"
  - Technical collaboration
  - Effective visualization
  - Scientific communications
- Provide taste of Data Science
"""

# ╔═╡ 44755795-c2f7-44dc-86a2-ba6e848f3a67
md"""
### Data Acumen
[^1]: "We define data acumen as the ability to make good judgements about the use of data to support problem solutions." ([Keller et al. 2020](https://doi.org/10.1162/99608f92.2d83f7f5))
"""

# ╔═╡ d6ae7f04-0c93-4c9b-b0a1-ec966d87e2c0
md"""
### Along the way...
You'll learn and/or reinforce foundational concepts that are covered in much more detail in other courses:
- Programming (build experience, likely a new language)
- Numerical Methods (e.g., integration, sampling)
- Linear Algebra (e.g., solving linear systems)
- Statistics (e.g., likelihood, priors, distributions) 
- Machine Learning (e.g., optimization)
- Astronomical Techniques (e.g., observational biases)
"""

# ╔═╡ d8015168-9c59-45b5-81c3-7b37fbf26319
md"""
# Course Overview
Students will build practical data science skills (e.g., querying astronomical databases, data storage and manipulation, data visualization, exploratory and explanatory data analysis, Bayesian modeling workflows, and reproducible research practices) and apply these lessons to analyzing data from astronomical surveys.

## Goals
- Increase their data acumen, and
- Appreciate how building data science skills can benefit astronomy & astrophysics research.

## Objectives
- Ingest and manipulate data from astronomical surveys.
- Build, apply, assess and update astrophysically motivated models for astronomical observations.
- Create visualizations for exploratory and explanatory data analyses of observations from astronomical surveys.
- Synthesize the above into a dashboard to support the efficient analysis of astronomical observations.
- Incorporate principles of reproducible research into their class project.
"""

# ╔═╡ 5370fe50-add3-4886-9ef5-a6e1aecd1cc4
md"""
# Remebmer to request Roar account so can log in on Wednesday!
"""

# ╔═╡ ff9410f3-73e4-4fbe-8560-c7fb671fffb4
md"""
# Philosophy of Data Analysis
"""

# ╔═╡ 0016cc4f-e869-4e58-9eb5-1e5504e15292
md"""
## What's the goal of an analysis?

## Example Goals
- Test a precisely formulated hypothesis 
- Make predicitons with an well-established model
- Make predictions, but you don't (yet?) have a trustworthy model
- Refine an exisiting model with additional data
- Compare multiple competing models to gain physical insight
- Compare multiple models to pick one to use for making predictions 
- Take a first look at a new dataset and find something interesting
- Prioritize what portions of analysis will require the most attention

#### Different Goals require Different Approaches 
"""

# ╔═╡ 9c73eb52-7002-42be-8e99-0e7037cfd8e1
md"""
## Prototypical Approaches
#### Tradditional physics/first-principles approach
- Start with a model we trust
- Add data to infer model parameters
#### Machine learning/Data-driven approach
- Start with large dataset
- Find a model that would have made good predictions
"""

# ╔═╡ 71df7883-35d2-448a-80b7-7d20662ab438
md"""
## Limitations of the Prototypical Approaches
#### First-principles approach
- Start with a **model we trust**
- Add data to infer model parameters
#### Machine learning/Data-driven approach
- Start with **large** dataset
- Find a model that **would have** made **good** predictions
"""

# ╔═╡ a3b3421a-5740-49eb-b9c1-b4a715c0a5c6
md"""
## Prototypical Astronomical Problem
- Significant astrophysical knowledge
  + but model is an approximation & incomplete
- Significant quantity of data
  + observing time is limited,
  + data collection process is complicated, and
  + constantly pushing limits of capabilities.

#### How can we integrate these effectively?
- What tool(s) are best for our task?
- Learning to apply an existing tool to data is (usually) relatively straightforward. 
- Developing experience to apply tools wisely is more challenging.  
- Acquiring the breath of experience to choose best tools for a task is a lifetime of learning.
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
# ╟─ef24c3ba-e027-465d-995f-efc5941843a2
# ╟─d3c6dede-be22-467f-8c81-698ec3448684
# ╟─8408e3e3-1794-48a4-8ddc-2a393e47cb50
# ╟─2a9bf396-c7a7-4e39-82d9-724b66923510
# ╟─19575253-08f8-48f8-b1ec-89b4074b8108
# ╟─db79a1cc-0cec-4cae-a24b-d2f4e256eb2c
# ╟─6c9684cd-3952-4e01-b3bc-d111d47b48ff
# ╟─dba2b51e-0dc7-48f2-a975-ead2280dca54
# ╟─4ead033d-0001-4479-86ac-f420ecbf15d3
# ╟─37f0e64b-fc92-4351-8ebb-ae318de7d447
# ╟─e9dfdedc-2d04-4f0a-b3c7-707628ab3580
# ╟─502d38bd-8b97-484d-9618-bed479bf648a
# ╟─bb7cda4e-2876-403f-8194-baa0f33e2ada
# ╟─3b7dd562-9db1-40bb-bb06-9476694e14ec
# ╟─d2f1789a-3d21-40e9-8d98-bdd52e54554e
# ╟─b2376e4d-4d13-42d6-a484-217f1dbcabb7
# ╟─a12f0d4d-12d9-4c13-81c1-69889e7aabf4
# ╟─07851600-44d6-4b44-9839-8bf19c647884
# ╟─75eecba2-fb5f-4dfc-b2af-b3041c9357b0
# ╟─44755795-c2f7-44dc-86a2-ba6e848f3a67
# ╟─d6ae7f04-0c93-4c9b-b0a1-ec966d87e2c0
# ╟─d8015168-9c59-45b5-81c3-7b37fbf26319
# ╟─5370fe50-add3-4886-9ef5-a6e1aecd1cc4
# ╟─ff9410f3-73e4-4fbe-8560-c7fb671fffb4
# ╟─0016cc4f-e869-4e58-9eb5-1e5504e15292
# ╟─9c73eb52-7002-42be-8e99-0e7037cfd8e1
# ╟─71df7883-35d2-448a-80b7-7d20662ab438
# ╟─a3b3421a-5740-49eb-b9c1-b4a715c0a5c6
# ╟─02a0991e-8ebe-4307-b277-59d39d612c78
# ╟─9a4a6761-8c60-4a7d-92d3-cdfbc85c76d9
# ╟─ffd38b51-b872-432b-a9bf-7568681d3aa1
# ╟─66eaf0bf-79e3-43b4-80a8-cb75971feceb
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
