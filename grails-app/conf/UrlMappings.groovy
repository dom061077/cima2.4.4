class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller: "/home/index")
		"500"(view:'/error')
		//"404"(view:'dddddddddd/index')

	}
}
