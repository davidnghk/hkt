class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_limit => [1920, 1920], :if => :is_jpg?
  process :resize_to_limit => [1920, 1920], :if => :is_jpeg?
  
  version :thumb do
     process :resize_to_limit => [100, 100], :if => :is_jpg?
     process :resize_to_limit => [100, 100], :if => :is_jpeg?

    def efficient_conversion
      manipulate! do |img|
        img.format("png") do |c|
          c.fuzz        "3%"
          c.trim
          c.colorspace  "sRGB"
        end
        img
      end
    end

   def full_filename (for_file = model.logo.file)
     super.chomp(File.extname(super)) + '.jpg'
   end 
  end

  def extension_whitelist
     %w(jpg jpeg gif png pdf)
   end

  protected

    def pdf?(new_file)
      new_file.content_type.include? "/pdf"
#      picture.extension.to_s.downcase == 'pdf'
    end

    def is_jpg?(picture)
      picture.extension.to_s.downcase == 'jpg'
    end
    
    def is_jpeg?(picture)
      picture.extension.to_s.downcase == 'jpeg'
    end
end
