# kpop_on_youtube

A new Flutter project.

## Android http networking

```
<manifest xmlns:android...>
 ...
 <uses-permission android:name="android.permission.INTERNET" />
 <application ...
</manifest>
```

## ios http networking
```
<key>com.apple.security.network.client</key>
<true/>
```

## APK
```
flutter build apk --release --target-platform=android-arm64
```

## firebase / firestore / getx