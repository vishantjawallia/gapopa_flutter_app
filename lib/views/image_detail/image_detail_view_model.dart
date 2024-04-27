import 'package:gapopa_flutter_app/models/image_model.dart';
import 'package:stacked/stacked.dart';

class ImageDetailViewModel extends BaseViewModel {
  final Hits? hitObj;
  ImageDetailViewModel(this.hitObj) {
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);
    //Write your models loading codes here

    //Let other views to render again
    setBusy(false);
    notifyListeners();
  }
}
