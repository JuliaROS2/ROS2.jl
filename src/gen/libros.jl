using CEnum

const SIZE_MAX = typemax(Int)
const UINT64_MAX = typemax(UInt64)
const RMW_TOPIC_MAX_NAME_LENGTH = 255 - 8

const int_least16_t = Cshort

const int_least32_t = Cint

const int_least64_t = Clong

const uint_least16_t = Cushort

const uint_least32_t = Cuint

const uint_least64_t = Culong

const int_fast16_t = Clong

const int_fast32_t = Clong

const int_fast64_t = Clong

const uint_fast16_t = Culong

const uint_fast32_t = Culong

const uint_fast64_t = Culong

const intptr_t = Clong

const intmax_t = Clong

const uintmax_t = Culong

struct rcutils_allocator_s
    allocate::Ptr{Cvoid}
    deallocate::Ptr{Cvoid}
    reallocate::Ptr{Cvoid}
    zero_allocate::Ptr{Cvoid}
    state::Ptr{Cvoid}
end

const rcutils_allocator_t = rcutils_allocator_s

function rcutils_allocator_is_valid(allocator)
    ccall((:rcutils_allocator_is_valid, librcutils), Bool, (Ptr{rcutils_allocator_t},), allocator)
end

function rcutils_set_error_state(error_string, file, line_number)
    ccall((:rcutils_set_error_state, librcutils), Cvoid, (Ptr{Cchar}, Ptr{Cchar}, Csize_t), error_string, file, line_number)
end

function rcutils_get_zero_initialized_allocator()
    ccall((:rcutils_get_zero_initialized_allocator, librcutils), rcutils_allocator_t, ())
end

function rcutils_get_default_allocator()
    ccall((:rcutils_get_default_allocator, librcutils), rcutils_allocator_t, ())
end

function rcutils_reallocf(pointer, size, allocator)
    ccall((:rcutils_reallocf, librcutils), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t, Ptr{rcutils_allocator_t}), pointer, size, allocator)
end

function rcutils_cli_option_exist(_begin, _end, option)
    ccall((:rcutils_cli_option_exist, librcutils), Bool, (Ptr{Ptr{Cchar}}, Ptr{Ptr{Cchar}}, Ptr{Cchar}), _begin, _end, option)
end

function rcutils_cli_get_option(_begin, _end, option)
    ccall((:rcutils_cli_get_option, librcutils), Ptr{Cchar}, (Ptr{Ptr{Cchar}}, Ptr{Ptr{Cchar}}, Ptr{Cchar}), _begin, _end, option)
end

function rcutils_set_env(env_name, env_value)
    ccall((:rcutils_set_env, librcutils), Bool, (Ptr{Cchar}, Ptr{Cchar}), env_name, env_value)
end

function rcutils_get_env(env_name, env_value)
    ccall((:rcutils_get_env, librcutils), Ptr{Cchar}, (Ptr{Cchar}, Ptr{Ptr{Cchar}}), env_name, env_value)
end

function rcutils_get_home_dir()
    ccall((:rcutils_get_home_dir, librcutils), Ptr{Cchar}, ())
end

struct rcutils_error_string_s
    str::NTuple{1024, Cchar}
end

const rcutils_error_string_t = rcutils_error_string_s

struct rcutils_error_state_s
    message::NTuple{768, Cchar}
    file::NTuple{229, Cchar}
    line_number::UInt64
end

const rcutils_error_state_t = rcutils_error_state_s

const rcutils_ret_t = Cint

function rcutils_initialize_error_handling_thread_local_storage(allocator)
    ccall((:rcutils_initialize_error_handling_thread_local_storage, librcutils), rcutils_ret_t, (rcutils_allocator_t,), allocator)
end

function rcutils_error_is_set()
    ccall((:rcutils_error_is_set, librcutils), Bool, ())
end

function rcutils_get_error_state()
    ccall((:rcutils_get_error_state, librcutils), Ptr{rcutils_error_state_t}, ())
end

function rcutils_get_error_string()
    ccall((:rcutils_get_error_string, librcutils), rcutils_error_string_t, ())
end

function rcutils_reset_error()
    ccall((:rcutils_reset_error, librcutils), Cvoid, ())
end

function rcutils_get_cwd(buffer, max_length)
    ccall((:rcutils_get_cwd, librcutils), Bool, (Ptr{Cchar}, Csize_t), buffer, max_length)
end

function rcutils_is_directory(abs_path)
    ccall((:rcutils_is_directory, librcutils), Bool, (Ptr{Cchar},), abs_path)
end

function rcutils_is_file(abs_path)
    ccall((:rcutils_is_file, librcutils), Bool, (Ptr{Cchar},), abs_path)
end

function rcutils_exists(abs_path)
    ccall((:rcutils_exists, librcutils), Bool, (Ptr{Cchar},), abs_path)
end

function rcutils_is_readable(abs_path)
    ccall((:rcutils_is_readable, librcutils), Bool, (Ptr{Cchar},), abs_path)
end

function rcutils_is_writable(abs_path)
    ccall((:rcutils_is_writable, librcutils), Bool, (Ptr{Cchar},), abs_path)
end

function rcutils_is_readable_and_writable(abs_path)
    ccall((:rcutils_is_readable_and_writable, librcutils), Bool, (Ptr{Cchar},), abs_path)
end

function rcutils_join_path(left_hand_path, right_hand_path, allocator)
    ccall((:rcutils_join_path, librcutils), Ptr{Cchar}, (Ptr{Cchar}, Ptr{Cchar}, rcutils_allocator_t), left_hand_path, right_hand_path, allocator)
end

function rcutils_to_native_path(path, allocator)
    ccall((:rcutils_to_native_path, librcutils), Ptr{Cchar}, (Ptr{Cchar}, rcutils_allocator_t), path, allocator)
end

function rcutils_expand_user(path, allocator)
    ccall((:rcutils_expand_user, librcutils), Ptr{Cchar}, (Ptr{Cchar}, rcutils_allocator_t), path, allocator)
end

function rcutils_mkdir(abs_path)
    ccall((:rcutils_mkdir, librcutils), Bool, (Ptr{Cchar},), abs_path)
end

function rcutils_calculate_directory_size(directory_path, size, allocator)
    ccall((:rcutils_calculate_directory_size, librcutils), rcutils_ret_t, (Ptr{Cchar}, Ptr{UInt64}, rcutils_allocator_t), directory_path, size, allocator)
end

function rcutils_calculate_directory_size_with_recursion(directory_path, max_depth, size, allocator)
    ccall((:rcutils_calculate_directory_size_with_recursion, librcutils), rcutils_ret_t, (Ptr{Cchar}, Csize_t, Ptr{UInt64}, rcutils_allocator_t), directory_path, max_depth, size, allocator)
end

function rcutils_get_file_size(file_path)
    ccall((:rcutils_get_file_size, librcutils), Csize_t, (Ptr{Cchar},), file_path)
end

struct rcutils_dir_iter_s
    entry_name::Ptr{Cchar}
    allocator::rcutils_allocator_t
    state::Ptr{Cvoid}
end

const rcutils_dir_iter_t = rcutils_dir_iter_s

function rcutils_dir_iter_start(directory_path, allocator)
    ccall((:rcutils_dir_iter_start, librcutils), Ptr{rcutils_dir_iter_t}, (Ptr{Cchar}, rcutils_allocator_t), directory_path, allocator)
end

function rcutils_dir_iter_next(iter)
    ccall((:rcutils_dir_iter_next, librcutils), Bool, (Ptr{rcutils_dir_iter_t},), iter)
end

function rcutils_dir_iter_end(iter)
    ccall((:rcutils_dir_iter_end, librcutils), Cvoid, (Ptr{rcutils_dir_iter_t},), iter)
end

function rcutils_find(str, delimiter)
    ccall((:rcutils_find, librcutils), Csize_t, (Ptr{Cchar}, Cchar), str, delimiter)
end

function rcutils_findn(str, delimiter, string_length)
    ccall((:rcutils_findn, librcutils), Csize_t, (Ptr{Cchar}, Cchar, Csize_t), str, delimiter, string_length)
end

function rcutils_find_last(str, delimiter)
    ccall((:rcutils_find_last, librcutils), Csize_t, (Ptr{Cchar}, Cchar), str, delimiter)
end

function rcutils_find_lastn(str, delimiter, string_length)
    ccall((:rcutils_find_lastn, librcutils), Csize_t, (Ptr{Cchar}, Cchar, Csize_t), str, delimiter, string_length)
end

function rcutils_isalnum_no_locale(c)
    ccall((:rcutils_isalnum_no_locale, librcutils), Cint, (Cchar,), c)
end

function rcutils_logging_initialize()
    ccall((:rcutils_logging_initialize, librcutils), rcutils_ret_t, ())
end

function rcutils_logging_initialize_with_allocator(allocator)
    ccall((:rcutils_logging_initialize_with_allocator, librcutils), rcutils_ret_t, (rcutils_allocator_t,), allocator)
end

function rcutils_logging_shutdown()
    ccall((:rcutils_logging_shutdown, librcutils), rcutils_ret_t, ())
end

struct rcutils_log_location_s
    function_name::Ptr{Cchar}
    file_name::Ptr{Cchar}
    line_number::Csize_t
end

const rcutils_log_location_t = rcutils_log_location_s

@cenum RCUTILS_LOG_SEVERITY::UInt32 begin
    RCUTILS_LOG_SEVERITY_UNSET = 0
    RCUTILS_LOG_SEVERITY_DEBUG = 10
    RCUTILS_LOG_SEVERITY_INFO = 20
    RCUTILS_LOG_SEVERITY_WARN = 30
    RCUTILS_LOG_SEVERITY_ERROR = 40
    RCUTILS_LOG_SEVERITY_FATAL = 50
end

function rcutils_logging_severity_level_from_string(severity_string, allocator, severity)
    ccall((:rcutils_logging_severity_level_from_string, librcutils), rcutils_ret_t, (Ptr{Cchar}, rcutils_allocator_t, Ptr{Cint}), severity_string, allocator, severity)
end

# typedef void ( * rcutils_logging_output_handler_t ) ( const rcutils_log_location_t * , // location int , // severity const char * , // name rcutils_time_point_value_t , // timestamp const char * , // format va_list * // args )
const rcutils_logging_output_handler_t = Ptr{Cvoid}

# no prototype is found for this function at logging.h:240:34, please use with caution
function rcutils_logging_get_output_handler()
    ccall((:rcutils_logging_get_output_handler, librcutils), rcutils_logging_output_handler_t, ())
end

function rcutils_logging_set_output_handler(_function)
    ccall((:rcutils_logging_set_output_handler, librcutils), Cvoid, (rcutils_logging_output_handler_t,), _function)
end

const rcutils_time_point_value_t = Int64

struct rcutils_char_array_s
    buffer::Ptr{Cchar}
    owns_buffer::Bool
    buffer_length::Csize_t
    buffer_capacity::Csize_t
    allocator::rcutils_allocator_t
end

const rcutils_char_array_t = rcutils_char_array_s

function rcutils_logging_format_message(location, severity, name, timestamp, msg, logging_output)
    ccall((:rcutils_logging_format_message, librcutils), rcutils_ret_t, (Ptr{rcutils_log_location_t}, Cint, Ptr{Cchar}, rcutils_time_point_value_t, Ptr{Cchar}, Ptr{rcutils_char_array_t}), location, severity, name, timestamp, msg, logging_output)
end

# no prototype is found for this function at logging.h:310:5, please use with caution
function rcutils_logging_get_default_logger_level()
    ccall((:rcutils_logging_get_default_logger_level, librcutils), Cint, ())
end

function rcutils_logging_set_default_logger_level(level)
    ccall((:rcutils_logging_set_default_logger_level, librcutils), Cvoid, (Cint,), level)
end

function rcutils_logging_get_logger_level(name)
    ccall((:rcutils_logging_get_logger_level, librcutils), Cint, (Ptr{Cchar},), name)
end

function rcutils_logging_get_logger_leveln(name, name_length)
    ccall((:rcutils_logging_get_logger_leveln, librcutils), Cint, (Ptr{Cchar}, Csize_t), name, name_length)
end

function rcutils_logging_set_logger_level(name, level)
    ccall((:rcutils_logging_set_logger_level, librcutils), rcutils_ret_t, (Ptr{Cchar}, Cint), name, level)
end

function rcutils_logging_logger_is_enabled_for(name, severity)
    ccall((:rcutils_logging_logger_is_enabled_for, librcutils), Bool, (Ptr{Cchar}, Cint), name, severity)
end

function rcutils_logging_get_logger_effective_level(name)
    ccall((:rcutils_logging_get_logger_effective_level, librcutils), Cint, (Ptr{Cchar},), name)
end

const rcutils_duration_value_t = Int64

# typedef bool ( * RclLogFilter ) ( )
const RclLogFilter = Ptr{Cvoid}

function rcutils_get_pid()
    ccall((:rcutils_get_pid, librcutils), Cint, ())
end

function rcutils_get_executable_name(allocator)
    ccall((:rcutils_get_executable_name, librcutils), Ptr{Cchar}, (rcutils_allocator_t,), allocator)
end

function rcutils_qsort(ptr, count, size, comp)
    ccall((:rcutils_qsort, librcutils), rcutils_ret_t, (Ptr{Cvoid}, Cint, Cint, Ptr{Cvoid}), ptr, count, size, comp)
end

function rcutils_repl_str(str, from, to, allocator)
    ccall((:rcutils_repl_str, librcutils), Ptr{Cchar}, (Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{rcutils_allocator_t}), str, from, to, allocator)
end

struct rcutils_shared_library_s
    lib_pointer::Ptr{Cvoid}
    library_path::Ptr{Cchar}
    allocator::rcutils_allocator_t
end

const rcutils_shared_library_t = rcutils_shared_library_s

function rcutils_get_zero_initialized_shared_library()
    ccall((:rcutils_get_zero_initialized_shared_library, librcutils), rcutils_shared_library_t, ())
end

function rcutils_load_shared_library(lib, library_path, allocator)
    ccall((:rcutils_load_shared_library, librcutils), rcutils_ret_t, (Ptr{rcutils_shared_library_t}, Ptr{Cchar}, rcutils_allocator_t), lib, library_path, allocator)
end

function rcutils_get_symbol(lib, symbol_name)
    ccall((:rcutils_get_symbol, librcutils), Ptr{Cvoid}, (Ptr{rcutils_shared_library_t}, Ptr{Cchar}), lib, symbol_name)
end

function rcutils_has_symbol(lib, symbol_name)
    ccall((:rcutils_has_symbol, librcutils), Bool, (Ptr{rcutils_shared_library_t}, Ptr{Cchar}), lib, symbol_name)
end

function rcutils_unload_shared_library(lib)
    ccall((:rcutils_unload_shared_library, librcutils), rcutils_ret_t, (Ptr{rcutils_shared_library_t},), lib)
end

function rcutils_is_shared_library_loaded(lib)
    ccall((:rcutils_is_shared_library_loaded, librcutils), Bool, (Ptr{rcutils_shared_library_t},), lib)
end

function rcutils_get_platform_library_name(library_name, library_name_platform, buffer_size, debug)
    ccall((:rcutils_get_platform_library_name, librcutils), rcutils_ret_t, (Ptr{Cchar}, Ptr{Cchar}, Cuint, Bool), library_name, library_name_platform, buffer_size, debug)
end

struct rcutils_string_array_s
    size::Csize_t
    data::Ptr{Ptr{Cchar}}
    allocator::rcutils_allocator_t
end

const rcutils_string_array_t = rcutils_string_array_s

function rcutils_split(str, delimiter, allocator, string_array)
    ccall((:rcutils_split, librcutils), rcutils_ret_t, (Ptr{Cchar}, Cchar, rcutils_allocator_t, Ptr{rcutils_string_array_t}), str, delimiter, allocator, string_array)
end

function rcutils_split_last(str, delimiter, allocator, string_array)
    ccall((:rcutils_split_last, librcutils), rcutils_ret_t, (Ptr{Cchar}, Cchar, rcutils_allocator_t, Ptr{rcutils_string_array_t}), str, delimiter, allocator, string_array)
end

function rcutils_atomic_load_bool(a_bool)
    ccall((:rcutils_atomic_load_bool, librcutils), Bool, (Ptr{Cint},), a_bool)
end

function rcutils_atomic_load_int64_t(a_int64_t)
    ccall((:rcutils_atomic_load_int64_t, librcutils), Int64, (Ptr{Cint},), a_int64_t)
end

function rcutils_atomic_load_uint64_t(a_uint64_t)
    ccall((:rcutils_atomic_load_uint64_t, librcutils), UInt64, (Ptr{Cint},), a_uint64_t)
end

function rcutils_atomic_load_uintptr_t(a_uintptr_t)
    ccall((:rcutils_atomic_load_uintptr_t, librcutils), Csize_t, (Ptr{Cint},), a_uintptr_t)
end

function rcutils_atomic_compare_exchange_strong_uint_least64_t(a_uint_least64_t, expected, desired)
    ccall((:rcutils_atomic_compare_exchange_strong_uint_least64_t, librcutils), Bool, (Ptr{Cint}, Ptr{UInt64}, UInt64), a_uint_least64_t, expected, desired)
end

function rcutils_atomic_exchange_bool(a_bool, desired)
    ccall((:rcutils_atomic_exchange_bool, librcutils), Bool, (Ptr{Cint}, Bool), a_bool, desired)
end

function rcutils_atomic_exchange_int64_t(a_int64_t, desired)
    ccall((:rcutils_atomic_exchange_int64_t, librcutils), Int64, (Ptr{Cint}, Int64), a_int64_t, desired)
end

function rcutils_atomic_exchange_uint64_t(a_uint64_t, desired)
    ccall((:rcutils_atomic_exchange_uint64_t, librcutils), UInt64, (Ptr{Cint}, UInt64), a_uint64_t, desired)
end

function rcutils_atomic_exchange_uintptr_t(a_uintptr_t, desired)
    ccall((:rcutils_atomic_exchange_uintptr_t, librcutils), Csize_t, (Ptr{Cint}, Csize_t), a_uintptr_t, desired)
end

function rcutils_atomic_fetch_add_uint64_t(a_uint64_t, arg)
    ccall((:rcutils_atomic_fetch_add_uint64_t, librcutils), UInt64, (Ptr{Cint}, UInt64), a_uint64_t, arg)
end

function rcutils_strcasecmp(s1, s2, value)
    ccall((:rcutils_strcasecmp, librcutils), Cint, (Ptr{Cchar}, Ptr{Cchar}, Ptr{Cint}), s1, s2, value)
end

function rcutils_strncasecmp(s1, s2, n, value)
    ccall((:rcutils_strncasecmp, librcutils), Cint, (Ptr{Cchar}, Ptr{Cchar}, Cint, Ptr{Cint}), s1, s2, n, value)
end

function rcutils_strdup(str, allocator)
    ccall((:rcutils_strdup, librcutils), Ptr{Cchar}, (Ptr{Cchar}, rcutils_allocator_t), str, allocator)
end

function rcutils_strndup(str, string_length, allocator)
    ccall((:rcutils_strndup, librcutils), Ptr{Cchar}, (Ptr{Cchar}, Csize_t, rcutils_allocator_t), str, string_length, allocator)
end

function rcutils_strerror(buffer, buffer_length)
    ccall((:rcutils_strerror, librcutils), Cvoid, (Ptr{Cchar}, Cint), buffer, buffer_length)
end

function rcutils_steady_time_now(now)
    ccall((:rcutils_steady_time_now, librcutils), rcutils_ret_t, (Ptr{rcutils_time_point_value_t},), now)
end

function rcutils_system_time_now(now)
    ccall((:rcutils_system_time_now, librcutils), rcutils_ret_t, (Ptr{rcutils_time_point_value_t},), now)
end

function rcutils_time_point_value_as_nanoseconds_string(time_point, str, str_size)
    ccall((:rcutils_time_point_value_as_nanoseconds_string, librcutils), rcutils_ret_t, (Ptr{rcutils_time_point_value_t}, Ptr{Cchar}, Csize_t), time_point, str, str_size)
end

function rcutils_time_point_value_as_seconds_string(time_point, str, str_size)
    ccall((:rcutils_time_point_value_as_seconds_string, librcutils), rcutils_ret_t, (Ptr{rcutils_time_point_value_t}, Ptr{Cchar}, Csize_t), time_point, str, str_size)
end

@cenum memory_order::UInt32 begin
    memory_order_relaxed = 0
    memory_order_consume = 1
    memory_order_acquire = 2
    memory_order_release = 3
    memory_order_acq_rel = 4
    memory_order_seq_cst = 5
end

struct var"##Ctag#2938"
    __val::Bool
end
function Base.getproperty(x::Ptr{var"##Ctag#2938"}, f::Symbol)
    f === :__val && return Ptr{Bool}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2938", f::Symbol)
    r = Ref{var"##Ctag#2938"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2938"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2938"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2939"
    __val::Cchar
end
function Base.getproperty(x::Ptr{var"##Ctag#2939"}, f::Symbol)
    f === :__val && return Ptr{Cchar}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2939", f::Symbol)
    r = Ref{var"##Ctag#2939"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2939"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2939"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2940"
    __val::Int8
end
function Base.getproperty(x::Ptr{var"##Ctag#2940"}, f::Symbol)
    f === :__val && return Ptr{Int8}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2940", f::Symbol)
    r = Ref{var"##Ctag#2940"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2940"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2940"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2941"
    __val::Cuchar
end
function Base.getproperty(x::Ptr{var"##Ctag#2941"}, f::Symbol)
    f === :__val && return Ptr{Cuchar}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2941", f::Symbol)
    r = Ref{var"##Ctag#2941"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2941"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2941"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2942"
    __val::Cshort
end
function Base.getproperty(x::Ptr{var"##Ctag#2942"}, f::Symbol)
    f === :__val && return Ptr{Cshort}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2942", f::Symbol)
    r = Ref{var"##Ctag#2942"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2942"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2942"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2943"
    __val::Cushort
end
function Base.getproperty(x::Ptr{var"##Ctag#2943"}, f::Symbol)
    f === :__val && return Ptr{Cushort}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2943", f::Symbol)
    r = Ref{var"##Ctag#2943"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2943"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2943"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2944"
    __val::Cint
end
function Base.getproperty(x::Ptr{var"##Ctag#2944"}, f::Symbol)
    f === :__val && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2944", f::Symbol)
    r = Ref{var"##Ctag#2944"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2944"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2944"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2945"
    __val::Cuint
end
function Base.getproperty(x::Ptr{var"##Ctag#2945"}, f::Symbol)
    f === :__val && return Ptr{Cuint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2945", f::Symbol)
    r = Ref{var"##Ctag#2945"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2945"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2945"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2946"
    __val::Clong
end
function Base.getproperty(x::Ptr{var"##Ctag#2946"}, f::Symbol)
    f === :__val && return Ptr{Clong}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2946", f::Symbol)
    r = Ref{var"##Ctag#2946"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2946"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2946"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2947"
    __val::Culong
end
function Base.getproperty(x::Ptr{var"##Ctag#2947"}, f::Symbol)
    f === :__val && return Ptr{Culong}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2947", f::Symbol)
    r = Ref{var"##Ctag#2947"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2947"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2947"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2948"
    __val::Clonglong
end
function Base.getproperty(x::Ptr{var"##Ctag#2948"}, f::Symbol)
    f === :__val && return Ptr{Clonglong}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2948", f::Symbol)
    r = Ref{var"##Ctag#2948"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2948"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2948"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2949"
    __val::Culonglong
end
function Base.getproperty(x::Ptr{var"##Ctag#2949"}, f::Symbol)
    f === :__val && return Ptr{Culonglong}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2949", f::Symbol)
    r = Ref{var"##Ctag#2949"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2949"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2949"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2950"
    __val::int_least16_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2950"}, f::Symbol)
    f === :__val && return Ptr{int_least16_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2950", f::Symbol)
    r = Ref{var"##Ctag#2950"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2950"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2950"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2951"
    __val::uint_least16_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2951"}, f::Symbol)
    f === :__val && return Ptr{uint_least16_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2951", f::Symbol)
    r = Ref{var"##Ctag#2951"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2951"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2951"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2952"
    __val::int_least32_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2952"}, f::Symbol)
    f === :__val && return Ptr{int_least32_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2952", f::Symbol)
    r = Ref{var"##Ctag#2952"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2952"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2952"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2953"
    __val::uint_least32_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2953"}, f::Symbol)
    f === :__val && return Ptr{uint_least32_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2953", f::Symbol)
    r = Ref{var"##Ctag#2953"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2953"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2953"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2954"
    __val::int_least64_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2954"}, f::Symbol)
    f === :__val && return Ptr{int_least64_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2954", f::Symbol)
    r = Ref{var"##Ctag#2954"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2954"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2954"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2955"
    __val::uint_least64_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2955"}, f::Symbol)
    f === :__val && return Ptr{uint_least64_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2955", f::Symbol)
    r = Ref{var"##Ctag#2955"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2955"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2955"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2956"
    __val::int_fast16_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2956"}, f::Symbol)
    f === :__val && return Ptr{int_fast16_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2956", f::Symbol)
    r = Ref{var"##Ctag#2956"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2956"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2956"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2957"
    __val::uint_fast16_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2957"}, f::Symbol)
    f === :__val && return Ptr{uint_fast16_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2957", f::Symbol)
    r = Ref{var"##Ctag#2957"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2957"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2957"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2958"
    __val::int_fast32_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2958"}, f::Symbol)
    f === :__val && return Ptr{int_fast32_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2958", f::Symbol)
    r = Ref{var"##Ctag#2958"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2958"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2958"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2959"
    __val::uint_fast32_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2959"}, f::Symbol)
    f === :__val && return Ptr{uint_fast32_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2959", f::Symbol)
    r = Ref{var"##Ctag#2959"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2959"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2959"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2960"
    __val::int_fast64_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2960"}, f::Symbol)
    f === :__val && return Ptr{int_fast64_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2960", f::Symbol)
    r = Ref{var"##Ctag#2960"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2960"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2960"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2961"
    __val::uint_fast64_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2961"}, f::Symbol)
    f === :__val && return Ptr{uint_fast64_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2961", f::Symbol)
    r = Ref{var"##Ctag#2961"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2961"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2961"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2962"
    __val::intptr_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2962"}, f::Symbol)
    f === :__val && return Ptr{intptr_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2962", f::Symbol)
    r = Ref{var"##Ctag#2962"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2962"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2962"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2963"
    __val::Csize_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2963"}, f::Symbol)
    f === :__val && return Ptr{Csize_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2963", f::Symbol)
    r = Ref{var"##Ctag#2963"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2963"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2963"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2964"
    __val::Csize_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2964"}, f::Symbol)
    f === :__val && return Ptr{Csize_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2964", f::Symbol)
    r = Ref{var"##Ctag#2964"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2964"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2964"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2965"
    __val::Cptrdiff_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2965"}, f::Symbol)
    f === :__val && return Ptr{Cptrdiff_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2965", f::Symbol)
    r = Ref{var"##Ctag#2965"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2965"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2965"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2966"
    __val::intmax_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2966"}, f::Symbol)
    f === :__val && return Ptr{intmax_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2966", f::Symbol)
    r = Ref{var"##Ctag#2966"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2966"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2966"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#2967"
    __val::uintmax_t
end
function Base.getproperty(x::Ptr{var"##Ctag#2967"}, f::Symbol)
    f === :__val && return Ptr{uintmax_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#2967", f::Symbol)
    r = Ref{var"##Ctag#2967"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#2967"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#2967"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


function _rcutils_fault_injection_maybe_fail()
    ccall((:_rcutils_fault_injection_maybe_fail, librcutils), int_least64_t, ())
end

function rcutils_fault_injection_set_count(count)
    ccall((:rcutils_fault_injection_set_count, librcutils), Cvoid, (int_least64_t,), count)
end

function rcutils_fault_injection_is_test_complete()
    ccall((:rcutils_fault_injection_is_test_complete, librcutils), Bool, ())
end

function rcutils_fault_injection_get_count()
    ccall((:rcutils_fault_injection_get_count, librcutils), int_least64_t, ())
end

mutable struct rcutils_array_list_impl_s end

struct rcutils_array_list_s
    impl::Ptr{rcutils_array_list_impl_s}
end

const rcutils_array_list_t = rcutils_array_list_s

function rcutils_get_zero_initialized_array_list()
    ccall((:rcutils_get_zero_initialized_array_list, librcutils), rcutils_array_list_t, ())
end

function rcutils_array_list_init(array_list, initial_capacity, data_size, allocator)
    ccall((:rcutils_array_list_init, librcutils), rcutils_ret_t, (Ptr{rcutils_array_list_t}, Csize_t, Csize_t, Ptr{rcutils_allocator_t}), array_list, initial_capacity, data_size, allocator)
end

function rcutils_array_list_fini(array_list)
    ccall((:rcutils_array_list_fini, librcutils), rcutils_ret_t, (Ptr{rcutils_array_list_t},), array_list)
end

function rcutils_array_list_add(array_list, data)
    ccall((:rcutils_array_list_add, librcutils), rcutils_ret_t, (Ptr{rcutils_array_list_t}, Ptr{Cvoid}), array_list, data)
end

function rcutils_array_list_set(array_list, index, data)
    ccall((:rcutils_array_list_set, librcutils), rcutils_ret_t, (Ptr{rcutils_array_list_t}, Csize_t, Ptr{Cvoid}), array_list, index, data)
end

function rcutils_array_list_remove(array_list, index)
    ccall((:rcutils_array_list_remove, librcutils), rcutils_ret_t, (Ptr{rcutils_array_list_t}, Csize_t), array_list, index)
end

function rcutils_array_list_get(array_list, index, data)
    ccall((:rcutils_array_list_get, librcutils), rcutils_ret_t, (Ptr{rcutils_array_list_t}, Csize_t, Ptr{Cvoid}), array_list, index, data)
end

function rcutils_array_list_get_size(array_list, size)
    ccall((:rcutils_array_list_get_size, librcutils), rcutils_ret_t, (Ptr{rcutils_array_list_t}, Ptr{Csize_t}), array_list, size)
end

function rcutils_get_zero_initialized_char_array()
    ccall((:rcutils_get_zero_initialized_char_array, librcutils), rcutils_char_array_t, ())
end

function rcutils_char_array_init(char_array, buffer_capacity, allocator)
    ccall((:rcutils_char_array_init, librcutils), rcutils_ret_t, (Ptr{rcutils_char_array_t}, Csize_t, Ptr{rcutils_allocator_t}), char_array, buffer_capacity, allocator)
end

function rcutils_char_array_fini(char_array)
    ccall((:rcutils_char_array_fini, librcutils), rcutils_ret_t, (Ptr{rcutils_char_array_t},), char_array)
end

function rcutils_char_array_resize(char_array, new_size)
    ccall((:rcutils_char_array_resize, librcutils), rcutils_ret_t, (Ptr{rcutils_char_array_t}, Csize_t), char_array, new_size)
end

function rcutils_char_array_expand_as_needed(char_array, new_size)
    ccall((:rcutils_char_array_expand_as_needed, librcutils), rcutils_ret_t, (Ptr{rcutils_char_array_t}, Csize_t), char_array, new_size)
end

function rcutils_char_array_strncat(char_array, src, n)
    ccall((:rcutils_char_array_strncat, librcutils), rcutils_ret_t, (Ptr{rcutils_char_array_t}, Ptr{Cchar}, Csize_t), char_array, src, n)
end

function rcutils_char_array_strcat(char_array, src)
    ccall((:rcutils_char_array_strcat, librcutils), rcutils_ret_t, (Ptr{rcutils_char_array_t}, Ptr{Cchar}), char_array, src)
end

function rcutils_char_array_memcpy(char_array, src, n)
    ccall((:rcutils_char_array_memcpy, librcutils), rcutils_ret_t, (Ptr{rcutils_char_array_t}, Ptr{Cchar}, Csize_t), char_array, src, n)
end

function rcutils_char_array_strcpy(char_array, src)
    ccall((:rcutils_char_array_strcpy, librcutils), rcutils_ret_t, (Ptr{rcutils_char_array_t}, Ptr{Cchar}), char_array, src)
end

mutable struct rcutils_hash_map_impl_s end

struct rcutils_hash_map_s
    impl::Ptr{rcutils_hash_map_impl_s}
end

const rcutils_hash_map_t = rcutils_hash_map_s

# typedef size_t ( * rcutils_hash_map_key_hasher_t ) ( const void * // key to hash )
const rcutils_hash_map_key_hasher_t = Ptr{Cvoid}

# typedef int ( * rcutils_hash_map_key_cmp_t ) ( const void * , // val1 const void * // val2 )
const rcutils_hash_map_key_cmp_t = Ptr{Cvoid}

function rcutils_hash_map_string_hash_func(key_str)
    ccall((:rcutils_hash_map_string_hash_func, librcutils), Csize_t, (Ptr{Cvoid},), key_str)
end

function rcutils_hash_map_string_cmp_func(val1, val2)
    ccall((:rcutils_hash_map_string_cmp_func, librcutils), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), val1, val2)
end

# no prototype is found for this function at hash_map.h:122:1, please use with caution
function rcutils_get_zero_initialized_hash_map()
    ccall((:rcutils_get_zero_initialized_hash_map, librcutils), rcutils_hash_map_t, ())
end

function rcutils_hash_map_init(hash_map, initial_capacity, key_size, data_size, key_hashing_func, key_cmp_func, allocator)
    ccall((:rcutils_hash_map_init, librcutils), rcutils_ret_t, (Ptr{rcutils_hash_map_t}, Csize_t, Csize_t, Csize_t, rcutils_hash_map_key_hasher_t, rcutils_hash_map_key_cmp_t, Ptr{rcutils_allocator_t}), hash_map, initial_capacity, key_size, data_size, key_hashing_func, key_cmp_func, allocator)
end

function rcutils_hash_map_fini(hash_map)
    ccall((:rcutils_hash_map_fini, librcutils), rcutils_ret_t, (Ptr{rcutils_hash_map_t},), hash_map)
end

function rcutils_hash_map_get_capacity(hash_map, capacity)
    ccall((:rcutils_hash_map_get_capacity, librcutils), rcutils_ret_t, (Ptr{rcutils_hash_map_t}, Ptr{Csize_t}), hash_map, capacity)
end

function rcutils_hash_map_get_size(hash_map, size)
    ccall((:rcutils_hash_map_get_size, librcutils), rcutils_ret_t, (Ptr{rcutils_hash_map_t}, Ptr{Csize_t}), hash_map, size)
end

function rcutils_hash_map_set(hash_map, key, value)
    ccall((:rcutils_hash_map_set, librcutils), rcutils_ret_t, (Ptr{rcutils_hash_map_t}, Ptr{Cvoid}, Ptr{Cvoid}), hash_map, key, value)
end

function rcutils_hash_map_unset(hash_map, key)
    ccall((:rcutils_hash_map_unset, librcutils), rcutils_ret_t, (Ptr{rcutils_hash_map_t}, Ptr{Cvoid}), hash_map, key)
end

function rcutils_hash_map_key_exists(hash_map, key)
    ccall((:rcutils_hash_map_key_exists, librcutils), Bool, (Ptr{rcutils_hash_map_t}, Ptr{Cvoid}), hash_map, key)
end

function rcutils_hash_map_get(hash_map, key, data)
    ccall((:rcutils_hash_map_get, librcutils), rcutils_ret_t, (Ptr{rcutils_hash_map_t}, Ptr{Cvoid}, Ptr{Cvoid}), hash_map, key, data)
end

function rcutils_hash_map_get_next_key_and_data(hash_map, previous_key, key, data)
    ccall((:rcutils_hash_map_get_next_key_and_data, librcutils), rcutils_ret_t, (Ptr{rcutils_hash_map_t}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), hash_map, previous_key, key, data)
end

function rcutils_get_zero_initialized_string_array()
    ccall((:rcutils_get_zero_initialized_string_array, librcutils), rcutils_string_array_t, ())
end

function rcutils_string_array_init(string_array, size, allocator)
    ccall((:rcutils_string_array_init, librcutils), rcutils_ret_t, (Ptr{rcutils_string_array_t}, Csize_t, Ptr{rcutils_allocator_t}), string_array, size, allocator)
end

function rcutils_string_array_fini(string_array)
    ccall((:rcutils_string_array_fini, librcutils), rcutils_ret_t, (Ptr{rcutils_string_array_t},), string_array)
end

function rcutils_string_array_cmp(lhs, rhs, res)
    ccall((:rcutils_string_array_cmp, librcutils), rcutils_ret_t, (Ptr{rcutils_string_array_t}, Ptr{rcutils_string_array_t}, Ptr{Cint}), lhs, rhs, res)
end

function rcutils_string_array_resize(string_array, new_size)
    ccall((:rcutils_string_array_resize, librcutils), rcutils_ret_t, (Ptr{rcutils_string_array_t}, Csize_t), string_array, new_size)
end

function rcutils_string_array_sort_compare(lhs, rhs)
    ccall((:rcutils_string_array_sort_compare, librcutils), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), lhs, rhs)
end

function rcutils_string_array_sort(string_array)
    ccall((:rcutils_string_array_sort, librcutils), rcutils_ret_t, (Ptr{rcutils_string_array_t},), string_array)
end

mutable struct rcutils_string_map_impl_s end

struct rcutils_string_map_s
    impl::Ptr{rcutils_string_map_impl_s}
end

const rcutils_string_map_t = rcutils_string_map_s

# no prototype is found for this function at string_map.h:60:1, please use with caution
function rcutils_get_zero_initialized_string_map()
    ccall((:rcutils_get_zero_initialized_string_map, librcutils), rcutils_string_map_t, ())
end

function rcutils_string_map_init(string_map, initial_capacity, allocator)
    ccall((:rcutils_string_map_init, librcutils), rcutils_ret_t, (Ptr{rcutils_string_map_t}, Csize_t, rcutils_allocator_t), string_map, initial_capacity, allocator)
end

function rcutils_string_map_fini(string_map)
    ccall((:rcutils_string_map_fini, librcutils), rcutils_ret_t, (Ptr{rcutils_string_map_t},), string_map)
end

function rcutils_string_map_get_capacity(string_map, capacity)
    ccall((:rcutils_string_map_get_capacity, librcutils), rcutils_ret_t, (Ptr{rcutils_string_map_t}, Ptr{Csize_t}), string_map, capacity)
end

function rcutils_string_map_get_size(string_map, size)
    ccall((:rcutils_string_map_get_size, librcutils), rcutils_ret_t, (Ptr{rcutils_string_map_t}, Ptr{Csize_t}), string_map, size)
end

function rcutils_string_map_reserve(string_map, capacity)
    ccall((:rcutils_string_map_reserve, librcutils), rcutils_ret_t, (Ptr{rcutils_string_map_t}, Csize_t), string_map, capacity)
end

function rcutils_string_map_clear(string_map)
    ccall((:rcutils_string_map_clear, librcutils), rcutils_ret_t, (Ptr{rcutils_string_map_t},), string_map)
end

function rcutils_string_map_set(string_map, key, value)
    ccall((:rcutils_string_map_set, librcutils), rcutils_ret_t, (Ptr{rcutils_string_map_t}, Ptr{Cchar}, Ptr{Cchar}), string_map, key, value)
end

function rcutils_string_map_set_no_resize(string_map, key, value)
    ccall((:rcutils_string_map_set_no_resize, librcutils), rcutils_ret_t, (Ptr{rcutils_string_map_t}, Ptr{Cchar}, Ptr{Cchar}), string_map, key, value)
end

function rcutils_string_map_unset(string_map, key)
    ccall((:rcutils_string_map_unset, librcutils), rcutils_ret_t, (Ptr{rcutils_string_map_t}, Ptr{Cchar}), string_map, key)
end

function rcutils_string_map_key_exists(string_map, key)
    ccall((:rcutils_string_map_key_exists, librcutils), Bool, (Ptr{rcutils_string_map_t}, Ptr{Cchar}), string_map, key)
end

function rcutils_string_map_key_existsn(string_map, key, key_length)
    ccall((:rcutils_string_map_key_existsn, librcutils), Bool, (Ptr{rcutils_string_map_t}, Ptr{Cchar}, Csize_t), string_map, key, key_length)
end

function rcutils_string_map_get(string_map, key)
    ccall((:rcutils_string_map_get, librcutils), Ptr{Cchar}, (Ptr{rcutils_string_map_t}, Ptr{Cchar}), string_map, key)
end

function rcutils_string_map_getn(string_map, key, key_length)
    ccall((:rcutils_string_map_getn, librcutils), Ptr{Cchar}, (Ptr{rcutils_string_map_t}, Ptr{Cchar}, Csize_t), string_map, key, key_length)
end

function rcutils_string_map_get_next_key(string_map, key)
    ccall((:rcutils_string_map_get_next_key, librcutils), Ptr{Cchar}, (Ptr{rcutils_string_map_t}, Ptr{Cchar}), string_map, key)
end

function rcutils_string_map_copy(src_string_map, dst_string_map)
    ccall((:rcutils_string_map_copy, librcutils), rcutils_ret_t, (Ptr{rcutils_string_map_t}, Ptr{rcutils_string_map_t}), src_string_map, dst_string_map)
end

struct rcutils_uint8_array_s
    buffer::Ptr{UInt8}
    buffer_length::Csize_t
    buffer_capacity::Csize_t
    allocator::rcutils_allocator_t
end

const rcutils_uint8_array_t = rcutils_uint8_array_s

function rcutils_get_zero_initialized_uint8_array()
    ccall((:rcutils_get_zero_initialized_uint8_array, librcutils), rcutils_uint8_array_t, ())
end

function rcutils_uint8_array_init(uint8_array, buffer_capacity, allocator)
    ccall((:rcutils_uint8_array_init, librcutils), rcutils_ret_t, (Ptr{rcutils_uint8_array_t}, Csize_t, Ptr{rcutils_allocator_t}), uint8_array, buffer_capacity, allocator)
end

function rcutils_uint8_array_fini(uint8_array)
    ccall((:rcutils_uint8_array_fini, librcutils), rcutils_ret_t, (Ptr{rcutils_uint8_array_t},), uint8_array)
end

function rcutils_uint8_array_resize(uint8_array, new_size)
    ccall((:rcutils_uint8_array_resize, librcutils), rcutils_ret_t, (Ptr{rcutils_uint8_array_t}, Csize_t), uint8_array, new_size)
end

# typedef const rosidl_service_type_support_t * ( * rosidl_service_typesupport_handle_function ) ( const rosidl_service_type_support_t * , const char * )
const rosidl_service_typesupport_handle_function = Ptr{Cvoid}

struct rosidl_service_type_support_t
    typesupport_identifier::Ptr{Cchar}
    data::Ptr{Cvoid}
    func::rosidl_service_typesupport_handle_function
end

# typedef const rosidl_message_type_support_t * ( * rosidl_message_typesupport_handle_function ) ( const rosidl_message_type_support_t * , const char * )
const rosidl_message_typesupport_handle_function = Ptr{Cvoid}

struct rosidl_message_type_support_t
    typesupport_identifier::Ptr{Cchar}
    data::Ptr{Cvoid}
    func::rosidl_message_typesupport_handle_function
end

struct rosidl_action_type_support_t
    goal_service_type_support::Ptr{rosidl_service_type_support_t}
    result_service_type_support::Ptr{rosidl_service_type_support_t}
    cancel_service_type_support::Ptr{rosidl_service_type_support_t}
    feedback_message_type_support::Ptr{rosidl_message_type_support_t}
    status_message_type_support::Ptr{rosidl_message_type_support_t}
end

@cenum rosidl_runtime_c__message_initialization::UInt32 begin
    ROSIDL_RUNTIME_C_MSG_INIT_ALL = 0
    ROSIDL_RUNTIME_C_MSG_INIT_SKIP = 1
    ROSIDL_RUNTIME_C_MSG_INIT_ZERO = 2
    ROSIDL_RUNTIME_C_MSG_INIT_DEFAULTS_ONLY = 3
end

function get_message_typesupport_handle(handle, identifier)
    ccall((:get_message_typesupport_handle, librosidl_runtime_c), Ptr{rosidl_message_type_support_t}, (Ptr{rosidl_message_type_support_t}, Ptr{Cchar}), handle, identifier)
end

function get_message_typesupport_handle_function(handle, identifier)
    ccall((:get_message_typesupport_handle_function, librosidl_runtime_c), Ptr{rosidl_message_type_support_t}, (Ptr{rosidl_message_type_support_t}, Ptr{Cchar}), handle, identifier)
end

struct rosidl_runtime_c__float__Sequence
    data::Ptr{Cfloat}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__double__Sequence
    data::Ptr{Cdouble}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__long_double__Sequence
    data::Ptr{Float64}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__char__Sequence
    data::Ptr{Int8}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__wchar__Sequence
    data::Ptr{UInt16}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__boolean__Sequence
    data::Ptr{Bool}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__octet__Sequence
    data::Ptr{UInt8}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__uint8__Sequence
    data::Ptr{UInt8}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__int8__Sequence
    data::Ptr{Int8}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__uint16__Sequence
    data::Ptr{UInt16}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__int16__Sequence
    data::Ptr{Int16}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__uint32__Sequence
    data::Ptr{UInt32}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__int32__Sequence
    data::Ptr{Int32}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__uint64__Sequence
    data::Ptr{UInt64}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__int64__Sequence
    data::Ptr{Int64}
    size::Csize_t
    capacity::Csize_t
end

const rosidl_runtime_c__bool__Sequence = rosidl_runtime_c__boolean__Sequence

const rosidl_runtime_c__byte__Sequence = rosidl_runtime_c__octet__Sequence

const rosidl_runtime_c__float32__Sequence = rosidl_runtime_c__float__Sequence

const rosidl_runtime_c__float64__Sequence = rosidl_runtime_c__double__Sequence

function rosidl_runtime_c__float__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__float__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__float__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__float__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__float__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__float__Sequence},), sequence)
end

function rosidl_runtime_c__float__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__float__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__float__Sequence}, Ptr{rosidl_runtime_c__float__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__float__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__float__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__float__Sequence}, Ptr{rosidl_runtime_c__float__Sequence}), input, output)
end

function rosidl_runtime_c__double__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__double__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__double__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__double__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__double__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__double__Sequence},), sequence)
end

function rosidl_runtime_c__double__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__double__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__double__Sequence}, Ptr{rosidl_runtime_c__double__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__double__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__double__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__double__Sequence}, Ptr{rosidl_runtime_c__double__Sequence}), input, output)
end

function rosidl_runtime_c__long_double__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__long_double__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__long_double__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__long_double__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__long_double__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__long_double__Sequence},), sequence)
end

function rosidl_runtime_c__long_double__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__long_double__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__long_double__Sequence}, Ptr{rosidl_runtime_c__long_double__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__long_double__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__long_double__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__long_double__Sequence}, Ptr{rosidl_runtime_c__long_double__Sequence}), input, output)
end

function rosidl_runtime_c__char__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__char__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__char__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__char__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__char__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__char__Sequence},), sequence)
end

function rosidl_runtime_c__char__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__char__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__char__Sequence}, Ptr{rosidl_runtime_c__char__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__char__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__char__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__char__Sequence}, Ptr{rosidl_runtime_c__char__Sequence}), input, output)
end

function rosidl_runtime_c__wchar__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__wchar__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__wchar__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__wchar__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__wchar__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__wchar__Sequence},), sequence)
end

function rosidl_runtime_c__wchar__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__wchar__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__wchar__Sequence}, Ptr{rosidl_runtime_c__wchar__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__wchar__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__wchar__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__wchar__Sequence}, Ptr{rosidl_runtime_c__wchar__Sequence}), input, output)
end

function rosidl_runtime_c__boolean__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__boolean__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__boolean__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__boolean__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__boolean__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__boolean__Sequence},), sequence)
end

function rosidl_runtime_c__boolean__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__boolean__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__boolean__Sequence}, Ptr{rosidl_runtime_c__boolean__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__boolean__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__boolean__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__boolean__Sequence}, Ptr{rosidl_runtime_c__boolean__Sequence}), input, output)
end

function rosidl_runtime_c__octet__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__octet__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__octet__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__octet__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__octet__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__octet__Sequence},), sequence)
end

function rosidl_runtime_c__octet__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__octet__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__octet__Sequence}, Ptr{rosidl_runtime_c__octet__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__octet__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__octet__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__octet__Sequence}, Ptr{rosidl_runtime_c__octet__Sequence}), input, output)
end

function rosidl_runtime_c__uint8__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__uint8__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__uint8__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__uint8__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__uint8__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__uint8__Sequence},), sequence)
end

function rosidl_runtime_c__uint8__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__uint8__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__uint8__Sequence}, Ptr{rosidl_runtime_c__uint8__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__uint8__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__uint8__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__uint8__Sequence}, Ptr{rosidl_runtime_c__uint8__Sequence}), input, output)
end

function rosidl_runtime_c__int8__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__int8__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__int8__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__int8__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__int8__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__int8__Sequence},), sequence)
end

function rosidl_runtime_c__int8__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__int8__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__int8__Sequence}, Ptr{rosidl_runtime_c__int8__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__int8__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__int8__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__int8__Sequence}, Ptr{rosidl_runtime_c__int8__Sequence}), input, output)
end

function rosidl_runtime_c__uint16__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__uint16__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__uint16__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__uint16__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__uint16__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__uint16__Sequence},), sequence)
end

function rosidl_runtime_c__uint16__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__uint16__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__uint16__Sequence}, Ptr{rosidl_runtime_c__uint16__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__uint16__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__uint16__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__uint16__Sequence}, Ptr{rosidl_runtime_c__uint16__Sequence}), input, output)
end

function rosidl_runtime_c__int16__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__int16__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__int16__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__int16__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__int16__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__int16__Sequence},), sequence)
end

function rosidl_runtime_c__int16__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__int16__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__int16__Sequence}, Ptr{rosidl_runtime_c__int16__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__int16__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__int16__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__int16__Sequence}, Ptr{rosidl_runtime_c__int16__Sequence}), input, output)
end

function rosidl_runtime_c__uint32__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__uint32__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__uint32__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__uint32__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__uint32__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__uint32__Sequence},), sequence)
end

function rosidl_runtime_c__uint32__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__uint32__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__uint32__Sequence}, Ptr{rosidl_runtime_c__uint32__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__uint32__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__uint32__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__uint32__Sequence}, Ptr{rosidl_runtime_c__uint32__Sequence}), input, output)
end

function rosidl_runtime_c__int32__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__int32__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__int32__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__int32__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__int32__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__int32__Sequence},), sequence)
end

function rosidl_runtime_c__int32__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__int32__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__int32__Sequence}, Ptr{rosidl_runtime_c__int32__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__int32__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__int32__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__int32__Sequence}, Ptr{rosidl_runtime_c__int32__Sequence}), input, output)
end

function rosidl_runtime_c__uint64__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__uint64__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__uint64__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__uint64__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__uint64__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__uint64__Sequence},), sequence)
end

function rosidl_runtime_c__uint64__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__uint64__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__uint64__Sequence}, Ptr{rosidl_runtime_c__uint64__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__uint64__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__uint64__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__uint64__Sequence}, Ptr{rosidl_runtime_c__uint64__Sequence}), input, output)
end

function rosidl_runtime_c__int64__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__int64__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__int64__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__int64__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__int64__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__int64__Sequence},), sequence)
end

function rosidl_runtime_c__int64__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__int64__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__int64__Sequence}, Ptr{rosidl_runtime_c__int64__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__int64__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__int64__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__int64__Sequence}, Ptr{rosidl_runtime_c__int64__Sequence}), input, output)
end

function rosidl_runtime_c__bool__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__bool__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__boolean__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__bool__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__bool__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__boolean__Sequence},), sequence)
end

function rosidl_runtime_c__bool__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__bool__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__boolean__Sequence}, Ptr{rosidl_runtime_c__boolean__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__bool__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__bool__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__boolean__Sequence}, Ptr{rosidl_runtime_c__boolean__Sequence}), input, output)
end

function rosidl_runtime_c__byte__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__byte__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__octet__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__byte__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__byte__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__octet__Sequence},), sequence)
end

function rosidl_runtime_c__byte__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__byte__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__octet__Sequence}, Ptr{rosidl_runtime_c__octet__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__byte__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__byte__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__octet__Sequence}, Ptr{rosidl_runtime_c__octet__Sequence}), input, output)
end

function rosidl_runtime_c__float32__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__float32__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__float__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__float32__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__float32__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__float__Sequence},), sequence)
end

function rosidl_runtime_c__float32__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__float32__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__float__Sequence}, Ptr{rosidl_runtime_c__float__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__float32__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__float32__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__float__Sequence}, Ptr{rosidl_runtime_c__float__Sequence}), input, output)
end

function rosidl_runtime_c__float64__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__float64__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__double__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__float64__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__float64__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__double__Sequence},), sequence)
end

function rosidl_runtime_c__float64__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__float64__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__double__Sequence}, Ptr{rosidl_runtime_c__double__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__float64__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__float64__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__double__Sequence}, Ptr{rosidl_runtime_c__double__Sequence}), input, output)
end

# typedef const rosidl_runtime_c__Sequence__bound * ( * rosidl_runtime_c__bound_handle_function ) ( const rosidl_runtime_c__Sequence__bound * , const char * )
const rosidl_runtime_c__bound_handle_function = Ptr{Cvoid}

struct rosidl_runtime_c__Sequence__bound
    typesupport_identifier::Ptr{Cchar}
    data::Ptr{Cvoid}
    func::rosidl_runtime_c__bound_handle_function
end

function get_sequence_bound_handle(handle, identifier)
    ccall((:get_sequence_bound_handle, librosidl_runtime_c), Ptr{rosidl_runtime_c__Sequence__bound}, (Ptr{rosidl_runtime_c__Sequence__bound}, Ptr{Cchar}), handle, identifier)
end

function get_sequence_bound_handle_function(handle, identifier)
    ccall((:get_sequence_bound_handle_function, librosidl_runtime_c), Ptr{rosidl_runtime_c__Sequence__bound}, (Ptr{rosidl_runtime_c__Sequence__bound}, Ptr{Cchar}), handle, identifier)
end

function get_service_typesupport_handle(handle, identifier)
    ccall((:get_service_typesupport_handle, librosidl_runtime_c), Ptr{rosidl_service_type_support_t}, (Ptr{rosidl_service_type_support_t}, Ptr{Cchar}), handle, identifier)
end

function get_service_typesupport_handle_function(handle, identifier)
    ccall((:get_service_typesupport_handle_function, librosidl_runtime_c), Ptr{rosidl_service_type_support_t}, (Ptr{rosidl_service_type_support_t}, Ptr{Cchar}), handle, identifier)
end

struct rosidl_runtime_c__String
    data::Ptr{Cchar}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__String__Sequence
    data::Ptr{rosidl_runtime_c__String}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__String__bound
    bound::Csize_t
end

function rosidl_runtime_c__String__init(str)
    ccall((:rosidl_runtime_c__String__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__String},), str)
end

function rosidl_runtime_c__String__fini(str)
    ccall((:rosidl_runtime_c__String__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__String},), str)
end

function rosidl_runtime_c__String__copy(input, output)
    ccall((:rosidl_runtime_c__String__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__String}, Ptr{rosidl_runtime_c__String}), input, output)
end

function rosidl_runtime_c__String__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__String__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__String}, Ptr{rosidl_runtime_c__String}), lhs, rhs)
end

function rosidl_runtime_c__String__assignn(str, value, n)
    ccall((:rosidl_runtime_c__String__assignn, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__String}, Ptr{Cchar}, Csize_t), str, value, n)
end

function rosidl_runtime_c__String__assign(str, value)
    ccall((:rosidl_runtime_c__String__assign, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__String}, Ptr{Cchar}), str, value)
end

function rosidl_runtime_c__String__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__String__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__String__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__String__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__String__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__String__Sequence},), sequence)
end

function rosidl_runtime_c__String__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__String__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__String__Sequence}, Ptr{rosidl_runtime_c__String__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__String__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__String__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__String__Sequence}, Ptr{rosidl_runtime_c__String__Sequence}), input, output)
end

function rosidl_runtime_c__String__Sequence__create(size)
    ccall((:rosidl_runtime_c__String__Sequence__create, librosidl_runtime_c), Ptr{rosidl_runtime_c__String__Sequence}, (Csize_t,), size)
end

function rosidl_runtime_c__String__Sequence__destroy(sequence)
    ccall((:rosidl_runtime_c__String__Sequence__destroy, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__String__Sequence},), sequence)
end

struct rosidl_runtime_c__U16String
    data::Ptr{uint_least16_t}
    size::Csize_t
    capacity::Csize_t
end

struct rosidl_runtime_c__U16String__Sequence
    data::Ptr{rosidl_runtime_c__U16String}
    size::Csize_t
    capacity::Csize_t
end

function rosidl_runtime_c__U16String__init(str)
    ccall((:rosidl_runtime_c__U16String__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__U16String},), str)
end

function rosidl_runtime_c__U16String__fini(str)
    ccall((:rosidl_runtime_c__U16String__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__U16String},), str)
end

function rosidl_runtime_c__U16String__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__U16String__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__U16String}, Ptr{rosidl_runtime_c__U16String}), lhs, rhs)
end

function rosidl_runtime_c__U16String__copy(input, output)
    ccall((:rosidl_runtime_c__U16String__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__U16String}, Ptr{rosidl_runtime_c__U16String}), input, output)
end

function rosidl_runtime_c__U16String__assignn(str, value, n)
    ccall((:rosidl_runtime_c__U16String__assignn, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__U16String}, Ptr{UInt16}, Csize_t), str, value, n)
end

function rosidl_runtime_c__U16String__assignn_from_char(str, value, n)
    ccall((:rosidl_runtime_c__U16String__assignn_from_char, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__U16String}, Ptr{Cchar}, Csize_t), str, value, n)
end

function rosidl_runtime_c__U16String__assign(str, value)
    ccall((:rosidl_runtime_c__U16String__assign, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__U16String}, Ptr{UInt16}), str, value)
end

function rosidl_runtime_c__U16String__len(value)
    ccall((:rosidl_runtime_c__U16String__len, librosidl_runtime_c), Csize_t, (Ptr{UInt16},), value)
end

function rosidl_runtime_c__U16String__resize(str, n)
    ccall((:rosidl_runtime_c__U16String__resize, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__U16String}, Csize_t), str, n)
end

function rosidl_runtime_c__U16String__Sequence__init(sequence, size)
    ccall((:rosidl_runtime_c__U16String__Sequence__init, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__U16String__Sequence}, Csize_t), sequence, size)
end

function rosidl_runtime_c__U16String__Sequence__fini(sequence)
    ccall((:rosidl_runtime_c__U16String__Sequence__fini, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__U16String__Sequence},), sequence)
end

function rosidl_runtime_c__U16String__Sequence__are_equal(lhs, rhs)
    ccall((:rosidl_runtime_c__U16String__Sequence__are_equal, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__U16String__Sequence}, Ptr{rosidl_runtime_c__U16String__Sequence}), lhs, rhs)
end

function rosidl_runtime_c__U16String__Sequence__copy(input, output)
    ccall((:rosidl_runtime_c__U16String__Sequence__copy, librosidl_runtime_c), Bool, (Ptr{rosidl_runtime_c__U16String__Sequence}, Ptr{rosidl_runtime_c__U16String__Sequence}), input, output)
end

function rosidl_runtime_c__U16String__Sequence__create(size)
    ccall((:rosidl_runtime_c__U16String__Sequence__create, librosidl_runtime_c), Ptr{rosidl_runtime_c__U16String__Sequence}, (Csize_t,), size)
end

function rosidl_runtime_c__U16String__Sequence__destroy(sequence)
    ccall((:rosidl_runtime_c__U16String__Sequence__destroy, librosidl_runtime_c), Cvoid, (Ptr{rosidl_runtime_c__U16String__Sequence},), sequence)
end

function rosidl_typesupport_c__get_message_typesupport_handle_function(handle, identifier)
    ccall((:rosidl_typesupport_c__get_message_typesupport_handle_function, rosidl_typesupport_c), Ptr{rosidl_message_type_support_t}, (Ptr{rosidl_message_type_support_t}, Ptr{Cchar}), handle, identifier)
end

function rosidl_typesupport_c__get_service_typesupport_handle_function(handle, identifier)
    ccall((:rosidl_typesupport_c__get_service_typesupport_handle_function, rosidl_typesupport_c), Ptr{rosidl_service_type_support_t}, (Ptr{rosidl_service_type_support_t}, Ptr{Cchar}), handle, identifier)
end

struct type_support_map_t
    size::Cint
    package_name::Ptr{Cchar}
    typesupport_identifier::Ptr{Ptr{Cchar}}
    symbol_name::Ptr{Ptr{Cchar}}
    data::Ptr{Ptr{Cvoid}}
end

@cenum rosidl_typesupport_introspection_c_field_types::UInt32 begin
    rosidl_typesupport_introspection_c__ROS_TYPE_FLOAT = 1
    rosidl_typesupport_introspection_c__ROS_TYPE_DOUBLE = 2
    rosidl_typesupport_introspection_c__ROS_TYPE_LONG_DOUBLE = 3
    rosidl_typesupport_introspection_c__ROS_TYPE_CHAR = 4
    rosidl_typesupport_introspection_c__ROS_TYPE_WCHAR = 5
    rosidl_typesupport_introspection_c__ROS_TYPE_BOOLEAN = 6
    rosidl_typesupport_introspection_c__ROS_TYPE_OCTET = 7
    rosidl_typesupport_introspection_c__ROS_TYPE_UINT8 = 8
    rosidl_typesupport_introspection_c__ROS_TYPE_INT8 = 9
    rosidl_typesupport_introspection_c__ROS_TYPE_UINT16 = 10
    rosidl_typesupport_introspection_c__ROS_TYPE_INT16 = 11
    rosidl_typesupport_introspection_c__ROS_TYPE_UINT32 = 12
    rosidl_typesupport_introspection_c__ROS_TYPE_INT32 = 13
    rosidl_typesupport_introspection_c__ROS_TYPE_UINT64 = 14
    rosidl_typesupport_introspection_c__ROS_TYPE_INT64 = 15
    rosidl_typesupport_introspection_c__ROS_TYPE_STRING = 16
    rosidl_typesupport_introspection_c__ROS_TYPE_WSTRING = 17
    rosidl_typesupport_introspection_c__ROS_TYPE_MESSAGE = 18
    rosidl_typesupport_introspection_c__ROS_TYPE_FLOAT32 = 1
    rosidl_typesupport_introspection_c__ROS_TYPE_FLOAT64 = 2
    rosidl_typesupport_introspection_c__ROS_TYPE_BOOL = 6
    rosidl_typesupport_introspection_c__ROS_TYPE_BYTE = 7
end

struct rosidl_typesupport_introspection_c__MessageMember_s
    name_::Ptr{Cchar}
    type_id_::UInt8
    string_upper_bound_::Csize_t
    members_::Ptr{rosidl_message_type_support_t}
    is_array_::Bool
    array_size_::Csize_t
    is_upper_bound_::Bool
    offset_::UInt32
    default_value_::Ptr{Cvoid}
    size_function::Ptr{Cvoid}
    get_const_function::Ptr{Cvoid}
    get_function::Ptr{Cvoid}
    fetch_function::Ptr{Cvoid}
    assign_function::Ptr{Cvoid}
    resize_function::Ptr{Cvoid}
end

const rosidl_typesupport_introspection_c__MessageMember = rosidl_typesupport_introspection_c__MessageMember_s

struct rosidl_typesupport_introspection_c__MessageMembers_s
    message_namespace_::Ptr{Cchar}
    message_name_::Ptr{Cchar}
    member_count_::UInt32
    size_of_::Csize_t
    members_::Ptr{rosidl_typesupport_introspection_c__MessageMember}
    init_function::Ptr{Cvoid}
    fini_function::Ptr{Cvoid}
end

const rosidl_typesupport_introspection_c__MessageMembers = rosidl_typesupport_introspection_c__MessageMembers_s

struct rosidl_typesupport_introspection_c__ServiceMembers_s
    service_namespace_::Ptr{Cchar}
    service_name_::Ptr{Cchar}
    request_members_::Ptr{rosidl_typesupport_introspection_c__MessageMembers}
    response_members_::Ptr{rosidl_typesupport_introspection_c__MessageMembers}
end

const rosidl_typesupport_introspection_c__ServiceMembers = rosidl_typesupport_introspection_c__ServiceMembers_s

struct rcl_byte_array_s
    values::Ptr{UInt8}
    size::Csize_t
end

const rcl_byte_array_t = rcl_byte_array_s

struct rcl_bool_array_s
    values::Ptr{Bool}
    size::Csize_t
end

const rcl_bool_array_t = rcl_bool_array_s

struct rcl_int64_array_s
    values::Ptr{Int64}
    size::Csize_t
end

const rcl_int64_array_t = rcl_int64_array_s

struct rcl_double_array_s
    values::Ptr{Cdouble}
    size::Csize_t
end

const rcl_double_array_t = rcl_double_array_s

struct rcl_variant_s
    bool_value::Ptr{Bool}
    integer_value::Ptr{Int64}
    double_value::Ptr{Cdouble}
    string_value::Ptr{Cchar}
    byte_array_value::Ptr{rcl_byte_array_t}
    bool_array_value::Ptr{rcl_bool_array_t}
    integer_array_value::Ptr{rcl_int64_array_t}
    double_array_value::Ptr{rcl_double_array_t}
    string_array_value::Ptr{rcutils_string_array_t}
end

const rcl_variant_t = rcl_variant_s

struct rcl_node_params_s
    parameter_names::Ptr{Ptr{Cchar}}
    parameter_values::Ptr{rcl_variant_t}
    num_params::Csize_t
    capacity_params::Csize_t
end

const rcl_node_params_t = rcl_node_params_s

struct rcl_params_s
    node_names::Ptr{Ptr{Cchar}}
    params::Ptr{rcl_node_params_t}
    num_nodes::Csize_t
    capacity_nodes::Csize_t
    allocator::rcutils_allocator_t
end

const rcl_params_t = rcl_params_s

function rcl_yaml_node_struct_init(allocator)
    ccall((:rcl_yaml_node_struct_init, librcl_yaml_param_parser), Ptr{rcl_params_t}, (rcutils_allocator_t,), allocator)
end

function rcl_yaml_node_struct_init_with_capacity(capacity, allocator)
    ccall((:rcl_yaml_node_struct_init_with_capacity, librcl_yaml_param_parser), Ptr{rcl_params_t}, (Csize_t, rcutils_allocator_t), capacity, allocator)
end

function rcl_yaml_node_struct_reallocate(params_st, new_capacity, allocator)
    ccall((:rcl_yaml_node_struct_reallocate, librcl_yaml_param_parser), rcutils_ret_t, (Ptr{rcl_params_t}, Csize_t, rcutils_allocator_t), params_st, new_capacity, allocator)
end

function rcl_yaml_node_struct_copy(params_st)
    ccall((:rcl_yaml_node_struct_copy, librcl_yaml_param_parser), Ptr{rcl_params_t}, (Ptr{rcl_params_t},), params_st)
end

function rcl_yaml_node_struct_fini(params_st)
    ccall((:rcl_yaml_node_struct_fini, librcl_yaml_param_parser), Cvoid, (Ptr{rcl_params_t},), params_st)
end

function rcl_parse_yaml_file(file_path, params_st)
    ccall((:rcl_parse_yaml_file, librcl_yaml_param_parser), Bool, (Ptr{Cchar}, Ptr{rcl_params_t}), file_path, params_st)
end

function rcl_parse_yaml_value(node_name, param_name, yaml_value, params_st)
    ccall((:rcl_parse_yaml_value, librcl_yaml_param_parser), Bool, (Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{rcl_params_t}), node_name, param_name, yaml_value, params_st)
end

function rcl_yaml_node_struct_get(node_name, param_name, params_st)
    ccall((:rcl_yaml_node_struct_get, librcl_yaml_param_parser), Ptr{rcl_variant_t}, (Ptr{Cchar}, Ptr{Cchar}, Ptr{rcl_params_t}), node_name, param_name, params_st)
end

function rcl_yaml_node_struct_print(params_st)
    ccall((:rcl_yaml_node_struct_print, librcl_yaml_param_parser), Cvoid, (Ptr{rcl_params_t},), params_st)
end

function rmw_allocate(size)
    ccall((:rmw_allocate, librmw), Ptr{Cvoid}, (Csize_t,), size)
end

function rmw_free(pointer)
    ccall((:rmw_free, librmw), Cvoid, (Ptr{Cvoid},), pointer)
end

@cenum rmw_security_enforcement_policy_e::UInt32 begin
    RMW_SECURITY_ENFORCEMENT_PERMISSIVE = 0
    RMW_SECURITY_ENFORCEMENT_ENFORCE = 1
end

const rmw_security_enforcement_policy_t = rmw_security_enforcement_policy_e

struct rmw_security_options_s
    enforce_security::rmw_security_enforcement_policy_t
    security_root_path::Ptr{Cchar}
end

const rmw_security_options_t = rmw_security_options_s

@cenum rmw_localhost_only_e::UInt32 begin
    RMW_LOCALHOST_ONLY_DEFAULT = 0
    RMW_LOCALHOST_ONLY_ENABLED = 1
    RMW_LOCALHOST_ONLY_DISABLED = 2
end

const rmw_localhost_only_t = rmw_localhost_only_e

mutable struct rmw_init_options_impl_s end

const rmw_init_options_impl_t = rmw_init_options_impl_s

struct rmw_init_options_s
    instance_id::UInt64
    implementation_identifier::Ptr{Cchar}
    domain_id::Csize_t
    security_options::rmw_security_options_t
    localhost_only::rmw_localhost_only_t
    enclave::Ptr{Cchar}
    allocator::rcutils_allocator_t
    impl::Ptr{rmw_init_options_impl_t}
end

const rmw_init_options_t = rmw_init_options_s

mutable struct rmw_context_impl_s end

const rmw_context_impl_t = rmw_context_impl_s

struct rmw_context_s
    instance_id::UInt64
    implementation_identifier::Ptr{Cchar}
    options::rmw_init_options_t
    actual_domain_id::Csize_t
    impl::Ptr{rmw_context_impl_t}
end

const rmw_context_t = rmw_context_s

struct rmw_node_s
    implementation_identifier::Ptr{Cchar}
    data::Ptr{Cvoid}
    name::Ptr{Cchar}
    namespace_::Ptr{Cchar}
    context::Ptr{rmw_context_t}
end

const rmw_node_t = rmw_node_s

function rmw_node_allocate()
    ccall((:rmw_node_allocate, librmw), Ptr{rmw_node_t}, ())
end

function rmw_node_free(node)
    ccall((:rmw_node_free, librmw), Cvoid, (Ptr{rmw_node_t},), node)
end

@cenum rmw_unique_network_flow_endpoints_requirement_e::UInt32 begin
    RMW_UNIQUE_NETWORK_FLOW_ENDPOINTS_NOT_REQUIRED = 0
    RMW_UNIQUE_NETWORK_FLOW_ENDPOINTS_STRICTLY_REQUIRED = 1
    RMW_UNIQUE_NETWORK_FLOW_ENDPOINTS_OPTIONALLY_REQUIRED = 2
    RMW_UNIQUE_NETWORK_FLOW_ENDPOINTS_SYSTEM_DEFAULT = 3
end

const rmw_unique_network_flow_endpoints_requirement_t = rmw_unique_network_flow_endpoints_requirement_e

struct rmw_publisher_options_s
    rmw_specific_publisher_payload::Ptr{Cvoid}
    require_unique_network_flow_endpoints::rmw_unique_network_flow_endpoints_requirement_t
end

const rmw_publisher_options_t = rmw_publisher_options_s

struct rmw_publisher_s
    implementation_identifier::Ptr{Cchar}
    data::Ptr{Cvoid}
    topic_name::Ptr{Cchar}
    options::rmw_publisher_options_t
    can_loan_messages::Bool
end

const rmw_publisher_t = rmw_publisher_s

function rmw_publisher_allocate()
    ccall((:rmw_publisher_allocate, librmw), Ptr{rmw_publisher_t}, ())
end

function rmw_publisher_free(publisher)
    ccall((:rmw_publisher_free, librmw), Cvoid, (Ptr{rmw_publisher_t},), publisher)
end

struct rmw_subscription_content_filter_options_s
    filter_expression::Ptr{Cchar}
    expression_parameters::rcutils_string_array_t
end

const rmw_subscription_content_filter_options_t = rmw_subscription_content_filter_options_s

struct rmw_subscription_options_s
    rmw_specific_subscription_payload::Ptr{Cvoid}
    ignore_local_publications::Bool
    require_unique_network_flow_endpoints::rmw_unique_network_flow_endpoints_requirement_t
    content_filter_options::Ptr{rmw_subscription_content_filter_options_t}
end

const rmw_subscription_options_t = rmw_subscription_options_s

struct rmw_subscription_s
    implementation_identifier::Ptr{Cchar}
    data::Ptr{Cvoid}
    topic_name::Ptr{Cchar}
    options::rmw_subscription_options_t
    can_loan_messages::Bool
    is_cft_enabled::Bool
end

const rmw_subscription_t = rmw_subscription_s

function rmw_subscription_allocate()
    ccall((:rmw_subscription_allocate, librmw), Ptr{rmw_subscription_t}, ())
end

function rmw_subscription_free(subscription)
    ccall((:rmw_subscription_free, librmw), Cvoid, (Ptr{rmw_subscription_t},), subscription)
end

struct rmw_guard_condition_s
    implementation_identifier::Ptr{Cchar}
    data::Ptr{Cvoid}
    context::Ptr{rmw_context_t}
end

const rmw_guard_condition_t = rmw_guard_condition_s

function rmw_guard_condition_allocate()
    ccall((:rmw_guard_condition_allocate, librmw), Ptr{rmw_guard_condition_t}, ())
end

function rmw_guard_condition_free(guard_condition)
    ccall((:rmw_guard_condition_free, librmw), Cvoid, (Ptr{rmw_guard_condition_t},), guard_condition)
end

struct rmw_client_s
    implementation_identifier::Ptr{Cchar}
    data::Ptr{Cvoid}
    service_name::Ptr{Cchar}
end

const rmw_client_t = rmw_client_s

function rmw_client_allocate()
    ccall((:rmw_client_allocate, librmw), Ptr{rmw_client_t}, ())
end

function rmw_client_free(client)
    ccall((:rmw_client_free, librmw), Cvoid, (Ptr{rmw_client_t},), client)
end

struct rmw_service_s
    implementation_identifier::Ptr{Cchar}
    data::Ptr{Cvoid}
    service_name::Ptr{Cchar}
end

const rmw_service_t = rmw_service_s

function rmw_service_allocate()
    ccall((:rmw_service_allocate, librmw), Ptr{rmw_service_t}, ())
end

function rmw_service_free(service)
    ccall((:rmw_service_free, librmw), Cvoid, (Ptr{rmw_service_t},), service)
end

struct rmw_guard_conditions_s
    guard_condition_count::Csize_t
    guard_conditions::Ptr{Ptr{Cvoid}}
end

const rmw_guard_conditions_t = rmw_guard_conditions_s

struct rmw_wait_set_s
    implementation_identifier::Ptr{Cchar}
    guard_conditions::Ptr{rmw_guard_conditions_t}
    data::Ptr{Cvoid}
end

const rmw_wait_set_t = rmw_wait_set_s

function rmw_wait_set_allocate()
    ccall((:rmw_wait_set_allocate, librmw), Ptr{rmw_wait_set_t}, ())
end

function rmw_wait_set_free(wait_set)
    ccall((:rmw_wait_set_free, librmw), Cvoid, (Ptr{rmw_wait_set_t},), wait_set)
end

const rmw_ret_t = Int32

function rmw_convert_rcutils_ret_to_rmw_ret(rcutils_ret)
    ccall((:rmw_convert_rcutils_ret_to_rmw_ret, librmw), rmw_ret_t, (rcutils_ret_t,), rcutils_ret)
end

const rmw_error_string_t = rcutils_error_string_t

const rmw_error_state_t = rcutils_error_state_t

@cenum rmw_event_type_e::UInt32 begin
    RMW_EVENT_LIVELINESS_CHANGED = 0
    RMW_EVENT_REQUESTED_DEADLINE_MISSED = 1
    RMW_EVENT_REQUESTED_QOS_INCOMPATIBLE = 2
    RMW_EVENT_MESSAGE_LOST = 3
    RMW_EVENT_LIVELINESS_LOST = 4
    RMW_EVENT_OFFERED_DEADLINE_MISSED = 5
    RMW_EVENT_OFFERED_QOS_INCOMPATIBLE = 6
    RMW_EVENT_INVALID = 7
end

const rmw_event_type_t = rmw_event_type_e

struct rmw_event_s
    implementation_identifier::Ptr{Cchar}
    data::Ptr{Cvoid}
    event_type::rmw_event_type_t
end

const rmw_event_t = rmw_event_s

function rmw_get_zero_initialized_event()
    ccall((:rmw_get_zero_initialized_event, librmw), rmw_event_t, ())
end

function rmw_publisher_event_init(rmw_event, publisher, event_type)
    ccall((:rmw_publisher_event_init, librmw), rmw_ret_t, (Ptr{rmw_event_t}, Ptr{rmw_publisher_t}, rmw_event_type_t), rmw_event, publisher, event_type)
end

function rmw_subscription_event_init(rmw_event, subscription, event_type)
    ccall((:rmw_subscription_event_init, librmw), rmw_ret_t, (Ptr{rmw_event_t}, Ptr{rmw_subscription_t}, rmw_event_type_t), rmw_event, subscription, event_type)
end

function rmw_take_event(event_handle, event_info, taken)
    ccall((:rmw_take_event, librmw), rmw_ret_t, (Ptr{rmw_event_t}, Ptr{Cvoid}, Ptr{Bool}), event_handle, event_info, taken)
end

function rmw_event_fini(event)
    ccall((:rmw_event_fini, librmw), rmw_ret_t, (Ptr{rmw_event_t},), event)
end

# typedef void ( * rmw_event_callback_t ) ( const void * user_data , size_t number_of_events )
const rmw_event_callback_t = Ptr{Cvoid}

@cenum rmw_feature_e::UInt32 begin
    RMW_FEATURE_MESSAGE_INFO_PUBLICATION_SEQUENCE_NUMBER = 0
    RMW_FEATURE_MESSAGE_INFO_RECEPTION_SEQUENCE_NUMBER = 1
end

const rmw_feature_t = rmw_feature_e

function rmw_feature_supported(feature)
    ccall((:rmw_feature_supported, librmw), Bool, (rmw_feature_t,), feature)
end

@cenum rmw_transport_protocol_e::UInt32 begin
    RMW_TRANSPORT_PROTOCOL_UNKNOWN = 0
    RMW_TRANSPORT_PROTOCOL_UDP = 1
    RMW_TRANSPORT_PROTOCOL_TCP = 2
    RMW_TRANSPORT_PROTOCOL_COUNT = 3
end

const rmw_transport_protocol_t = rmw_transport_protocol_e

@cenum rmw_internet_protocol_e::UInt32 begin
    RMW_INTERNET_PROTOCOL_UNKNOWN = 0
    RMW_INTERNET_PROTOCOL_IPV4 = 1
    RMW_INTERNET_PROTOCOL_IPV6 = 2
    RMW_INTERNET_PROTOCOL_COUNT = 3
end

const rmw_internet_protocol_t = rmw_internet_protocol_e

struct rmw_network_flow_endpoint_s
    transport_protocol::rmw_transport_protocol_t
    internet_protocol::rmw_internet_protocol_t
    transport_port::UInt16
    flow_label::UInt32
    dscp::UInt8
    internet_address::NTuple{48, Cchar}
end

const rmw_network_flow_endpoint_t = rmw_network_flow_endpoint_s

struct rmw_network_flow_endpoint_array_s
    size::Csize_t
    network_flow_endpoint::Ptr{rmw_network_flow_endpoint_t}
    allocator::Ptr{rcutils_allocator_t}
end

const rmw_network_flow_endpoint_array_t = rmw_network_flow_endpoint_array_s

function rmw_publisher_get_network_flow_endpoints(publisher, allocator, network_flow_endpoint_array)
    ccall((:rmw_publisher_get_network_flow_endpoints, librmw), rmw_ret_t, (Ptr{rmw_publisher_t}, Ptr{rcutils_allocator_t}, Ptr{rmw_network_flow_endpoint_array_t}), publisher, allocator, network_flow_endpoint_array)
end

function rmw_subscription_get_network_flow_endpoints(subscription, allocator, network_flow_endpoint_array)
    ccall((:rmw_subscription_get_network_flow_endpoints, librmw), rmw_ret_t, (Ptr{rmw_subscription_t}, Ptr{rcutils_allocator_t}, Ptr{rmw_network_flow_endpoint_array_t}), subscription, allocator, network_flow_endpoint_array)
end

struct rmw_names_and_types_s
    names::rcutils_string_array_t
    types::Ptr{rcutils_string_array_t}
end

const rmw_names_and_types_t = rmw_names_and_types_s

function rmw_get_subscriber_names_and_types_by_node(node, allocator, node_name, node_namespace, no_demangle, topic_names_and_types)
    ccall((:rmw_get_subscriber_names_and_types_by_node, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{rcutils_allocator_t}, Ptr{Cchar}, Ptr{Cchar}, Bool, Ptr{rmw_names_and_types_t}), node, allocator, node_name, node_namespace, no_demangle, topic_names_and_types)
end

function rmw_get_publisher_names_and_types_by_node(node, allocator, node_name, node_namespace, no_demangle, topic_names_and_types)
    ccall((:rmw_get_publisher_names_and_types_by_node, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{rcutils_allocator_t}, Ptr{Cchar}, Ptr{Cchar}, Bool, Ptr{rmw_names_and_types_t}), node, allocator, node_name, node_namespace, no_demangle, topic_names_and_types)
end

function rmw_get_service_names_and_types_by_node(node, allocator, node_name, node_namespace, service_names_and_types)
    ccall((:rmw_get_service_names_and_types_by_node, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{rcutils_allocator_t}, Ptr{Cchar}, Ptr{Cchar}, Ptr{rmw_names_and_types_t}), node, allocator, node_name, node_namespace, service_names_and_types)
end

function rmw_get_client_names_and_types_by_node(node, allocator, node_name, node_namespace, service_names_and_types)
    ccall((:rmw_get_client_names_and_types_by_node, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{rcutils_allocator_t}, Ptr{Cchar}, Ptr{Cchar}, Ptr{rmw_names_and_types_t}), node, allocator, node_name, node_namespace, service_names_and_types)
end

function rmw_get_service_names_and_types(node, allocator, service_names_and_types)
    ccall((:rmw_get_service_names_and_types, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{rcutils_allocator_t}, Ptr{rmw_names_and_types_t}), node, allocator, service_names_and_types)
end

@cenum rmw_endpoint_type_e::UInt32 begin
    RMW_ENDPOINT_INVALID = 0
    RMW_ENDPOINT_PUBLISHER = 1
    RMW_ENDPOINT_SUBSCRIPTION = 2
end

const rmw_endpoint_type_t = rmw_endpoint_type_e

@cenum rmw_qos_history_policy_e::UInt32 begin
    RMW_QOS_POLICY_HISTORY_SYSTEM_DEFAULT = 0
    RMW_QOS_POLICY_HISTORY_KEEP_LAST = 1
    RMW_QOS_POLICY_HISTORY_KEEP_ALL = 2
    RMW_QOS_POLICY_HISTORY_UNKNOWN = 3
end

@cenum rmw_qos_reliability_policy_e::UInt32 begin
    RMW_QOS_POLICY_RELIABILITY_SYSTEM_DEFAULT = 0
    RMW_QOS_POLICY_RELIABILITY_RELIABLE = 1
    RMW_QOS_POLICY_RELIABILITY_BEST_EFFORT = 2
    RMW_QOS_POLICY_RELIABILITY_UNKNOWN = 3
end

@cenum rmw_qos_durability_policy_e::UInt32 begin
    RMW_QOS_POLICY_DURABILITY_SYSTEM_DEFAULT = 0
    RMW_QOS_POLICY_DURABILITY_TRANSIENT_LOCAL = 1
    RMW_QOS_POLICY_DURABILITY_VOLATILE = 2
    RMW_QOS_POLICY_DURABILITY_UNKNOWN = 3
end

struct rmw_time_s
    sec::UInt64
    nsec::UInt64
end

@cenum rmw_qos_liveliness_policy_e::UInt32 begin
    RMW_QOS_POLICY_LIVELINESS_SYSTEM_DEFAULT = 0
    RMW_QOS_POLICY_LIVELINESS_AUTOMATIC = 1
    RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_NODE = 2
    RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_TOPIC = 3
    RMW_QOS_POLICY_LIVELINESS_UNKNOWN = 4
end

struct rmw_qos_profile_s
    history::rmw_qos_history_policy_e
    depth::Csize_t
    reliability::rmw_qos_reliability_policy_e
    durability::rmw_qos_durability_policy_e
    deadline::rmw_time_s
    lifespan::rmw_time_s
    liveliness::rmw_qos_liveliness_policy_e
    liveliness_lease_duration::rmw_time_s
    avoid_ros_namespace_conventions::Bool
end

const rmw_qos_profile_t = rmw_qos_profile_s

struct rmw_topic_endpoint_info_s
    node_name::Ptr{Cchar}
    node_namespace::Ptr{Cchar}
    topic_type::Ptr{Cchar}
    endpoint_type::rmw_endpoint_type_t
    endpoint_gid::NTuple{24, UInt8}
    qos_profile::rmw_qos_profile_t
end

const rmw_topic_endpoint_info_t = rmw_topic_endpoint_info_s

struct rmw_topic_endpoint_info_array_s
    size::Csize_t
    info_array::Ptr{rmw_topic_endpoint_info_t}
end

const rmw_topic_endpoint_info_array_t = rmw_topic_endpoint_info_array_s

function rmw_get_publishers_info_by_topic(node, allocator, topic_name, no_mangle, publishers_info)
    ccall((:rmw_get_publishers_info_by_topic, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{rcutils_allocator_t}, Ptr{Cchar}, Bool, Ptr{rmw_topic_endpoint_info_array_t}), node, allocator, topic_name, no_mangle, publishers_info)
end

function rmw_get_subscriptions_info_by_topic(node, allocator, topic_name, no_mangle, subscriptions_info)
    ccall((:rmw_get_subscriptions_info_by_topic, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{rcutils_allocator_t}, Ptr{Cchar}, Bool, Ptr{rmw_topic_endpoint_info_array_t}), node, allocator, topic_name, no_mangle, subscriptions_info)
end

function rmw_get_topic_names_and_types(node, allocator, no_demangle, topic_names_and_types)
    ccall((:rmw_get_topic_names_and_types, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{rcutils_allocator_t}, Bool, Ptr{rmw_names_and_types_t}), node, allocator, no_demangle, topic_names_and_types)
end

function rmw_get_zero_initialized_context()
    ccall((:rmw_get_zero_initialized_context, librmw), rmw_context_t, ())
end

function rmw_init(options, context)
    ccall((:rmw_init, librmw), rmw_ret_t, (Ptr{rmw_init_options_t}, Ptr{rmw_context_t}), options, context)
end

function rmw_shutdown(context)
    ccall((:rmw_shutdown, librmw), rmw_ret_t, (Ptr{rmw_context_t},), context)
end

function rmw_context_fini(context)
    ccall((:rmw_context_fini, librmw), rmw_ret_t, (Ptr{rmw_context_t},), context)
end

function rmw_get_zero_initialized_init_options()
    ccall((:rmw_get_zero_initialized_init_options, librmw), rmw_init_options_t, ())
end

function rmw_init_options_init(init_options, allocator)
    ccall((:rmw_init_options_init, librmw), rmw_ret_t, (Ptr{rmw_init_options_t}, rcutils_allocator_t), init_options, allocator)
end

function rmw_init_options_copy(src, dst)
    ccall((:rmw_init_options_copy, librmw), rmw_ret_t, (Ptr{rmw_init_options_t}, Ptr{rmw_init_options_t}), src, dst)
end

function rmw_init_options_fini(init_options)
    ccall((:rmw_init_options_fini, librmw), rmw_ret_t, (Ptr{rmw_init_options_t},), init_options)
end

struct rmw_message_sequence_s
    data::Ptr{Ptr{Cvoid}}
    size::Csize_t
    capacity::Csize_t
    allocator::Ptr{rcutils_allocator_t}
end

const rmw_message_sequence_t = rmw_message_sequence_s

const rmw_time_point_value_t = rcutils_time_point_value_t

struct rmw_gid_s
    implementation_identifier::Ptr{Cchar}
    data::NTuple{24, UInt8}
end

const rmw_gid_t = rmw_gid_s

struct rmw_message_info_s
    source_timestamp::rmw_time_point_value_t
    received_timestamp::rmw_time_point_value_t
    publication_sequence_number::UInt64
    reception_sequence_number::UInt64
    publisher_gid::rmw_gid_t
    from_intra_process::Bool
end

const rmw_message_info_t = rmw_message_info_s

struct rmw_message_info_sequence_s
    data::Ptr{rmw_message_info_t}
    size::Csize_t
    capacity::Csize_t
    allocator::Ptr{rcutils_allocator_t}
end

const rmw_message_info_sequence_t = rmw_message_info_sequence_s

function rmw_get_zero_initialized_message_sequence()
    ccall((:rmw_get_zero_initialized_message_sequence, librmw), rmw_message_sequence_t, ())
end

function rmw_message_sequence_init(sequence, size, allocator)
    ccall((:rmw_message_sequence_init, librmw), rmw_ret_t, (Ptr{rmw_message_sequence_t}, Csize_t, Ptr{rcutils_allocator_t}), sequence, size, allocator)
end

function rmw_message_sequence_fini(sequence)
    ccall((:rmw_message_sequence_fini, librmw), rmw_ret_t, (Ptr{rmw_message_sequence_t},), sequence)
end

function rmw_get_zero_initialized_message_info_sequence()
    ccall((:rmw_get_zero_initialized_message_info_sequence, librmw), rmw_message_info_sequence_t, ())
end

function rmw_message_info_sequence_init(sequence, size, allocator)
    ccall((:rmw_message_info_sequence_init, librmw), rmw_ret_t, (Ptr{rmw_message_info_sequence_t}, Csize_t, Ptr{rcutils_allocator_t}), sequence, size, allocator)
end

function rmw_message_info_sequence_fini(sequence)
    ccall((:rmw_message_info_sequence_fini, librmw), rmw_ret_t, (Ptr{rmw_message_info_sequence_t},), sequence)
end

function rmw_get_zero_initialized_names_and_types()
    ccall((:rmw_get_zero_initialized_names_and_types, librmw), rmw_names_and_types_t, ())
end

function rmw_names_and_types_check_zero(names_and_types)
    ccall((:rmw_names_and_types_check_zero, librmw), rmw_ret_t, (Ptr{rmw_names_and_types_t},), names_and_types)
end

function rmw_names_and_types_init(names_and_types, size, allocator)
    ccall((:rmw_names_and_types_init, librmw), rmw_ret_t, (Ptr{rmw_names_and_types_t}, Csize_t, Ptr{rcutils_allocator_t}), names_and_types, size, allocator)
end

function rmw_names_and_types_fini(names_and_types)
    ccall((:rmw_names_and_types_fini, librmw), rmw_ret_t, (Ptr{rmw_names_and_types_t},), names_and_types)
end

function rmw_get_zero_initialized_network_flow_endpoint()
    ccall((:rmw_get_zero_initialized_network_flow_endpoint, librmw), rmw_network_flow_endpoint_t, ())
end

function rmw_network_flow_endpoint_get_transport_protocol_string(transport_protocol)
    ccall((:rmw_network_flow_endpoint_get_transport_protocol_string, librmw), Ptr{Cchar}, (rmw_transport_protocol_t,), transport_protocol)
end

function rmw_network_flow_endpoint_get_internet_protocol_string(internet_protocol)
    ccall((:rmw_network_flow_endpoint_get_internet_protocol_string, librmw), Ptr{Cchar}, (rmw_internet_protocol_t,), internet_protocol)
end

function rmw_network_flow_endpoint_set_internet_address(network_flow_endpoint, internet_address, size)
    ccall((:rmw_network_flow_endpoint_set_internet_address, librmw), rmw_ret_t, (Ptr{rmw_network_flow_endpoint_t}, Ptr{Cchar}, Csize_t), network_flow_endpoint, internet_address, size)
end

function rmw_get_zero_initialized_network_flow_endpoint_array()
    ccall((:rmw_get_zero_initialized_network_flow_endpoint_array, librmw), rmw_network_flow_endpoint_array_t, ())
end

function rmw_network_flow_endpoint_array_check_zero(network_flow_endpoint_array)
    ccall((:rmw_network_flow_endpoint_array_check_zero, librmw), rmw_ret_t, (Ptr{rmw_network_flow_endpoint_array_t},), network_flow_endpoint_array)
end

function rmw_network_flow_endpoint_array_init(network_flow_endpoint_array, size, allocator)
    ccall((:rmw_network_flow_endpoint_array_init, librmw), rmw_ret_t, (Ptr{rmw_network_flow_endpoint_array_t}, Csize_t, Ptr{rcutils_allocator_t}), network_flow_endpoint_array, size, allocator)
end

function rmw_network_flow_endpoint_array_fini(network_flow_endpoint_array)
    ccall((:rmw_network_flow_endpoint_array_fini, librmw), rmw_ret_t, (Ptr{rmw_network_flow_endpoint_array_t},), network_flow_endpoint_array)
end

function rmw_get_default_publisher_options()
    ccall((:rmw_get_default_publisher_options, librmw), rmw_publisher_options_t, ())
end

@cenum rmw_qos_policy_kind_e::UInt32 begin
    RMW_QOS_POLICY_INVALID = 1
    RMW_QOS_POLICY_DURABILITY = 2
    RMW_QOS_POLICY_DEADLINE = 4
    RMW_QOS_POLICY_LIVELINESS = 8
    RMW_QOS_POLICY_RELIABILITY = 16
    RMW_QOS_POLICY_HISTORY = 32
    RMW_QOS_POLICY_LIFESPAN = 64
    RMW_QOS_POLICY_DEPTH = 128
    RMW_QOS_POLICY_LIVELINESS_LEASE_DURATION = 256
    RMW_QOS_POLICY_AVOID_ROS_NAMESPACE_CONVENTIONS = 512
end

const rmw_qos_policy_kind_t = rmw_qos_policy_kind_e

@cenum rmw_qos_compatibility_type_e::UInt32 begin
    RMW_QOS_COMPATIBILITY_OK = 0
    RMW_QOS_COMPATIBILITY_WARNING = 1
    RMW_QOS_COMPATIBILITY_ERROR = 2
end

const rmw_qos_compatibility_type_t = rmw_qos_compatibility_type_e

function rmw_qos_profile_check_compatible(publisher_profile, subscription_profile, compatibility, reason, reason_size)
    ccall((:rmw_qos_profile_check_compatible, librmw), rmw_ret_t, (rmw_qos_profile_t, rmw_qos_profile_t, Ptr{rmw_qos_compatibility_type_t}, Ptr{Cchar}, Csize_t), publisher_profile, subscription_profile, compatibility, reason, reason_size)
end

function rmw_qos_policy_kind_to_str(kind)
    ccall((:rmw_qos_policy_kind_to_str, librmw), Ptr{Cchar}, (rmw_qos_policy_kind_t,), kind)
end

const rmw_qos_durability_policy_t = rmw_qos_durability_policy_e

function rmw_qos_durability_policy_to_str(value)
    ccall((:rmw_qos_durability_policy_to_str, librmw), Ptr{Cchar}, (rmw_qos_durability_policy_t,), value)
end

const rmw_qos_history_policy_t = rmw_qos_history_policy_e

function rmw_qos_history_policy_to_str(value)
    ccall((:rmw_qos_history_policy_to_str, librmw), Ptr{Cchar}, (rmw_qos_history_policy_t,), value)
end

const rmw_qos_liveliness_policy_t = rmw_qos_liveliness_policy_e

function rmw_qos_liveliness_policy_to_str(value)
    ccall((:rmw_qos_liveliness_policy_to_str, librmw), Ptr{Cchar}, (rmw_qos_liveliness_policy_t,), value)
end

const rmw_qos_reliability_policy_t = rmw_qos_reliability_policy_e

function rmw_qos_reliability_policy_to_str(value)
    ccall((:rmw_qos_reliability_policy_to_str, librmw), Ptr{Cchar}, (rmw_qos_reliability_policy_t,), value)
end

function rmw_qos_policy_kind_from_str(str)
    ccall((:rmw_qos_policy_kind_from_str, librmw), rmw_qos_policy_kind_t, (Ptr{Cchar},), str)
end

function rmw_qos_durability_policy_from_str(str)
    ccall((:rmw_qos_durability_policy_from_str, librmw), rmw_qos_durability_policy_t, (Ptr{Cchar},), str)
end

function rmw_qos_history_policy_from_str(str)
    ccall((:rmw_qos_history_policy_from_str, librmw), rmw_qos_history_policy_t, (Ptr{Cchar},), str)
end

function rmw_qos_liveliness_policy_from_str(str)
    ccall((:rmw_qos_liveliness_policy_from_str, librmw), rmw_qos_liveliness_policy_t, (Ptr{Cchar},), str)
end

function rmw_qos_reliability_policy_from_str(str)
    ccall((:rmw_qos_reliability_policy_from_str, librmw), rmw_qos_reliability_policy_t, (Ptr{Cchar},), str)
end

function rmw_get_implementation_identifier()
    ccall((:rmw_get_implementation_identifier, librmw), Ptr{Cchar}, ())
end

function rmw_get_serialization_format()
    ccall((:rmw_get_serialization_format, librmw), Ptr{Cchar}, ())
end

function rmw_create_node(context, name, namespace_)
    ccall((:rmw_create_node, librmw), Ptr{rmw_node_t}, (Ptr{rmw_context_t}, Ptr{Cchar}, Ptr{Cchar}), context, name, namespace_)
end

function rmw_destroy_node(node)
    ccall((:rmw_destroy_node, librmw), rmw_ret_t, (Ptr{rmw_node_t},), node)
end

function rmw_node_assert_liveliness(node)
    ccall((:rmw_node_assert_liveliness, librmw), rmw_ret_t, (Ptr{rmw_node_t},), node)
end

function rmw_node_get_graph_guard_condition(node)
    ccall((:rmw_node_get_graph_guard_condition, librmw), Ptr{rmw_guard_condition_t}, (Ptr{rmw_node_t},), node)
end

struct rmw_publisher_allocation_s
    implementation_identifier::Ptr{Cchar}
    data::Ptr{Cvoid}
end

const rmw_publisher_allocation_t = rmw_publisher_allocation_s

function rmw_init_publisher_allocation(type_support, message_bounds, allocation)
    ccall((:rmw_init_publisher_allocation, librmw), rmw_ret_t, (Ptr{rosidl_message_type_support_t}, Ptr{rosidl_runtime_c__Sequence__bound}, Ptr{rmw_publisher_allocation_t}), type_support, message_bounds, allocation)
end

function rmw_fini_publisher_allocation(allocation)
    ccall((:rmw_fini_publisher_allocation, librmw), rmw_ret_t, (Ptr{rmw_publisher_allocation_t},), allocation)
end

function rmw_create_publisher(node, type_support, topic_name, qos_profile, publisher_options)
    ccall((:rmw_create_publisher, librmw), Ptr{rmw_publisher_t}, (Ptr{rmw_node_t}, Ptr{rosidl_message_type_support_t}, Ptr{Cchar}, Ptr{rmw_qos_profile_t}, Ptr{rmw_publisher_options_t}), node, type_support, topic_name, qos_profile, publisher_options)
end

function rmw_destroy_publisher(node, publisher)
    ccall((:rmw_destroy_publisher, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{rmw_publisher_t}), node, publisher)
end

function rmw_borrow_loaned_message(publisher, type_support, ros_message)
    ccall((:rmw_borrow_loaned_message, librmw), rmw_ret_t, (Ptr{rmw_publisher_t}, Ptr{rosidl_message_type_support_t}, Ptr{Ptr{Cvoid}}), publisher, type_support, ros_message)
end

function rmw_return_loaned_message_from_publisher(publisher, loaned_message)
    ccall((:rmw_return_loaned_message_from_publisher, librmw), rmw_ret_t, (Ptr{rmw_publisher_t}, Ptr{Cvoid}), publisher, loaned_message)
end

function rmw_publish(publisher, ros_message, allocation)
    ccall((:rmw_publish, librmw), rmw_ret_t, (Ptr{rmw_publisher_t}, Ptr{Cvoid}, Ptr{rmw_publisher_allocation_t}), publisher, ros_message, allocation)
end

function rmw_publish_loaned_message(publisher, ros_message, allocation)
    ccall((:rmw_publish_loaned_message, librmw), rmw_ret_t, (Ptr{rmw_publisher_t}, Ptr{Cvoid}, Ptr{rmw_publisher_allocation_t}), publisher, ros_message, allocation)
end

function rmw_publisher_count_matched_subscriptions(publisher, subscription_count)
    ccall((:rmw_publisher_count_matched_subscriptions, librmw), rmw_ret_t, (Ptr{rmw_publisher_t}, Ptr{Csize_t}), publisher, subscription_count)
end

function rmw_publisher_get_actual_qos(publisher, qos)
    ccall((:rmw_publisher_get_actual_qos, librmw), rmw_ret_t, (Ptr{rmw_publisher_t}, Ptr{rmw_qos_profile_t}), publisher, qos)
end

const rmw_serialized_message_t = rcutils_uint8_array_t

function rmw_publish_serialized_message(publisher, serialized_message, allocation)
    ccall((:rmw_publish_serialized_message, librmw), rmw_ret_t, (Ptr{rmw_publisher_t}, Ptr{rmw_serialized_message_t}, Ptr{rmw_publisher_allocation_t}), publisher, serialized_message, allocation)
end

function rmw_get_serialized_message_size(type_support, message_bounds, size)
    ccall((:rmw_get_serialized_message_size, librmw), rmw_ret_t, (Ptr{rosidl_message_type_support_t}, Ptr{rosidl_runtime_c__Sequence__bound}, Ptr{Csize_t}), type_support, message_bounds, size)
end

function rmw_publisher_assert_liveliness(publisher)
    ccall((:rmw_publisher_assert_liveliness, librmw), rmw_ret_t, (Ptr{rmw_publisher_t},), publisher)
end

const rmw_time_t = rmw_time_s

function rmw_publisher_wait_for_all_acked(publisher, wait_timeout)
    ccall((:rmw_publisher_wait_for_all_acked, librmw), rmw_ret_t, (Ptr{rmw_publisher_t}, rmw_time_t), publisher, wait_timeout)
end

function rmw_serialize(ros_message, type_support, serialized_message)
    ccall((:rmw_serialize, librmw), rmw_ret_t, (Ptr{Cvoid}, Ptr{rosidl_message_type_support_t}, Ptr{rmw_serialized_message_t}), ros_message, type_support, serialized_message)
end

function rmw_deserialize(serialized_message, type_support, ros_message)
    ccall((:rmw_deserialize, librmw), rmw_ret_t, (Ptr{rmw_serialized_message_t}, Ptr{rosidl_message_type_support_t}, Ptr{Cvoid}), serialized_message, type_support, ros_message)
end

struct rmw_subscription_allocation_s
    implementation_identifier::Ptr{Cchar}
    data::Ptr{Cvoid}
end

const rmw_subscription_allocation_t = rmw_subscription_allocation_s

function rmw_init_subscription_allocation(type_support, message_bounds, allocation)
    ccall((:rmw_init_subscription_allocation, librmw), rmw_ret_t, (Ptr{rosidl_message_type_support_t}, Ptr{rosidl_runtime_c__Sequence__bound}, Ptr{rmw_subscription_allocation_t}), type_support, message_bounds, allocation)
end

function rmw_fini_subscription_allocation(allocation)
    ccall((:rmw_fini_subscription_allocation, librmw), rmw_ret_t, (Ptr{rmw_subscription_allocation_t},), allocation)
end

function rmw_create_subscription(node, type_support, topic_name, qos_policies, subscription_options)
    ccall((:rmw_create_subscription, librmw), Ptr{rmw_subscription_t}, (Ptr{rmw_node_t}, Ptr{rosidl_message_type_support_t}, Ptr{Cchar}, Ptr{rmw_qos_profile_t}, Ptr{rmw_subscription_options_t}), node, type_support, topic_name, qos_policies, subscription_options)
end

function rmw_destroy_subscription(node, subscription)
    ccall((:rmw_destroy_subscription, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{rmw_subscription_t}), node, subscription)
end

function rmw_subscription_count_matched_publishers(subscription, publisher_count)
    ccall((:rmw_subscription_count_matched_publishers, librmw), rmw_ret_t, (Ptr{rmw_subscription_t}, Ptr{Csize_t}), subscription, publisher_count)
end

function rmw_subscription_get_actual_qos(subscription, qos)
    ccall((:rmw_subscription_get_actual_qos, librmw), rmw_ret_t, (Ptr{rmw_subscription_t}, Ptr{rmw_qos_profile_t}), subscription, qos)
end

function rmw_subscription_set_content_filter(subscription, options)
    ccall((:rmw_subscription_set_content_filter, librmw), rmw_ret_t, (Ptr{rmw_subscription_t}, Ptr{rmw_subscription_content_filter_options_t}), subscription, options)
end

function rmw_subscription_get_content_filter(subscription, allocator, options)
    ccall((:rmw_subscription_get_content_filter, librmw), rmw_ret_t, (Ptr{rmw_subscription_t}, Ptr{rcutils_allocator_t}, Ptr{rmw_subscription_content_filter_options_t}), subscription, allocator, options)
end

function rmw_take(subscription, ros_message, taken, allocation)
    ccall((:rmw_take, librmw), rmw_ret_t, (Ptr{rmw_subscription_t}, Ptr{Cvoid}, Ptr{Bool}, Ptr{rmw_subscription_allocation_t}), subscription, ros_message, taken, allocation)
end

function rmw_take_with_info(subscription, ros_message, taken, message_info, allocation)
    ccall((:rmw_take_with_info, librmw), rmw_ret_t, (Ptr{rmw_subscription_t}, Ptr{Cvoid}, Ptr{Bool}, Ptr{rmw_message_info_t}, Ptr{rmw_subscription_allocation_t}), subscription, ros_message, taken, message_info, allocation)
end

function rmw_take_sequence(subscription, count, message_sequence, message_info_sequence, taken, allocation)
    ccall((:rmw_take_sequence, librmw), rmw_ret_t, (Ptr{rmw_subscription_t}, Csize_t, Ptr{rmw_message_sequence_t}, Ptr{rmw_message_info_sequence_t}, Ptr{Csize_t}, Ptr{rmw_subscription_allocation_t}), subscription, count, message_sequence, message_info_sequence, taken, allocation)
end

function rmw_take_serialized_message(subscription, serialized_message, taken, allocation)
    ccall((:rmw_take_serialized_message, librmw), rmw_ret_t, (Ptr{rmw_subscription_t}, Ptr{rmw_serialized_message_t}, Ptr{Bool}, Ptr{rmw_subscription_allocation_t}), subscription, serialized_message, taken, allocation)
end

function rmw_take_serialized_message_with_info(subscription, serialized_message, taken, message_info, allocation)
    ccall((:rmw_take_serialized_message_with_info, librmw), rmw_ret_t, (Ptr{rmw_subscription_t}, Ptr{rmw_serialized_message_t}, Ptr{Bool}, Ptr{rmw_message_info_t}, Ptr{rmw_subscription_allocation_t}), subscription, serialized_message, taken, message_info, allocation)
end

function rmw_take_loaned_message(subscription, loaned_message, taken, allocation)
    ccall((:rmw_take_loaned_message, librmw), rmw_ret_t, (Ptr{rmw_subscription_t}, Ptr{Ptr{Cvoid}}, Ptr{Bool}, Ptr{rmw_subscription_allocation_t}), subscription, loaned_message, taken, allocation)
end

function rmw_take_loaned_message_with_info(subscription, loaned_message, taken, message_info, allocation)
    ccall((:rmw_take_loaned_message_with_info, librmw), rmw_ret_t, (Ptr{rmw_subscription_t}, Ptr{Ptr{Cvoid}}, Ptr{Bool}, Ptr{rmw_message_info_t}, Ptr{rmw_subscription_allocation_t}), subscription, loaned_message, taken, message_info, allocation)
end

function rmw_return_loaned_message_from_subscription(subscription, loaned_message)
    ccall((:rmw_return_loaned_message_from_subscription, librmw), rmw_ret_t, (Ptr{rmw_subscription_t}, Ptr{Cvoid}), subscription, loaned_message)
end

function rmw_create_client(node, type_support, service_name, qos_policies)
    ccall((:rmw_create_client, librmw), Ptr{rmw_client_t}, (Ptr{rmw_node_t}, Ptr{rosidl_service_type_support_t}, Ptr{Cchar}, Ptr{rmw_qos_profile_t}), node, type_support, service_name, qos_policies)
end

function rmw_destroy_client(node, client)
    ccall((:rmw_destroy_client, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{rmw_client_t}), node, client)
end

function rmw_send_request(client, ros_request, sequence_id)
    ccall((:rmw_send_request, librmw), rmw_ret_t, (Ptr{rmw_client_t}, Ptr{Cvoid}, Ptr{Int64}), client, ros_request, sequence_id)
end

struct rmw_request_id_s
    writer_guid::NTuple{16, Int8}
    sequence_number::Int64
end

const rmw_request_id_t = rmw_request_id_s

struct rmw_service_info_s
    source_timestamp::rmw_time_point_value_t
    received_timestamp::rmw_time_point_value_t
    request_id::rmw_request_id_t
end

const rmw_service_info_t = rmw_service_info_s

function rmw_take_response(client, request_header, ros_response, taken)
    ccall((:rmw_take_response, librmw), rmw_ret_t, (Ptr{rmw_client_t}, Ptr{rmw_service_info_t}, Ptr{Cvoid}, Ptr{Bool}), client, request_header, ros_response, taken)
end

function rmw_client_request_publisher_get_actual_qos(client, qos)
    ccall((:rmw_client_request_publisher_get_actual_qos, librmw), rmw_ret_t, (Ptr{rmw_client_t}, Ptr{rmw_qos_profile_t}), client, qos)
end

function rmw_client_response_subscription_get_actual_qos(client, qos)
    ccall((:rmw_client_response_subscription_get_actual_qos, librmw), rmw_ret_t, (Ptr{rmw_client_t}, Ptr{rmw_qos_profile_t}), client, qos)
end

function rmw_create_service(node, type_support, service_name, qos_profile)
    ccall((:rmw_create_service, librmw), Ptr{rmw_service_t}, (Ptr{rmw_node_t}, Ptr{rosidl_service_type_support_t}, Ptr{Cchar}, Ptr{rmw_qos_profile_t}), node, type_support, service_name, qos_profile)
end

function rmw_destroy_service(node, service)
    ccall((:rmw_destroy_service, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{rmw_service_t}), node, service)
end

function rmw_take_request(service, request_header, ros_request, taken)
    ccall((:rmw_take_request, librmw), rmw_ret_t, (Ptr{rmw_service_t}, Ptr{rmw_service_info_t}, Ptr{Cvoid}, Ptr{Bool}), service, request_header, ros_request, taken)
end

function rmw_send_response(service, request_header, ros_response)
    ccall((:rmw_send_response, librmw), rmw_ret_t, (Ptr{rmw_service_t}, Ptr{rmw_request_id_t}, Ptr{Cvoid}), service, request_header, ros_response)
end

function rmw_service_request_subscription_get_actual_qos(service, qos)
    ccall((:rmw_service_request_subscription_get_actual_qos, librmw), rmw_ret_t, (Ptr{rmw_service_t}, Ptr{rmw_qos_profile_t}), service, qos)
end

function rmw_service_response_publisher_get_actual_qos(service, qos)
    ccall((:rmw_service_response_publisher_get_actual_qos, librmw), rmw_ret_t, (Ptr{rmw_service_t}, Ptr{rmw_qos_profile_t}), service, qos)
end

function rmw_create_guard_condition(context)
    ccall((:rmw_create_guard_condition, librmw), Ptr{rmw_guard_condition_t}, (Ptr{rmw_context_t},), context)
end

function rmw_destroy_guard_condition(guard_condition)
    ccall((:rmw_destroy_guard_condition, librmw), rmw_ret_t, (Ptr{rmw_guard_condition_t},), guard_condition)
end

function rmw_trigger_guard_condition(guard_condition)
    ccall((:rmw_trigger_guard_condition, librmw), rmw_ret_t, (Ptr{rmw_guard_condition_t},), guard_condition)
end

function rmw_create_wait_set(context, max_conditions)
    ccall((:rmw_create_wait_set, librmw), Ptr{rmw_wait_set_t}, (Ptr{rmw_context_t}, Csize_t), context, max_conditions)
end

function rmw_destroy_wait_set(wait_set)
    ccall((:rmw_destroy_wait_set, librmw), rmw_ret_t, (Ptr{rmw_wait_set_t},), wait_set)
end

struct rmw_subscriptions_s
    subscriber_count::Csize_t
    subscribers::Ptr{Ptr{Cvoid}}
end

const rmw_subscriptions_t = rmw_subscriptions_s

struct rmw_services_s
    service_count::Csize_t
    services::Ptr{Ptr{Cvoid}}
end

const rmw_services_t = rmw_services_s

struct rmw_clients_s
    client_count::Csize_t
    clients::Ptr{Ptr{Cvoid}}
end

const rmw_clients_t = rmw_clients_s

struct rmw_events_s
    event_count::Csize_t
    events::Ptr{Ptr{Cvoid}}
end

const rmw_events_t = rmw_events_s

function rmw_wait(subscriptions, guard_conditions, services, clients, events, wait_set, wait_timeout)
    ccall((:rmw_wait, librmw), rmw_ret_t, (Ptr{rmw_subscriptions_t}, Ptr{rmw_guard_conditions_t}, Ptr{rmw_services_t}, Ptr{rmw_clients_t}, Ptr{rmw_events_t}, Ptr{rmw_wait_set_t}, Ptr{rmw_time_t}), subscriptions, guard_conditions, services, clients, events, wait_set, wait_timeout)
end

function rmw_get_node_names(node, node_names, node_namespaces)
    ccall((:rmw_get_node_names, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{rcutils_string_array_t}, Ptr{rcutils_string_array_t}), node, node_names, node_namespaces)
end

function rmw_get_node_names_with_enclaves(node, node_names, node_namespaces, enclaves)
    ccall((:rmw_get_node_names_with_enclaves, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{rcutils_string_array_t}, Ptr{rcutils_string_array_t}, Ptr{rcutils_string_array_t}), node, node_names, node_namespaces, enclaves)
end

function rmw_count_publishers(node, topic_name, count)
    ccall((:rmw_count_publishers, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{Cchar}, Ptr{Csize_t}), node, topic_name, count)
end

function rmw_count_subscribers(node, topic_name, count)
    ccall((:rmw_count_subscribers, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{Cchar}, Ptr{Csize_t}), node, topic_name, count)
end

function rmw_get_gid_for_publisher(publisher, gid)
    ccall((:rmw_get_gid_for_publisher, librmw), rmw_ret_t, (Ptr{rmw_publisher_t}, Ptr{rmw_gid_t}), publisher, gid)
end

function rmw_compare_gids_equal(gid1, gid2, result)
    ccall((:rmw_compare_gids_equal, librmw), rmw_ret_t, (Ptr{rmw_gid_t}, Ptr{rmw_gid_t}, Ptr{Bool}), gid1, gid2, result)
end

function rmw_service_server_is_available(node, client, is_available)
    ccall((:rmw_service_server_is_available, librmw), rmw_ret_t, (Ptr{rmw_node_t}, Ptr{rmw_client_t}, Ptr{Bool}), node, client, is_available)
end

@cenum rmw_log_severity_t::UInt32 begin
    RMW_LOG_SEVERITY_DEBUG = 10
    RMW_LOG_SEVERITY_INFO = 20
    RMW_LOG_SEVERITY_WARN = 30
    RMW_LOG_SEVERITY_ERROR = 40
    RMW_LOG_SEVERITY_FATAL = 50
end

function rmw_set_log_severity(severity)
    ccall((:rmw_set_log_severity, librmw), rmw_ret_t, (rmw_log_severity_t,), severity)
end

function rmw_subscription_set_on_new_message_callback(subscription, callback, user_data)
    ccall((:rmw_subscription_set_on_new_message_callback, librmw), rmw_ret_t, (Ptr{rmw_subscription_t}, rmw_event_callback_t, Ptr{Cvoid}), subscription, callback, user_data)
end

function rmw_service_set_on_new_request_callback(service, callback, user_data)
    ccall((:rmw_service_set_on_new_request_callback, librmw), rmw_ret_t, (Ptr{rmw_service_t}, rmw_event_callback_t, Ptr{Cvoid}), service, callback, user_data)
end

function rmw_client_set_on_new_response_callback(client, callback, user_data)
    ccall((:rmw_client_set_on_new_response_callback, librmw), rmw_ret_t, (Ptr{rmw_client_t}, rmw_event_callback_t, Ptr{Cvoid}), client, callback, user_data)
end

function rmw_event_set_callback(event, callback, user_data)
    ccall((:rmw_event_set_callback, librmw), rmw_ret_t, (Ptr{rmw_event_t}, rmw_event_callback_t, Ptr{Cvoid}), event, callback, user_data)
end

function rmw_check_zero_rmw_string_array(array)
    ccall((:rmw_check_zero_rmw_string_array, librmw), rmw_ret_t, (Ptr{rcutils_string_array_t},), array)
end

# no prototype is found for this function at security_options.h:45:1, please use with caution
function rmw_get_zero_initialized_security_options()
    ccall((:rmw_get_zero_initialized_security_options, librmw), rmw_security_options_t, ())
end

# no prototype is found for this function at security_options.h:50:1, please use with caution
function rmw_get_default_security_options()
    ccall((:rmw_get_default_security_options, librmw), rmw_security_options_t, ())
end

function rmw_security_options_copy(src, allocator, dst)
    ccall((:rmw_security_options_copy, librmw), rmw_ret_t, (Ptr{rmw_security_options_t}, Ptr{rcutils_allocator_t}, Ptr{rmw_security_options_t}), src, allocator, dst)
end

function rmw_security_options_set_root_path(security_root_path, allocator, security_options)
    ccall((:rmw_security_options_set_root_path, librmw), rmw_ret_t, (Ptr{Cchar}, Ptr{rcutils_allocator_t}, Ptr{rmw_security_options_t}), security_root_path, allocator, security_options)
end

function rmw_security_options_fini(security_options, allocator)
    ccall((:rmw_security_options_fini, librmw), rmw_ret_t, (Ptr{rmw_security_options_t}, Ptr{rcutils_allocator_t}), security_options, allocator)
end

# no prototype is found for this function at subscription_content_filter_options.h:52:1, please use with caution
function rmw_get_zero_initialized_content_filter_options()
    ccall((:rmw_get_zero_initialized_content_filter_options, librmw), rmw_subscription_content_filter_options_t, ())
end

function rmw_subscription_content_filter_options_init(filter_expression, expression_parameters_argc, expression_parameter_argv, allocator, options)
    ccall((:rmw_subscription_content_filter_options_init, librmw), rmw_ret_t, (Ptr{Cchar}, Csize_t, Ptr{Ptr{Cchar}}, Ptr{rcutils_allocator_t}, Ptr{rmw_subscription_content_filter_options_t}), filter_expression, expression_parameters_argc, expression_parameter_argv, allocator, options)
end

function rmw_subscription_content_filter_options_set(filter_expression, expression_parameters_argc, expression_parameter_argv, allocator, options)
    ccall((:rmw_subscription_content_filter_options_set, librmw), rmw_ret_t, (Ptr{Cchar}, Csize_t, Ptr{Ptr{Cchar}}, Ptr{rcutils_allocator_t}, Ptr{rmw_subscription_content_filter_options_t}), filter_expression, expression_parameters_argc, expression_parameter_argv, allocator, options)
end

function rmw_subscription_content_filter_options_copy(src, allocator, dst)
    ccall((:rmw_subscription_content_filter_options_copy, librmw), rmw_ret_t, (Ptr{rmw_subscription_content_filter_options_t}, Ptr{rcutils_allocator_t}, Ptr{rmw_subscription_content_filter_options_t}), src, allocator, dst)
end

function rmw_subscription_content_filter_options_fini(options, allocator)
    ccall((:rmw_subscription_content_filter_options_fini, librmw), rmw_ret_t, (Ptr{rmw_subscription_content_filter_options_t}, Ptr{rcutils_allocator_t}), options, allocator)
end

function rmw_get_default_subscription_options()
    ccall((:rmw_get_default_subscription_options, librmw), rmw_subscription_options_t, ())
end

const rmw_duration_t = rcutils_duration_value_t

function rmw_time_equal(left, right)
    ccall((:rmw_time_equal, librmw), Bool, (rmw_time_t, rmw_time_t), left, right)
end

function rmw_time_total_nsec(time)
    ccall((:rmw_time_total_nsec, librmw), rmw_duration_t, (rmw_time_t,), time)
end

function rmw_time_from_nsec(nanoseconds)
    ccall((:rmw_time_from_nsec, librmw), rmw_time_t, (rmw_duration_t,), nanoseconds)
end

function rmw_time_normalize(time)
    ccall((:rmw_time_normalize, librmw), rmw_time_t, (rmw_time_t,), time)
end

function rmw_get_zero_initialized_topic_endpoint_info()
    ccall((:rmw_get_zero_initialized_topic_endpoint_info, librmw), rmw_topic_endpoint_info_t, ())
end

function rmw_topic_endpoint_info_fini(topic_endpoint_info, allocator)
    ccall((:rmw_topic_endpoint_info_fini, librmw), rmw_ret_t, (Ptr{rmw_topic_endpoint_info_t}, Ptr{rcutils_allocator_t}), topic_endpoint_info, allocator)
end

function rmw_topic_endpoint_info_set_topic_type(topic_endpoint_info, topic_type, allocator)
    ccall((:rmw_topic_endpoint_info_set_topic_type, librmw), rmw_ret_t, (Ptr{rmw_topic_endpoint_info_t}, Ptr{Cchar}, Ptr{rcutils_allocator_t}), topic_endpoint_info, topic_type, allocator)
end

function rmw_topic_endpoint_info_set_node_name(topic_endpoint_info, node_name, allocator)
    ccall((:rmw_topic_endpoint_info_set_node_name, librmw), rmw_ret_t, (Ptr{rmw_topic_endpoint_info_t}, Ptr{Cchar}, Ptr{rcutils_allocator_t}), topic_endpoint_info, node_name, allocator)
end

function rmw_topic_endpoint_info_set_node_namespace(topic_endpoint_info, node_namespace, allocator)
    ccall((:rmw_topic_endpoint_info_set_node_namespace, librmw), rmw_ret_t, (Ptr{rmw_topic_endpoint_info_t}, Ptr{Cchar}, Ptr{rcutils_allocator_t}), topic_endpoint_info, node_namespace, allocator)
end

function rmw_topic_endpoint_info_set_endpoint_type(topic_endpoint_info, type)
    ccall((:rmw_topic_endpoint_info_set_endpoint_type, librmw), rmw_ret_t, (Ptr{rmw_topic_endpoint_info_t}, rmw_endpoint_type_t), topic_endpoint_info, type)
end

function rmw_topic_endpoint_info_set_gid(topic_endpoint_info, gid, size)
    ccall((:rmw_topic_endpoint_info_set_gid, librmw), rmw_ret_t, (Ptr{rmw_topic_endpoint_info_t}, Ptr{UInt8}, Csize_t), topic_endpoint_info, gid, size)
end

function rmw_topic_endpoint_info_set_qos_profile(topic_endpoint_info, qos_profile)
    ccall((:rmw_topic_endpoint_info_set_qos_profile, librmw), rmw_ret_t, (Ptr{rmw_topic_endpoint_info_t}, Ptr{rmw_qos_profile_t}), topic_endpoint_info, qos_profile)
end

function rmw_get_zero_initialized_topic_endpoint_info_array()
    ccall((:rmw_get_zero_initialized_topic_endpoint_info_array, librmw), rmw_topic_endpoint_info_array_t, ())
end

function rmw_topic_endpoint_info_array_check_zero(topic_endpoint_info_array)
    ccall((:rmw_topic_endpoint_info_array_check_zero, librmw), rmw_ret_t, (Ptr{rmw_topic_endpoint_info_array_t},), topic_endpoint_info_array)
end

function rmw_topic_endpoint_info_array_init_with_size(topic_endpoint_info_array, size, allocator)
    ccall((:rmw_topic_endpoint_info_array_init_with_size, librmw), rmw_ret_t, (Ptr{rmw_topic_endpoint_info_array_t}, Csize_t, Ptr{rcutils_allocator_t}), topic_endpoint_info_array, size, allocator)
end

function rmw_topic_endpoint_info_array_fini(topic_endpoint_info_array, allocator)
    ccall((:rmw_topic_endpoint_info_array_fini, librmw), rmw_ret_t, (Ptr{rmw_topic_endpoint_info_array_t}, Ptr{rcutils_allocator_t}), topic_endpoint_info_array, allocator)
end

function rmw_get_zero_initialized_message_info()
    ccall((:rmw_get_zero_initialized_message_info, librmw), rmw_message_info_t, ())
end

@cenum var"##Ctag#3215"::UInt32 begin
    RMW_QOS_POLICY_DEPTH_SYSTEM_DEFAULT = 0
end

function rmw_validate_full_topic_name(topic_name, validation_result, invalid_index)
    ccall((:rmw_validate_full_topic_name, librmw), rmw_ret_t, (Ptr{Cchar}, Ptr{Cint}, Ptr{Csize_t}), topic_name, validation_result, invalid_index)
end

function rmw_validate_full_topic_name_with_size(topic_name, topic_name_length, validation_result, invalid_index)
    ccall((:rmw_validate_full_topic_name_with_size, librmw), rmw_ret_t, (Ptr{Cchar}, Csize_t, Ptr{Cint}, Ptr{Csize_t}), topic_name, topic_name_length, validation_result, invalid_index)
end

function rmw_full_topic_name_validation_result_string(validation_result)
    ccall((:rmw_full_topic_name_validation_result_string, librmw), Ptr{Cchar}, (Cint,), validation_result)
end

function rmw_validate_namespace(namespace_, validation_result, invalid_index)
    ccall((:rmw_validate_namespace, librmw), rmw_ret_t, (Ptr{Cchar}, Ptr{Cint}, Ptr{Csize_t}), namespace_, validation_result, invalid_index)
end

function rmw_validate_namespace_with_size(namespace_, namespace_length, validation_result, invalid_index)
    ccall((:rmw_validate_namespace_with_size, librmw), rmw_ret_t, (Ptr{Cchar}, Csize_t, Ptr{Cint}, Ptr{Csize_t}), namespace_, namespace_length, validation_result, invalid_index)
end

function rmw_namespace_validation_result_string(validation_result)
    ccall((:rmw_namespace_validation_result_string, librmw), Ptr{Cchar}, (Cint,), validation_result)
end

function rmw_validate_node_name(node_name, validation_result, invalid_index)
    ccall((:rmw_validate_node_name, librmw), rmw_ret_t, (Ptr{Cchar}, Ptr{Cint}, Ptr{Csize_t}), node_name, validation_result, invalid_index)
end

function rmw_validate_node_name_with_size(node_name, node_name_length, validation_result, invalid_index)
    ccall((:rmw_validate_node_name_with_size, librmw), rmw_ret_t, (Ptr{Cchar}, Csize_t, Ptr{Cint}, Ptr{Csize_t}), node_name, node_name_length, validation_result, invalid_index)
end

function rmw_node_name_validation_result_string(validation_result)
    ccall((:rmw_node_name_validation_result_string, librmw), Ptr{Cchar}, (Cint,), validation_result)
end

struct rmw_qos_incompatible_event_status_s
    total_count::Int32
    total_count_change::Int32
    last_policy_kind::rmw_qos_policy_kind_t
end

const rmw_qos_incompatible_event_status_t = rmw_qos_incompatible_event_status_s

const rmw_requested_qos_incompatible_event_status_t = rmw_qos_incompatible_event_status_t

const rmw_offered_qos_incompatible_event_status_t = rmw_qos_incompatible_event_status_t

struct rmw_liveliness_changed_status_s
    alive_count::Int32
    not_alive_count::Int32
    alive_count_change::Int32
    not_alive_count_change::Int32
end

const rmw_liveliness_changed_status_t = rmw_liveliness_changed_status_s

struct rmw_liveliness_lost_status_s
    total_count::Int32
    total_count_change::Int32
end

const rmw_liveliness_lost_status_t = rmw_liveliness_lost_status_s

struct rmw_message_lost_status_s
    total_count::Csize_t
    total_count_change::Csize_t
end

const rmw_message_lost_status_t = rmw_message_lost_status_s

struct rmw_offered_deadline_missed_status_s
    total_count::Cint
    total_count_change::Cint
end

const rmw_offered_deadline_missed_status_t = rmw_offered_deadline_missed_status_s

struct rmw_requested_deadline_missed_status_s
    total_count::Int32
    total_count_change::Int32
end

const rmw_requested_deadline_missed_status_t = rmw_requested_deadline_missed_status_s

const rcl_allocator_t = rcutils_allocator_t

mutable struct rcl_arguments_impl_s end

const rcl_arguments_impl_t = rcl_arguments_impl_s

struct rcl_arguments_s
    impl::Ptr{rcl_arguments_impl_t}
end

const rcl_arguments_t = rcl_arguments_s

function rcl_get_zero_initialized_arguments()
    ccall((:rcl_get_zero_initialized_arguments, librcl), rcl_arguments_t, ())
end

const rcl_ret_t = rmw_ret_t

function rcl_parse_arguments(argc, argv, allocator, args_output)
    ccall((:rcl_parse_arguments, librcl), rcl_ret_t, (Cint, Ptr{Ptr{Cchar}}, rcl_allocator_t, Ptr{rcl_arguments_t}), argc, argv, allocator, args_output)
end

function rcl_arguments_get_count_unparsed(args)
    ccall((:rcl_arguments_get_count_unparsed, librcl), Cint, (Ptr{rcl_arguments_t},), args)
end

function rcl_arguments_get_unparsed(args, allocator, output_unparsed_indices)
    ccall((:rcl_arguments_get_unparsed, librcl), rcl_ret_t, (Ptr{rcl_arguments_t}, rcl_allocator_t, Ptr{Ptr{Cint}}), args, allocator, output_unparsed_indices)
end

function rcl_arguments_get_count_unparsed_ros(args)
    ccall((:rcl_arguments_get_count_unparsed_ros, librcl), Cint, (Ptr{rcl_arguments_t},), args)
end

function rcl_arguments_get_unparsed_ros(args, allocator, output_unparsed_ros_indices)
    ccall((:rcl_arguments_get_unparsed_ros, librcl), rcl_ret_t, (Ptr{rcl_arguments_t}, rcl_allocator_t, Ptr{Ptr{Cint}}), args, allocator, output_unparsed_ros_indices)
end

function rcl_arguments_get_param_files_count(args)
    ccall((:rcl_arguments_get_param_files_count, librcl), Cint, (Ptr{rcl_arguments_t},), args)
end

function rcl_arguments_get_param_files(arguments, allocator, parameter_files)
    ccall((:rcl_arguments_get_param_files, librcl), rcl_ret_t, (Ptr{rcl_arguments_t}, rcl_allocator_t, Ptr{Ptr{Ptr{Cchar}}}), arguments, allocator, parameter_files)
end

function rcl_arguments_get_param_overrides(arguments, parameter_overrides)
    ccall((:rcl_arguments_get_param_overrides, librcl), rcl_ret_t, (Ptr{rcl_arguments_t}, Ptr{Ptr{rcl_params_t}}), arguments, parameter_overrides)
end

function rcl_remove_ros_arguments(argv, args, allocator, nonros_argc, nonros_argv)
    ccall((:rcl_remove_ros_arguments, librcl), rcl_ret_t, (Ptr{Ptr{Cchar}}, Ptr{rcl_arguments_t}, rcl_allocator_t, Ptr{Cint}, Ptr{Ptr{Ptr{Cchar}}}), argv, args, allocator, nonros_argc, nonros_argv)
end

const rcl_log_severity_t = RCUTILS_LOG_SEVERITY

struct rcl_logger_setting_s
    name::Ptr{Cchar}
    level::rcl_log_severity_t
end

const rcl_logger_setting_t = rcl_logger_setting_s

struct rcl_log_levels_s
    default_logger_level::rcl_log_severity_t
    logger_settings::Ptr{rcl_logger_setting_t}
    num_logger_settings::Csize_t
    capacity_logger_settings::Csize_t
    allocator::rcl_allocator_t
end

const rcl_log_levels_t = rcl_log_levels_s

function rcl_arguments_get_log_levels(arguments, log_levels)
    ccall((:rcl_arguments_get_log_levels, librcl), rcl_ret_t, (Ptr{rcl_arguments_t}, Ptr{rcl_log_levels_t}), arguments, log_levels)
end

function rcl_arguments_copy(args, args_out)
    ccall((:rcl_arguments_copy, librcl), rcl_ret_t, (Ptr{rcl_arguments_t}, Ptr{rcl_arguments_t}), args, args_out)
end

function rcl_arguments_fini(args)
    ccall((:rcl_arguments_fini, librcl), rcl_ret_t, (Ptr{rcl_arguments_t},), args)
end

mutable struct rcl_client_impl_s end

const rcl_client_impl_t = rcl_client_impl_s

struct rcl_client_s
    impl::Ptr{rcl_client_impl_t}
end

const rcl_client_t = rcl_client_s

struct rcl_client_options_s
    qos::rmw_qos_profile_t
    allocator::rcl_allocator_t
end

const rcl_client_options_t = rcl_client_options_s

function rcl_get_zero_initialized_client()
    ccall((:rcl_get_zero_initialized_client, librcl), rcl_client_t, ())
end

mutable struct rcl_context_impl_s end

const rcl_context_impl_t = rcl_context_impl_s

struct rcl_context_s
    data::NTuple{24, UInt8}
end

function Base.getproperty(x::Ptr{rcl_context_s}, f::Symbol)
    f === :global_arguments && return Ptr{rcl_arguments_t}(x + 0)
    f === :impl && return Ptr{Ptr{rcl_context_impl_t}}(x + 8)
    f === :instance_id_storage && return Ptr{NTuple{8, UInt8}}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::rcl_context_s, f::Symbol)
    r = Ref{rcl_context_s}(x)
    ptr = Base.unsafe_convert(Ptr{rcl_context_s}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{rcl_context_s}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const rcl_context_t = rcl_context_s

mutable struct rcl_node_impl_s end

const rcl_node_impl_t = rcl_node_impl_s

struct rcl_node_s
    context::Ptr{rcl_context_t}
    impl::Ptr{rcl_node_impl_t}
end

const rcl_node_t = rcl_node_s

function rcl_client_init(client, node, type_support, service_name, options)
    ccall((:rcl_client_init, librcl), rcl_ret_t, (Ptr{rcl_client_t}, Ptr{rcl_node_t}, Ptr{rosidl_service_type_support_t}, Ptr{Cchar}, Ptr{rcl_client_options_t}), client, node, type_support, service_name, options)
end

function rcl_client_fini(client, node)
    ccall((:rcl_client_fini, librcl), rcl_ret_t, (Ptr{rcl_client_t}, Ptr{rcl_node_t}), client, node)
end

function rcl_client_get_default_options()
    ccall((:rcl_client_get_default_options, librcl), rcl_client_options_t, ())
end

function rcl_send_request(client, ros_request, sequence_number)
    ccall((:rcl_send_request, librcl), rcl_ret_t, (Ptr{rcl_client_t}, Ptr{Cvoid}, Ptr{Int64}), client, ros_request, sequence_number)
end

function rcl_take_response_with_info(client, request_header, ros_response)
    ccall((:rcl_take_response_with_info, librcl), rcl_ret_t, (Ptr{rcl_client_t}, Ptr{rmw_service_info_t}, Ptr{Cvoid}), client, request_header, ros_response)
end

function rcl_take_response(client, request_header, ros_response)
    ccall((:rcl_take_response, librcl), rcl_ret_t, (Ptr{rcl_client_t}, Ptr{rmw_request_id_t}, Ptr{Cvoid}), client, request_header, ros_response)
end

function rcl_client_get_service_name(client)
    ccall((:rcl_client_get_service_name, librcl), Ptr{Cchar}, (Ptr{rcl_client_t},), client)
end

function rcl_client_get_options(client)
    ccall((:rcl_client_get_options, librcl), Ptr{rcl_client_options_t}, (Ptr{rcl_client_t},), client)
end

function rcl_client_get_rmw_handle(client)
    ccall((:rcl_client_get_rmw_handle, librcl), Ptr{rmw_client_t}, (Ptr{rcl_client_t},), client)
end

function rcl_client_is_valid(client)
    ccall((:rcl_client_is_valid, librcl), Bool, (Ptr{rcl_client_t},), client)
end

function rcl_client_request_publisher_get_actual_qos(client)
    ccall((:rcl_client_request_publisher_get_actual_qos, librcl), Ptr{rmw_qos_profile_t}, (Ptr{rcl_client_t},), client)
end

function rcl_client_response_subscription_get_actual_qos(client)
    ccall((:rcl_client_response_subscription_get_actual_qos, librcl), Ptr{rmw_qos_profile_t}, (Ptr{rcl_client_t},), client)
end

const rcl_event_callback_t = rmw_event_callback_t

function rcl_client_set_on_new_response_callback(client, callback, user_data)
    ccall((:rcl_client_set_on_new_response_callback, librcl), rcl_ret_t, (Ptr{rcl_client_t}, rcl_event_callback_t, Ptr{Cvoid}), client, callback, user_data)
end

const rcl_context_instance_id_t = UInt64

function rcl_get_zero_initialized_context()
    ccall((:rcl_get_zero_initialized_context, librcl), rcl_context_t, ())
end

function rcl_context_fini(context)
    ccall((:rcl_context_fini, librcl), rcl_ret_t, (Ptr{rcl_context_t},), context)
end

mutable struct rcl_init_options_impl_s end

const rcl_init_options_impl_t = rcl_init_options_impl_s

struct rcl_init_options_s
    impl::Ptr{rcl_init_options_impl_t}
end

const rcl_init_options_t = rcl_init_options_s

function rcl_context_get_init_options(context)
    ccall((:rcl_context_get_init_options, librcl), Ptr{rcl_init_options_t}, (Ptr{rcl_context_t},), context)
end

function rcl_context_get_instance_id(context)
    ccall((:rcl_context_get_instance_id, librcl), rcl_context_instance_id_t, (Ptr{rcl_context_t},), context)
end

function rcl_context_get_domain_id(context, domain_id)
    ccall((:rcl_context_get_domain_id, librcl), rcl_ret_t, (Ptr{rcl_context_t}, Ptr{Csize_t}), context, domain_id)
end

function rcl_context_is_valid(context)
    ccall((:rcl_context_is_valid, librcl), Bool, (Ptr{rcl_context_t},), context)
end

function rcl_context_get_rmw_context(context)
    ccall((:rcl_context_get_rmw_context, librcl), Ptr{rmw_context_t}, (Ptr{rcl_context_t},), context)
end

function rcl_get_default_domain_id(domain_id)
    ccall((:rcl_get_default_domain_id, librcl), rcl_ret_t, (Ptr{Csize_t},), domain_id)
end

const rcl_error_state_t = rcutils_error_state_t

const rcl_error_string_t = rcutils_error_string_t

@cenum rcl_publisher_event_type_e::UInt32 begin
    RCL_PUBLISHER_OFFERED_DEADLINE_MISSED = 0
    RCL_PUBLISHER_LIVELINESS_LOST = 1
    RCL_PUBLISHER_OFFERED_INCOMPATIBLE_QOS = 2
end

const rcl_publisher_event_type_t = rcl_publisher_event_type_e

@cenum rcl_subscription_event_type_e::UInt32 begin
    RCL_SUBSCRIPTION_REQUESTED_DEADLINE_MISSED = 0
    RCL_SUBSCRIPTION_LIVELINESS_CHANGED = 1
    RCL_SUBSCRIPTION_REQUESTED_INCOMPATIBLE_QOS = 2
    RCL_SUBSCRIPTION_MESSAGE_LOST = 3
end

const rcl_subscription_event_type_t = rcl_subscription_event_type_e

mutable struct rcl_event_impl_s end

const rcl_event_impl_t = rcl_event_impl_s

struct rcl_event_s
    impl::Ptr{rcl_event_impl_t}
end

const rcl_event_t = rcl_event_s

function rcl_get_zero_initialized_event()
    ccall((:rcl_get_zero_initialized_event, librcl), rcl_event_t, ())
end

mutable struct rcl_publisher_impl_s end

const rcl_publisher_impl_t = rcl_publisher_impl_s

struct rcl_publisher_s
    impl::Ptr{rcl_publisher_impl_t}
end

const rcl_publisher_t = rcl_publisher_s

function rcl_publisher_event_init(event, publisher, event_type)
    ccall((:rcl_publisher_event_init, librcl), rcl_ret_t, (Ptr{rcl_event_t}, Ptr{rcl_publisher_t}, rcl_publisher_event_type_t), event, publisher, event_type)
end

mutable struct rcl_subscription_impl_s end

const rcl_subscription_impl_t = rcl_subscription_impl_s

struct rcl_subscription_s
    impl::Ptr{rcl_subscription_impl_t}
end

const rcl_subscription_t = rcl_subscription_s

function rcl_subscription_event_init(event, subscription, event_type)
    ccall((:rcl_subscription_event_init, librcl), rcl_ret_t, (Ptr{rcl_event_t}, Ptr{rcl_subscription_t}, rcl_subscription_event_type_t), event, subscription, event_type)
end

function rcl_take_event(event, event_info)
    ccall((:rcl_take_event, librcl), rcl_ret_t, (Ptr{rcl_event_t}, Ptr{Cvoid}), event, event_info)
end

function rcl_event_fini(event)
    ccall((:rcl_event_fini, librcl), rcl_ret_t, (Ptr{rcl_event_t},), event)
end

function rcl_event_get_rmw_handle(event)
    ccall((:rcl_event_get_rmw_handle, librcl), Ptr{rmw_event_t}, (Ptr{rcl_event_t},), event)
end

function rcl_event_is_valid(event)
    ccall((:rcl_event_is_valid, librcl), Bool, (Ptr{rcl_event_t},), event)
end

function rcl_event_set_callback(event, callback, user_data)
    ccall((:rcl_event_set_callback, librcl), rcl_ret_t, (Ptr{rcl_event_t}, rcl_event_callback_t, Ptr{Cvoid}), event, callback, user_data)
end

function rcl_expand_topic_name(input_topic_name, node_name, node_namespace, substitutions, allocator, output_topic_name)
    ccall((:rcl_expand_topic_name, librcl), rcl_ret_t, (Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{rcutils_string_map_t}, rcl_allocator_t, Ptr{Ptr{Cchar}}), input_topic_name, node_name, node_namespace, substitutions, allocator, output_topic_name)
end

function rcl_get_default_topic_name_substitutions(string_map)
    ccall((:rcl_get_default_topic_name_substitutions, librcl), rcl_ret_t, (Ptr{rcutils_string_map_t},), string_map)
end

const rcl_names_and_types_t = rmw_names_and_types_t

const rcl_topic_endpoint_info_t = rmw_topic_endpoint_info_t

const rcl_topic_endpoint_info_array_t = rmw_topic_endpoint_info_array_t

function rcl_get_publisher_names_and_types_by_node(node, allocator, no_demangle, node_name, node_namespace, topic_names_and_types)
    ccall((:rcl_get_publisher_names_and_types_by_node, librcl), rcl_ret_t, (Ptr{rcl_node_t}, Ptr{rcl_allocator_t}, Bool, Ptr{Cchar}, Ptr{Cchar}, Ptr{rcl_names_and_types_t}), node, allocator, no_demangle, node_name, node_namespace, topic_names_and_types)
end

function rcl_get_subscriber_names_and_types_by_node(node, allocator, no_demangle, node_name, node_namespace, topic_names_and_types)
    ccall((:rcl_get_subscriber_names_and_types_by_node, librcl), rcl_ret_t, (Ptr{rcl_node_t}, Ptr{rcl_allocator_t}, Bool, Ptr{Cchar}, Ptr{Cchar}, Ptr{rcl_names_and_types_t}), node, allocator, no_demangle, node_name, node_namespace, topic_names_and_types)
end

function rcl_get_service_names_and_types_by_node(node, allocator, node_name, node_namespace, service_names_and_types)
    ccall((:rcl_get_service_names_and_types_by_node, librcl), rcl_ret_t, (Ptr{rcl_node_t}, Ptr{rcl_allocator_t}, Ptr{Cchar}, Ptr{Cchar}, Ptr{rcl_names_and_types_t}), node, allocator, node_name, node_namespace, service_names_and_types)
end

function rcl_get_client_names_and_types_by_node(node, allocator, node_name, node_namespace, service_names_and_types)
    ccall((:rcl_get_client_names_and_types_by_node, librcl), rcl_ret_t, (Ptr{rcl_node_t}, Ptr{rcl_allocator_t}, Ptr{Cchar}, Ptr{Cchar}, Ptr{rcl_names_and_types_t}), node, allocator, node_name, node_namespace, service_names_and_types)
end

function rcl_get_topic_names_and_types(node, allocator, no_demangle, topic_names_and_types)
    ccall((:rcl_get_topic_names_and_types, librcl), rcl_ret_t, (Ptr{rcl_node_t}, Ptr{rcl_allocator_t}, Bool, Ptr{rcl_names_and_types_t}), node, allocator, no_demangle, topic_names_and_types)
end

function rcl_get_service_names_and_types(node, allocator, service_names_and_types)
    ccall((:rcl_get_service_names_and_types, librcl), rcl_ret_t, (Ptr{rcl_node_t}, Ptr{rcl_allocator_t}, Ptr{rcl_names_and_types_t}), node, allocator, service_names_and_types)
end

function rcl_names_and_types_init(names_and_types, size, allocator)
    ccall((:rcl_names_and_types_init, librcl), rcl_ret_t, (Ptr{rcl_names_and_types_t}, Csize_t, Ptr{rcl_allocator_t}), names_and_types, size, allocator)
end

function rcl_names_and_types_fini(names_and_types)
    ccall((:rcl_names_and_types_fini, librcl), rcl_ret_t, (Ptr{rcl_names_and_types_t},), names_and_types)
end

function rcl_get_node_names(node, allocator, node_names, node_namespaces)
    ccall((:rcl_get_node_names, librcl), rcl_ret_t, (Ptr{rcl_node_t}, rcl_allocator_t, Ptr{rcutils_string_array_t}, Ptr{rcutils_string_array_t}), node, allocator, node_names, node_namespaces)
end

function rcl_get_node_names_with_enclaves(node, allocator, node_names, node_namespaces, enclaves)
    ccall((:rcl_get_node_names_with_enclaves, librcl), rcl_ret_t, (Ptr{rcl_node_t}, rcl_allocator_t, Ptr{rcutils_string_array_t}, Ptr{rcutils_string_array_t}, Ptr{rcutils_string_array_t}), node, allocator, node_names, node_namespaces, enclaves)
end

function rcl_count_publishers(node, topic_name, count)
    ccall((:rcl_count_publishers, librcl), rcl_ret_t, (Ptr{rcl_node_t}, Ptr{Cchar}, Ptr{Csize_t}), node, topic_name, count)
end

function rcl_count_subscribers(node, topic_name, count)
    ccall((:rcl_count_subscribers, librcl), rcl_ret_t, (Ptr{rcl_node_t}, Ptr{Cchar}, Ptr{Csize_t}), node, topic_name, count)
end

function rcl_wait_for_publishers(node, allocator, topic_name, count, timeout, success)
    ccall((:rcl_wait_for_publishers, librcl), rcl_ret_t, (Ptr{rcl_node_t}, Ptr{rcl_allocator_t}, Ptr{Cchar}, Csize_t, rcutils_duration_value_t, Ptr{Bool}), node, allocator, topic_name, count, timeout, success)
end

function rcl_wait_for_subscribers(node, allocator, topic_name, count, timeout, success)
    ccall((:rcl_wait_for_subscribers, librcl), rcl_ret_t, (Ptr{rcl_node_t}, Ptr{rcl_allocator_t}, Ptr{Cchar}, Csize_t, rcutils_duration_value_t, Ptr{Bool}), node, allocator, topic_name, count, timeout, success)
end

function rcl_get_publishers_info_by_topic(node, allocator, topic_name, no_mangle, publishers_info)
    ccall((:rcl_get_publishers_info_by_topic, librcl), rcl_ret_t, (Ptr{rcl_node_t}, Ptr{rcutils_allocator_t}, Ptr{Cchar}, Bool, Ptr{rcl_topic_endpoint_info_array_t}), node, allocator, topic_name, no_mangle, publishers_info)
end

function rcl_get_subscriptions_info_by_topic(node, allocator, topic_name, no_mangle, subscriptions_info)
    ccall((:rcl_get_subscriptions_info_by_topic, librcl), rcl_ret_t, (Ptr{rcl_node_t}, Ptr{rcutils_allocator_t}, Ptr{Cchar}, Bool, Ptr{rcl_topic_endpoint_info_array_t}), node, allocator, topic_name, no_mangle, subscriptions_info)
end

function rcl_service_server_is_available(node, client, is_available)
    ccall((:rcl_service_server_is_available, librcl), rcl_ret_t, (Ptr{rcl_node_t}, Ptr{rcl_client_t}, Ptr{Bool}), node, client, is_available)
end

mutable struct rcl_guard_condition_impl_s end

const rcl_guard_condition_impl_t = rcl_guard_condition_impl_s

struct rcl_guard_condition_s
    context::Ptr{rcl_context_t}
    impl::Ptr{rcl_guard_condition_impl_t}
end

const rcl_guard_condition_t = rcl_guard_condition_s

struct rcl_guard_condition_options_s
    allocator::rcl_allocator_t
end

const rcl_guard_condition_options_t = rcl_guard_condition_options_s

function rcl_get_zero_initialized_guard_condition()
    ccall((:rcl_get_zero_initialized_guard_condition, librcl), rcl_guard_condition_t, ())
end

function rcl_guard_condition_init(guard_condition, context, options)
    ccall((:rcl_guard_condition_init, librcl), rcl_ret_t, (Ptr{rcl_guard_condition_t}, Ptr{rcl_context_t}, rcl_guard_condition_options_t), guard_condition, context, options)
end

function rcl_guard_condition_init_from_rmw(guard_condition, rmw_guard_condition, context, options)
    ccall((:rcl_guard_condition_init_from_rmw, librcl), rcl_ret_t, (Ptr{rcl_guard_condition_t}, Ptr{rmw_guard_condition_t}, Ptr{rcl_context_t}, rcl_guard_condition_options_t), guard_condition, rmw_guard_condition, context, options)
end

function rcl_guard_condition_fini(guard_condition)
    ccall((:rcl_guard_condition_fini, librcl), rcl_ret_t, (Ptr{rcl_guard_condition_t},), guard_condition)
end

function rcl_guard_condition_get_default_options()
    ccall((:rcl_guard_condition_get_default_options, librcl), rcl_guard_condition_options_t, ())
end

function rcl_trigger_guard_condition(guard_condition)
    ccall((:rcl_trigger_guard_condition, librcl), rcl_ret_t, (Ptr{rcl_guard_condition_t},), guard_condition)
end

function rcl_guard_condition_get_options(guard_condition)
    ccall((:rcl_guard_condition_get_options, librcl), Ptr{rcl_guard_condition_options_t}, (Ptr{rcl_guard_condition_t},), guard_condition)
end

function rcl_guard_condition_get_rmw_handle(guard_condition)
    ccall((:rcl_guard_condition_get_rmw_handle, librcl), Ptr{rmw_guard_condition_t}, (Ptr{rcl_guard_condition_t},), guard_condition)
end

function rcl_init(argc, argv, options, context)
    ccall((:rcl_init, librcl), rcl_ret_t, (Cint, Ptr{Ptr{Cchar}}, Ptr{rcl_init_options_t}, Ptr{rcl_context_t}), argc, argv, options, context)
end

function rcl_shutdown(context)
    ccall((:rcl_shutdown, librcl), rcl_ret_t, (Ptr{rcl_context_t},), context)
end

function rcl_get_zero_initialized_init_options()
    ccall((:rcl_get_zero_initialized_init_options, librcl), rcl_init_options_t, ())
end

function rcl_init_options_init(init_options, allocator)
    ccall((:rcl_init_options_init, librcl), rcl_ret_t, (Ptr{rcl_init_options_t}, rcl_allocator_t), init_options, allocator)
end

function rcl_init_options_copy(src, dst)
    ccall((:rcl_init_options_copy, librcl), rcl_ret_t, (Ptr{rcl_init_options_t}, Ptr{rcl_init_options_t}), src, dst)
end

function rcl_init_options_fini(init_options)
    ccall((:rcl_init_options_fini, librcl), rcl_ret_t, (Ptr{rcl_init_options_t},), init_options)
end

function rcl_init_options_get_domain_id(init_options, domain_id)
    ccall((:rcl_init_options_get_domain_id, librcl), rcl_ret_t, (Ptr{rcl_init_options_t}, Ptr{Csize_t}), init_options, domain_id)
end

function rcl_init_options_set_domain_id(init_options, domain_id)
    ccall((:rcl_init_options_set_domain_id, librcl), rcl_ret_t, (Ptr{rcl_init_options_t}, Csize_t), init_options, domain_id)
end

function rcl_init_options_get_rmw_init_options(init_options)
    ccall((:rcl_init_options_get_rmw_init_options, librcl), Ptr{rmw_init_options_t}, (Ptr{rcl_init_options_t},), init_options)
end

function rcl_init_options_get_allocator(init_options)
    ccall((:rcl_init_options_get_allocator, librcl), Ptr{rcl_allocator_t}, (Ptr{rcl_init_options_t},), init_options)
end

@cenum rcl_lexeme_e::UInt32 begin
    RCL_LEXEME_NONE = 0
    RCL_LEXEME_EOF = 1
    RCL_LEXEME_TILDE_SLASH = 2
    RCL_LEXEME_URL_SERVICE = 3
    RCL_LEXEME_URL_TOPIC = 4
    RCL_LEXEME_COLON = 5
    RCL_LEXEME_NODE = 6
    RCL_LEXEME_NS = 7
    RCL_LEXEME_SEPARATOR = 8
    RCL_LEXEME_BR1 = 9
    RCL_LEXEME_BR2 = 10
    RCL_LEXEME_BR3 = 11
    RCL_LEXEME_BR4 = 12
    RCL_LEXEME_BR5 = 13
    RCL_LEXEME_BR6 = 14
    RCL_LEXEME_BR7 = 15
    RCL_LEXEME_BR8 = 16
    RCL_LEXEME_BR9 = 17
    RCL_LEXEME_TOKEN = 18
    RCL_LEXEME_FORWARD_SLASH = 19
    RCL_LEXEME_WILD_ONE = 20
    RCL_LEXEME_WILD_MULTI = 21
    RCL_LEXEME_DOT = 22
end

const rcl_lexeme_t = rcl_lexeme_e

function rcl_lexer_analyze(text, lexeme, length)
    ccall((:rcl_lexer_analyze, librcl), rcl_ret_t, (Ptr{Cchar}, Ptr{rcl_lexeme_t}, Ptr{Csize_t}), text, lexeme, length)
end

mutable struct rcl_lexer_lookahead2_impl_s end

const rcl_lexer_lookahead2_impl_t = rcl_lexer_lookahead2_impl_s

struct rcl_lexer_lookahead2_s
    impl::Ptr{rcl_lexer_lookahead2_impl_t}
end

const rcl_lexer_lookahead2_t = rcl_lexer_lookahead2_s

# no prototype is found for this function at lexer_lookahead.h:59:1, please use with caution
function rcl_get_zero_initialized_lexer_lookahead2()
    ccall((:rcl_get_zero_initialized_lexer_lookahead2, librcl), rcl_lexer_lookahead2_t, ())
end

function rcl_lexer_lookahead2_init(buffer, text, allocator)
    ccall((:rcl_lexer_lookahead2_init, librcl), rcl_ret_t, (Ptr{rcl_lexer_lookahead2_t}, Ptr{Cchar}, rcl_allocator_t), buffer, text, allocator)
end

function rcl_lexer_lookahead2_fini(buffer)
    ccall((:rcl_lexer_lookahead2_fini, librcl), rcl_ret_t, (Ptr{rcl_lexer_lookahead2_t},), buffer)
end

function rcl_lexer_lookahead2_peek(buffer, next_type)
    ccall((:rcl_lexer_lookahead2_peek, librcl), rcl_ret_t, (Ptr{rcl_lexer_lookahead2_t}, Ptr{rcl_lexeme_t}), buffer, next_type)
end

function rcl_lexer_lookahead2_peek2(buffer, next_type1, next_type2)
    ccall((:rcl_lexer_lookahead2_peek2, librcl), rcl_ret_t, (Ptr{rcl_lexer_lookahead2_t}, Ptr{rcl_lexeme_t}, Ptr{rcl_lexeme_t}), buffer, next_type1, next_type2)
end

function rcl_lexer_lookahead2_accept(buffer, lexeme_text, lexeme_text_length)
    ccall((:rcl_lexer_lookahead2_accept, librcl), rcl_ret_t, (Ptr{rcl_lexer_lookahead2_t}, Ptr{Ptr{Cchar}}, Ptr{Csize_t}), buffer, lexeme_text, lexeme_text_length)
end

function rcl_lexer_lookahead2_expect(buffer, type, lexeme_text, lexeme_text_length)
    ccall((:rcl_lexer_lookahead2_expect, librcl), rcl_ret_t, (Ptr{rcl_lexer_lookahead2_t}, rcl_lexeme_t, Ptr{Ptr{Cchar}}, Ptr{Csize_t}), buffer, type, lexeme_text, lexeme_text_length)
end

function rcl_lexer_lookahead2_get_text(buffer)
    ccall((:rcl_lexer_lookahead2_get_text, librcl), Ptr{Cchar}, (Ptr{rcl_lexer_lookahead2_t},), buffer)
end

function rcl_get_localhost_only(localhost_only)
    ccall((:rcl_get_localhost_only, librcl), rcl_ret_t, (Ptr{rmw_localhost_only_t},), localhost_only)
end

# no prototype is found for this function at log_level.h:72:1, please use with caution
function rcl_get_zero_initialized_log_levels()
    ccall((:rcl_get_zero_initialized_log_levels, librcl), rcl_log_levels_t, ())
end

function rcl_log_levels_init(log_levels, allocator, logger_count)
    ccall((:rcl_log_levels_init, librcl), rcl_ret_t, (Ptr{rcl_log_levels_t}, Ptr{rcl_allocator_t}, Csize_t), log_levels, allocator, logger_count)
end

function rcl_log_levels_copy(src, dst)
    ccall((:rcl_log_levels_copy, librcl), rcl_ret_t, (Ptr{rcl_log_levels_t}, Ptr{rcl_log_levels_t}), src, dst)
end

function rcl_log_levels_fini(log_levels)
    ccall((:rcl_log_levels_fini, librcl), rcl_ret_t, (Ptr{rcl_log_levels_t},), log_levels)
end

function rcl_log_levels_shrink_to_size(log_levels)
    ccall((:rcl_log_levels_shrink_to_size, librcl), rcl_ret_t, (Ptr{rcl_log_levels_t},), log_levels)
end

function rcl_log_levels_add_logger_setting(log_levels, logger_name, log_level)
    ccall((:rcl_log_levels_add_logger_setting, librcl), rcl_ret_t, (Ptr{rcl_log_levels_t}, Ptr{Cchar}, rcl_log_severity_t), log_levels, logger_name, log_level)
end

const rcl_logging_output_handler_t = rcutils_logging_output_handler_t

function rcl_logging_configure(global_args, allocator)
    ccall((:rcl_logging_configure, librcl), rcl_ret_t, (Ptr{rcl_arguments_t}, Ptr{rcl_allocator_t}), global_args, allocator)
end

function rcl_logging_configure_with_output_handler(global_args, allocator, output_handler)
    ccall((:rcl_logging_configure_with_output_handler, librcl), rcl_ret_t, (Ptr{rcl_arguments_t}, Ptr{rcl_allocator_t}, rcl_logging_output_handler_t), global_args, allocator, output_handler)
end

function rcl_logging_fini()
    ccall((:rcl_logging_fini, librcl), rcl_ret_t, ())
end

function rcl_logging_rosout_enabled()
    ccall((:rcl_logging_rosout_enabled, librcl), Bool, ())
end

function rcl_logging_rosout_init(allocator)
    ccall((:rcl_logging_rosout_init, librcl), rcl_ret_t, (Ptr{rcl_allocator_t},), allocator)
end

# no prototype is found for this function at logging_rosout.h:94:1, please use with caution
function rcl_logging_rosout_fini()
    ccall((:rcl_logging_rosout_fini, librcl), rcl_ret_t, ())
end

function rcl_logging_rosout_init_publisher_for_node(node)
    ccall((:rcl_logging_rosout_init_publisher_for_node, librcl), rcl_ret_t, (Ptr{rcl_node_t},), node)
end

function rcl_logging_rosout_fini_publisher_for_node(node)
    ccall((:rcl_logging_rosout_fini_publisher_for_node, librcl), rcl_ret_t, (Ptr{rcl_node_t},), node)
end

const rcl_network_flow_endpoint_t = rmw_network_flow_endpoint_t

const rcl_network_flow_endpoint_array_t = rmw_network_flow_endpoint_array_t

const rcl_transport_protocol_t = rmw_transport_protocol_t

const rcl_internet_protocol_t = rmw_internet_protocol_t

function rcl_publisher_get_network_flow_endpoints(publisher, allocator, network_flow_endpoint_array)
    ccall((:rcl_publisher_get_network_flow_endpoints, librcl), rcl_ret_t, (Ptr{rcl_publisher_t}, Ptr{rcutils_allocator_t}, Ptr{rcl_network_flow_endpoint_array_t}), publisher, allocator, network_flow_endpoint_array)
end

function rcl_subscription_get_network_flow_endpoints(subscription, allocator, network_flow_endpoint_array)
    ccall((:rcl_subscription_get_network_flow_endpoints, librcl), rcl_ret_t, (Ptr{rcl_subscription_t}, Ptr{rcutils_allocator_t}, Ptr{rcl_network_flow_endpoint_array_t}), subscription, allocator, network_flow_endpoint_array)
end

function rcl_get_zero_initialized_node()
    ccall((:rcl_get_zero_initialized_node, librcl), rcl_node_t, ())
end

struct rcl_node_options_s
    allocator::rcl_allocator_t
    use_global_arguments::Bool
    arguments::rcl_arguments_t
    enable_rosout::Bool
    rosout_qos::rmw_qos_profile_t
end

const rcl_node_options_t = rcl_node_options_s

function rcl_node_init(node, name, namespace_, context, options)
    ccall((:rcl_node_init, librcl), rcl_ret_t, (Ptr{rcl_node_t}, Ptr{Cchar}, Ptr{Cchar}, Ptr{rcl_context_t}, Ptr{rcl_node_options_t}), node, name, namespace_, context, options)
end

function rcl_node_fini(node)
    ccall((:rcl_node_fini, librcl), rcl_ret_t, (Ptr{rcl_node_t},), node)
end

function rcl_node_is_valid(node)
    ccall((:rcl_node_is_valid, librcl), Bool, (Ptr{rcl_node_t},), node)
end

function rcl_node_is_valid_except_context(node)
    ccall((:rcl_node_is_valid_except_context, librcl), Bool, (Ptr{rcl_node_t},), node)
end

function rcl_node_get_name(node)
    ccall((:rcl_node_get_name, librcl), Ptr{Cchar}, (Ptr{rcl_node_t},), node)
end

function rcl_node_get_namespace(node)
    ccall((:rcl_node_get_namespace, librcl), Ptr{Cchar}, (Ptr{rcl_node_t},), node)
end

function rcl_node_get_fully_qualified_name(node)
    ccall((:rcl_node_get_fully_qualified_name, librcl), Ptr{Cchar}, (Ptr{rcl_node_t},), node)
end

function rcl_node_get_options(node)
    ccall((:rcl_node_get_options, librcl), Ptr{rcl_node_options_t}, (Ptr{rcl_node_t},), node)
end

function rcl_node_get_domain_id(node, domain_id)
    ccall((:rcl_node_get_domain_id, librcl), rcl_ret_t, (Ptr{rcl_node_t}, Ptr{Csize_t}), node, domain_id)
end

function rcl_node_get_rmw_handle(node)
    ccall((:rcl_node_get_rmw_handle, librcl), Ptr{rmw_node_t}, (Ptr{rcl_node_t},), node)
end

function rcl_node_get_rcl_instance_id(node)
    ccall((:rcl_node_get_rcl_instance_id, librcl), UInt64, (Ptr{rcl_node_t},), node)
end

function rcl_node_get_graph_guard_condition(node)
    ccall((:rcl_node_get_graph_guard_condition, librcl), Ptr{rcl_guard_condition_t}, (Ptr{rcl_node_t},), node)
end

function rcl_node_get_logger_name(node)
    ccall((:rcl_node_get_logger_name, librcl), Ptr{Cchar}, (Ptr{rcl_node_t},), node)
end

function rcl_node_resolve_name(node, input_name, allocator, is_service, only_expand, output_name)
    ccall((:rcl_node_resolve_name, librcl), rcl_ret_t, (Ptr{rcl_node_t}, Ptr{Cchar}, rcl_allocator_t, Bool, Bool, Ptr{Ptr{Cchar}}), node, input_name, allocator, is_service, only_expand, output_name)
end

function rcl_get_disable_loaned_message(disable_loaned_message)
    ccall((:rcl_get_disable_loaned_message, librcl), rcl_ret_t, (Ptr{Bool},), disable_loaned_message)
end

function rcl_node_get_default_options()
    ccall((:rcl_node_get_default_options, librcl), rcl_node_options_t, ())
end

function rcl_node_options_copy(options, options_out)
    ccall((:rcl_node_options_copy, librcl), rcl_ret_t, (Ptr{rcl_node_options_t}, Ptr{rcl_node_options_t}), options, options_out)
end

function rcl_node_options_fini(options)
    ccall((:rcl_node_options_fini, librcl), rcl_ret_t, (Ptr{rcl_node_options_t},), options)
end

struct rcl_publisher_options_s
    qos::rmw_qos_profile_t
    allocator::rcl_allocator_t
    rmw_publisher_options::rmw_publisher_options_t
end

const rcl_publisher_options_t = rcl_publisher_options_s

function rcl_get_zero_initialized_publisher()
    ccall((:rcl_get_zero_initialized_publisher, librcl), rcl_publisher_t, ())
end

function rcl_publisher_init(publisher, node, type_support, topic_name, options)
    ccall((:rcl_publisher_init, librcl), rcl_ret_t, (Ptr{rcl_publisher_t}, Ptr{rcl_node_t}, Ptr{rosidl_message_type_support_t}, Ptr{Cchar}, Ptr{rcl_publisher_options_t}), publisher, node, type_support, topic_name, options)
end

function rcl_publisher_fini(publisher, node)
    ccall((:rcl_publisher_fini, librcl), rcl_ret_t, (Ptr{rcl_publisher_t}, Ptr{rcl_node_t}), publisher, node)
end

function rcl_publisher_get_default_options()
    ccall((:rcl_publisher_get_default_options, librcl), rcl_publisher_options_t, ())
end

function rcl_borrow_loaned_message(publisher, type_support, ros_message)
    ccall((:rcl_borrow_loaned_message, librcl), rcl_ret_t, (Ptr{rcl_publisher_t}, Ptr{rosidl_message_type_support_t}, Ptr{Ptr{Cvoid}}), publisher, type_support, ros_message)
end

function rcl_return_loaned_message_from_publisher(publisher, loaned_message)
    ccall((:rcl_return_loaned_message_from_publisher, librcl), rcl_ret_t, (Ptr{rcl_publisher_t}, Ptr{Cvoid}), publisher, loaned_message)
end

function rcl_publish(publisher, ros_message, allocation)
    ccall((:rcl_publish, librcl), rcl_ret_t, (Ptr{rcl_publisher_t}, Ptr{Cvoid}, Ptr{rmw_publisher_allocation_t}), publisher, ros_message, allocation)
end

const rcl_serialized_message_t = rmw_serialized_message_t

function rcl_publish_serialized_message(publisher, serialized_message, allocation)
    ccall((:rcl_publish_serialized_message, librcl), rcl_ret_t, (Ptr{rcl_publisher_t}, Ptr{rcl_serialized_message_t}, Ptr{rmw_publisher_allocation_t}), publisher, serialized_message, allocation)
end

function rcl_publish_loaned_message(publisher, ros_message, allocation)
    ccall((:rcl_publish_loaned_message, librcl), rcl_ret_t, (Ptr{rcl_publisher_t}, Ptr{Cvoid}, Ptr{rmw_publisher_allocation_t}), publisher, ros_message, allocation)
end

function rcl_publisher_assert_liveliness(publisher)
    ccall((:rcl_publisher_assert_liveliness, librcl), rcl_ret_t, (Ptr{rcl_publisher_t},), publisher)
end

const rcl_duration_value_t = rcutils_duration_value_t

function rcl_publisher_wait_for_all_acked(publisher, timeout)
    ccall((:rcl_publisher_wait_for_all_acked, librcl), rcl_ret_t, (Ptr{rcl_publisher_t}, rcl_duration_value_t), publisher, timeout)
end

function rcl_publisher_get_topic_name(publisher)
    ccall((:rcl_publisher_get_topic_name, librcl), Ptr{Cchar}, (Ptr{rcl_publisher_t},), publisher)
end

function rcl_publisher_get_options(publisher)
    ccall((:rcl_publisher_get_options, librcl), Ptr{rcl_publisher_options_t}, (Ptr{rcl_publisher_t},), publisher)
end

function rcl_publisher_get_rmw_handle(publisher)
    ccall((:rcl_publisher_get_rmw_handle, librcl), Ptr{rmw_publisher_t}, (Ptr{rcl_publisher_t},), publisher)
end

function rcl_publisher_get_context(publisher)
    ccall((:rcl_publisher_get_context, librcl), Ptr{rcl_context_t}, (Ptr{rcl_publisher_t},), publisher)
end

function rcl_publisher_is_valid(publisher)
    ccall((:rcl_publisher_is_valid, librcl), Bool, (Ptr{rcl_publisher_t},), publisher)
end

function rcl_publisher_is_valid_except_context(publisher)
    ccall((:rcl_publisher_is_valid_except_context, librcl), Bool, (Ptr{rcl_publisher_t},), publisher)
end

function rcl_publisher_get_subscription_count(publisher, subscription_count)
    ccall((:rcl_publisher_get_subscription_count, librcl), rcl_ret_t, (Ptr{rcl_publisher_t}, Ptr{Csize_t}), publisher, subscription_count)
end

function rcl_publisher_get_actual_qos(publisher)
    ccall((:rcl_publisher_get_actual_qos, librcl), Ptr{rmw_qos_profile_t}, (Ptr{rcl_publisher_t},), publisher)
end

function rcl_publisher_can_loan_messages(publisher)
    ccall((:rcl_publisher_can_loan_messages, librcl), Bool, (Ptr{rcl_publisher_t},), publisher)
end

mutable struct rcl_remap_impl_s end

const rcl_remap_impl_t = rcl_remap_impl_s

struct rcl_remap_s
    impl::Ptr{rcl_remap_impl_t}
end

const rcl_remap_t = rcl_remap_s

function rcl_get_zero_initialized_remap()
    ccall((:rcl_get_zero_initialized_remap, librcl), rcl_remap_t, ())
end

function rcl_remap_topic_name(local_arguments, global_arguments, topic_name, node_name, node_namespace, allocator, output_name)
    ccall((:rcl_remap_topic_name, librcl), rcl_ret_t, (Ptr{rcl_arguments_t}, Ptr{rcl_arguments_t}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, rcl_allocator_t, Ptr{Ptr{Cchar}}), local_arguments, global_arguments, topic_name, node_name, node_namespace, allocator, output_name)
end

function rcl_remap_service_name(local_arguments, global_arguments, service_name, node_name, node_namespace, allocator, output_name)
    ccall((:rcl_remap_service_name, librcl), rcl_ret_t, (Ptr{rcl_arguments_t}, Ptr{rcl_arguments_t}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, rcl_allocator_t, Ptr{Ptr{Cchar}}), local_arguments, global_arguments, service_name, node_name, node_namespace, allocator, output_name)
end

function rcl_remap_node_name(local_arguments, global_arguments, node_name, allocator, output_name)
    ccall((:rcl_remap_node_name, librcl), rcl_ret_t, (Ptr{rcl_arguments_t}, Ptr{rcl_arguments_t}, Ptr{Cchar}, rcl_allocator_t, Ptr{Ptr{Cchar}}), local_arguments, global_arguments, node_name, allocator, output_name)
end

function rcl_remap_node_namespace(local_arguments, global_arguments, node_name, allocator, output_namespace)
    ccall((:rcl_remap_node_namespace, librcl), rcl_ret_t, (Ptr{rcl_arguments_t}, Ptr{rcl_arguments_t}, Ptr{Cchar}, rcl_allocator_t, Ptr{Ptr{Cchar}}), local_arguments, global_arguments, node_name, allocator, output_namespace)
end

function rcl_remap_copy(rule, rule_out)
    ccall((:rcl_remap_copy, librcl), rcl_ret_t, (Ptr{rcl_remap_t}, Ptr{rcl_remap_t}), rule, rule_out)
end

function rcl_remap_fini(remap)
    ccall((:rcl_remap_fini, librcl), rcl_ret_t, (Ptr{rcl_remap_t},), remap)
end

function rcl_rmw_implementation_identifier_check()
    ccall((:rcl_rmw_implementation_identifier_check, librcl), Cint, ())
end

function rcl_get_security_options_from_environment(name, allocator, security_options)
    ccall((:rcl_get_security_options_from_environment, librcl), rcl_ret_t, (Ptr{Cchar}, Ptr{rcutils_allocator_t}, Ptr{rmw_security_options_t}), name, allocator, security_options)
end

function rcl_security_enabled(use_security)
    ccall((:rcl_security_enabled, librcl), rcl_ret_t, (Ptr{Bool},), use_security)
end

function rcl_get_enforcement_policy(policy)
    ccall((:rcl_get_enforcement_policy, librcl), rcl_ret_t, (Ptr{rmw_security_enforcement_policy_t},), policy)
end

function rcl_get_secure_root(name, allocator)
    ccall((:rcl_get_secure_root, librcl), Ptr{Cchar}, (Ptr{Cchar}, Ptr{rcl_allocator_t}), name, allocator)
end

mutable struct rcl_service_impl_s end

const rcl_service_impl_t = rcl_service_impl_s

struct rcl_service_s
    impl::Ptr{rcl_service_impl_t}
end

const rcl_service_t = rcl_service_s

struct rcl_service_options_s
    qos::rmw_qos_profile_t
    allocator::rcl_allocator_t
end

const rcl_service_options_t = rcl_service_options_s

function rcl_get_zero_initialized_service()
    ccall((:rcl_get_zero_initialized_service, librcl), rcl_service_t, ())
end

function rcl_service_init(service, node, type_support, service_name, options)
    ccall((:rcl_service_init, librcl), rcl_ret_t, (Ptr{rcl_service_t}, Ptr{rcl_node_t}, Ptr{rosidl_service_type_support_t}, Ptr{Cchar}, Ptr{rcl_service_options_t}), service, node, type_support, service_name, options)
end

function rcl_service_fini(service, node)
    ccall((:rcl_service_fini, librcl), rcl_ret_t, (Ptr{rcl_service_t}, Ptr{rcl_node_t}), service, node)
end

function rcl_service_get_default_options()
    ccall((:rcl_service_get_default_options, librcl), rcl_service_options_t, ())
end

function rcl_take_request_with_info(service, request_header, ros_request)
    ccall((:rcl_take_request_with_info, librcl), rcl_ret_t, (Ptr{rcl_service_t}, Ptr{rmw_service_info_t}, Ptr{Cvoid}), service, request_header, ros_request)
end

function rcl_take_request(service, request_header, ros_request)
    ccall((:rcl_take_request, librcl), rcl_ret_t, (Ptr{rcl_service_t}, Ptr{rmw_request_id_t}, Ptr{Cvoid}), service, request_header, ros_request)
end

function rcl_send_response(service, response_header, ros_response)
    ccall((:rcl_send_response, librcl), rcl_ret_t, (Ptr{rcl_service_t}, Ptr{rmw_request_id_t}, Ptr{Cvoid}), service, response_header, ros_response)
end

function rcl_service_get_service_name(service)
    ccall((:rcl_service_get_service_name, librcl), Ptr{Cchar}, (Ptr{rcl_service_t},), service)
end

function rcl_service_get_options(service)
    ccall((:rcl_service_get_options, librcl), Ptr{rcl_service_options_t}, (Ptr{rcl_service_t},), service)
end

function rcl_service_get_rmw_handle(service)
    ccall((:rcl_service_get_rmw_handle, librcl), Ptr{rmw_service_t}, (Ptr{rcl_service_t},), service)
end

function rcl_service_is_valid(service)
    ccall((:rcl_service_is_valid, librcl), Bool, (Ptr{rcl_service_t},), service)
end

function rcl_service_request_subscription_get_actual_qos(service)
    ccall((:rcl_service_request_subscription_get_actual_qos, librcl), Ptr{rmw_qos_profile_t}, (Ptr{rcl_service_t},), service)
end

function rcl_service_response_publisher_get_actual_qos(service)
    ccall((:rcl_service_response_publisher_get_actual_qos, librcl), Ptr{rmw_qos_profile_t}, (Ptr{rcl_service_t},), service)
end

function rcl_service_set_on_new_request_callback(service, callback, user_data)
    ccall((:rcl_service_set_on_new_request_callback, librcl), rcl_ret_t, (Ptr{rcl_service_t}, rcl_event_callback_t, Ptr{Cvoid}), service, callback, user_data)
end

struct rcl_subscription_options_s
    qos::rmw_qos_profile_t
    allocator::rcl_allocator_t
    rmw_subscription_options::rmw_subscription_options_t
end

const rcl_subscription_options_t = rcl_subscription_options_s

struct rcl_subscription_content_filter_options_s
    rmw_subscription_content_filter_options::rmw_subscription_content_filter_options_t
end

const rcl_subscription_content_filter_options_t = rcl_subscription_content_filter_options_s

function rcl_get_zero_initialized_subscription()
    ccall((:rcl_get_zero_initialized_subscription, librcl), rcl_subscription_t, ())
end

function rcl_subscription_init(subscription, node, type_support, topic_name, options)
    ccall((:rcl_subscription_init, librcl), rcl_ret_t, (Ptr{rcl_subscription_t}, Ptr{rcl_node_t}, Ptr{rosidl_message_type_support_t}, Ptr{Cchar}, Ptr{rcl_subscription_options_t}), subscription, node, type_support, topic_name, options)
end

function rcl_subscription_fini(subscription, node)
    ccall((:rcl_subscription_fini, librcl), rcl_ret_t, (Ptr{rcl_subscription_t}, Ptr{rcl_node_t}), subscription, node)
end

function rcl_subscription_get_default_options()
    ccall((:rcl_subscription_get_default_options, librcl), rcl_subscription_options_t, ())
end

function rcl_subscription_options_fini(option)
    ccall((:rcl_subscription_options_fini, librcl), rcl_ret_t, (Ptr{rcl_subscription_options_t},), option)
end

function rcl_subscription_options_set_content_filter_options(filter_expression, expression_parameters_argc, expression_parameter_argv, options)
    ccall((:rcl_subscription_options_set_content_filter_options, librcl), rcl_ret_t, (Ptr{Cchar}, Csize_t, Ptr{Ptr{Cchar}}, Ptr{rcl_subscription_options_t}), filter_expression, expression_parameters_argc, expression_parameter_argv, options)
end

function rcl_get_zero_initialized_subscription_content_filter_options()
    ccall((:rcl_get_zero_initialized_subscription_content_filter_options, librcl), rcl_subscription_content_filter_options_t, ())
end

function rcl_subscription_content_filter_options_init(subscription, filter_expression, expression_parameters_argc, expression_parameter_argv, options)
    ccall((:rcl_subscription_content_filter_options_init, librcl), rcl_ret_t, (Ptr{rcl_subscription_t}, Ptr{Cchar}, Csize_t, Ptr{Ptr{Cchar}}, Ptr{rcl_subscription_content_filter_options_t}), subscription, filter_expression, expression_parameters_argc, expression_parameter_argv, options)
end

function rcl_subscription_content_filter_options_set(subscription, filter_expression, expression_parameters_argc, expression_parameter_argv, options)
    ccall((:rcl_subscription_content_filter_options_set, librcl), rcl_ret_t, (Ptr{rcl_subscription_t}, Ptr{Cchar}, Csize_t, Ptr{Ptr{Cchar}}, Ptr{rcl_subscription_content_filter_options_t}), subscription, filter_expression, expression_parameters_argc, expression_parameter_argv, options)
end

function rcl_subscription_content_filter_options_fini(subscription, options)
    ccall((:rcl_subscription_content_filter_options_fini, librcl), rcl_ret_t, (Ptr{rcl_subscription_t}, Ptr{rcl_subscription_content_filter_options_t}), subscription, options)
end

function rcl_subscription_is_cft_enabled(subscription)
    ccall((:rcl_subscription_is_cft_enabled, librcl), Bool, (Ptr{rcl_subscription_t},), subscription)
end

function rcl_subscription_set_content_filter(subscription, options)
    ccall((:rcl_subscription_set_content_filter, librcl), rcl_ret_t, (Ptr{rcl_subscription_t}, Ptr{rcl_subscription_content_filter_options_t}), subscription, options)
end

function rcl_subscription_get_content_filter(subscription, options)
    ccall((:rcl_subscription_get_content_filter, librcl), rcl_ret_t, (Ptr{rcl_subscription_t}, Ptr{rcl_subscription_content_filter_options_t}), subscription, options)
end

function rcl_take(subscription, ros_message, message_info, allocation)
    ccall((:rcl_take, librcl), rcl_ret_t, (Ptr{rcl_subscription_t}, Ptr{Cvoid}, Ptr{rmw_message_info_t}, Ptr{rmw_subscription_allocation_t}), subscription, ros_message, message_info, allocation)
end

function rcl_take_sequence(subscription, count, message_sequence, message_info_sequence, allocation)
    ccall((:rcl_take_sequence, librcl), rcl_ret_t, (Ptr{rcl_subscription_t}, Csize_t, Ptr{rmw_message_sequence_t}, Ptr{rmw_message_info_sequence_t}, Ptr{rmw_subscription_allocation_t}), subscription, count, message_sequence, message_info_sequence, allocation)
end

function rcl_take_serialized_message(subscription, serialized_message, message_info, allocation)
    ccall((:rcl_take_serialized_message, librcl), rcl_ret_t, (Ptr{rcl_subscription_t}, Ptr{rcl_serialized_message_t}, Ptr{rmw_message_info_t}, Ptr{rmw_subscription_allocation_t}), subscription, serialized_message, message_info, allocation)
end

function rcl_take_loaned_message(subscription, loaned_message, message_info, allocation)
    ccall((:rcl_take_loaned_message, librcl), rcl_ret_t, (Ptr{rcl_subscription_t}, Ptr{Ptr{Cvoid}}, Ptr{rmw_message_info_t}, Ptr{rmw_subscription_allocation_t}), subscription, loaned_message, message_info, allocation)
end

function rcl_return_loaned_message_from_subscription(subscription, loaned_message)
    ccall((:rcl_return_loaned_message_from_subscription, librcl), rcl_ret_t, (Ptr{rcl_subscription_t}, Ptr{Cvoid}), subscription, loaned_message)
end

function rcl_subscription_get_topic_name(subscription)
    ccall((:rcl_subscription_get_topic_name, librcl), Ptr{Cchar}, (Ptr{rcl_subscription_t},), subscription)
end

function rcl_subscription_get_options(subscription)
    ccall((:rcl_subscription_get_options, librcl), Ptr{rcl_subscription_options_t}, (Ptr{rcl_subscription_t},), subscription)
end

function rcl_subscription_get_rmw_handle(subscription)
    ccall((:rcl_subscription_get_rmw_handle, librcl), Ptr{rmw_subscription_t}, (Ptr{rcl_subscription_t},), subscription)
end

function rcl_subscription_is_valid(subscription)
    ccall((:rcl_subscription_is_valid, librcl), Bool, (Ptr{rcl_subscription_t},), subscription)
end

function rcl_subscription_get_publisher_count(subscription, publisher_count)
    ccall((:rcl_subscription_get_publisher_count, librcl), rmw_ret_t, (Ptr{rcl_subscription_t}, Ptr{Csize_t}), subscription, publisher_count)
end

function rcl_subscription_get_actual_qos(subscription)
    ccall((:rcl_subscription_get_actual_qos, librcl), Ptr{rmw_qos_profile_t}, (Ptr{rcl_subscription_t},), subscription)
end

function rcl_subscription_can_loan_messages(subscription)
    ccall((:rcl_subscription_can_loan_messages, librcl), Bool, (Ptr{rcl_subscription_t},), subscription)
end

function rcl_subscription_set_on_new_message_callback(subscription, callback, user_data)
    ccall((:rcl_subscription_set_on_new_message_callback, librcl), rcl_ret_t, (Ptr{rcl_subscription_t}, rcl_event_callback_t, Ptr{Cvoid}), subscription, callback, user_data)
end

const rcl_time_point_value_t = rcutils_time_point_value_t

@cenum rcl_clock_type_e::UInt32 begin
    RCL_CLOCK_UNINITIALIZED = 0
    RCL_ROS_TIME = 1
    RCL_SYSTEM_TIME = 2
    RCL_STEADY_TIME = 3
end

const rcl_clock_type_t = rcl_clock_type_e

struct rcl_duration_s
    nanoseconds::rcl_duration_value_t
end

const rcl_duration_t = rcl_duration_s

@cenum rcl_clock_change_e::UInt32 begin
    RCL_ROS_TIME_NO_CHANGE = 1
    RCL_ROS_TIME_ACTIVATED = 2
    RCL_ROS_TIME_DEACTIVATED = 3
    RCL_SYSTEM_TIME_NO_CHANGE = 4
end

const rcl_clock_change_t = rcl_clock_change_e

struct rcl_time_jump_s
    clock_change::rcl_clock_change_t
    delta::rcl_duration_t
end

const rcl_time_jump_t = rcl_time_jump_s

# typedef void ( * rcl_jump_callback_t ) ( const rcl_time_jump_t * time_jump , bool before_jump , void * user_data )
const rcl_jump_callback_t = Ptr{Cvoid}

struct rcl_jump_threshold_s
    on_clock_change::Bool
    min_forward::rcl_duration_t
    min_backward::rcl_duration_t
end

const rcl_jump_threshold_t = rcl_jump_threshold_s

struct rcl_jump_callback_info_s
    callback::rcl_jump_callback_t
    threshold::rcl_jump_threshold_t
    user_data::Ptr{Cvoid}
end

const rcl_jump_callback_info_t = rcl_jump_callback_info_s

struct rcl_clock_s
    type::rcl_clock_type_t
    jump_callbacks::Ptr{rcl_jump_callback_info_t}
    num_jump_callbacks::Csize_t
    get_now::Ptr{Cvoid}
    data::Ptr{Cvoid}
    allocator::rcl_allocator_t
end

const rcl_clock_t = rcl_clock_s

struct rcl_time_point_s
    nanoseconds::rcl_time_point_value_t
    clock_type::rcl_clock_type_t
end

const rcl_time_point_t = rcl_time_point_s

function rcl_clock_valid(clock)
    ccall((:rcl_clock_valid, librcl), Bool, (Ptr{rcl_clock_t},), clock)
end

function rcl_clock_init(clock_type, clock, allocator)
    ccall((:rcl_clock_init, librcl), rcl_ret_t, (rcl_clock_type_t, Ptr{rcl_clock_t}, Ptr{rcl_allocator_t}), clock_type, clock, allocator)
end

function rcl_clock_fini(clock)
    ccall((:rcl_clock_fini, librcl), rcl_ret_t, (Ptr{rcl_clock_t},), clock)
end

function rcl_ros_clock_init(clock, allocator)
    ccall((:rcl_ros_clock_init, librcl), rcl_ret_t, (Ptr{rcl_clock_t}, Ptr{rcl_allocator_t}), clock, allocator)
end

function rcl_ros_clock_fini(clock)
    ccall((:rcl_ros_clock_fini, librcl), rcl_ret_t, (Ptr{rcl_clock_t},), clock)
end

function rcl_steady_clock_init(clock, allocator)
    ccall((:rcl_steady_clock_init, librcl), rcl_ret_t, (Ptr{rcl_clock_t}, Ptr{rcl_allocator_t}), clock, allocator)
end

function rcl_steady_clock_fini(clock)
    ccall((:rcl_steady_clock_fini, librcl), rcl_ret_t, (Ptr{rcl_clock_t},), clock)
end

function rcl_system_clock_init(clock, allocator)
    ccall((:rcl_system_clock_init, librcl), rcl_ret_t, (Ptr{rcl_clock_t}, Ptr{rcl_allocator_t}), clock, allocator)
end

function rcl_system_clock_fini(clock)
    ccall((:rcl_system_clock_fini, librcl), rcl_ret_t, (Ptr{rcl_clock_t},), clock)
end

function rcl_difference_times(start, finish, delta)
    ccall((:rcl_difference_times, librcl), rcl_ret_t, (Ptr{rcl_time_point_t}, Ptr{rcl_time_point_t}, Ptr{rcl_duration_t}), start, finish, delta)
end

function rcl_clock_get_now(clock, time_point_value)
    ccall((:rcl_clock_get_now, librcl), rcl_ret_t, (Ptr{rcl_clock_t}, Ptr{rcl_time_point_value_t}), clock, time_point_value)
end

function rcl_enable_ros_time_override(clock)
    ccall((:rcl_enable_ros_time_override, librcl), rcl_ret_t, (Ptr{rcl_clock_t},), clock)
end

function rcl_disable_ros_time_override(clock)
    ccall((:rcl_disable_ros_time_override, librcl), rcl_ret_t, (Ptr{rcl_clock_t},), clock)
end

function rcl_is_enabled_ros_time_override(clock, is_enabled)
    ccall((:rcl_is_enabled_ros_time_override, librcl), rcl_ret_t, (Ptr{rcl_clock_t}, Ptr{Bool}), clock, is_enabled)
end

function rcl_set_ros_time_override(clock, time_value)
    ccall((:rcl_set_ros_time_override, librcl), rcl_ret_t, (Ptr{rcl_clock_t}, rcl_time_point_value_t), clock, time_value)
end

function rcl_clock_add_jump_callback(clock, threshold, callback, user_data)
    ccall((:rcl_clock_add_jump_callback, librcl), rcl_ret_t, (Ptr{rcl_clock_t}, rcl_jump_threshold_t, rcl_jump_callback_t, Ptr{Cvoid}), clock, threshold, callback, user_data)
end

function rcl_clock_remove_jump_callback(clock, callback, user_data)
    ccall((:rcl_clock_remove_jump_callback, librcl), rcl_ret_t, (Ptr{rcl_clock_t}, rcl_jump_callback_t, Ptr{Cvoid}), clock, callback, user_data)
end

mutable struct rcl_timer_impl_s end

const rcl_timer_impl_t = rcl_timer_impl_s

struct rcl_timer_s
    impl::Ptr{rcl_timer_impl_t}
end

const rcl_timer_t = rcl_timer_s

# typedef void ( * rcl_timer_callback_t ) ( rcl_timer_t * , int64_t )
const rcl_timer_callback_t = Ptr{Cvoid}

function rcl_get_zero_initialized_timer()
    ccall((:rcl_get_zero_initialized_timer, librcl), rcl_timer_t, ())
end

function rcl_timer_init(timer, clock, context, period, callback, allocator)
    ccall((:rcl_timer_init, librcl), rcl_ret_t, (Ptr{rcl_timer_t}, Ptr{rcl_clock_t}, Ptr{rcl_context_t}, Int64, rcl_timer_callback_t, rcl_allocator_t), timer, clock, context, period, callback, allocator)
end

function rcl_timer_fini(timer)
    ccall((:rcl_timer_fini, librcl), rcl_ret_t, (Ptr{rcl_timer_t},), timer)
end

function rcl_timer_call(timer)
    ccall((:rcl_timer_call, librcl), rcl_ret_t, (Ptr{rcl_timer_t},), timer)
end

function rcl_timer_clock(timer, clock)
    ccall((:rcl_timer_clock, librcl), rcl_ret_t, (Ptr{rcl_timer_t}, Ptr{Ptr{rcl_clock_t}}), timer, clock)
end

function rcl_timer_is_ready(timer, is_ready)
    ccall((:rcl_timer_is_ready, librcl), rcl_ret_t, (Ptr{rcl_timer_t}, Ptr{Bool}), timer, is_ready)
end

function rcl_timer_get_time_until_next_call(timer, time_until_next_call)
    ccall((:rcl_timer_get_time_until_next_call, librcl), rcl_ret_t, (Ptr{rcl_timer_t}, Ptr{Int64}), timer, time_until_next_call)
end

function rcl_timer_get_time_since_last_call(timer, time_since_last_call)
    ccall((:rcl_timer_get_time_since_last_call, librcl), rcl_ret_t, (Ptr{rcl_timer_t}, Ptr{Int64}), timer, time_since_last_call)
end

function rcl_timer_get_period(timer, period)
    ccall((:rcl_timer_get_period, librcl), rcl_ret_t, (Ptr{rcl_timer_t}, Ptr{Int64}), timer, period)
end

function rcl_timer_exchange_period(timer, new_period, old_period)
    ccall((:rcl_timer_exchange_period, librcl), rcl_ret_t, (Ptr{rcl_timer_t}, Int64, Ptr{Int64}), timer, new_period, old_period)
end

function rcl_timer_get_callback(timer)
    ccall((:rcl_timer_get_callback, librcl), rcl_timer_callback_t, (Ptr{rcl_timer_t},), timer)
end

function rcl_timer_exchange_callback(timer, new_callback)
    ccall((:rcl_timer_exchange_callback, librcl), rcl_timer_callback_t, (Ptr{rcl_timer_t}, rcl_timer_callback_t), timer, new_callback)
end

function rcl_timer_cancel(timer)
    ccall((:rcl_timer_cancel, librcl), rcl_ret_t, (Ptr{rcl_timer_t},), timer)
end

function rcl_timer_is_canceled(timer, is_canceled)
    ccall((:rcl_timer_is_canceled, librcl), rcl_ret_t, (Ptr{rcl_timer_t}, Ptr{Bool}), timer, is_canceled)
end

function rcl_timer_reset(timer)
    ccall((:rcl_timer_reset, librcl), rcl_ret_t, (Ptr{rcl_timer_t},), timer)
end

function rcl_timer_get_allocator(timer)
    ccall((:rcl_timer_get_allocator, librcl), Ptr{rcl_allocator_t}, (Ptr{rcl_timer_t},), timer)
end

function rcl_timer_get_guard_condition(timer)
    ccall((:rcl_timer_get_guard_condition, librcl), Ptr{rcl_guard_condition_t}, (Ptr{rcl_timer_t},), timer)
end

function rcl_validate_enclave_name(enclave, validation_result, invalid_index)
    ccall((:rcl_validate_enclave_name, librcl), rcl_ret_t, (Ptr{Cchar}, Ptr{Cint}, Ptr{Csize_t}), enclave, validation_result, invalid_index)
end

function rcl_validate_enclave_name_with_size(enclave, enclave_length, validation_result, invalid_index)
    ccall((:rcl_validate_enclave_name_with_size, librcl), rcl_ret_t, (Ptr{Cchar}, Csize_t, Ptr{Cint}, Ptr{Csize_t}), enclave, enclave_length, validation_result, invalid_index)
end

function rcl_enclave_name_validation_result_string(validation_result)
    ccall((:rcl_enclave_name_validation_result_string, librcl), Ptr{Cchar}, (Cint,), validation_result)
end

function rcl_validate_topic_name(topic_name, validation_result, invalid_index)
    ccall((:rcl_validate_topic_name, librcl), rcl_ret_t, (Ptr{Cchar}, Ptr{Cint}, Ptr{Csize_t}), topic_name, validation_result, invalid_index)
end

function rcl_validate_topic_name_with_size(topic_name, topic_name_length, validation_result, invalid_index)
    ccall((:rcl_validate_topic_name_with_size, librcl), rcl_ret_t, (Ptr{Cchar}, Csize_t, Ptr{Cint}, Ptr{Csize_t}), topic_name, topic_name_length, validation_result, invalid_index)
end

function rcl_topic_name_validation_result_string(validation_result)
    ccall((:rcl_topic_name_validation_result_string, librcl), Ptr{Cchar}, (Cint,), validation_result)
end

mutable struct rcl_wait_set_impl_s end

const rcl_wait_set_impl_t = rcl_wait_set_impl_s

struct rcl_wait_set_s
    subscriptions::Ptr{Ptr{rcl_subscription_t}}
    size_of_subscriptions::Csize_t
    guard_conditions::Ptr{Ptr{rcl_guard_condition_t}}
    size_of_guard_conditions::Csize_t
    timers::Ptr{Ptr{rcl_timer_t}}
    size_of_timers::Csize_t
    clients::Ptr{Ptr{rcl_client_t}}
    size_of_clients::Csize_t
    services::Ptr{Ptr{rcl_service_t}}
    size_of_services::Csize_t
    events::Ptr{Ptr{rcl_event_t}}
    size_of_events::Csize_t
    impl::Ptr{rcl_wait_set_impl_t}
end

const rcl_wait_set_t = rcl_wait_set_s

function rcl_get_zero_initialized_wait_set()
    ccall((:rcl_get_zero_initialized_wait_set, librcl), rcl_wait_set_t, ())
end

function rcl_wait_set_init(wait_set, number_of_subscriptions, number_of_guard_conditions, number_of_timers, number_of_clients, number_of_services, number_of_events, context, allocator)
    ccall((:rcl_wait_set_init, librcl), rcl_ret_t, (Ptr{rcl_wait_set_t}, Csize_t, Csize_t, Csize_t, Csize_t, Csize_t, Csize_t, Ptr{rcl_context_t}, rcl_allocator_t), wait_set, number_of_subscriptions, number_of_guard_conditions, number_of_timers, number_of_clients, number_of_services, number_of_events, context, allocator)
end

function rcl_wait_set_fini(wait_set)
    ccall((:rcl_wait_set_fini, librcl), rcl_ret_t, (Ptr{rcl_wait_set_t},), wait_set)
end

function rcl_wait_set_get_allocator(wait_set, allocator)
    ccall((:rcl_wait_set_get_allocator, librcl), rcl_ret_t, (Ptr{rcl_wait_set_t}, Ptr{rcl_allocator_t}), wait_set, allocator)
end

function rcl_wait_set_add_subscription(wait_set, subscription, index)
    ccall((:rcl_wait_set_add_subscription, librcl), rcl_ret_t, (Ptr{rcl_wait_set_t}, Ptr{rcl_subscription_t}, Ptr{Csize_t}), wait_set, subscription, index)
end

function rcl_wait_set_clear(wait_set)
    ccall((:rcl_wait_set_clear, librcl), rcl_ret_t, (Ptr{rcl_wait_set_t},), wait_set)
end

function rcl_wait_set_resize(wait_set, subscriptions_size, guard_conditions_size, timers_size, clients_size, services_size, events_size)
    ccall((:rcl_wait_set_resize, librcl), rcl_ret_t, (Ptr{rcl_wait_set_t}, Csize_t, Csize_t, Csize_t, Csize_t, Csize_t, Csize_t), wait_set, subscriptions_size, guard_conditions_size, timers_size, clients_size, services_size, events_size)
end

function rcl_wait_set_add_guard_condition(wait_set, guard_condition, index)
    ccall((:rcl_wait_set_add_guard_condition, librcl), rcl_ret_t, (Ptr{rcl_wait_set_t}, Ptr{rcl_guard_condition_t}, Ptr{Csize_t}), wait_set, guard_condition, index)
end

function rcl_wait_set_add_timer(wait_set, timer, index)
    ccall((:rcl_wait_set_add_timer, librcl), rcl_ret_t, (Ptr{rcl_wait_set_t}, Ptr{rcl_timer_t}, Ptr{Csize_t}), wait_set, timer, index)
end

function rcl_wait_set_add_client(wait_set, client, index)
    ccall((:rcl_wait_set_add_client, librcl), rcl_ret_t, (Ptr{rcl_wait_set_t}, Ptr{rcl_client_t}, Ptr{Csize_t}), wait_set, client, index)
end

function rcl_wait_set_add_service(wait_set, service, index)
    ccall((:rcl_wait_set_add_service, librcl), rcl_ret_t, (Ptr{rcl_wait_set_t}, Ptr{rcl_service_t}, Ptr{Csize_t}), wait_set, service, index)
end

function rcl_wait_set_add_event(wait_set, event, index)
    ccall((:rcl_wait_set_add_event, librcl), rcl_ret_t, (Ptr{rcl_wait_set_t}, Ptr{rcl_event_t}, Ptr{Csize_t}), wait_set, event, index)
end

function rcl_wait(wait_set, timeout)
    ccall((:rcl_wait, librcl), rcl_ret_t, (Ptr{rcl_wait_set_t}, Int64), wait_set, timeout)
end

function rcl_wait_set_is_valid(wait_set)
    ccall((:rcl_wait_set_is_valid, librcl), Bool, (Ptr{rcl_wait_set_t},), wait_set)
end

const __STDC_WANT_LIB_EXT1__ = 1

const RCUTILS_ERROR_MESSAGE_MAX_LENGTH = 1024

const RCUTILS_ERROR_STATE_LINE_NUMBER_STR_MAX_LENGTH = 20

const RCUTILS_ERROR_FORMATTING_CHARACTERS = 6

const RCUTILS_ERROR_STATE_MESSAGE_MAX_LENGTH = 768

const RCUTILS_ERROR_STATE_FILE_MAX_LENGTH = (((RCUTILS_ERROR_MESSAGE_MAX_LENGTH - RCUTILS_ERROR_STATE_MESSAGE_MAX_LENGTH) - RCUTILS_ERROR_STATE_LINE_NUMBER_STR_MAX_LENGTH) - RCUTILS_ERROR_FORMATTING_CHARACTERS) - 1

const RCUTILS_LOGGING_SEPARATOR_STRING = "."

const RCUTILS_DEFAULT_LOGGER_DEFAULT_LEVEL = RCUTILS_LOG_SEVERITY_INFO

const RCUTILS_RET_OK = 0

# Skipping MacroDefinition: RCUTILS_LOGGING_AUTOINIT do { if ( RCUTILS_UNLIKELY ( ! g_rcutils_logging_initialized ) ) { if ( rcutils_logging_initialize ( ) != RCUTILS_RET_OK ) { RCUTILS_SAFE_FWRITE_TO_STDERR ( "[rcutils|" __FILE__ ":" RCUTILS_STRINGIFY ( __LINE__ ) "] error initializing logging: " ) ; RCUTILS_SAFE_FWRITE_TO_STDERR ( rcutils_get_error_string ( ) . str ) ; RCUTILS_SAFE_FWRITE_TO_STDERR ( "\n" ) ; rcutils_reset_error ( ) ; } } } while ( 0 )

const RCUTILS_LOG_MIN_SEVERITY_DEBUG = 0

const RCUTILS_LOG_MIN_SEVERITY_INFO = 1

const RCUTILS_LOG_MIN_SEVERITY_WARN = 2

const RCUTILS_LOG_MIN_SEVERITY_ERROR = 3

const RCUTILS_LOG_MIN_SEVERITY_FATAL = 4

const RCUTILS_LOG_MIN_SEVERITY_NONE = 5

const RCUTILS_LOG_MIN_SEVERITY = RCUTILS_LOG_MIN_SEVERITY_DEBUG

# Skipping MacroDefinition: RCUTILS_LOG_CONDITION_ONCE_BEFORE { static int __rcutils_logging_once = 0 ; if ( RCUTILS_UNLIKELY ( 0 == __rcutils_logging_once ) ) { __rcutils_logging_once = 1 ;

# Skipping MacroDefinition: RCUTILS_LOG_CONDITION_ONCE_AFTER } \
#}

# Skipping MacroDefinition: RCUTILS_LOG_CONDITION_EXPRESSION_AFTER }

# Skipping MacroDefinition: RCUTILS_LOG_CONDITION_FUNCTION_AFTER }

# Skipping MacroDefinition: RCUTILS_LOG_CONDITION_SKIPFIRST_BEFORE { static bool __rcutils_logging_first = true ; if ( RCUTILS_UNLIKELY ( true == __rcutils_logging_first ) ) { __rcutils_logging_first = false ; } else {

# Skipping MacroDefinition: RCUTILS_LOG_CONDITION_SKIPFIRST_AFTER } \
#}

# Skipping MacroDefinition: RCUTILS_LOG_CONDITION_THROTTLE_AFTER } \
#}

# Skipping MacroDefinition: RCUTILS_THREAD_LOCAL _Thread_local

# Skipping MacroDefinition: RCUTILS_DEPRECATED __attribute__ ( ( deprecated ) )

const RCUTILS_STEADY_TIME = rcutils_steady_time_now

# Skipping MacroDefinition: RCUTILS_IMPORT __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: RCUTILS_EXPORT __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: RCUTILS_LOCAL __attribute__ ( ( visibility ( "hidden" ) ) )

const _RCUTILS_PACKAGE_NAME = "<Unknown Package>"

const RCUTILS_FAULT_INJECTION_NEVER_FAIL = -1

const RCUTILS_FAULT_INJECTION_FAIL_NOW = 0

const RCUTILS_RET_INVALID_ARGUMENT = 11

const RCUTILS_RET_NOT_INITIALIZED = 13

const RCUTILS_RET_WARN = 1

const RCUTILS_RET_ERROR = 2

const RCUTILS_RET_BAD_ALLOC = 10

const RCUTILS_RET_NOT_ENOUGH_SPACE = 12

const RCUTILS_RET_NOT_FOUND = 14

const RCUTILS_RET_STRING_MAP_ALREADY_INIT = 30

const RCUTILS_RET_STRING_MAP_INVALID = 31

const RCUTILS_RET_STRING_KEY_NOT_FOUND = 32

const RCUTILS_RET_LOGGING_SEVERITY_MAP_INVALID = 40

const RCUTILS_RET_LOGGING_SEVERITY_STRING_INVALID = 41

const RCUTILS_RET_HASH_MAP_NO_MORE_ENTRIES = 50

# Skipping MacroDefinition: ROSIDL_GENERATOR_C_PUBLIC __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: ROSIDL_GENERATOR_C_EXPORT __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: ROSIDL_GENERATOR_C_LOCAL __attribute__ ( ( visibility ( "hidden" ) ) )

# Skipping MacroDefinition: ROSIDL_TYPESUPPORT_C_EXPORT __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: ROSIDL_TYPESUPPORT_C_PUBLIC __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: ROSIDL_TYPESUPPORT_C_LOCAL __attribute__ ( ( visibility ( "hidden" ) ) )

# Skipping MacroDefinition: ROSIDL_TYPESUPPORT_INTROSPECTION_C_EXPORT __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: ROSIDL_TYPESUPPORT_INTROSPECTION_C_PUBLIC __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: ROSIDL_TYPESUPPORT_INTROSPECTION_C_LOCAL __attribute__ ( ( visibility ( "hidden" ) ) )

# Skipping MacroDefinition: RCL_YAML_PARAM_PARSER_EXPORT __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: RCL_YAML_PARAM_PARSER_PUBLIC __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: RCL_YAML_PARAM_PARSER_LOCAL __attribute__ ( ( visibility ( "hidden" ) ) )

const RMW_DEFAULT_DOMAIN_ID = SIZE_MAX

const rmw_initialize_error_handling_thread_local_storage = rcutils_initialize_error_handling_thread_local_storage

const rmw_set_error_state = rcutils_set_error_state

const rmw_error_is_set = rcutils_error_is_set

const rmw_get_error_state = rcutils_get_error_state

const rmw_get_error_string = rcutils_get_error_string

const rmw_reset_error = rcutils_reset_error

const RMW_INET_ADDRSTRLEN = 48

const RMW_RET_OK = 0

const RMW_RET_ERROR = 1

const RMW_RET_TIMEOUT = 2

const RMW_RET_UNSUPPORTED = 3

const RMW_RET_BAD_ALLOC = 10

const RMW_RET_INVALID_ARGUMENT = 11

const RMW_RET_INCORRECT_RMW_IMPLEMENTATION = 12

const RMW_RET_NODE_NAME_NON_EXISTENT = 203

const rmw_get_zero_initialized_serialized_message = rcutils_get_zero_initialized_uint8_array

const RMW_GID_STORAGE_SIZE = Cuint(24)

const RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_NODE_DEPRECATED_MSG = "RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_NODE is deprecated. Use RMW_QOS_POLICY_LIVELINESS_MANUAL_BY_TOPIC if manually asserted liveliness is needed."

const RMW_MESSAGE_INFO_SEQUENCE_NUMBER_UNSUPPORTED = UINT64_MAX

const RMW_TOPIC_VALID = 0

const RMW_TOPIC_INVALID_IS_EMPTY_STRING = 1

const RMW_TOPIC_INVALID_NOT_ABSOLUTE = 2

const RMW_TOPIC_INVALID_ENDS_WITH_FORWARD_SLASH = 3

const RMW_TOPIC_INVALID_CONTAINS_UNALLOWED_CHARACTERS = 4

const RMW_TOPIC_INVALID_CONTAINS_REPEATED_FORWARD_SLASH = 5

const RMW_TOPIC_INVALID_NAME_TOKEN_STARTS_WITH_NUMBER = 6

const RMW_TOPIC_INVALID_TOO_LONG = 7

# Skipping MacroDefinition: RMW_TOPIC_MAX_NAME_LENGTH 255U /* impl constraint */ - 8U

const RMW_NAMESPACE_VALID = 0

const RMW_NAMESPACE_INVALID_IS_EMPTY_STRING = 1

const RMW_NAMESPACE_INVALID_NOT_ABSOLUTE = 2

const RMW_NAMESPACE_INVALID_ENDS_WITH_FORWARD_SLASH = 3

const RMW_NAMESPACE_INVALID_CONTAINS_UNALLOWED_CHARACTERS = 4

const RMW_NAMESPACE_INVALID_CONTAINS_REPEATED_FORWARD_SLASH = 5

const RMW_NAMESPACE_INVALID_NAME_TOKEN_STARTS_WITH_NUMBER = 6

const RMW_NAMESPACE_INVALID_TOO_LONG = 7

const RMW_NAMESPACE_MAX_LENGTH = RMW_TOPIC_MAX_NAME_LENGTH - Cuint(2)

const RMW_NODE_NAME_VALID = 0

const RMW_NODE_NAME_INVALID_IS_EMPTY_STRING = 1

const RMW_NODE_NAME_INVALID_CONTAINS_UNALLOWED_CHARACTERS = 2

const RMW_NODE_NAME_INVALID_STARTS_WITH_NUMBER = 3

const RMW_NODE_NAME_INVALID_TOO_LONG = 4

const RMW_NODE_NAME_MAX_NAME_LENGTH = 255

# Skipping MacroDefinition: RMW_EXPORT __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: RMW_PUBLIC __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: RMW_LOCAL __attribute__ ( ( visibility ( "hidden" ) ) )

const RMW_AVOID_MEMORY_ALLOCATION = 0

const rcl_get_default_allocator = rcutils_get_default_allocator

const rcl_reallocf = rcutils_reallocf

const RCL_ROS_ARGS_FLAG = "--ros-args"

const RCL_ROS_ARGS_EXPLICIT_END_TOKEN = "--"

const RCL_PARAM_FLAG = "--param"

const RCL_SHORT_PARAM_FLAG = "-p"

const RCL_PARAM_FILE_FLAG = "--params-file"

const RCL_REMAP_FLAG = "--remap"

const RCL_SHORT_REMAP_FLAG = "-r"

const RCL_ENCLAVE_FLAG = "--enclave"

const RCL_SHORT_ENCLAVE_FLAG = "-e"

const RCL_LOG_LEVEL_FLAG = "--log-level"

const RCL_EXTERNAL_LOG_CONFIG_FLAG = "--log-config-file"

const RCL_LOG_STDOUT_FLAG_SUFFIX = "stdout-logs"

const RCL_LOG_ROSOUT_FLAG_SUFFIX = "rosout-logs"

const RCL_LOG_EXT_LIB_FLAG_SUFFIX = "external-lib-logs"

# Skipping MacroDefinition: RCL_CONTEXT_ATOMIC_INSTANCE_ID_STORAGE_SIZE sizeof ( uint_least64_t )

const RCL_DEFAULT_DOMAIN_ID = RMW_DEFAULT_DOMAIN_ID

const rcl_initialize_error_handling_thread_local_storage = rcutils_initialize_error_handling_thread_local_storage

const rcl_set_error_state = rcutils_set_error_state

const rcl_error_is_set = rcutils_error_is_set

const rcl_get_error_state = rcutils_get_error_state

const rcl_get_error_string = rcutils_get_error_string

const rcl_reset_error = rcutils_reset_error

const rcl_get_zero_initialized_names_and_types = rmw_get_zero_initialized_names_and_types

const rcl_get_zero_initialized_topic_endpoint_info_array = rmw_get_zero_initialized_topic_endpoint_info_array

const rcl_topic_endpoint_info_array_fini = rmw_topic_endpoint_info_array_fini

const rcl_get_zero_initialized_network_flow_endpoint_array = rmw_get_zero_initialized_network_flow_endpoint_array

const rcl_network_flow_endpoint_array_fini = rmw_network_flow_endpoint_array_fini

const rcl_network_flow_endpoint_get_transport_protocol_string = rmw_network_flow_endpoint_get_transport_protocol_string

const rcl_network_flow_endpoint_get_internet_protocol_string = rmw_network_flow_endpoint_get_internet_protocol_string

const RCL_NODE_OPTIONS_DEFAULT_DOMAIN_ID = RCL_DEFAULT_DOMAIN_ID

const RMW_IMPLEMENTATION_ENV_VAR_NAME = "RMW_IMPLEMENTATION"

const RCL_ASSERT_RMW_ID_MATCHES_ENV_VAR_NAME = "RCL_ASSERT_RMW_ID_MATCHES"

const ROS_SECURITY_ENCLAVE_OVERRIDE = "ROS_SECURITY_ENCLAVE_OVERRIDE"

const ROS_SECURITY_KEYSTORE_VAR_NAME = "ROS_SECURITY_KEYSTORE"

const ROS_SECURITY_STRATEGY_VAR_NAME = "ROS_SECURITY_STRATEGY"

const ROS_SECURITY_ENABLE_VAR_NAME = "ROS_SECURITY_ENABLE"

const RCL_RET_OK = RMW_RET_OK

const RCL_RET_ERROR = RMW_RET_ERROR

const RCL_RET_TIMEOUT = RMW_RET_TIMEOUT

const RCL_RET_BAD_ALLOC = RMW_RET_BAD_ALLOC

const RCL_RET_INVALID_ARGUMENT = RMW_RET_INVALID_ARGUMENT

const RCL_RET_UNSUPPORTED = RMW_RET_UNSUPPORTED

const RCL_RET_ALREADY_INIT = 100

const RCL_RET_NOT_INIT = 101

const RCL_RET_MISMATCHED_RMW_ID = 102

const RCL_RET_TOPIC_NAME_INVALID = 103

const RCL_RET_SERVICE_NAME_INVALID = 104

const RCL_RET_UNKNOWN_SUBSTITUTION = 105

const RCL_RET_ALREADY_SHUTDOWN = 106

const RCL_RET_NODE_INVALID = 200

const RCL_RET_NODE_INVALID_NAME = 201

const RCL_RET_NODE_INVALID_NAMESPACE = 202

const RCL_RET_NODE_NAME_NON_EXISTENT = 203

const RCL_RET_PUBLISHER_INVALID = 300

const RCL_RET_SUBSCRIPTION_INVALID = 400

const RCL_RET_SUBSCRIPTION_TAKE_FAILED = 401

const RCL_RET_CLIENT_INVALID = 500

const RCL_RET_CLIENT_TAKE_FAILED = 501

const RCL_RET_SERVICE_INVALID = 600

const RCL_RET_SERVICE_TAKE_FAILED = 601

const RCL_RET_TIMER_INVALID = 800

const RCL_RET_TIMER_CANCELED = 801

const RCL_RET_WAIT_SET_INVALID = 900

const RCL_RET_WAIT_SET_EMPTY = 901

const RCL_RET_WAIT_SET_FULL = 902

const RCL_RET_INVALID_REMAP_RULE = 1001

const RCL_RET_WRONG_LEXEME = 1002

const RCL_RET_INVALID_ROS_ARGS = 1003

const RCL_RET_INVALID_PARAM_RULE = 1010

const RCL_RET_INVALID_LOG_LEVEL_RULE = 1020

const RCL_RET_EVENT_INVALID = 2000

const RCL_RET_EVENT_TAKE_FAILED = 2001

const RCL_RET_LIFECYCLE_STATE_REGISTERED = 3000

const RCL_RET_LIFECYCLE_STATE_NOT_REGISTERED = 3001

const RCL_ENCLAVE_NAME_VALID = RMW_NAMESPACE_VALID

const RCL_ENCLAVE_NAME_INVALID_IS_EMPTY_STRING = RMW_NAMESPACE_INVALID_IS_EMPTY_STRING

const RCL_ENCLAVE_NAME_INVALID_NOT_ABSOLUTE = RMW_NAMESPACE_INVALID_NOT_ABSOLUTE

const RCL_ENCLAVE_NAME_INVALID_ENDS_WITH_FORWARD_SLASH = RMW_NAMESPACE_INVALID_ENDS_WITH_FORWARD_SLASH

const RCL_ENCLAVE_NAME_INVALID_CONTAINS_UNALLOWED_CHARACTERS = RMW_NAMESPACE_INVALID_CONTAINS_UNALLOWED_CHARACTERS

const RCL_ENCLAVE_NAME_INVALID_CONTAINS_REPEATED_FORWARD_SLASH = RMW_NAMESPACE_INVALID_CONTAINS_REPEATED_FORWARD_SLASH

const RCL_ENCLAVE_NAME_INVALID_NAME_TOKEN_STARTS_WITH_NUMBER = RMW_NAMESPACE_INVALID_NAME_TOKEN_STARTS_WITH_NUMBER

const RCL_ENCLAVE_NAME_INVALID_TOO_LONG = RMW_NAMESPACE_INVALID_TOO_LONG

const RCL_ENCLAVE_NAME_MAX_LENGTH = RMW_NODE_NAME_MAX_NAME_LENGTH

const RCL_TOPIC_NAME_VALID = 0

const RCL_TOPIC_NAME_INVALID_IS_EMPTY_STRING = 1

const RCL_TOPIC_NAME_INVALID_ENDS_WITH_FORWARD_SLASH = 2

const RCL_TOPIC_NAME_INVALID_CONTAINS_UNALLOWED_CHARACTERS = 3

const RCL_TOPIC_NAME_INVALID_NAME_TOKEN_STARTS_WITH_NUMBER = 4

const RCL_TOPIC_NAME_INVALID_UNMATCHED_CURLY_BRACE = 5

const RCL_TOPIC_NAME_INVALID_MISPLACED_TILDE = 6

const RCL_TOPIC_NAME_INVALID_TILDE_NOT_FOLLOWED_BY_FORWARD_SLASH = 7

const RCL_TOPIC_NAME_INVALID_SUBSTITUTION_CONTAINS_UNALLOWED_CHARACTERS = 8

const RCL_TOPIC_NAME_INVALID_SUBSTITUTION_STARTS_WITH_NUMBER = 9

# Skipping MacroDefinition: RCL_EXPORT __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: RCL_PUBLIC __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: RCL_LOCAL __attribute__ ( ( visibility ( "hidden" ) ) )


const RMW_DURATION_INFINITE = rmw_time_s(Clonglong(9223372036), Clonglong(854775807))
const RMW_DURATION_UNSPECIFIED = rmw_time_s(Clonglong(0), Clonglong(0))
const RMW_QOS_DEADLINE_DEFAULT = RMW_DURATION_UNSPECIFIED
const RMW_QOS_LIFESPAN_DEFAULT = RMW_DURATION_UNSPECIFIED
const RMW_QOS_LIVELINESS_LEASE_DURATION_DEFAULT = RMW_DURATION_UNSPECIFIED
const ROSIDL_TYPESUPPORT_INTROSPECTION_C__IDENTIFIER = "rosidl_typesupport_introspection_c"

# exports
const PREFIXES = ["CX", "rcl_"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

