class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # AWS S3 Bucket 저장 경로
  # 이미지가 동일한 경로에 저장되면 똑같은 이름의 이미지가 업로드 할 시 덮어씌어질 수 있어서 이미지가 새로 추가될 때 서로 다른 경로에 이미지가 생성되게 함.
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 업로드 시 허용 확장자
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # 파일 업로드 허용 용량
  # 해당 부분은 주석처리 되어있음, 아래 예시에선 2MB까지만 허용
  # def size_range
  #    1..2.megabytes
  # end
end
