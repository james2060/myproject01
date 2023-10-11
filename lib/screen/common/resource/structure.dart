import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'fire_assets.dart';
import 'package:myproject01/screen/authentication/sign_in_screen.dart';
List<Map<String, dynamic>> menu = [
  {
    'name': 'Authentication',
    'icon': FireAssets.fireAuthentication,
    'screens': [
      {
        'name': 'Email Sign In',
        'icon': const Icon(
          Icons.email_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': const SignInScreen(),
      },
    ]
  },
  {
    'name': 'Database',
    'icon': FireAssets.fireDatabase,
    'screens': [
      {
        'name': 'CRUD operations',
        'icon': const Icon(
          Icons.task_alt,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'Storage',
        'icon': const Icon(
          Icons.storage_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'Realtime Database',
        'icon': const Icon(
          Icons.timeline_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
    ]
  },
  {
    'name': 'Backend Actions',
    'icon': FireAssets.fireBackend,
    'screens': [
      {
        'name': 'Cloud Functions',
        'icon': const Icon(
          Icons.image,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },

    ]
  },
  {
    'name': 'Machine Learning',
    'icon': FireAssets.fireMachineLearning,
    'screens': [
      {
        'name': 'Text recognition',
        'icon': const Icon(
          Icons.text_fields_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'Face detection',
        'icon': const Icon(
          Icons.face_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'Image recognition',
        'icon': const Icon(
          Icons.image,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
    ]
  },
  {
    'name': 'Other utilities',
    'icon': FireAssets.fireOtherUtilities,
    'screens': [
      {
        'name': 'Crashlytics',
        'icon': const Icon(
          Icons.analytics_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      // {
      //   'name': 'Remote Config',
      //   'icon': const FaIcon(
      //     FontAwesomeIcons.gamepad,
      //     color: Palette.firebaseNavy,
      //   ),
      //   'widget': null,
      // },
      {
        'name': 'A/B Testing',
        'icon': const Icon(
          Icons.rule_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
      {
        'name': 'Dynamic Linking',
        'icon': const Icon(
          Icons.link_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': null,
      },
    ]
  },
];
