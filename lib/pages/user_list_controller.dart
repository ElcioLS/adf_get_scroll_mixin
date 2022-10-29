import 'package:adf_get_scroll_mixin/models/user_model.dart';
import 'package:adf_get_scroll_mixin/repositories/user_repository.dart';
import 'package:get/get.dart';

class UserListController extends GetxController
    with StateMixin<List<UserModel>>, ScrollMixin {
  final UserRepository _userRepository;
  late final Worker workerPage;

  UserListController({required UserRepository userRepository})
      : _userRepository = userRepository;

  final _page = 1.obs;
  final _limit = 12;

  @override
  void onInit() {
    workerPage = ever<int>(_page, (_) {
      _findUser();
    });
    super.onInit();
  }

  void atualizar() => _page.value++;

  @override
  void onReady() {
    _findUser();
    super.onReady();
  }

  @override
  void onClose() {
    workerPage();
    // super.onClose();
  }

  Future<void> _findUser() async {
    final result = await _userRepository.getUsers(_page.value, _limit);

    final stateResult = state ?? [];
    stateResult.addAll(result);

    change(stateResult, status: RxStatus.success());
  }

  @override
  Future<void> onTopScroll() async {}

  @override
  Future<void> onEndScroll() async {
    _page.value++;
  }
}
