module ApplicationHelper
	# Inserta el titulo completo a la página
	# La función recibe el parametro con el nombre de la pagina, ej: Concurso, About, etc y la concatena con el la variable base_title que en nuestro caso es Kpoperos
	# asi que quedaria Kpoperos | Concurso, si no le mandas nada solo despliega de titulo Kpoperos
	# Esta funcion se manda llamar desde el Layout de Aplication en este caso, que a su vez como esté es general para toda la aplicación
	# la variable page_title la mandas en la vista de la pagina que estas rendereando.
	def full_title(page_title)
		base_title = "Kpoperos"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
