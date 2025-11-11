import 'package:firebase_messaging/firebase_messaging.dart';
import 'services/notification_service.dart';

// This method is called when the app is in the background or terminated
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await NotificationService.handleBackgroundMessage(message);
}
