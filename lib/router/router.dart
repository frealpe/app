import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';


////////////////Nombre de la clase
class Flurorouter{
  
  static final FluroRouter router = new FluroRouter();
  //Se crean las rutas de acceso
  //Principla Page
  static String rootRoute = '/inicio';  
  //Auth Router
  static String loginRoute = '/login';
  //Login
  static String registerRoute = '/register';
  //Dashboard
  static String dashboardRoute = '/dashboard';
  //Productos
//////////////////////////////////////////////////////////////////////////////////////////////////
  static void configureRoutes(){
    router.define(rootRoute, handler: AdminHandlers.login,transitionType: TransitionType.none);
    router.define(loginRoute, handler: AdminHandlers.login,transitionType: TransitionType.none);
    router.define(registerRoute, handler: AdminHandlers.register,transitionType: TransitionType.none); 
  
  //Dashboard  
    router.define(dashboardRoute, handler: DashboardHandlers.dashboard);

    router.notFoundHandler= NoPageFoundHandlers.noPageFound;
   
  }

}
