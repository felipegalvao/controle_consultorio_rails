module ApplicationHelper
    
    def titulo(titulo_pagina = '')
        titulo_base = "Controle de Consultório"
        if titulo_pagina.empty?
            titulo_base
        else
            titulo_pagina + " | " + titulo_base
        end
    end
    
end