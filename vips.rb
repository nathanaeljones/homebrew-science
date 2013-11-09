require 'formula'

class Vips < Formula
  homepage 'http://www.vips.ecs.soton.ac.uk/'
  url 'http://www.vips.ecs.soton.ac.uk/supported/7.36/vips-7.36.3.tar.gz'
  sha1 '65862f91c8b72c7e7c223023284a760aec7ebd52'
  head 'https://github.com/jcupitt/libvips'

  depends_on 'pkg-config' => :build
  depends_on :libpng
  depends_on :fontconfig
  depends_on 'gettext'
  depends_on 'glib'
  # Removed the optional flag to jpeg library as a temporary workaround since it fails to build
  # Already reported on project here https://github.com/jcupitt/libvips/issues/57
  depends_on 'jpeg'
  depends_on 'openslide' => :optional
  depends_on 'libtiff' => :optional
  depends_on 'imagemagick' => :optional
  depends_on 'fftw' => :optional
  depends_on 'little-cms' => :optional
  depends_on 'pango' => :optional
  depends_on 'libexif' => :optional
  depends_on 'liboil' => :optional
  depends_on 'openexr' => :optional
  depends_on 'cfitsio' => :optional

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
