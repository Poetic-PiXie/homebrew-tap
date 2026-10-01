cask "pdf-toolkit" do
  version "1.1"
  sha256 "74bf91b59ff388cd4c5dfe341824580c061bd54248b4416316a649086a52c2f3"

  url "https://github.com/Poetic-PiXie/pdf-toolkit/releases/download/v#{version}/PDF_Toolkit.dmg"
  name "PDF Toolkit"
  desc "Split, merge, rotate and convert PDFs"
  homepage "https://github.com/Poetic-PiXie/pdf-toolkit"

  depends_on macos: ">= :ventura"

  app "PDF Toolkit.app"
end
