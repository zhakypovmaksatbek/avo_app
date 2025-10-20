import 'dart:io';

import 'package:avo/presentation/widgets/image/cashed_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePhotoWidget extends StatefulWidget {
  const EditProfilePhotoWidget({
    super.key,
    required this.onChanged,
    this.imageUrl,
    this.username,
  });

  final ValueChanged<bool?> onChanged;
  final String? imageUrl;
  final String? username;

  @override
  State<EditProfilePhotoWidget> createState() => _EditProfilePhotoWidgetState();
}

class _EditProfilePhotoWidgetState extends State<EditProfilePhotoWidget> {
  File? _selectedPhoto;

  Future<void> _pickImage(BuildContext context) async {
    // final status = await PermissionSettings.checkPermission(Permission.photos);

    // if (!context.mounted) return;

    // if (status.isDenied) {
    //   return;
    // } else if (status.isPermanentlyDenied) {
    //   // AppWarningDialog.showSettingsDialog(
    //   //   context,
    //   //   permissionDescription: LocaleKeys
    //   //       .warning_permission_gallery_required_description
    //   //       .tr(),
    //   // );
    //   return;
    // }

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      _selectedPhoto = File(image.path);
      setState(() {});
    }
  }

  Widget _buildAvatarImage(ThemeData theme, bool isLoading) {
    // Loading durumu
    if (isLoading) {
      return const CircularProgressIndicator();
    }

    // Seçilmiş local fotoğraf varsa ve upload başarısızsa
    if (_selectedPhoto != null) {
      return Image.file(
        _selectedPhoto!,
        width: 120,
        height: 120,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          debugPrint('Local image error: $error');
          return _buildPlaceholder(theme);
        },
      );
    }

    // Network URL varsa
    if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty) {
      return CashedImages(
        imageUrl: widget.imageUrl!,
        // errorWidget: _buildPlaceholder(theme),
        fit: BoxFit.cover,
      );
    }

    // Hiçbiri yoksa placeholder
    return _buildPlaceholder(theme);
  }

  Widget _buildPlaceholder(ThemeData theme) {
    final firstLetter = (widget.username?.isNotEmpty ?? false)
        ? widget.username![0].toUpperCase()
        : "";

    return Center(
      child: Text(
        firstLetter,
        style: theme.textTheme.titleLarge?.copyWith(
          fontSize: 54,
          fontWeight: FontWeight.w900,
          color: theme.textTheme.bodySmall?.color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 110,
      height: 110,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomRight,
        children: [
          ClipOval(
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: _buildAvatarImage(theme, false),
            ),
          ),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.surface,
              foregroundColor: theme.colorScheme.onSurface,
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
            ),
            onPressed: () => _pickImage(context),
            icon: const Icon(CupertinoIcons.pencil),
          ),
        ],
      ),
    );
  }
}
