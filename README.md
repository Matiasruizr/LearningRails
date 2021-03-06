# LearningRails
Apuntes y ejercicios que he utilizado en mi camino para dominar rails. .

Rails es un framework de desarrollo de aplicaciones web escrito en el lenguaje de programación Ruby. Está diseñado para hacer que la programación de aplicaciones web sea más fácil, haciendo supuestos sobre lo que cada desarrollador necesita para comenzar. Te permite escribir menos código realizando más que muchos otros lenguajes y frameworks. Además,tiene como intención que el desarrollo de aplicaciones web sea más divertido.


Filosofia de Rails:

DRY - "Don't Repeat Yourself" - sugiere que escribir el mismo código una y otra vez es una mala práctica.

Convencion por sobre configuracion, rails toma decisiones triviales por nosotros para permitirnos avanzar mas rapido

Omakase, no tenemos que ser experto para tener un gran fundamento para realizar app, ya que estas las tomaron con anterioridad tanto el framework como todas las personas que lo crearon

Beautiful code 


# Creando mi primer proyecto en Rails

Para crear un nuevo proyecto en reails simplemente ejecutamos desde nuestra terminal
```
Rails new nombreProyecto
```

Estructura de archivos

Comentare a continucación como funciona la estructura de rails dando una breve explicación a los archivos relevantes. 


| Archivo/Carpeta | Propósito |
| --------------- | --------- |
|app/|Contiene los controllers, models, views, helpers, mailers y assets para tu aplicación. a.|
|app/|Contiene los controllers, models, views, helpers, mailers y assets para tu aplicación. a.|
|/assets/| Acá van los Js, Scss, img, todo lo necesario para el frontend|
|/channels/|
|/controllers/| Acá van todos los controladores que utilizará nuestra aplicación, manejan las peticiones http y manipulan nuestros modelos|
|/helpers/| Acá van los metodos que queremos utilizar en las vistas principalmente|
|/jobs/| |
|/mailers/| Acá iria toda la lógica de envío de correo en caso de existir en la app|
|/models/|Acá va toda la lógica de la app|
|/views/| Front end, html, erb|
|config/|Configura las reglas de ejecución de la aplicación, rutas, base de datos y más. Este tema es cubierto en mayor detalle en [Configuring Rails Applications](http://edgeguides.rubyonrails.org/configuring.html).|
|/environments/| Por defecto se generan 3 entornos, cada uno debe ser distinto, local, test, prod|
|/initializers/| Codigo que se ejecuta al levantar el server, antes de cargar la app|
|/locales/|
|/database.yml| Configuracionm de nuesta base de datos, por defecto esta configurada a sqlite|
|/routes.rb| Permite configurar las rutas a utilizar dentro de nuestra app|
|config.ru| Configuración Rack para servidores basados en Rack usados para iniciar la aplicación.|
|db/|Contiene el esquema actual de tu base de datos, así como las migraciones de la base de datos.|
|doc/|Documentación detallada de tu aplicación.|
|Gemfile<br />Gemfile.lock| Estos arhivos te permiten especificar qué dependencias de gemas son necesitadas para tu aplicación Rails. Estos archivos son usados por la gema Bundler, ver [Sitio web de Bundler](http://gembundler.com).|
|lib/|Módulos extendidos para tu aplicación.|
|log/|Archivos de Log de tu aplicación.|
|public/|La única carpeta vista por el mundo tal como es. Contiene los archivos estáticos y assets compilados.|
|Rakefile|Este archivo localiza y carga tareas que pueden ser ejecutadas desde la línea de comandos. La lista de tareas son definidas a través de los componentes de Rails. En vez de cambiar el Rakefile, deberías agregar tus propias tareas, añadiendo archivos al directorio `lib/tasks` de tu aplicación.|
|README.rdoc|Este es un breve manual de instrucciones para tu aplicación. Deberías editar este archivo para comunicar a otros lo que tu aplicación hace, cómo configurarla y demás.|
|script/|Contiene el script de Rails que inicia tu aplicación y contiene otros scripts usados para desplegar o correr tu aplicación.|
|test/|Pruebas unitarias, fixtures y otras pruebas. Éstos son cubiertos en [Testing Rails Applications](http://edgeguides.rubyonrails.org/testing.html).|
|tmp/|Archivos temporales (como archivos de caché, pid y archivos de sesiones).|
|vendor/|Lugar para código de terceros. En una típica aplicación Rails, esta incluye librerías y plugins.|


# Generadores Rails

Es la manera más simple de crear componentes de nuestra app
```
rails generate models
               controllers
               scaffold
               assets
               mailer
               migration
               helper
               taks
               etc.
               
# Tambien podemos llamarlo como
rails g
```

# Scaffold (Andamio)
Con Scaffold le decimos a rails como utiilizaremos nuestra base de datos y en base a esto genera modelos, rutas, controladores, y vistas.
Es una de las herramientas más utiles para comenzar nuestro desarrollo de manera rápida
```
rails g scaffold nombreModelo atributo:tipo_de_dato
                                      :binary	
                                      :boolean	
                                      :date	
                                      :datetime
                                      :decimal	
                                      :float	
                                      :integer	
                                      :string	
                                      :text
                                      :time
                                      :timestamp
                                      # Estos son todos los tipos de datos que soporta el Scaffold
```
Más info en detalle sobre todo lo que podemos hacer en un scaffold https://richonrails.com/articles/rails-model-generator-shortcuts


Una vez generemos un modelo, scaffold necesitamos generar una migración!
Una migración es una manera de sincronizar los esquemas con la base de datos y los archivos en ruby de manera simultanea.
Con esto permitimos que ruby haga todo el trabajo en SQL por nosotros

Ejecutamos una migración con el siguiente comando:
```
rake db:migrate
```

# Rutas

```
rake routes
```
# ActiveRecord

Active Record es la M en MVC - el modelo - el cual es la capa del sistema responsable de representar los datos y la lógica de nogocio para manipularlos. Active Record facilita la creación y manipulación de objetos de negocio quienes requieren ser almacenados persistentemente en una base de datos. Esta es una implementación del patrón de Active Record el cual en si mismo es una descripción de un sitema de Mapeo de Objetos Relacionales

brinda varios mecanismos, los más importantes nos la capacidad para:

  Representar modelos y sus datos.
  Representar asociaciones entre esos modelos.
  Representar jerarquías de herencia a través de modelos relacionados.
  Validar modelos antes the que sean guardados o cambiados en la base de datos.
  Mantener las operaciones de la base de datos orientadas a objetos.

Nos permite hacer consultas a la base de datos mediante una interaccion con objetos simplificadas, por lo tanto solo interactuamos con objetos de ruby en vez de estar consultando a la base de datos.

# SQLlite

Para hacer consultas podemos acceder a sqlite3 y hacer consultas a la base de datos directamente, desde la consola situados en nuestro proyectos ejecutamos
```
sqlite db/development.sqlite3
```

# Otro tipo de Base de datos

Tambien podemos utilizar otro tipo de base de datos, por ejemplo para utilizar PostgreSQL

Cambiamos la gema sqlite3 por la gema 'pg'

Y cambiamos nuestro database.yml para que quede de la siguiente manera

```
postgresql: &postgresql
  adapter: postgresql
  host: localhost
  pool: 5
  timeout: 5000
  username: user
  password: pass

development:
  <<: *postgresql
  database: musicapp_development

test:
  <<: *postgresql
  database: musicapp_test

production:
  <<: *postgresql
  database: musicapp_production
```

Y luego creamos la base de datos con
```
rails db:create
```

Como en todo cambio en la base de datos terminamos con una migracion
```
rails db:migrate
```

# Consola de rails
Podemos acceder a esta consola ejectuando el comando
```
rails console
```

Desde acá podemos (entre mucahs cosas) hacer consultas a active record.

Para partir hacemos una coneccion con la base de datos y el nombre del modelo
```
Track.connection
```

Ahora podemos acceder a los datos de este modelo simplemente escribiendo el nombre
```
Track
```
Algunos comandos utilez
```
Track.count # Cuenta cuantas filas tenemos en Track
Track.first # Obtenemos el primero
Track.create title: 'A', artist: 'Megadeth', album: 'Peace sells but who's buying' #Creamos un nuevo track
Track.all # Trae todos los objetos 
Track.where title: 'A' # Trae todos los elementos que coincidan con al busqueda
Track.find_by title: 'A' # Trae el primer elemento que coincida con al busqueda
cancion = Track.new # Guardamos un tracl en una variable cancion
  cancion.title = "For whom the bells tolls"
  cancion.artist = "Metallica"
  
  cancion.save # Con esto se guarda en la base de datos
```

# Modelos

Creacion de modelos sin usar scaffold, simplemente creamos el archivo dentro de models, en este caso palylist.rb y lo heredamos de ApplicationRecord 
```
class Playlist  < ApplicationRecord

end
```

LOS NOMBRES DE LAS TABALS DEBEN SER EN PLURAL, Y LOS MODELOS EN SINGULAR
```
rails g migration CreationPlaylists 
```
Con esto invocamos a active record y nos retorna un archivo de migracion que permite crear la tabla en la BdD
```
 create_table :playlists do |t|
      t.string :name
      t.integer :number_of_votes
    end
```
Ejecutamos como siempre rake db:migrate

Luego en routes.rb creamos los recursos para este modelo 
```
resource :playlists
```
finalmente creamos un controlador para manejar este modelo

Para manejar las distintas vistas debemos crearlas en la carpeta views, y ademas crear un metodo para cada una desde el controlador

Ej: 
```
class PlaylistsController < ApplicationController
    def index
        @playlists = Playlist.all
    end
end
```
Vista index 
```
<h1> Listado de listas de reproducción </h1>

<table>
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Numero de votos</th>
        </tr>
    </thead>
    <tbody>
        <% @playlists.each do |p| %>
            <tr>
                <td><%= p.name %></td>
                <td><%= p.number_of_votes %></td>
            </tr>
        <% end %>   
    </tbody>
</table>
```

# Formularios

El helper form for nos crea un formulario en html que incluye todas las configuraciones pertinentes por defecto,
```
<%= form_for( playlists) do |f| %>

<% end %>
```

Tambien tenemos helpers para crear los label, campos de texto, numeros, select, etc...
```
   
 # Campo de texto para el atributo name
 <%= f.text_field :name %>
 
 # Select con elementos de un array
 <%= form.select(:cliente, Cliente.all.collect {|c| [ c.cliente_id, c.cliente_id ] } ) %>
 
 # Boton de submit
 <%= f.submit %>
```

Para crear un elemento con este formulario necesitamos un metodo create
Para realizar esto primero recibimos los parametros ingresados en el formulario a travez de un metodo privado
```
 private
  def playlists_params
      params.require(:playlist).permit(:name, :number_of_votes)
  end
```

En el metodo create creamos una nueva playlist con los parametros ingresamos, y validamos si este guarda efectivamente generando una accion en caso de hacerlo u otra en caso de no hacerlo
```
  def create
      @playlist = Playlist.new(playlists_params)
      if @playlist.save
          # Guardo correctamente
      else
          # Error al guardar
      end
  end
```

# Validaciones
```
# Con esto validamos la presencia de estos dos campos
validates_presence_of  :name, :number_of_votes
```

```
# Con esto validamos que exista un solo campo email
validates :email, uniqueness: true
```


* Las migraciones pueden ser progresivas!, pueden modificarse los modelos y tablas del scaffold


# Relaciones en modelos

belongs_to | Pertenece a es una relacion 1 a 1
  Por ejemplo, una orden de compra, corresponde a un cliente ( la orden de compra corresponderia a un cliente)
has_one | Tiene uno y solo uno
  Por ejemplo una orden de compre, tiene solo un cliente, tiene una subscripcion, no puede tener más!

has_many | Uno a muchos
  Un cliente, tiene muchas ordenes de compra
  class Cliente < ActiveRecord::Base
    has_many :oc
  end
  

  
  
has_mayn:through | Relacion uno a muchos, a travez de un intermediario
  Un medico tiene muchos pacientes a travez de una agenda
  
  class Doctor < ActiveRecord::Base
    has_many :agendas
    has_many :pacientes, through :agendas
  end
  
  class Agendas < ActiveRecord::Base
    has_many :doctor
    has_many :paciente
  end
  
  class Paciente < ActiveRecord::Base
    has_many :agendas
    has_many :doctores, through :agendas
  end
  
 has_one:through | tiene uno a travez
 class Proveedor < ActiveRecord::Base
    has_one :account
    has_one :account_history, throught :account
  end
 
  class Account < ActiveRecord::Base
    belongs_to :supplier
    has:one :account_historu
  end
  
  class AccountHistory < ActiveRecord::Base
    belongs_to :account
  end
  
  has_and_belongs_to_many | relacion de muchos a muchos
  class Assembly < ActiveRecord::Base
    has_and_belongs_to_many :parts
  end
  
  class Part < ActiveRecord::Base
    has_and_belongs_to_many :assembles
  end
  
