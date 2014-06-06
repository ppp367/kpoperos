module ApplicationHelper
	#Inserta el titulo completo a la pagina
	def full_title(page_title)
		base_title = "Kpoperos"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
