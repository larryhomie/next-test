ActiveAdmin.register Tv do

	index do
		selectable_column
		column :id
		column :title
		#column for number of seasons and episodes

		default_actions
	end
	 
	# Filter only by title
	filter :title

	show :title => :title do

	  attributes_table do
        row :id
        row :title
        row :story
        row :created_at
        row :updated_at
        #row :tv.episodes.count #/ Count number of episodes
      end
      #active_admin_comments

	  panel "Episodes" do
	    table_for tv.episodes do |t|
	      t.column("Title") { |episode| link_to episode.title, admin_episode_path(episode) }
	      t.column("Season") { |episode| link_to episode.season, admin_episode_path(episode) }
	      # Clicking on a season should bring a list of all episodes in that season
	    end
	  end

	end

end
