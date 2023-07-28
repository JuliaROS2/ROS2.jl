using JuliaROS
using Test
using Libdl
struct char_msg 
    data::Char
end
struct char_seq_msg 
    data::Vector{char_msg}
    size::Int
    capacity::Int
end
char_init(message_memory::Ptr{Cvoid}, init::JuliaROS.Librcl.rosidl_runtime_c__message_initialization) = nothing
char_fini(message_memory::Ptr{Cvoid}) = nothing
librosidl_typesupport_c_dl = Libc.Libdl.dlopen(JuliaROS.Librcl.librosidl_typesupport_c)
librosidl_typesupport_introspection_c_dl = Libc.Libdl.dlopen(JuliaROS.Librcl.librosidl_typesupport_introspection_c)
librosidl_runtime_c_dl = Libc.Libdl.dlopen(JuliaROS.Librcl.librosidl_runtime_c)

function dummy_typesupport_func(handle::Ptr{Cvoid}, identifier::Ptr{Int8}) 
    println(unsafe_string(identifier))
    return 0
end


gsc = Libdl.dlopen("libstd_msgs__rosidl_generator_c")
tsc = Libdl.dlopen("libstd_msgs__rosidl_typesupport_c")
rtps = Libdl.dlopen("libstd_msgs__rosidl_typesupport_fastrtps_c")
const make_typesupport = Libdl.dlsym(tsc, "rosidl_typesupport_c__get_message_type_support_handle__std_msgs__msg__String")


const String_msg_create = Libdl.dlsym(gsc, "std_msgs__msg__String__create")
const String_msg_destroy = Libdl.dlsym(gsc, "std_msgs__msg__String__destroy")
const String_msg_init = Libdl.dlsym(gsc, "std_msgs__msg__String__init")
const String_msg_fini = Libdl.dlsym(gsc, "std_msgs__msg__String__fini")

@testset "JuliaROS.jl" begin
    allocator = (JuliaROS.Librcl.rcl_get_default_allocator())
    options = Ref(JuliaROS.Librcl.rcl_get_zero_initialized_init_options())
    JuliaROS.Librcl.rcl_init_options_init(options, allocator)
    JuliaROS.Librcl.rcl_init_options_set_domain_id(options, 10)

    io = unsafe_load(JuliaROS.Librcl.rcl_init_options_get_rmw_init_options(options))
    rmw_name = unsafe_string(io.implementation_identifier)

    ts = ccall(make_typesupport, Ptr{JuliaROS.Librcl.rosidl_service_type_support_t}, ())
    tsl = unsafe_load(ts)

    context = Ref(JuliaROS.Librcl.rcl_get_zero_initialized_context())

    JuliaROS.Librcl.rcl_init(0, C_NULL, options, context)
        
    node = Ref(JuliaROS.Librcl.rcl_get_zero_initialized_node())
    node_ops = Ref(JuliaROS.Librcl.rcl_node_get_default_options())
    ret = JuliaROS.Librcl.rcl_node_init(node, "node_name", "/my_namespace", context, node_ops)

    pub = Ref(JuliaROS.Librcl.rcl_get_zero_initialized_publisher())
    opts = Ref(JuliaROS.Librcl.rcl_publisher_get_default_options())

    println(JuliaROS.Librcl.rcl_publisher_fini(pub, node))

end
