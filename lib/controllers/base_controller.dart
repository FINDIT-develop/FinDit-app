import 'package:FinDit/repository/app_exceptions.dart';
import 'package:FinDit/screens/widgets/dialog_helper.dart';

class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message);
    }
  }

  showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}
