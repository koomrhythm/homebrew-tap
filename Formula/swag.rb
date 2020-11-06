class Swag < Formula
  desc "Swag converts Go annotations to Swagger Documentation 2.0."
  homepage "https://github.com/swaggo/swag"
  version "1.6.9"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/swaggo/swag/releases/download/v1.6.9/swag_1.6.9_Darwin_x86_64.tar.gz"
    sha256 "c472f063d7e020197d78d881034de50b82b597dba61c8ac42eb2ed432c59384b"
  elsif OS.linux?
    url "https://github.com/swaggo/swag/releases/download/v1.6.9/swag_1.6.9_Linux_x86_64.tar.gz"
    sha256 "6e22c2a736fa8e5d45a372035bb4bcdc2ca89e64912adef55bbd8d4bc047fdd1"
  end

  def install
    bin.install "swag"
    output = Utils.popen_read("#{bin}/swag completion bash")
    (bash_completion/"swag").write output
    output = Utils.popen_read("#{bin}/swag completion zsh")
    (zsh_completion/"_swag").write output
    prefix.install_metafiles
  end

  test do
    system "#{bin}/swag --version"
  end
end
