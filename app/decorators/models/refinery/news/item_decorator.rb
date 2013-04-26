::Refinery::News::Item.class_eval do
  has_many :image_pages, :as => :item, :order => 'position ASC'
  has_many :images, :through => :image_pages, :order => 'position ASC'
  has_many_page_images
end
