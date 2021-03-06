class Singular < Formula
    desc "Singular -- A Computer Algebra System for Polynomial Computations"
    homepage "http://www.singular.uni-kl.de/"
    url "https://github.com/roidocampo/singular/archive/Release-4-0-3-20160229.tar.gz"
    version "4.0.3"
    sha256 "c326964b369c17c709519eac856de23a1501da494034009887718031207ec027"
    revision 1

    bottle do
        root_url 'https://raw.githubusercontent.com/roidocampo/homebrew-bottles/master'
        rebuild 1
        sha256 "2225ddfba1e724c30dd0565617599686b5051b43f722bb3f7ab347ad2f846e4b" => :el_capitan
    end

    depends_on "autoconf" => :build
    depends_on "autogen" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
    depends_on "readline" => :build
    depends_on "gmp" => :build
    depends_on "ntl" => :build
    depends_on "homebrew/science/flint" => :build
    depends_on "mpfr" => :build
    depends_on "homebrew/science/glpk" => :build
    depends_on "homebrew/science/cddlib" => :build
    depends_on "graphviz"

    def install
        system "./autogen.sh"
        mkdir "brewbuild" do
            system "../configure", "--prefix=#{prefix}"
            system "make"
            system "make", "install"
        end
    end

    test do
        system "false"
    end
end

# OLD HACK:

# require 'formula'
# require_relative 'lib/dmg'

# DMG_FILE = "Singular4-0-2_64.dmg"

# class Singular < Formula

#     desc "Singular -- A Computer Algebra System for Polynomial Computations"
#     homepage "http://www.singular.uni-kl.de/"
#     url "ftp://www.mathematik.uni-kl.de/pub/Math/Singular/UNIX/Singular4-0-2_64.dmg"
#     sha256 "587de535df29ffe492b5686d9ebb0e79a5d70176022a424e4223719a728e532d"
#     version "4.0.2"

#     def install
#         extract_dmg DMG_FILE, buildpath/'dmg'
#         prefix.install Dir[buildpath/'dmg/Singular.app']
#         (bin/'singular').write script
#     end

#     def script; <<-EOS.undent
#         #!/bin/sh
#         exec "#{prefix}/Singular.app/Contents/bin/SINGULAR.sh" "$@"
#         EOS
#     end

#     test do
#         system "false"
#     end

# end
