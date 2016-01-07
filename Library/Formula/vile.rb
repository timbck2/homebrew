class Vile < Formula
  desc "Vi Like Emacs"
  homepage "http://invisible-island.net/vile/vile.html"
  url "ftp://invisible-island.net/vile/vile-9.8.tgz"
  version "9.8"
  sha256 "dea31c023aa7a90271056c712c826a5d16d19ad61df5cf5f299aa1025af280d6"

  resource "reflex" do
    url "ftp://invisible-island.net/reflex/reflex-20131209.tgz"
    sha256 "0ebbfa2d564e1e211ccf862ad6f12dbffa784164ea4492d08b9d50a592aaf0e2"
  end
 
  def install
	resource("reflex").stage do
      system "./configure", "--prefix=#{buildpath}/reflex"
      system "make", "install"
    end

	ENV.prepend_path "PATH", buildpath/"reflex/bin"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--with-builtin-filters"
    system "make", "install"
  end

  test do
    system "#{bin}/vile", "-V"
  end
end
