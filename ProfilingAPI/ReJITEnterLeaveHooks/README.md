XPlat CoreCLR Profiler with ELT Simulation
==========================================

This sample shows a minimal CoreCLR profiler that simulates Enter/Leave hooks by rewriting the incoming MSIL and adding instructions to make P/Invoke calls to profiler supplied Enter/Leave functions.

Prerequisites
-------------

* CoreCLR Repository (build from source) Dependencies
* Clang 3.5  (Linux)
* Visual Studio 2015 Community (Windows)

Building on Linux, MacOSX
-------------------------

### Environment

``build.sh`` expects the following environment variables to be setup; default values are shown below.

```bash
export CORECLR_PATH=~/coreclr # default
export BuildOS=Linux # Linux(default), osx
export BuildArch=x64 # x64 (default)
export BuildType=Debug # Debug(default), Release
export Output=CorProfiler.so # default
```

``CORECLR_PATH`` is the path to your cloned and successfully built CoreCLR repository(current is dotnet/runtime).

``BuildOS``, ``BuildArch`` and ``BuildType`` must match how you built the CoreCLR repository, so the header files and other artifacts needed for compilation are found.

### Build

```bash
git clone http://github.com/Microsoft/clr-samples
cd clr-samples/ProfilingAPI/ReJITEnterLeaveHooks
./build.sh
```

### Setup

```bash
export CORECLR_PROFILER={cf0d821e-299b-5307-a3d8-b283c03916dd}
export CORECLR_ENABLE_PROFILING=1
export CORECLR_PROFILER_PATH=/filePath/to/CorProfiler.so
./corerun YourProgram.dll
```

Building on Windows
-------------------

### Environment

All instructions must be run on the ``VS 2015 x64 Native Tools Command Prompt``.

```batch
SET CORECLR_PATH=../coreclr # default
SET BuildOS=Windows # Windows(default)
SET BuildArch=x64 # x64 (default)
SET BuildType=Debug # Debug(default), Release
SET Output=ClrProfiler.dll # default
```

### Build
On the ``VS 2015 x64 Native Tools Command Prompt``.

* msbuild
* or open using Visual Studio 2015 Community and Build

### Setup

```batch
SET CORECLR_PROFILER={cf0d821e-299b-5307-a3d8-b283c03916dd}
SET CORECLR_ENABLE_PROFILING=1
SET CORECLR_PROFILER_PATH=C:\filePath\to\ClrProfiler.dll
corerun YourProgram.dll
```

### Setup (on .NET 4.6.1+ CLR)

This profiler is also capable of running on the .NET 4.6.1 (or higher) CLR.

```batch
SET COR_PROFILER={cf0d821e-299b-5307-a3d8-b283c03916dd}
SET COR_ENABLE_PROFILING=1
SET COR_PROFILER_PATH=C:\filePath\to\ClrProfiler.dll
YourProgram.exe
```
