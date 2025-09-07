import 'package:share_sampatti_mvp/app/app.dart';

// Filter type enum for different filter categories
enum FilterType { category, region }

// Filter state class to manage all filter-related data
class ExploreFilterState {
  final int selectedCategoryIndex;
  final int selectedRegionIndex;
  final bool isFilterVisible;
  final String? selectedCategory;
  final String? selectedRegion;
  final bool hasActiveFilters;

  const ExploreFilterState({
    this.selectedCategoryIndex = 0,
    this.selectedRegionIndex = 1,
    this.isFilterVisible = false,
    this.selectedCategory,
    this.selectedRegion,
    this.hasActiveFilters = false,
  });

  ExploreFilterState copyWith({
    int? selectedCategoryIndex,
    int? selectedRegionIndex,
    bool? isFilterVisible,
    String? selectedCategory,
    String? selectedRegion,
    bool? hasActiveFilters,
  }) {
    return ExploreFilterState(
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      selectedRegionIndex: selectedRegionIndex ?? this.selectedRegionIndex,
      isFilterVisible: isFilterVisible ?? this.isFilterVisible,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedRegion: selectedRegion ?? this.selectedRegion,
      hasActiveFilters: hasActiveFilters ?? this.hasActiveFilters,
    );
  }
}

// Controller class for managing explore filters
class ExploreFilterController extends StateNotifier<ExploreFilterState> {
  ExploreFilterController() : super(const ExploreFilterState());

  // Category management - single selection
  void selectCategory(int index) {
    final category = AppConstants.exploreTheme[index];
    String? selectedCategory;

    if (index == 0) {
      // "All" selected - clear category filter
      selectedCategory = null;
    } else {
      // Select the specific category
      selectedCategory = category;
    }

    state = state.copyWith(
      selectedCategoryIndex: index,
      selectedCategory: selectedCategory,
      hasActiveFilters: _hasActiveFilters(
        selectedCategory,
        state.selectedRegion,
      ),
    );
  }

  // Region management - single selection
  void selectRegion(int index) {
    if (index == 0) {
      // Close filter panel
      toggleFilterVisibility();
      return;
    }

    final region = AppConstants.regions[index - 1];
    String? selectedRegion;

    // Toggle selection - if same region is selected, deselect it
    if (state.selectedRegion == region) {
      selectedRegion = null;
    } else {
      selectedRegion = region;
    }

    state = state.copyWith(
      selectedRegionIndex: index,
      selectedRegion: selectedRegion,
      hasActiveFilters: _hasActiveFilters(
        state.selectedCategory,
        selectedRegion,
      ),
    );
  }

  // Filter visibility management
  void toggleFilterVisibility() {
    state = state.copyWith(isFilterVisible: !state.isFilterVisible);
  }

  void showFilters() {
    state = state.copyWith(isFilterVisible: true);
  }

  void hideFilters() {
    state = state.copyWith(isFilterVisible: false);
  }

  // Clear all filters
  void clearAllFilters() {
    state = state.copyWith(
      selectedCategoryIndex: 0,
      selectedRegionIndex: 1,
      selectedCategory: null,
      selectedRegion: null,
      hasActiveFilters: false,
    );
  }

  // Clear only category filters
  void clearCategoryFilters() {
    state = state.copyWith(
      selectedCategoryIndex: 0,
      selectedCategory: null,
      hasActiveFilters: _hasActiveFilters(null, state.selectedRegion),
    );
  }

  // Clear only region filters
  void clearRegionFilters() {
    state = state.copyWith(
      selectedRegionIndex: 1,
      selectedRegion: null,
      hasActiveFilters: _hasActiveFilters(state.selectedCategory, null),
    );
  }

  // Check if there are active filters
  bool _hasActiveFilters(String? category, String? region) {
    final hasCategoryFilters = category != null;
    final hasRegionFilters = region != null;
    return hasCategoryFilters || hasRegionFilters;
  }

  // Get filtered properties (this would integrate with your property provider)
  List<PropertyModel> getFilteredProperties(List<PropertyModel> properties) {
    if (!state.hasActiveFilters) {
      return properties;
    }

    return properties.where((property) {
      bool categoryMatch = true;
      bool regionMatch = true;

      // Check category filter - use propertyCategory field
      if (state.selectedCategory != null) {
        categoryMatch = property.propertyCategory == state.selectedCategory;
      }

      // Check region filter - since PropertyModel doesn't have region field,
      // we'll implement a simple mapping based on property title or description
      if (state.selectedRegion != null) {
        regionMatch = _checkRegionMatch(property, state.selectedRegion!);
      }

      return categoryMatch && regionMatch;
    }).toList();
  }

  // Get current filter summary
  String getFilterSummary() {
    List<String> summary = [];

    if (state.selectedCategory != null) {
      summary.add('Category: ${state.selectedCategory}');
    }

    if (state.selectedRegion != null) {
      summary.add('Region: ${state.selectedRegion}');
    }

    return summary.join(' • ');
  }

  // Check if a category is selected
  bool isCategorySelected(int index) {
    if (index == 0) {
      return state.selectedCategory == null;
    }
    return state.selectedCategory == AppConstants.exploreTheme[index];
  }

  // Check if a region is selected
  bool isRegionSelected(int index) {
    if (index == 0) return false; // "X" button
    return state.selectedRegion == AppConstants.regions[index - 1];
  }

  // Helper method to check if property matches selected region
  bool _checkRegionMatch(PropertyModel property, String selectedRegion) {
    // TODO: Add proper region field to PropertyModel
    // Recommended PropertyModel update:
    // final String? region; // Add this field
    // region: json["region"] ?? "Unknown", // Add this to fromJson

    // Simple region mapping based on property title or description
    // This is a temporary solution until proper region data is available
    final propertyText = '${property.title} ${property.description ?? ''}'
        .toLowerCase();

    if (propertyText.contains(selectedRegion.toLowerCase())) {
      return true;
    }

    // If no specific region match found, you can implement additional logic here
    // For example, default to showing all properties when region filter is active
    // but no specific match is found
    return true; // For now, show all properties when region filter is active
  }

  // Get filter parameters for backend API
  Map<String, dynamic> getFilterParams() {
    Map<String, dynamic> params = {};

    if (state.selectedCategory != null) {
      params['category'] = state.selectedCategory;
    }

    if (state.selectedRegion != null) {
      params['region'] = state.selectedRegion;
    }

    return params;
  }

  // Get filter query string for backend API
  String getFilterQueryString() {
    List<String> queryParams = [];

    if (state.selectedCategory != null) {
      queryParams.add(
        'category=${Uri.encodeComponent(state.selectedCategory!)}',
      );
    }

    if (state.selectedRegion != null) {
      queryParams.add('region=${Uri.encodeComponent(state.selectedRegion!)}');
    }

    return queryParams.isNotEmpty ? '?${queryParams.join('&')}' : '';
  }

  // Reset filters to default state
  void resetFilters() {
    state = const ExploreFilterState();
  }
}

// Provider for the explore filter controller
final exploreFilterProvider =
    StateNotifierProvider<ExploreFilterController, ExploreFilterState>((ref) {
      return ExploreFilterController();
    });

// Legacy providers for backward compatibility (can be removed later)
final exploreCategoriesController = StateProvider<int>((ref) => 0);
final exploreRegionController = StateProvider<int>((ref) => 1);
final exploreFilterController = StateProvider<bool>((ref) => false);
