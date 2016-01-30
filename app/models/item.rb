class Item < ActiveRecord::Base
  has_and_belongs_to_many :genres, -> { uniq }
  has_and_belongs_to_many :languages, -> { uniq }

  dragonfly_accessor :front do
    after_assign do |img|
      img.convert!(%q[
                       -strip -filter Triangle -define filter:support=2
                       -thumbnail 'x1081' -gravity east -crop '764x1081+0+0' -unsharp 0.25x0.25+8+0.065
                       -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off
                       -define png:compression-filter=5 -define png:compression-level=9
                       -define png:compression-strategy=1 -define png:exclude-chunk=all
                       -interlace none -colorspace sRGB -units PixelsPerInch -density 72
                     ], 'format' => 'jpg') unless img.width == 764 &&
                                                  img.height == 1081 &&
                                                  img.format == 'jpeg'
    end
  end
  
  dragonfly_accessor :back do
    after_assign do |img|
      img.convert!(%q[
                       -strip -filter Triangle -define filter:support=2
                       -thumbnail 'x1081' -crop '764x1081+0+0' -unsharp 0.25x0.25+8+0.065
                       -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off
                       -define png:compression-filter=5 -define png:compression-level=9
                       -define png:compression-strategy=1 -define png:exclude-chunk=all
                       -interlace none -colorspace sRGB -units PixelsPerInch -density 72
                     ], 'format' => 'jpg') unless img.width == 764 &&
                                                  img.height == 1081 &&
                                                  img.format == 'jpeg'
    end
  end
end
