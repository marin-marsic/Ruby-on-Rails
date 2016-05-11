class Track < ActiveRecord::Base
	mount_uploader :path, MusicUploader
	validates :name, presence: true, uniqueness: {case_sensitive: false}

end
