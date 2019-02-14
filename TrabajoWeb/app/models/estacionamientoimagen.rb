class Estacionamientoimagen < ApplicationRecord
  belongs_to :estacionamiento
  mount_uploader :foto, PictureUploader
end
