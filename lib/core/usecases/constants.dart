import '../controllers/network/network_controller.dart';
import '../controllers/langs/app_language.dart';
import '../controllers/utils/utils_logic.dart';
import '../controllers/utils/utils_state.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';


///!  --------- Controllers ---------
final NetworkLogic networkLogic = NetworkLogic.instance;

final UtilsLogic utilsLogic = UtilsLogic.instance;
final UtilsState utilsState = utilsLogic.state;

final AppLanguage appLanguage = AppLanguage.instance;

///!  --------- Constants ---------
final http.Client httpClient = GetIt.I.get<http.Client>();
final Logger logger = Logger();
const int numLimit = 20;

///!  --------- Format ---------
final DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
final DateFormat timeFormat = DateFormat('E, h:mm a');


const baseUrl = 'https://reqres.in';