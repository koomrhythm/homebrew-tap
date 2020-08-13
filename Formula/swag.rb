class Swag < Formula
  desc "Swag converts Go annotations to Swagger Documentation 2.0."
  homepage "https://github.com/swaggo/swag"
  version "1.6.7"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/swaggo/swag/releases/download/v1.6.7/swag_1.6.7_Darwin_x86_64.tar.gz"
    sha256 "bbd30049c904c615f1736c4f3438fb244b2ea4a7aa24779353449c8820915f4d"
  elsif OS.linux?
    url "https://github.com/swaggo/swag/releases/download/v1.6.7/swag_1.6.7_Linux_x86_64.tar.gz"
    sha256 "8ee53c1f32bd7c0d0ff963b35ad6437d3757314c8269aac3a90955f99313e6ea"
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