### A Pluto.jl notebook ###
# v0.20.1

using Markdown
using InteractiveUtils

# ╔═╡ bd1bf442-3fba-441d-b22e-8768d67d8652
# hideall 
begin
	using CSV, DataFrames, Query
	using HTTP
	using PlutoUI, PlutoTeachingTools
end

# ╔═╡ 38400125-b41e-4df2-be70-991b5aa50be9
# hideall
begin
  title = "Data Science Applications to Astronomy";
  topic = "Data Wrangling"
  subtitle = "Databases & Queries"
  week = 5
end;

# ╔═╡ 0b9fed6d-c472-4292-befb-39c7874a329a
# hideall
md"""
+++
title = $topic
subtitle = $subtitle
week_num = $week
+++
"""  |> Base.Text;

# ╔═╡ ec8a13fb-3d55-4c3b-897e-c468f752a41f
md"""
#### $title
# Week $week: $topic:
## $subtitle
"""

# ╔═╡ a629d501-0dbc-4be8-b1fb-984af4fe2fd8
TableOfContents()

# ╔═╡ c801d8b3-d439-4d55-be1b-111207dd1bf5
md"""
# Databases
"""

# ╔═╡ 16243631-00ec-4ffd-8eb5-1281a4d00f02
md"""
### Simplest form
- Store data 
- Retrieve data
- Commonly implemented as a set of **tables**
  - **Columns** contain different fields (e.g., ID, magnitude, RA, Dec)
  - **Rows** contain entries (e.g., 51 Pegasi, Kepler-10, HAT-P-13,... )

### Value-added features
- Return subset of data *efficiently*
- Many strategies for how to filter data (e.g., order of operations)
- Database server can use heuristics to pick good strategy
- Allow for transactions to update database
"""

# ╔═╡ 1be82094-5d9a-47a5-96ac-50c5a3179e3a
md"""
### Fundamental properties of databases
- Atomicity:  All part of a transaction succeed, or the database is rolled back to its previous state
- Consistency:  Data in database always satisfies its validation rules
- Isolation: Even if multiple transactions are made concurrently, there is no interference between transactions
- Durability:  Once a transaction is committed, it will remain committed
"""

# ╔═╡ 1b60fbf6-1baf-46ac-92c4-2d9485f92220
md"""
### SQL-based Database Servers
Open-source:
- MySQL
- PostgreSQL & Greenplum
Commercial:
- Microsoft SQL Server: 
- IBM DB2
- Oracle Database
- ...
"""

# ╔═╡ 280f7444-4b3c-46e4-b1f6-a8eced3a24a2
md"""
#### Continuing innovation in database systems
- SciDB (array & disk based database)
- MonetDB (column store)
- JuliaDB (pure Julia, for persistent data)

When selecting a database for a project, consider:
- How much data is to be stored?
- How frequent/large will transactions be?
- Are there specific hardware or OS requirements?
- Does the team have someone dedicated to supporting database?
"""

# ╔═╡ f783601e-f0a0-4c6a-b478-060b288a279e
md"""
### Database Clients
- One database server many clients simultaneously
- Different clients can use different interfaces
  - Command line
  - Webpage
  - URL-based
  - Custom Graphical user interface (GUI)
    - TopCat
"""

# ╔═╡ ad409d2a-1d8f-4f9f-b649-6b5c76321f7e
md"""
# Queries
"""

# ╔═╡ 9ac78e9d-c97e-451c-af50-2a7251f0714b
md"""
**Query**:  An expression that requests database to return a specific subset of data.  

#### Query languages:
- Structured Query Language (SQL):  Dated, but by far the most common
- Astronomical Data Query Language (ADQL):  Astronomy-specific
- Language Integrated Query (LINQ):  Microsoft-supported
- Many more
"""

# ╔═╡ 804babe2-6398-401d-b443-eeff52721208
md"""
## SQL essentials
- Selecting (columns)
- Filtering (for rows)
- Joining (multiple tables)
- Aggregating (rows within a table)

### SQL programming
- Variables
- Functions
- Procedures
- Data management
- Transactions
"""

# ╔═╡ e1669276-2b84-4bd4-94bc-d58feda22caf
md"""
## Virtual Observatory (VO)
Defines standards that help astronomers to collaborate effectively, emphasizing working with multiple data sources.  

- Astronomical Data Query Language (ADQL) 
- Table Access Protocol (TAP)
"""

# ╔═╡ d09c5da7-7b12-478b-ae23-bf130a645f93
md"""
## Astronomy-specific functions in ADQL
- AREA
- BOX
- CENTROID
- CIRCLE
- CONTAINS
- COORD1
- COORD2
- COORDSYS
- DISTANCE
- INTERSECTS
- POINT
- POLYGON
- REGION
"""

# ╔═╡ a30a9fb2-0ac8-488a-ac63-0f9085b32fa2
md"""
## Example Bad SQL Query

#### Do not send
```sql
select * from SomeTable
```

Why?
"""

# ╔═╡ 39a288ff-eb95-486b-9816-e0693334fe4f
md"""
## Example SQL Queries 
"""

# ╔═╡ 650e5cbe-7bc2-4c13-881a-e4469cf0152a
md"""
### Take a quick peak two columns data for first few entries
```sql
select top 10 X, Y from SomeTable 
```

"""

# ╔═╡ b61ec045-9c2f-4496-bde4-f2bade567867
md"""
## Find extreme values of X
```sql
select top 10 X, Y 
from SomeTable 
order by X
```

"""

# ╔═╡ 5e7371b9-7923-4ec3-b9c0-505391f5aebd
md"""
## Filter which rows are returned using expression 
```sql
select top 10 x,y
from SomeTable 
where x*x+y*y between 0 and 1
order by x 
```
"""

# ╔═╡ f68211ad-5ed2-40ca-8199-44b5e1a6b984
md"""
## Check how many rows are in a table
```sql
select COUNT(designation) as N from gaiadr2.gaia_source
```
"""

# ╔═╡ 29a7a0ca-fbe8-42e9-aabf-4e30a0a4eae7
md"""
#### [Gaia Archive](https://gea.esac.esa.int/archive/)
"""

# ╔═╡ 430fc7a3-2824-43ad-a281-64c1d0487898
md"""
## Check how many rows satisfy a filter
```sql
select COUNT(designation) as n, AVG(astrometric_n_good_obs_al) as astrometric_n_good_obs_al_ave
from gaiadr2.gaia_source
where phot_g_mean_mag < 14
```
"""

# ╔═╡ 8d04311d-42dc-499b-af80-7a2e6bdc332e
md"""
## Grouping data to make a histogram
```sql
select COUNT(designation) as N, 
       AVG(astrometric_n_good_obs_al) as astrometric_n_good_obs_al_ave,  
       AVG(phot_g_mean_mag) as phot_g_mean_mag_ave,
       ROUND(phot_g_mean_mag,1) as bin
from gaiadr2.gaia_source
where phot_g_mean_mag < 14
group by bin 
order by bin
```
"""

# ╔═╡ f561d36e-ec3c-42b8-b7f8-0202f4a4363b
md"""
# Table Access Protocol (TAP)
"""

# ╔═╡ 5396181f-b169-4011-b590-7bcc546bbbdc
md"""
Start with ADQL 
```sql
SELECT <column list> FROM <table> WHERE <constraints>
```
but transform it into a url, by
1.  Prepend a base service url
2.  convert spaces to `+`'s
3.  Deal with other special characters (e.g., +, quotes)
4.  Optionally, specify format for results
e.g., 
```url
https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,pl_masse,ra,dec+from+ps
```
"""

# ╔═╡ f1d3a8af-2c50-41ed-86e1-786a1df5da72
row_to_study = 7

# ╔═╡ cb1b5efb-3ce2-4eb7-99a2-eec4cbd02eea
md"""
# Joins
"""

# ╔═╡ 5afb074f-8416-4441-be7e-96f73d448940
md"""
Joining tables is a fundamental concept that can be applied either to DataFrames stored locally or as part of SQL/ADQL queries.
"""

# ╔═╡ 04f2fa13-057e-4b26-a2db-2a02055dc61d
md"""
- `innerjoin` & `semijoin`:  Return rows for values of the key that exist **in both tables**
- `outerjoin`: Return rows for values of the key that exist **in either table**
- `leftjoin`: Return rows for values of the key that exist **in first table**
- `rightjoin`: Return rows for values of the key that exist **in second table**


- `antijoin`: Return rows Return rows for values of the key that exist **in first table but not the second table**


- `crossjoin`: Return table with every row from first table as rows and every row from second table as columns
"""

# ╔═╡ 49bf3268-bb0f-484c-972a-14f94d7c4151
md"""
# Examples
"""

# ╔═╡ 553cf2df-dd96-4167-bfd7-ea23c24b8a83
md"""
## Join on Gaia ID
"""

# ╔═╡ 70fe782a-bcd8-4239-b922-f6949435d865
tip(md"Originally, both tables contained columns named `ra` and `dec`.  The joined table contains columns `ra` and `ra_1` (and `dec` and `dec_1`) because we set `makeunique`.")

# ╔═╡ 6d00e16e-0556-440f-bb7b-29a347e65272
md"""
## Find by position
"""

# ╔═╡ ccfcbbe1-a358-41e8-a562-f5db25e2a9fc
md"""
## Which row is the best match?
"""

# ╔═╡ 540c6982-2759-4b63-b5a4-e360bddfa4e1
md"""
## Questions?
"""

# ╔═╡ b0224927-730a-41b5-a0e1-fa7101b64a12


# ╔═╡ 499a15c9-41bb-46ea-beff-4ae9584ed780
md"""
# Setup & Helper Code
"""

# ╔═╡ a62e5bb9-9027-4da8-8ce4-65a5419f79e3
# hideall 
WidthOverDocs()

# ╔═╡ 0d1dafe5-d584-4952-981e-f418d5043cef
begin
	nexsci_query_base_url = "https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query="
	gaia_query_base_url = 
	"https://gea.esac.esa.int/tap-server/tap/sync?REQUEST=doQuery&LANG=ADQL&FORMAT=csv&QUERY="
end;

# ╔═╡ 45813921-68c4-4a61-84f2-d7f06a1e9e1b
begin
	make_tap_query_url_url = "#" * (PlutoRunner.currently_running_cell_id |> string)
"""
`make_tap_query_url(base_url, table_name; ...)`

Returns url for a Table Access Protocol (TAP) query.
Inputs:
- base url 
- table name
Optional arguments (and default):
- `max_rows` (all)
- `select_cols` (all)
- `where` (no requirements)
- `order_by_cols` (not sorted)
- `format` (tsv)
See [NExScI](https://exoplanetarchive.ipac.caltech.edu/docs/TAP/usingTAP.html#sync) or [Virtual Observatory](https://www.ivoa.net/documents/TAP/) for more info.
"""
function make_tap_query_url(query_base_url::String, query_table::String; max_rows::Integer = 0, select_cols::String = "", where::String = "", order_by_cols::String = "", format::String="tsv" )
	
	query_select = "select"
	if max_rows > 0 
		query_select *= "+top+" * string(max_rows)
	end
	if length(select_cols) >0
		query_select *= "+" * select_cols 
	else
		query_select *= "+*"
	end
	query_from = "+from+" * query_table
	query_where = length(where)>0 ? "+where+" * where : ""
	query_order_by = length(order_by_cols) > 0 ? "+order+by+" * order_by_cols : ""
	query_format = "&format=" * format
	url = query_base_url * query_select * query_from * query_where * query_order_by * query_format
end
end

# ╔═╡ 241a7b00-a53e-4c93-8b1e-a9b76e3223e3
url_ex1 = make_tap_query_url(nexsci_query_base_url, "ps", select_cols="pl_name,gaia_id,sy_kepmag,ra,dec", where="default_flag=1")

# ╔═╡ 41f86e08-7292-468f-9d6f-266b169c7d8b
"""
`query_to_df(url)` downloads data from a URL and attempts to place it into a DataFrame
"""
query_to_df(url) = CSV.read(HTTP.get(url).body,DataFrame)

# ╔═╡ 59c3abea-3aee-452d-902a-9a22b6393bd6
df_ex1 = query_to_df(url_ex1)

# ╔═╡ 91aab994-2b5f-4de2-b78e-828868c3ead5
targetpos = (; ra = df_ex1.ra[1], dec = df_ex1.dec[1] )

# ╔═╡ 29ab2b94-1aba-4831-ba1f-044c7f2843d1
url_ex4 = make_tap_query_url(gaia_query_base_url, "gaiadr3.gaia_source", where="1=contains(POINT($(targetpos.ra),$(targetpos.dec)),CIRCLE(ra,dec,30./3600.))", select_cols="*,DISTANCE(POINT($(targetpos.ra),$(targetpos.dec)),POINT(ra,dec))+AS+ang_sep",order_by_cols="ang_sep",max_rows=100, format="csv")

# ╔═╡ 41dfc658-2e54-4408-8e52-4879e209b022
df_ex1.sy_kepmag[row_to_study]

# ╔═╡ 6cde0247-5471-45e5-b291-73b8b96179ab
df_ex4 = query_to_df(url_ex4)

# ╔═╡ e667dfb6-40b6-4739-ae63-a8be386e1f21
sort(df_ex4[!,[:designation,:ang_sep,:phot_g_mean_mag] ], :ang_sep)

# ╔═╡ 5c48bd08-18e4-4e08-97e1-b69413ae7e3a
"""`replace_spaces_for_tap(str)`

Replace spaces with +'s as expected for TAP queries.
"""
replace_spaces_for_tap(s::AbstractString) = replace(s," "=>"+")

# ╔═╡ cc583927-f657-4617-a057-97a15f8ccb3a
desig = replace_spaces_for_tap(df_ex1.gaia_id[row_to_study])

# ╔═╡ 8708d13b-25ac-4829-b9cb-bdbc02a29005
url_ex2 = make_tap_query_url(gaia_query_base_url, "gaiadr2.gaia_source", where="designation='$(desig)'",select_cols="*",max_rows=5,format="csv")

# ╔═╡ 3c057644-11a0-404d-acc8-6f897f52fb1a
df_ex2 = query_to_df(url_ex2)

# ╔═╡ 8fb6efb1-6493-449a-b5cb-49763b7d361c
df_ex3_inner = innerjoin(df_ex1,df_ex2, on=:gaia_id=>:designation, matchmissing=:notequal, makeunique=true )

# ╔═╡ 1775c8de-0dc3-44c9-b36d-40b5eb2922e1
names(df_ex3_inner)

# ╔═╡ 18a45746-6435-41d7-8385-b2240fd35028
df_ex3_left = leftjoin(df_ex1,df_ex2, on=:gaia_id=>:designation, matchmissing=:notequal, makeunique=true )

# ╔═╡ 0a9cd597-530f-4c4f-8319-f2ebca4185f3
df_ex3_right = rightjoin(df_ex1,df_ex2, on=:gaia_id=>:designation, matchmissing=:notequal, makeunique=true )

# ╔═╡ 65c6a7a3-fd6a-44ad-b35f-9b21b7c9a9ce
nrow(df_ex3_left), nrow(df_ex3_right)

# ╔═╡ c0c07e4b-4720-4c34-b1e9-ce76789d246c
try
	df_ex3_outer_fails = outerjoin(df_ex1,df_ex2, on=:gaia_id=>:designation, matchmissing=:notequal, makeunique=true )
catch ex
	warning_box(ex.msg)
end

# ╔═╡ 759e8774-f07f-4996-92f7-14c914bf852e
df_ex3_outer = outerjoin(filter(r->!ismissing(r.gaia_id),df_ex1),df_ex2, on=:gaia_id=>:designation, makeunique=true )

# ╔═╡ 1438dd04-ca0b-4aa7-9951-8f767db28925
nrow(df_ex3_inner), nrow(df_ex3_outer), nrow(filter(r->!ismissing(r.gaia_id),df_ex1))

# ╔═╡ 8be5e540-8a79-4622-ada1-bc27e01f1ccd
df_ex3_anti = antijoin(df_ex1,df_ex2, on=:gaia_id=>:designation, matchmissing=:notequal, makeunique=true )

# ╔═╡ b3d00ec9-21c6-4cd8-b625-907e464f54a8
ncol(df_ex1), ncol(df_ex2), ncol(df_ex3_inner), ncol(df_ex3_outer), ncol(df_ex3_left), ncol(df_ex3_anti)

# ╔═╡ 9460a180-85e0-4032-acac-94626537fac4
nrow(df_ex1), nrow(df_ex2)

# ╔═╡ c784f6bd-0843-4682-bcaa-f26a8fd5f7b5
begin
	""" 
	`select_cols_for_tap(cols)`

	Returns a string of comma-separated columns names from a vector of columns names (as either strings or symbols), for using in a TAP query.
	"""
	function select_cols_for_tap end
	select_cols_for_tap(cols_to_keep::AbstractVector{Symbol}) = select_cols_for_tap(string.(cols_to_keep)) #string(map(s->string(s) * "+", cols_to_keep)...)[1:end-1]
	select_cols_for_tap(cols_to_keep::AbstractVector{AS}) where {AS<:AbstractString} = string(map(s->s * ",", cols_to_keep)...)[1:end-1]
	select_cols_for_tap(col_to_keep::Symbol) = string(col_to_keep)
	select_cols_for_tap(col_to_keep::AbstractString) = col_to_keep
	@doc select_cols_for_tap
end


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CSV = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
HTTP = "cd3eb016-35fb-5094-929b-558a96fad6f3"
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
Query = "1a8c2f83-1ff3-5112-b086-8aa67b057ba1"

[compat]
CSV = "~0.10.4"
DataFrames = "~1.7.0"
HTTP = "~1.10.15"
PlutoTeachingTools = "~0.3.1"
PlutoUI = "~0.7.43"
Query = "~1.0.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.2"
manifest_format = "2.0"
project_hash = "fc1aba4d77ee4448abe4f8d90d50f97520158fda"

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

[[deps.BitFlags]]
git-tree-sha1 = "0691e34b3bb8be9307330f88d1a3c3f25466c24d"
uuid = "d1d4a3ce-64b1-5f1a-9ba4-7e7e69966f35"
version = "0.1.9"

[[deps.CSV]]
deps = ["CodecZlib", "Dates", "FilePathsBase", "InlineStrings", "Mmap", "Parsers", "PooledArrays", "PrecompileTools", "SentinelArrays", "Tables", "Unicode", "WeakRefStrings", "WorkerUtilities"]
git-tree-sha1 = "deddd8725e5e1cc49ee205a1964256043720a6c3"
uuid = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
version = "0.10.15"

[[deps.CodeTracking]]
deps = ["InteractiveUtils", "UUIDs"]
git-tree-sha1 = "7eee164f122511d3e4e1ebadb7956939ea7e1c77"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.3.6"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "545a177179195e442472a1c4dc86982aa7a1bef0"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.7"

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

[[deps.ConcurrentUtilities]]
deps = ["Serialization", "Sockets"]
git-tree-sha1 = "d9d26935a0bcffc87d2613ce14c527c99fc543fd"
uuid = "f0e56b4a-5159-44fe-b623-3e5288b988bb"
version = "2.5.0"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.DataAPI]]
git-tree-sha1 = "abe83f3a2f1b857aac70ef8b269080af17764bbe"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.16.0"

[[deps.DataFrames]]
deps = ["Compat", "DataAPI", "DataStructures", "Future", "InlineStrings", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrecompileTools", "PrettyTables", "Printf", "Random", "Reexport", "SentinelArrays", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "fb61b4812c49343d7ef0b533ba982c46021938a6"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.7.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "1d0a14036acb104d9e89698bd408f63ab58cdc82"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.20"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.DataValues]]
deps = ["DataValueInterfaces", "Dates"]
git-tree-sha1 = "d88a19299eba280a6d062e135a43f00323ae70bf"
uuid = "e7dc6d0d-1eca-5fa6-8ad6-5aecde8b7ea5"
version = "0.4.13"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.ExceptionUnwrapping]]
deps = ["Test"]
git-tree-sha1 = "d36f682e590a83d63d1c7dbd287573764682d12a"
uuid = "460bff9d-24e4-43bc-9d9f-a8973cb893f4"
version = "0.1.11"

[[deps.FilePathsBase]]
deps = ["Compat", "Dates"]
git-tree-sha1 = "2ec417fc319faa2d768621085cc1feebbdee686b"
uuid = "48062228-2e41-5def-b9a4-89aafe57970f"
version = "0.9.23"
weakdeps = ["Mmap", "Test"]

    [deps.FilePathsBase.extensions]
    FilePathsBaseMmapExt = "Mmap"
    FilePathsBaseTestExt = "Test"

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

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"
version = "1.11.0"

[[deps.HTTP]]
deps = ["Base64", "CodecZlib", "ConcurrentUtilities", "Dates", "ExceptionUnwrapping", "Logging", "LoggingExtras", "MbedTLS", "NetworkOptions", "OpenSSL", "PrecompileTools", "Random", "SimpleBufferStream", "Sockets", "URIs", "UUIDs"]
git-tree-sha1 = "c67b33b085f6e2faf8bf79a61962e7339a81129c"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "1.10.15"

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

[[deps.InlineStrings]]
git-tree-sha1 = "45521d31238e87ee9f9732561bfee12d4eebd52d"
uuid = "842dd82b-1e85-43dc-bf29-5d0ee9dffc48"
version = "1.4.2"

    [deps.InlineStrings.extensions]
    ArrowTypesExt = "ArrowTypes"
    ParsersExt = "Parsers"

    [deps.InlineStrings.weakdeps]
    ArrowTypes = "31f734f8-188a-4ce0-8406-c8a06bd891cd"
    Parsers = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

[[deps.InvertedIndices]]
git-tree-sha1 = "6da3c4316095de0f5ee2ebd875df8721e7e0bdbe"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.3.1"

[[deps.IterableTables]]
deps = ["DataValues", "IteratorInterfaceExtensions", "Requires", "TableTraits", "TableTraitsUtils"]
git-tree-sha1 = "70300b876b2cebde43ebc0df42bc8c94a144e1b4"
uuid = "1c8ee90f-4401-5389-894e-7a04a3dc0f4d"
version = "1.0.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLLWrappers]]
deps = ["Artifacts", "Preferences"]
git-tree-sha1 = "a007feb38b422fbdab534406aeca1b86823cb4d6"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.7.0"

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

[[deps.LoggingExtras]]
deps = ["Dates", "Logging"]
git-tree-sha1 = "f02b56007b064fbfddb4c9cd60161b6dd0f40df3"
uuid = "e6f89c97-d47a-5376-807f-9c37f3926c36"
version = "1.1.0"

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

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "MozillaCACerts_jll", "NetworkOptions", "Random", "Sockets"]
git-tree-sha1 = "c067a280ddc25f196b5e7df3877c6b226d390aaf"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.1.9"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.6+0"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "ec4f7fbeab05d7747bdf98eb74d130a2a2ed298d"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.2.0"

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

[[deps.OpenSSL]]
deps = ["BitFlags", "Dates", "MozillaCACerts_jll", "OpenSSL_jll", "Sockets"]
git-tree-sha1 = "38cb508d080d21dc1128f7fb04f20387ed4c0af4"
uuid = "4d8831e6-92b7-49fb-bdf8-b643e874388c"
version = "1.4.3"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "7493f61f55a6cce7325f197443aa80d32554ba10"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "3.0.15+3"

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

[[deps.PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "36d8b4b899628fb92c2749eb488d884a926614d3"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.4.3"

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

[[deps.PrettyTables]]
deps = ["Crayons", "LaTeXStrings", "Markdown", "PrecompileTools", "Printf", "Reexport", "StringManipulation", "Tables"]
git-tree-sha1 = "1101cd475833706e4d0e7b122218257178f48f34"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "2.4.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.Query]]
deps = ["DataValues", "IterableTables", "MacroTools", "QueryOperators", "Statistics"]
git-tree-sha1 = "a66aa7ca6f5c29f0e303ccef5c8bd55067df9bbe"
uuid = "1a8c2f83-1ff3-5112-b086-8aa67b057ba1"
version = "1.0.0"

[[deps.QueryOperators]]
deps = ["DataStructures", "DataValues", "IteratorInterfaceExtensions", "TableShowUtils"]
git-tree-sha1 = "911c64c204e7ecabfd1872eb93c49b4e7c701f02"
uuid = "2aef5ad7-51ca-5a8f-8e88-e75cf067b44b"
version = "0.9.3"

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

[[deps.SentinelArrays]]
deps = ["Dates", "Random"]
git-tree-sha1 = "712fb0231ee6f9120e005ccd56297abbc053e7e0"
uuid = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
version = "1.4.8"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.SimpleBufferStream]]
git-tree-sha1 = "f305871d2f381d21527c770d4788c06c097c9bc1"
uuid = "777ac1f9-54b0-4bf8-805c-2214025038e7"
version = "1.2.0"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"
version = "1.11.0"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "66e0a8e672a0bdfca2c3f5937efb8538b9ddc085"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.2.1"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.1"

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

    [deps.Statistics.weakdeps]
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.StringManipulation]]
deps = ["PrecompileTools"]
git-tree-sha1 = "a6b1675a536c5ad1a60e5a5153e1fee12eb146e3"
uuid = "892a3eda-7b42-436c-8928-eab12a02cf0e"
version = "0.4.0"

[[deps.StyledStrings]]
uuid = "f489334b-da3d-4c2e-b8f0-e476e12c162b"
version = "1.11.0"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.TableShowUtils]]
deps = ["DataValues", "Dates", "JSON", "Markdown", "Unicode"]
git-tree-sha1 = "2a41a3dedda21ed1184a47caab56ed9304e9a038"
uuid = "5e66a065-1f0a-5976-b372-e0b8c017ca10"
version = "0.2.6"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.TableTraitsUtils]]
deps = ["DataValues", "IteratorInterfaceExtensions", "Missings", "TableTraits"]
git-tree-sha1 = "78fecfe140d7abb480b53a44f3f85b6aa373c293"
uuid = "382cd787-c1b6-5bf2-a167-d5b971a19bda"
version = "1.0.2"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "OrderedCollections", "TableTraits"]
git-tree-sha1 = "598cd7c1f68d1e205689b1c2fe65a9f85846f297"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.12.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
version = "1.11.0"

[[deps.TranscodingStreams]]
git-tree-sha1 = "0c45878dcfdcfa8480052b6ab162cdd138781742"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.11.3"

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

[[deps.WeakRefStrings]]
deps = ["DataAPI", "InlineStrings", "Parsers"]
git-tree-sha1 = "b1be2855ed9ed8eac54e5caff2afcdb442d52c23"
uuid = "ea10d353-3f73-51f8-a26c-33c1cb351aa5"
version = "1.4.2"

[[deps.WorkerUtilities]]
git-tree-sha1 = "cd1659ba0d57b71a464a29e64dbc67cfe83d54e7"
uuid = "76eceee3-57b5-4d4a-8e66-0e911cebbf60"
version = "1.6.1"

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
# ╟─38400125-b41e-4df2-be70-991b5aa50be9
# ╟─0b9fed6d-c472-4292-befb-39c7874a329a
# ╟─ec8a13fb-3d55-4c3b-897e-c468f752a41f
# ╟─a629d501-0dbc-4be8-b1fb-984af4fe2fd8
# ╟─c801d8b3-d439-4d55-be1b-111207dd1bf5
# ╟─16243631-00ec-4ffd-8eb5-1281a4d00f02
# ╟─1be82094-5d9a-47a5-96ac-50c5a3179e3a
# ╟─1b60fbf6-1baf-46ac-92c4-2d9485f92220
# ╟─280f7444-4b3c-46e4-b1f6-a8eced3a24a2
# ╟─f783601e-f0a0-4c6a-b478-060b288a279e
# ╟─ad409d2a-1d8f-4f9f-b649-6b5c76321f7e
# ╟─9ac78e9d-c97e-451c-af50-2a7251f0714b
# ╟─804babe2-6398-401d-b443-eeff52721208
# ╟─e1669276-2b84-4bd4-94bc-d58feda22caf
# ╟─d09c5da7-7b12-478b-ae23-bf130a645f93
# ╟─a30a9fb2-0ac8-488a-ac63-0f9085b32fa2
# ╟─39a288ff-eb95-486b-9816-e0693334fe4f
# ╟─650e5cbe-7bc2-4c13-881a-e4469cf0152a
# ╟─b61ec045-9c2f-4496-bde4-f2bade567867
# ╟─5e7371b9-7923-4ec3-b9c0-505391f5aebd
# ╟─f68211ad-5ed2-40ca-8199-44b5e1a6b984
# ╟─29a7a0ca-fbe8-42e9-aabf-4e30a0a4eae7
# ╟─430fc7a3-2824-43ad-a281-64c1d0487898
# ╟─8d04311d-42dc-499b-af80-7a2e6bdc332e
# ╟─f561d36e-ec3c-42b8-b7f8-0202f4a4363b
# ╟─5396181f-b169-4011-b590-7bcc546bbbdc
# ╠═241a7b00-a53e-4c93-8b1e-a9b76e3223e3
# ╠═59c3abea-3aee-452d-902a-9a22b6393bd6
# ╠═f1d3a8af-2c50-41ed-86e1-786a1df5da72
# ╠═cc583927-f657-4617-a057-97a15f8ccb3a
# ╠═8708d13b-25ac-4829-b9cb-bdbc02a29005
# ╠═3c057644-11a0-404d-acc8-6f897f52fb1a
# ╟─cb1b5efb-3ce2-4eb7-99a2-eec4cbd02eea
# ╟─5afb074f-8416-4441-be7e-96f73d448940
# ╟─04f2fa13-057e-4b26-a2db-2a02055dc61d
# ╟─49bf3268-bb0f-484c-972a-14f94d7c4151
# ╟─553cf2df-dd96-4167-bfd7-ea23c24b8a83
# ╠═8fb6efb1-6493-449a-b5cb-49763b7d361c
# ╠═1775c8de-0dc3-44c9-b36d-40b5eb2922e1
# ╟─70fe782a-bcd8-4239-b922-f6949435d865
# ╠═18a45746-6435-41d7-8385-b2240fd35028
# ╠═0a9cd597-530f-4c4f-8319-f2ebca4185f3
# ╠═c0c07e4b-4720-4c34-b1e9-ce76789d246c
# ╠═759e8774-f07f-4996-92f7-14c914bf852e
# ╠═8be5e540-8a79-4622-ada1-bc27e01f1ccd
# ╠═b3d00ec9-21c6-4cd8-b625-907e464f54a8
# ╠═9460a180-85e0-4032-acac-94626537fac4
# ╠═1438dd04-ca0b-4aa7-9951-8f767db28925
# ╠═65c6a7a3-fd6a-44ad-b35f-9b21b7c9a9ce
# ╟─6d00e16e-0556-440f-bb7b-29a347e65272
# ╠═91aab994-2b5f-4de2-b78e-828868c3ead5
# ╠═29ab2b94-1aba-4831-ba1f-044c7f2843d1
# ╠═6cde0247-5471-45e5-b291-73b8b96179ab
# ╟─ccfcbbe1-a358-41e8-a562-f5db25e2a9fc
# ╠═e667dfb6-40b6-4739-ae63-a8be386e1f21
# ╠═41dfc658-2e54-4408-8e52-4879e209b022
# ╟─540c6982-2759-4b63-b5a4-e360bddfa4e1
# ╠═b0224927-730a-41b5-a0e1-fa7101b64a12
# ╟─499a15c9-41bb-46ea-beff-4ae9584ed780
# ╟─a62e5bb9-9027-4da8-8ce4-65a5419f79e3
# ╠═bd1bf442-3fba-441d-b22e-8768d67d8652
# ╠═0d1dafe5-d584-4952-981e-f418d5043cef
# ╟─45813921-68c4-4a61-84f2-d7f06a1e9e1b
# ╟─41f86e08-7292-468f-9d6f-266b169c7d8b
# ╟─5c48bd08-18e4-4e08-97e1-b69413ae7e3a
# ╟─c784f6bd-0843-4682-bcaa-f26a8fd5f7b5
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
