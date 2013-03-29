ActiveAdmin.register Episode do
  	index do
		selectable_column
		column :id
		column :title
		column :season
		#column for number of seasons and episodes

		default_actions
	end
	 
	# Filter
	filter :tv
	filter :title
	filter :season
	
	scope :all, :default => true
	#seasons available

end
