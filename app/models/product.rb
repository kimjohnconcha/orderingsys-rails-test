class Product < ApplicationRecord

    mount_uploader :image, ImageUploaderProduct

    #test
    has_many :carts

    validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }

end
