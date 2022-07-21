/// Base View Model class where all common variables and functions ar defined.
/// All other view models should extend this class.
abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {}

/// View model inputs for the view model.
abstract class BaseViewModelInputs {
  /// Called to start the view model job.
  void start();

  /// Called to kill the view model.
  void dispose();
}

/// View model outputs for the view model.
abstract class BaseViewModelOutputs {
  /// TODO: implement view model outputs

}
