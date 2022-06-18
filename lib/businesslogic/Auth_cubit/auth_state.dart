part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthCheckGoogleSignIn extends AuthState {}

class AuthGoogleSignSuccess extends AuthState {}

class AuthGoogleSignInError extends AuthState {}

class AuthGoogleSignOut extends AuthState {}

class AuthFacebookSignInSuccess extends AuthState {}

class AuthCheckFacebookSignIn extends AuthState {}

class AuthFacebookSignInError extends AuthState {}

class AuthFacebookSignInOut extends AuthState {}
