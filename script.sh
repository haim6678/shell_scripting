



echo "welcome to bash scripting";

#start scrpit
echo "start gm exe";
#go to the emulator directory
cd ~/Android/Sdk/emulator 
#start the emulatur
#./emulator -avd Nexus_5X_API_25 &


#clone the project folder

#go to android folder
cd ~/GM_git_folder/files

#build the project step by step
#start with workspace file
export WORKSPACE=$HOME/GM_git_folder/files
touch $WORKSPACE/WORKSPACE

#write to the file

echo "android_sdk_repository(
    name = \"androidsdk\"
)
" >WORKSPACE 

cd ~/GM_git_folder/files/android

#create build file
touch $WORKSPACE/android/BUILD

#go to the directory
cd $WORKSPACE/android

#write the build commands
#create the library
echo "android_library(
  name = \"activities\",
  srcs = glob([\"src/main/java/com/activities/*.java\"]),
  custom_package = \"com.google.bazel.example.android.activities\",
  manifest = \"src/main/java/com/activities/AndroidManifest.xml\",
  resource_files = glob([\"src/main/java/com/activities/res/**\"]),
)" > BUILD
#create the apk
echo "android_binary(
    name = \"android\",
    custom_package = \"com.google.bazel.example.android\",
    manifest = \"src/main/java/com/AndroidManifest.xml\",
    resource_files = glob([\"src/main/java/com/res/**\"]),
    deps = [\":activities\"],
)" >> BUILD

#go back to workspace
cd $WORKSPACE
#build the program
bazel build //android:android

sleep 5

result=$?

if [ "$result" -eq "0" ];then
  echo "build success";
else
    echo "build failed"
    exit 
fi

printf "\n"

if pgrep -x "emulator" > /dev/null
then
    echo "Running"
else
    echo "Stopped"
fi

bazel mobile-install //android:android

installresult=$?

if [ "$installresult" -eq "0" ];then
  echo "install success";
else
    echo "install failed"
    exit 
fi

echo "the end"
