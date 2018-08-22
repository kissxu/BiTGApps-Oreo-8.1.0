#!/sbin/sh
# 
# /system/addon.d/90bit_gapps.sh
# Treble and Non-Treble addon.d shell file
#
. /tmp/backuptool.functions

list_files() {
cat <<EOF
app/FaceLock/FaceLock.apk
app/FaceLock/lib/arm64/libfacenet.so
app/GoogleContactsSyncAdapter/GoogleContactsSyncAdapter.apk
app/GoogleExtShared/GoogleExtShared.apk
priv-app/GmsCoreSetupPrebuilt/GmsCoreSetupPrebuilt.apk
priv-app/GoogleBackupTransport/GoogleBackupTransport.apk
priv-app/GoogleExtServices/GoogleExtServices.apk
priv-app/GoogleServicesFramework/GoogleServicesFramework.apk
priv-app/Phonesky/Phonesky.apk
priv-app/PrebuiltGmsCore/PrebuiltGmsCore.apk
etc/permissions/com.google.android.dialer.support.xml
etc/permissions/com.google.android.maps.xml
etc/permissions/com.google.android.media.effects.xml
etc/permissions/com.google.widevine.software.xml
etc/sysconfig/dialer_experience.xml
etc/sysconfig/google_build.xml
etc/sysconfig/whitelist_com.android.omadm.service.xml
etc/g.prop
framework/com.google.android.dialer.support.jar
framework/com.google.android.maps.jar
framework/com.google.android.media.effects.jar
framework/com.google.widevine.software.drm.jar
lib/libfilterpack_facedetect.so
lib/libfrsdk.so
lib64/libfacenet.so
lib64/libfilterpack_facedetect.so
lib64/libfrsdk.so
xbin/busybox
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
    chmod 0755 /system/xbin/busybox
    chmod 0755 /system/app/FaceLock
    chmod 0755 /system/app/FaceLock/lib
    chmod 0755 /system/app/FaceLock/lib/arm64
    chmod 0644 /system/app/FaceLock/FaceLock.apk
    chmod 0644 /system/app/FaceLock/lib/arm64/libfacenet.so
    chmod 0755 /system/app/GoogleContactsSyncAdapter
    chmod 0644 /system/app/GoogleContactsSyncAdapter/GoogleContactsSyncAdapter.apk
    chmod 0755 /system/app/GoogleExtShared
    chmod 0644 /system/app/GoogleExtShared/GoogleExtShared.apk
    chmod 0644 /system/etc/permissions/com.google.android.dialer.support.xml
    chmod 0644 /system/etc/permissions/com.google.android.maps.xml
    chmod 0644 /system/etc/permissions/com.google.android.media.effects.xml
    chmod 0644 /system/etc/permissions/com.google.widevine.software.xml
    chmod 0644 /system/etc/sysconfig/dialer_experience.xml
    chmod 0644 /system/etc/sysconfig/google_build.xml
    chmod 0644 /system/etc/sysconfig/whitelist_com.android.omadm.service.xml
    chmod 0644 /system/etc/g.prop
    chmod 0644 /system/framework/com.google.android.dialer.support.jar
    chmod 0644 /system/framework/com.google.android.maps.jar
    chmod 0644 /system/framework/com.google.android.media.effects.jar
    chmod 0644 /system/framework/com.google.widevine.software.drm.jar
    chmod 0644 /system/lib/libfilterpack_facedetect.so
    chmod 0644 /system/lib/libfrsdk.so
    chmod 0644 /system/lib64/libfacenet.so
    chmod 0644 /system/lib64/libfilterpack_facedetect.so
    chmod 0644 /system/lib64/libfrsdk.so
    chmod 0755 /system/priv-app/GmsCoreSetupPrebuilt
    chmod 0644 /system/priv-app/GmsCoreSetupPrebuilt/GmsCoreSetupPrebuilt.apk
    chmod 0755 /system/priv-app/GoogleBackupTransport
    chmod 0644 /system/priv-app/GoogleBackupTransport/GoogleBackupTransport.apk
    chmod 0755 /system/priv-app/GoogleExtServices
    chmod 0644 /system/priv-app/GoogleExtServices/GoogleExtServices.apk
    chmod 0755 /system/priv-app/GoogleServicesFramework
    chmod 0644 /system/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk
    chmod 0755 /system/priv-app/Phonesky
    chmod 0644 /system/priv-app/Phonesky/Phonesky.apk
    chmod 0755 /system/priv-app/PrebuiltGmsCore
    chmod 0644 /system/priv-app/PrebuiltGmsCore/PrebuiltGmsCore.apk
    chmod 0755 /system/addon.d/90bit_gapps.sh
  ;;
esac
