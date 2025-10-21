/// A generic class that represents a paginated list of items of type [T].
///
/// This class is used to handle paginated responses from APIs, containing both
/// the current page's items and the total count of all available items.
///
/// Example:
/// ```dart
/// final userList = PaginationList<User>(
///   result: [user1, user2, user3],
///   totalCount: 100,
/// );
/// ```
///
/// [T] is the type of items in the list.
class PaginationList<T> {
  /// The current page's items.
  ///
  /// Contains a list of items of type [T] that represent the current page
  /// of data being displayed or processed.
  final List<T> result;

  /// The total number of items available across all pages.
  ///
  /// This count represents the total number of items that exist in the complete dataset,
  /// not just the current page. This is useful for implementing pagination controls
  /// or displaying progress indicators.
  final int totalCount;

  /// Creates a new [PaginationList] instance.
  ///
  /// [result] is the list of items for the current page.
  /// [totalCount] is the total number of items available across all pages.
  const PaginationList({
    required this.result,
    required this.totalCount,
  });
}
