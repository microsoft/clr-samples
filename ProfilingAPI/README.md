# Profiling API Samples for CoreCLR

This directory houses samples using the CoreCLR Profiler APIs.

The sample code in this repository is being provided to the community `AS-IS`. It is the profiler authors responsibility to verify that the sample code provided is built, tested and behaves correctly for their platform and particular scenario. Although the samples were verified initially when they were written, there is no continous testing enabled for them.

Additionally the samples may use profiling APIs that are currently considered unsupported/untested.

Please check the [Profiling API Status](https://github.com/dotnet/coreclr/tree/master/Documentation/project-docs/profiling-api-status.md) when building your profiler that may target multiple platforms to verify which APIs have been ported and tested for your target platform.

## Native SDK for consuming the Profiler APIs

Profilers using the CoreCLR Profiling APIs are unmanaged components that require the native headers and static libraries to compile against.

Samples in this repository refer to instructions in the CoreCLR repo to build it, and then compile against the built output of that CoreCLR.

While this gets the profiler author up-and-running, using headers and libraries from a local CoreCLR build is a temporary setup until the .NET team is able to provide a more reasonable cross-platform SDK.

## Samples

* [ReJIT Enter Leave Hooks Profiler](https://github.com/Microsoft/clr-samples/tree/master/ProfilingAPI/ReJITEnterLeaveHooks) - This sample demonstrates a cross-platform portable profiler that rewrites the incoming method `CIL` to add a hook to a profiler supplied function that is called at method entry and exit.

* [ELT Profiler](https://github.com/Microsoft/clr-samples/tree/master/ProfilingAPI/ELTProfiler) - This sample demonstrates a cross-platform profiler that uses `SetEnterLeaveFunctionHooks3WithInfo` to monitor enter/leave of methods.
