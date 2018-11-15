class Gauchada < ApplicationRecord
    #un gauchda es publicado por un usuario
	belongs_to :user
	belongs_to :category
	has_attached_file :cover, styles: { medium:"800x800" ,thumb:"200x200" , mini: "50x50"}
	validates_attachment :cover, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }


	#filtrado
	def self.search(search)
		 if search 
  			  where('title LIKE ?', "%#{search}%")

  		else
    		
  		end

	end
end
