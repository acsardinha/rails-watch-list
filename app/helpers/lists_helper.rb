module ListsHelper
  def cloudinary_image(list)
    if list.photo.attached?
      cl_image_path list.photo.key, crop: :fill
    else
      'https://www.firstbenefits.org/wp-content/uploads/2017/10/placeholder-1024x1024.png'
    end
  end
end
