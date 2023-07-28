using Clang.Generators

cd(@__DIR__)

# wrapper generator options

# this file again from the package https://github.com/nstiurca/Rcl.jl
isheader(header) = occursin(r".+\.(h|hpp)$", header)

include("../src/findROS.jl")
function wrap_roslib(lib::AbstractString, lib_headers, lib_includes)
    lib_include = joinpath(ROS_INCLUDE_PATH, lib)
    for (root, dirs, files) in walkdir(lib_include)
        for file in files
            if isheader(file) && !endswith(file, "hpp")
                push!(lib_headers, joinpath(lib_include, root, file))
            end
        end
    end
    push!(lib_includes, lib_include)
end

options = load_options(joinpath(@__DIR__, "generator.toml"))
#options["general"]["library_name"] = "calleme"
options["general"]["output_file_path"] = "../src/gen/libros.jl"
lib_headers = String[]
lib_includes = String[]

wrap_roslib.(WRAPPED_ROS2_LIBS, (lib_headers,), (lib_includes,))

args = get_default_args()  # Note you must call this function firstly and then append your own flags
push!(args, "-I$ROS_INCLUDE_PATH")
for inc in lib_includes
    push!(args, "-I$inc")
end
push!(args, "-std=c2x")

ctx = create_context(lib_headers, args, options)
build!(ctx)