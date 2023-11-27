VERSION 0.7

# TODO make it so that this file does not have to refer to the absolute paths to `juliaup` and `julia`.

deps:
    # See https://github.com/osrf/docker_images/
    FROM osrf/ros2:nightly

    RUN apt-get update \
      && apt-get install --no-install-recommends -qy \
        curl \
        && apt-get clean all

    # https://github.com/JuliaLang/juliaup#mac-and-linux
    RUN curl -fsSL https://install.julialang.org | sh -s -- --yes
    # ENV PATH="~/.juliaup/bin/:${PATH}"
    # RUN echo "$PATH"
    RUN ~/.juliaup/bin/juliaup add 1.9
    # RUN juliaup default 1.9
    # ENV PATH="~/.julia/juliaup/julia-1.9.2+0.x64.linux.gnu/bin:${PATH}"
    

code:
    FROM +deps
    WORKDIR /workspaces/ROS2.jl
    COPY . .

tests:
    FROM +code
    WORKDIR /workspaces/ROS2.jl
    RUN ["/bin/bash", "-c", "\"source /ros_entrypoint.sh && printenv | grep ROS \""]
    # TODO the glob here is bad. Related to inability to setting PATH.
    RUN ["/bin/bash", "-c", "\"source /ros_entrypoint.sh && ~/.julia/juliaup/julia-1.9.*/bin/julia --project=. --eval \\\"import Pkg; Pkg.test()\\\" \""]
