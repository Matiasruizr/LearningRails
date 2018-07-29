# LearningRails
Apuntes y ejercicios que he utilizado en mi camino para dominar rails



Rails es un framework de desarrollo de aplicaciones web escrito en el lenguaje de programación Ruby. Está diseñado para hacer que la programación de aplicaciones web sea más fácil, haciendo supuestos sobre lo que cada desarrollador necesita para comenzar. Te permite escribir menos código realizando más que muchos otros lenguajes y frameworks. Además,tiene como intención que el desarrollo de aplicaciones web sea más divertido.


Filosofia de Rails

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
