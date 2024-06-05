# Pokemon-Card-App

> ...

# Nguồn tham khảo:

> [Flutter Clean Architecture - Full Course](https://www.youtube.com/watch?v=SmJB8cy8emU).

## Các vấn đề:

> Thời điểm clone project này (28/05/24), chưa thể run app được!
>
> ---
>
> <u>Bước 0</u>: đã được chạy tự động trước đó lệnh [flutter pub get].
>
> <u>Bước 1</u>: chạy lệnh [flutter pub outdated].
>
> <pre>
> Showing outdated packages.
> [*] indicates versions that are not the latest available.
>
> Package Name        Current  Upgradable  Resolvable  Latest   
>
> direct dependencies:
> cupertino_icons     *1.0.5   1.0.8       1.0.8       1.0.8    
> dio                 *5.3.2   5.4.3+1     5.4.3+1     5.4.3+1  
> path_provider       *2.1.0   2.1.3       2.1.3       2.1.3    
> provider            *6.0.5   6.1.2       6.1.2       6.1.2    
> shared_preferences  *2.2.0   2.2.3       2.2.3       2.2.3    
>
> dev_dependencies:  
> flutter_lints       *2.0.2   *2.0.3      4.0.0       4.0.0
>
> 6 upgradable dependencies are locked (in pubspec.lock) to older versions.
> To update these dependencies, use `flutter pub upgrade`.
>
> 1 dependency is constrained to a version that is older than a resolvable version.
> To update it, edit pubspec.yaml, or run `flutter pub upgrade --major-versions`.
> </pre>
>
> <u>Bước 2</u>: chạy lệnh [flutter pub upgrade].
>
> <u>Bước 3</u>: chạy lệnh [flutter pub upgrade --major-versions].
>
> <u>Bước 4</u>: chạy lại lệnh [flutter pub outdated] để kiểm tra.
>
> <pre>
> Showing outdated packages.
> [*] indicates versions that are not the latest available.
>
> Package Name  Current  Upgradable  Resolvable  Latest  
>
> direct dependencies: all up-to-date.
>
> dev_dependencies: all up-to-date.
> all dependencies are up-to-date.
> </pre>
>
> <u>Bước 5</u>: Sửa các gợi ý trong [Problems] của VSCode.
>
> ---
>
> Thử run app lại nữa!
>
> <u>Gặp lỗi</u>: `CocoaPods`!
>
> <pre>
> CocoaPods' output:
> ↳
>       Preparing
>
>     Analyzing dependencies
>
>     Inspecting targets to integrate
>       Using `ARCHS` setting to build architectures of target `Pods-Runner`: (``)
>     [!] Unable to find a target named `RunnerTests` in project `Runner.xcodeproj`, did find `Runner`.
>
>     ...
>
> Error output from CocoaPods:
> ↳
>
>     [!] Automatically assigning platform `iOS` with version `12.0` on target `Runner` because no platform was specified. Please specify a platform for this target in your Podfile. See `https:>guides.cocoapods.org/syntax/podfile.html#platform`.
>
> Error running pod install
> Error launching application on iPhone 15 Pro.
> </pre>
>
> - Kiểm tra máy đã cài `CocoaPods` framework chưa?
>   - [How to check version of a CocoaPods framework](https://stackoverflow.com/questions/18931091/how-to-check-version-of-a-cocoapods-framework).
>   - Chạy lệnh [pod --version].
>
> - Nếu đã cài rồi, kiểm tra đã thêm `CocoaPods` vào dự án hay chưa?
>   - [Cannot Install Cocoapods - No podfile found in the project directory](https://stackoverflow.com/questions/36902497/cannot-install-cocoapods-no-podfile-found-in-the-project-directory).
>   - [error running pod install error launching application on iphone11 Pro Max](https://stackoverflow.com/questions/59418820/error-running-pod-install-error-launching-application-on-iphone11-pro-max).
>
> - Nếu đã thêm vào rồi, thử run app lại nữa! Mà vẫn gặp lỗi trên?
>   - [Unable to find a target named `Runner` in project `Runner.xcodeproj` did find `dev` and `prod`](https://stackoverflow.com/questions/67405994/unable-to-find-a-target-named-runner-in-project-runner-xcodeproj-did-find-d).
>   - Mở file `Podfile` trong thư mục `ios` và bật comment để vô hiệu những dòng này:
>
> <pre>
> # target 'RunnerTests' do
> #   inherit! :search_paths
> # end
> </pre>
>
> - Thử run app lại nữa! Tuy `XCode` đã build thành công, nhưng build `iOS app` thất bại.
> - Với thông báo yêu cầu dùng Platform `iOS 17.5` thay cho `iOS 17.4` hiện tại của `XCode`. App đã run thành công!