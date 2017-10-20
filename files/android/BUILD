android_library(
  name = "activities",
  srcs = glob(["src/main/java/com/activities/*.java"]),
  custom_package = "com.google.bazel.example.android.activities",
  manifest = "src/main/java/com/activities/AndroidManifest.xml",
  resource_files = glob(["src/main/java/com/activities/res/**"]),
)
android_binary(
    name = "android",
    custom_package = "com.google.bazel.example.android",
    manifest = "src/main/java/com/AndroidManifest.xml",
    resource_files = glob(["src/main/java/com/res/**"]),
    deps = [":activities"],
)
