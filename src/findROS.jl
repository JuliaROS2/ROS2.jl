# this file from the package https://github.com/nstiurca/Rcl.jl

import Libdl: dlext, find_library
# FIXME: THis should all probably be in some kind of __init__ (see Issue #2)
# TODO: handle missing values gracefully

const ROS_VERSION = VersionNumber(ENV["ROS_VERSION"])
const ROS_DISTRO = ENV["ROS_DISTRO"]

@assert ROS_VERSION >= v"2.0" "Only ROS 2.0 is supported by this package."

const AMENT_PREFIX_PATH = ENV["AMENT_PREFIX_PATH"]
const ROS_INCLUDE_PATH = joinpath(AMENT_PREFIX_PATH, "include")
const ROS_LIB_PATH = joinpath(AMENT_PREFIX_PATH, "lib")

const WRAPPED_ROS2_LIBS = ["rcutils", "rosidl_generator_c", "rosidl_runtime_c", "rosidl_typesupport_c", "rosidl_typesupport_introspection_c", "rosidl_typesupport_interface", "rcl_yaml_param_parser", "rmw", "rcl"]

# dynamically load the ROS2 libraries
for lib_name in WRAPPED_ROS2_LIBS
    lib_var = Symbol("lib", lib_name)
    lib_fname = "lib$lib_name.$dlext"
    @info "Loading library $lib_name"
    @eval const $lib_var = Symbol(find_library([$lib_fname]))
end