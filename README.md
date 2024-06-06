# Pokemon-Card-App

> Các tính năng:
> - `[skeleton]` - quản lý các trang và nội dung hiển thị của chúng.
> - `[pokemon]` - lấy data **(Pokemon)** dạng Json từ `API` trang https://pokeapi.co/.

# Nguồn tham khảo:

> [Flutter Clean Architecture - Full Course](https://www.youtube.com/watch?v=SmJB8cy8emU).
>
> Dự án sử dụng kiến trúc `"Clean Architecture"` theo cách tiếp cận *"tính năng"* trước *"lớp"*.
>
> Tức cấu trúc thư mục được phân cấp theo:
>
> <pre>
> lib
> |
> |_ core
> |
> |_ features
> |  |
> |  |_ feature_1
> |  |  |
> |  |  |_ presentation
> |  |  |_ business
> |  |  |_ data
> |  |
> |  |_ ...
> |
> |_ main.dart
> </pre>
>
> ---
>
> Sơ đồ kiến trúc: chi tiết về *"tính năng pokemon"* (thư mục `[features] -> [pokemon]`).
>
> <img src=".\assets\images\My Clean Architecture (1).jpg" width="100%">
>
> Sơ đồ kiến trúc: theo góc nhìn 3 lớp `[presentation] - [business] - [data]` trong thư mục tính năng `[pokemon]`
>
> <img src=".\assets\images\My Clean Architecture (2).jpg" width="100%">
>
> Sơ đồ kiến trúc: dạng tổng quát.
>
> <img src=".\assets\images\My Clean Architecture (3).jpg" width="100%">

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

## Các vấn đề:

> Thư mục gốc của dự án Flutter có tên `[Pokemon-Card-App]` gọi tắt là thư mục `[A]`.
> - Có kho Git quản lý với URL: https://github.com/TrungKuro/Pokemon-Card-App.git
>
> Trong thư mục `[Pokemon-Card-App]` có thư mục con tên `[flutter_mapp_clean_architecture]` gọi tắt là thư mục `[B]`.
> - Cũng có kho Git quản lý với URL: https://github.com/fluttermapp/flutter_mapp_clean_architecture.git
>
> ---
>
> Thư mục `[B]` có được khi trong thư mục `[A]` thực hiện lệnh [git clone].
>
> <u>Nhu cầu</u>: làm cách nào để hợp nhất 2 kho Git này thành 1. Tức hợp nhất kho Git của thư mục `[B]` vào cho thư mục `[A]`.
>
> ---
>
> <u>Bước 1</u>: Thêm thư mục `[B]` như một <u>remote repository</u> trong thư mục `[A]`.
>
> 1. Chuyển đến thư mục A:
>
>         cd /path/to/A
>
> 2. Thêm thư mục B như một remote repository và đặt tên là `B_remote`:
>
>         git remote add B_remote ./B
>
> <u>Bước 2</u>: Fetch (tải về) các thay đổi từ thư mục `[B]`.
>
> 3. Fetch các thay đổi từ `B_remote`:
>
>         git fetch B_remote
>
> <u>Bước 3</u>: Tạo một nhánh mới để hợp nhất các thay đổi từ thư mục `[B]`.
>
> 4. Tạo nhánh mới trong kho Git của `[A]` đặt tên là `merge-B` và chuyển sang nhánh mới này để thực hiện việc hợp nhất:
>
>         git checkout -b merge-B
>
> <u>Bước 4</u>: Hợp nhất các thay đổi từ nhánh chính của thư mục `[B]` vào nhánh mới của thư mục `[A]`.
>
> 5. Hợp nhất nhánh chính (`main` hoặc `master`) của `B_remote` vào nhánh `merge-B` trong `[A]`:
>
>         git merge B_remote/main --allow-unrelated-histories
>
> <u>Lưu ý</u>:
> - Sử dụng `--allow-unrelated-histories` vì 2 kho có lịch sử commit khác nhau.
> - Dùng lệnh `git branch` để xem tên các nhánh hiện có của kho Git.
>
> <u>Bước 5</u>: Giải quyết xung đột nếu có và commit các thay đổi.
>
> 6. Giải quyết các xung đột nếu có:
>     - Nếu có xung đột, Git sẽ thông báo và bạn cần phải chỉnh sửa các file bị xung đột.
>     - Sau khi giải quyết xong các xung đột, thêm các file đã chỉnh sửa.
>     - <pre>git add .</pre>
>     - Commit các thay đổi:
>     - <pre>git commit -m "Merged B into A"</pre>
>
> <u>Bước 6</u>: Merge nhánh `merge-B` vào nhánh chính của thư mục `[A]`.
>
> 7. Chuyển về nhánh chính (`main` hoặc `master`) của thư mục `[A]`:
>
>         git checkout main
>
> 8. Merge nhánh `merge-B` vào nhánh chính của thư mục `[A]`:
>
>         git merge merge-B
>
> <u>Bước 7</u>: Dọn dẹp (tùy chọn).
>
> 9. Xóa <u>remote repository</u> `B_remote` nếu không còn cần thiết:
>
>         git remote remove B_remote
>
> 10. Xóa nhánh `merge-B` nếu không còn cần thiết:
>
>         git branch -d merge-B
