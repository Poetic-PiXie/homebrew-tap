cask "pdf-toolkit" do
  version "1.0"
  sha256 "f1ecc58725eba94a166bd6fcedbd4c8e87fb9473e126cf41a714cc17af8863a8"

  url "https://github.com/Poetic-PiXie/pdf-toolkit/releases/download/v#{version}/PDF_Toolkit.dmg"
  name "PDF Toolkit"
  desc "Split, merge, rotate and convert PDFs"
  homepage "https://github.com/Poetic-PiXie/pdf-toolkit"

  depends_on macos: ">= :ventura"

  app "PDF Toolkit.app"
end
