import '../../../../core/data/repositories/bookmark_repository.dart';
import '../../../../core/domain/entities/bookmark_data_entity.dart';
import '../../../../core/domain/usecases/bookmark_usecase.dart';
import '../payload/bookmark_param.dart';

class BookmarkUseCaseImpl implements BookmarkUseCase {

  BookmarkUseCaseImpl({
    required this.bookmarkRepository
  });

  final BookmarkRepository bookmarkRepository;

  @override
  Future<List<BookmarkDataEntity>> bookmark() {

    return bookmarkRepository.bookmark();
  }
  
  @override
  Future<BookmarkDataEntity> getIdFromBookmark({required int id}) {

    var param = BookmarkParam(
      id: id
    );

    return bookmarkRepository.getIdFromBookmark(param);
  }
}