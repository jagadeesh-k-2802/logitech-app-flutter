import 'package:flutter/foundation.dart';

// API URL
const _debugUrl = "https://j5m72h62-3000.inc1.devtunnels.ms";
const _prodUrl = "http://10.0.2.2:3000";
const apiUrl = kReleaseMode ? _prodUrl : _debugUrl;

/// [tokenKey] for secure local storage of JWT Token
const tokenKey = "TOKEN_KEY";

/// [customerSupportNumber] Support number shown in the application
const customerSupportNumber = "+912345678790";

/// [skipPayments] Skip payments flag
const skipPayments = !kReleaseMode;

/// [fakePayments] Pay only 1 rupee
const fakePayments = true;
