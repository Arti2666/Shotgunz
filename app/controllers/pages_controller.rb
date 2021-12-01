class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @url_page = "http://www.shotgunz.net" # Needed for QR Code generation
    @qr_code = RQRCode::QRCode.new(@url_page) #QR Code generation
    @svg = @qr_code.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      standalone: true  ) #QR Code transformation to image
  end
end
