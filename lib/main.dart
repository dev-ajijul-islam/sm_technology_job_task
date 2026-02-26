import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sm_technology_job_task/app/job_task.dart';
import 'package:sm_technology_job_task/data/models/product_model.dart';
import 'package:sm_technology_job_task/data/services/auth_services.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  final Directory dir = await getApplicationDocumentsDirectory();

  Hive.init(dir.path);

  await Hive.openBox<ProductModel>("productsBox");
  await AuthProvider().init();
  runApp(JobTask());
}