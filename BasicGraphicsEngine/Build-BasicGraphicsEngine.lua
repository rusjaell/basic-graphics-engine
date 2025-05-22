project "BasicGraphicsEngine"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++20"
   targetdir "Build/%{cfg.buildcfg}"
   staticruntime "off"
   
   files 
   { 
       "src/**.h", 
       "src/**.cpp", 
       "../Vendor/GLAD/src/glad.c",
       "../Vendor/imgui/*.cpp",
       "../Vendor/imgui/*.h"
   }

   includedirs
   {
      "assets",
      "src/",
      "../Vendor/GLFW/include",
      "../Vendor/GLAD/include",
      "../Vendor/GLM/include",
      "../Vendor/stb/include"
   }

   links
   {
      "../Vendor/GLFW/lib/glfw3.lib",
      "opengl32.lib"
   }

   targetdir ("../Build/" .. OutputDir .. "/%{prj.name}")
   objdir ("../Build/Intermediates/" .. OutputDir .. "/%{prj.name}")
   
   postbuildcommands 
   {
      "{COPYDIR} assets ../Build/" .. OutputDir .. "/%{prj.name}/assets"
   }

   filter "system:windows"
       systemversion "latest"
       defines { "WINDOWS" }

   filter "configurations:Debug"
       defines { "DEBUG" }
       runtime "Debug"
       symbols "On"

   filter "configurations:Release"
       defines { "RELEASE" }
       runtime "Release"
       optimize "On"
       symbols "On"

   filter "configurations:Dist"
       defines { "DIST" }
       runtime "Release"
       optimize "On"
       symbols "Off"
