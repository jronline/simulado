class Alternative < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  do_not_validate_attachment_file_type :image
  
  
  # corrigir o erro de validacao de tipo de imagens pois nao esta amigavel ao usuario.
  validates_attachment :image, content_type: { content_type: "image/jpeg" } if present?
  
end
