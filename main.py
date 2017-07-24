import cherrypy
import jinja2

class RoboCopo(object):

    def __init__(self):
        self.jj=jinja2.Environment(loader=jinja2.FileSystemLoader('./plantillas'))

    def _validar(self, plantilla):
        if not "_id_usuario" in cherrypy.session or cherrypy.session["_id_usuario"]==None:
            return "login.html"
        return plantilla

    @cherrypy.expose
    def index(self):
        plantilla=self._validar("index.html")
        tpl=self.jj.get_template(plantilla)
        return tpl.render()

    @cherrypy.expose
    def ingresar(self, **kwargs):
        cherrypy.session["_id_usuario"]=0

if __name__=='__main__':
    cherrypy.log("iniciando...")
    #
    cherrypy.config.update({"server.socket_port": 8080, 
                                             "tools.sessions.on":True
                                            })
    cherrypy.tree.mount(RoboCopo(), '/')
    cherrypy.engine.start()
    cherrypy.engine.block()
    cherrypy.log("terminado")
