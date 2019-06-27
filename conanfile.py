from conans import ConanFile, CMake

class LibExpatConan(ConanFile):
    name = "libexpat"
    version = "2.2.7.0"
    license = "MIT"
    url = "https://libexpat.github.io/"
    description = "XML parser"
    settings = "os", "compiler", "build_type", "arch"
    options = {}
    default_options = ""
    generators = "cmake"
    exports_sources = "*", "!build/*"
    
    def build(self):
        cmake = CMake(self)
        cmake.configure(source_folder="expat")
        cmake.build()
        cmake.install()

#    def package(self):
#         nothing to do here. All is handled by cmake.install() above.
        
    def package_info(self):
        self.cpp_info.libs = ["LibExpat"]
