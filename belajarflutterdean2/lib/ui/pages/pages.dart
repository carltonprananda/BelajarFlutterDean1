import 'dart:io';

import 'package:belajarflutterdean2/bloc/bloc.dart';
import 'package:belajarflutterdean2/services/services.dart';
import 'package:belajarflutterdean2/models/models.dart';
import 'package:belajarflutterdean2/ui/widgets/productcard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


part 'main_page.dart';
part 'add_page.dart';
part 'account_page.dart';
part 'home_page.dart';
part 'data_page.dart';
part 'signin_page.dart';
part 'signup_page.dart';
part 'mainmenu.dart';