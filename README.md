# JuliaROS
![test workflow](https://github.com/JuliaROS2/ROS2.jl/actions/workflows/julia_test.yml/badge.svg)


## Running tests locally
The unit tests are setup to run in GitHub Actions within [Earthly](https://earthly.dev/get-earthly). If you install Earthly locally, you can do

```
earthly +tests
```

To debug a failure interactively and get a system shell, use


```
earthly -i +tests
```
