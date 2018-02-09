class Product < ApplicationRecord

    mount_uploader :image, ImageUploaderProduct

    #test
    has_many :carts

end
