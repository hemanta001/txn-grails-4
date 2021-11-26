package txn.grails
class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "txn",action: "index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}

