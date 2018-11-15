class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #dimenciones en las cual va a crear las imagenes
  has_attached_file :cover, styles: { medium:"800x800" ,thumb:"200x200" , mini: "50x50"}
  #validaciones ante ataques que los brinda piperlip
  validates_attachment :cover, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  #un usuario se postula a muchas gauchadas.
  has_many :gauchadas
  has_many :buys
  #belongs_to :reputacion
end
