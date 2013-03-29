module ApplicationHelper
	def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end

	def genre_cloud(genres, classes)
		max = genres.sort_by(&:count).last
		genres.each do |genre|
			index = genre.count.to_f / max.count * (classes.size - 1)
			yield(genre, classes[index.round])
		end
	end
end
