import 'package:auto_route/auto_route.dart'; 
import 'package:interview_newstartup/presentation/screens/presentation.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SingUpScreen,
      initial: true,
    ),
    AutoRoute(page: SingInScreen),
    AutoRoute(page: HomeScreen),
  ],
)
class $AppRouter {}
