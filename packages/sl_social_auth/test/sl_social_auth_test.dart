import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sl_social_auth/core/sl_auth_response.dart';
import 'package:sl_social_auth/sl_social_auth.dart';

import 'sl_social_auth_test.mocks.dart';

@GenerateMocks(<Type>[SlSocialAuth])
void main() {
  group('Initialized testcase', () {
    final MockSlSocialAuth slSocialAuth = MockSlSocialAuth();

    test('Should return true if initialized', () async {
      when(slSocialAuth.initializedSocialAuth())
          .thenAnswer((Invocation realInvocation) async => true);

      //arrange
      final bool result = await slSocialAuth.initializedSocialAuth();

      //act
      verify(slSocialAuth.initializedSocialAuth());

      //expect

      expect(result, true);
    });
    test('Should return false if not initialized', () async {
      when(slSocialAuth.initializedSocialAuth())
          .thenAnswer((Invocation realInvocation) async => false);

      //arrange
      final bool result = await slSocialAuth.initializedSocialAuth();

      //act
      verify(slSocialAuth.initializedSocialAuth());

      //expect

      expect(result, false);
    });
  });

  group('Sigin with Google testcase', () {
    final MockSlSocialAuth slSocialAuth = MockSlSocialAuth();

    test('Should return SlAuthResponse with true if initialized', () async {
      when(slSocialAuth.signInWithGoogle()).thenAnswer(
          (Invocation realInvocation) async => SlAuthResponse<UserCredential?>(
              msg: 'true', isAuthenticated: true, authData: null));

      //arrange
      final SlAuthResponse<UserCredential?> result =
          await slSocialAuth.signInWithGoogle();

      //act
      verify(slSocialAuth.signInWithGoogle());

      //expect

      expect(result.isAuthenticated, true);
    });
    test('Should return SlAuthResponse with false if authenticated', () async {
      when(slSocialAuth.signInWithGoogle()).thenAnswer(
          (Invocation realInvocation) async => SlAuthResponse<UserCredential?>(
              msg: 'true', isAuthenticated: false, authData: null));

      //arrange
      final SlAuthResponse<UserCredential?> result =
          await slSocialAuth.signInWithGoogle();

      //act
      verify(slSocialAuth.signInWithGoogle());

      //expect

      expect(result.isAuthenticated, false);
    });
  });
}
