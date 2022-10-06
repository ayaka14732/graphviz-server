import graphviz
import cherrypy

SUPPORTED_FORMATS = ('svg', 'png', 'gif', 'pdf')
FORMAT2MIME = {
    'svg': 'image/svg+xml',
    'png': 'image/png',
    'gif': 'image/gif',
    'pdf': 'application/pdf',
}

class Server:
    @cherrypy.expose
    def index(self, src, format='svg'):
        if format not in SUPPORTED_FORMATS:
            error_msg = f"Error: Unsupported format \'{format}\'. Please specify one of the following: {', '.join(SUPPORTED_FORMATS)} (default: svg)."
            raise cherrypy.HTTPError(415, error_msg)
        try:
            output = graphviz.Source(src, format=format).pipe()
        except graphviz.backend.CalledProcessError as e:
            raise cherrypy.HTTPError(400, e.stderr.decode('utf-8'))
        cherrypy.response.headers['Content-Type'] = FORMAT2MIME[format]
        return output

if __name__ == '__main__':
    cherrypy.config.update({
        'environment': 'production',
        'log.screen': False,
        'server.socket_host': '0.0.0.0',
        'show_tracebacks': False,
    })
    cherrypy.quickstart(Server())
