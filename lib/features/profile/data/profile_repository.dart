// lib/features/profile/data/profile_repository.dart

class UserProfileData {
  String name;
  String phone;
  String area;
  String ward;
  String? avatarPath; // local file path

  UserProfileData({
    required this.name,
    required this.phone,
    required this.area,
    required this.ward,
    this.avatarPath,
  });

  UserProfileData copyWith({
    String? name,
    String? phone,
    String? area,
    String? ward,
    String? avatarPath,
  }) {
    return UserProfileData(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      area: area ?? this.area,
      ward: ward ?? this.ward,
      avatarPath: avatarPath ?? this.avatarPath,
    );
  }
}

/// Simple in-memory profile store (no backend yet).
class ProfileRepository {
  ProfileRepository._internal();

  static final ProfileRepository instance = ProfileRepository._internal();

  UserProfileData _profile = UserProfileData(
    name: 'Demo User',
    phone: '01XXXXXXXXX',
    area: 'Mohammadpur',
    ward: 'Ward 17',
  );

  UserProfileData get profile => _profile;

  void updateProfile(UserProfileData updated) {
    _profile = updated;
  }
}
