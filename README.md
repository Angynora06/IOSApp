# IOSApp

En la aplicación el ContainerController es el root al cual se  le insertan el HomeController y MenuController. Para poder hacer eso en el ContainerController  se hace una función llamada "configureHomeController"  en el handlers. En el cual añadimos el HomeController como hijo al ContainerContainer controller. Para definir el root para el esquema de la navegación se hace a través del "UINavigationController", y maneja uno o más hijos de las vistas de la navegación.

-HomeController: sería el menu deslizante.

Para ver si funciona en el HomeController se puede hacer mirando si se cambia el color de fondo en el layout. Para poder hacer  eso se ha de llamar a una función llamada "configureHomeController" en el "ContainerController" en el método "viewDidLoad" para poder llamar a nuestra función HomeController.

Para poder configurar la barra de navegación se hace a través del "NavigationBarStyle" en el ContainerController y hay que hacerlo ahi por que es el root de las vistas.

Para configurar una barra de menu a la izquierda se hace a través de "UIBarButtonItem"  en el "HomeController" como se quiere que la barra de menu sea a la izquierda se envia esa información a través de "leftBarButtonItem".

Con ".withRenderingMode(.alwaysOriginal)" nos aseguramos que la imagen que ponemos en la UIBarButtonItem sea siempre blanca y se ponga tal cual el original. En action llamamos a la función "handleMenuToggle" para enseñar el Menu.

Para poder llamar a la función se hace a través de configureNavigationBar() en el método viewDidLoad.

Para poder mostrar solo una vez el menu se hace con la variable menuController: UIViewController!, así solo se mostrará una vez.

Para poder añadir el MenuController se hace a tráves no solo de la variable sino también de la función configureMenuController en el ContainerController.

Para poder mostrar el menu hay que hacer un prótocolo usando un "delegate" para poder añadir el menuController ya que donde tiene que estar sería en el "HomeController" pero donde se configura se hace en el "ContainerController"; el prótocolo se configura en el fichero "Utils"  creando el prótocolo HomeControllerDelegate. Despúes se hace una extensión "ContainerController: HomeControllerDelegate" que heredara de el prótocolo recién hecho. Luego se crea un "delegate" en el "HomeController" a través de una variable.

Para que funcione hay que llamarlo en el ContainerController en la función "configureHomeController" a través del homeController.delegate por que es el archivo que configura el prótocolo.

Para poder mostrar el Menu se hace a través de la función "showMenuController" en el ContainerController que recibe como parámetro shouldExpand. Se hace a través de una animación UIView que lo muestra hacia la derecha. Para llamar a esa función se hace en el handleMenuToggle, como "showMenuController". 

La variable "isExpand" es la que indica si se muestra el menu o se esconde el menu.

Para poder crear una tabla de menus se hace en el MenuController con la variable "tableView" y en la función configureTableView.

Se crea también en el MenuController una extensión por el mismo motivo que la interior. Para crear la celda de la TableView se hace en la carpeta "View" y se llama en el MenuController con la variable cell.
