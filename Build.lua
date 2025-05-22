workspace "BasicGraphicsEngine"
   architecture "x64"
   configurations { "Debug", "Release", "Dist" }
   startproject "BasicGraphicsEngine"

   filter "system:windows"
      buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus" }

OutputDir = "%{cfg.system}-%{cfg.architecture}/%{cfg.buildcfg}"

include "BasicGraphicsEngine/Build-BasicGraphicsEngine.lua"