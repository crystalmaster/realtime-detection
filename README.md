 Ứng dụng real-time detection
#### Sử ngôn ngữ lập trình dart
#### Framework: Flutter
#### Sử dụng tensorflow lite: convert từ model yolov3-tiny và ssd_mobilenet sang tflite

Để chạy chương trình
Download full source code tại: https://github.com/crystalmaster/realtime-detection.git

Hoặc sử dụng command line: 
git clone https://github.com/crystalmaster/realtime-detection.git

Để run ứng dụng cần phải 
cài đặt Flutter framework: https://flutter.dev/docs/get-started/install
Cài đặt bộ thư viện sdk android: https://developer.android.com/studio/index.html

Sử dụng command line để kiểm tra cài đặt thành công hay chưa: 
flutter doctor 
![](https://scontent.fsgn5-4.fna.fbcdn.net/v/t1.15752-9/64444025_2060689050900967_709087800510644224_n.png?_nc_cat=104&_nc_oc=AQn739_WJGI9T4f-ycvcjom0BjV-9HcYXOs0tTidhVK_xUoD9T4tZXcxTsbF0v7J4XFXCXQDyB66o8RgjLhW7vf1&_nc_ht=scontent.fsgn5-4.fna&oh=cdf3959d4c87e376a04a8a222c1b71e9&oe=5D890631)

Run command line để chạy source code

cd realtime-detection

flutter run

Chọn font camera hoặc main camera

![](https://scontent.fsgn5-4.fna.fbcdn.net/v/t1.15752-9/64653309_2259036041025947_7162581418961272832_n.png?_nc_cat=102&_nc_oc=AQk2n1ITxxQ7yxGsBMBNhJ1YWROUg_La-A9ySr0rhC5A0RpSDZGvxaBg56H92Sik4oySNpMXBHp94nNX7zBZUJfk&_nc_ht=scontent.fsgn5-4.fna&oh=27cf95195e3219d58939a4707180ddee&oe=5DC5D74A)

![](https://scontent.fsgn5-7.fna.fbcdn.net/v/t1.15752-9/64781952_2399791420100390_5277437641871065088_n.png?_nc_cat=103&_nc_oc=AQnHMmoq6GChB-AnUAaWBRR1KqrKo_p2RI7oqgWHqWtG6bNTATQKmEHROmlYK16lo1sp8qcwSfUUbS8oHeFnEmWc&_nc_ht=scontent.fsgn5-7.fna&oh=d173b5fb6ded8da2899352471b0b913c&oe=5D7F9BFA)

Click Button Start để mở camera

![](https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.15752-9/64686928_2281425552108811_5675648652865961984_n.png?_nc_cat=107&_nc_oc=AQlAq3XZuy3LxezsDFv1UK3N89r0eILDjydqxx7rkZMU9DEtqWxorwONGfHH-7EeCkwnYdT2JMq5VezLd-WvJk26&_nc_ht=scontent.fsgn5-2.fna&oh=28c425308bbe184cab04c31f5f9bf09d&oe=5D7D9B43)

![](https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.15752-9/64668736_1186309934882378_2671658005312831488_n.png?_nc_cat=105&_nc_oc=AQljaqk509kEufMW5sJtyl5SUKp4F4RtYpEM5LEwicb1hXXIytEPfvZfuZigrZDB6-B0xaJF1UEmoyEIgLxHu7Jz&_nc_ht=scontent.fsgn5-2.fna&oh=a2187de31e50cfdc8680ec63efd2466b&oe=5D805335)

![](https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.15752-9/64874444_451480979018851_5776013092156604416_n.png?_nc_cat=111&_nc_oc=AQl_OeTakQSgz44JhUZo1QplBSbgLdUfeAqHMKmUqVFOrh18ckPsi9aJVdgruOfooz8J9aY4J2oFZIlYqEHMqdtg&_nc_ht=scontent.fsgn5-5.fna&oh=9b32945dac8c16a31df8736bd2cc55ca&oe=5D814539)
Hướng dẫn sử dụng và train yolo model với custom dataset
1.	Cài đặt Darknet(YOLO)

Sử dụng git comman line:
git clone https://github.com/AlexeyAB/darknet.git

Hoặc download trực tiếp từ : https://github.com/AlexeyAB/darknet.git

2.	Download the pre-trained weight file: https://pjreddie.com/media/files/yolo.weights
        Hoặc dùng command line: wget https://pjreddie.com/media/files/yolo.weights

File yolo.weight lưu ở folder darknet
Run command line tại folder darknet
3. Để test (run detector)
Sử dụng command line: ./darknet detect cfg/yolov2.cfg yolo.weights data/dog.jpg
Tại folder darknet file predictions.jpg sẽ được tạo


4. Train custom data với YOLO

Data annotation (Gán nhãn label cho tập data set customer)
MACOS 
Sử dụng tool để gán nhãn cho nhanh

git clone https://github.com/ManivannanMurugavel/YOLO-Annotation-Tool

Hoặc download trực tiếp: https://github.com/ManivannanMurugavel/YOLO-Annotation-Tool


Run tool để thử hiện gán nhãn

Dataset lưu ở ./Images/001

Image Dir: input 001 -> bấm load -> tiến hành annotation -> bấm next

Sau khi annotation xong -> tiến hành gán nhãn 
Kết quả tại folder ./Labels/001

Tạo file test.txt và train.txt

Chứa link dẫn đến foder chứa dataset (dataset sẽ gôm hình và file label)

File train.txt và test.txt lưu ở folder darknet

Tại folder darknet/cfg

Tạo 2 file và obj.data và obj.names

Training cho new dataset:
Download Pretrained Convolutional Weights:
Để training chúng ta sử dung convolutional weights that tập pre-trained trên Imagenet.
Chúng ta có thể sử dụng weights từ the darknet53 model. 
Download file weights cho convolutional layers: https://pjreddie.com/media/files/darknet53.conv.74

File darknet19_448.conv.23 lưu ở folder darknet

Run command line
./darknet detector train cfg/obj.data cfg/yolo-obj.cfg darknet19_448.conv.23

Sau khi train xong chúng ta sẽ có được 
File *.weights đây là file trained-model

Dùng model mới train được để test
Run command line 
./darknet detect cfg/yolov2.cfg ‘filename-model-moi’.weights link_imag_test

Window

2.1.1 Download tool gán nhãn nhữ liệu tại:
https://github.com/AlexeyAB/Yolo_mark
	2.1.2 Tạo file obj.names với nội dung là label của dữ liêu, mỗi label nằm trên 1 dòng và đặt trong thư mục data
 
	2.1.3 Tạo file obj.data đặt trong thư mục data:
		 
	2.1.4 Tạo tập các ảnh train vào thư mục data/img
		 
	2.1.5 Run tool yolo mark
 ![](https://scontent.fsgn5-1.fna.fbcdn.net/v/t1.15752-9/65211909_2230935027123835_6431833879333568512_n.png?_nc_cat=101&_nc_oc=AQm2iiyt4aaL-4GsoI3RDpIVNJ2xWIhDK-h6uQbcINmMt-FAtuc0PltYystAFq8bBgyOrEnQW0xhE-Rsnp5ltX7h&_nc_ht=scontent.fsgn5-1.fna&oh=943940ca0cafb3f0d6e96ba4bd61895b&oe=5D7BF25F)
 
2.2 Xây dựng custom object detection model

	Đây là các bước train cho máy sử dụng GPU Nvidia (GTX950M), nếu máy không có GPU hoặc hoặc sử dụng GPU khác thì xem thêm tại[1]	
Các bước  chuẩn bị để train custom model sử dụng darknet
Phần 1: compile darknet
	Dowload hoặc clone darknet:     https://github.com/AlexeyAB/darknet/tree/master/build/darknet
a.Cấu hình môi trường như sau:
•	CMake >= 3.8 for modern CUDA support: https://cmake.org/download/
•	CUDA 10.0: https://developer.nvidia.com/cuda-toolkit-archive 
•	OpenCV >= 2.4: OpenCV official site
•	cuDNN >= 7.0 for CUDA 10.0 https://developer.nvidia.com/rdp/cudnn-archive on Windows copy cudnn.h,cudnn64_7.dll, cudnn64_7.lib as desribed here https://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html#installwindows )
•	GPU with CC >= 3.0: https://en.wikipedia.org/wiki/CUDA#GPUs_supported
•	on Linux GCC or Clang, on Windows MSVC 2015/2017/2019 https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community 
b. Compile darknet
b1. Cài đặt biến môi trường CUDA, cuCNN như hình sau:
 
b2.Copy 2 file opencv_world410.dll và opencv_ffmpeg410_64.dll vào thư mục darknet.
b3. Mở project darknet.sln bằng vs 2017, thiết đặt X64 và  Build với Release mode.
b4. Chọn build → build darknet
Phần 2: Tạo file cfg và tiến hành train
b1. Download pre-trained weights for the convolutional layers :
và đặt tại thư mục darknet/x64
b2. Tạo file yolov3-tiny-obj.cfg giống với file yolov3-tiny.cfg và thay đổi một số line:
•	batch=64
•	subdivisions=8
•	max_batches=6000 max_batches = số class*2000
•	steps = 80%  90% của max_batches, ví dụ max_batches = 6000 thì  steps=4800,5400
•	classes=80 đổi thành classes = số lớp cần detect.
•	[filters=255] đổi thành filters=(classes + 5)x3 
b3. Train model bằng lệnh: darknet.exe detector train data/obj.data yolov3-tiny-obj.cfg yolov3-tiny.conv.15
Model đã sẽ được lưu thành yolov3-tiny-obj_last.weights sau mỗi 100 interations và yolov3-tiny-obj_xxxx.weights sau mỗi 1000 interations.
Sau khi train xong, model sẽ được lưu ở đường dẫn darknet\x64\backup\
Có thể tạm ngưng train sau 100 interations và tiếp tục train lại bằng câu lệnh sau: darknet.exe detector train data/obj.data yolov3-tiny-obj.cfg backup/yolov3-tiny-obj_last.weight
2.3 Convert yolo modal thành tensorflow lite model (.weights to .lite) (thực hiện trên mac OS) 
	Tensorflow chỉ hỗ trợ convert model .pb (tensorflow model) sang .lite, vì vậy trước tiên phải convert .weight model sang .pb model bằng darkflow 
2.3.1 Clone darkflow và cài đặt: https://github.com/thtrieu/darkflow
	Và cài đặt như sau:
	cd darkflow
sed -i -e 's/self.offset = 16/self.offset = 20/g' darkflow/utils/loader.py

python3 setup.py build_ext --inplace
pip install .
	2.3.2 Sao chép 3 file yolov3-tiny-obj_last.weights, yolov3-tiny-obj.cfg,  vào thư mục darkflow. Mở terminal và chạy lệnh:
	flow --model yolov3-tiny-obj.cfg --load yolov3-tiny-obj_last.weights --savepb
	Sau khi complete, ta sẽ có được model yolov3-tiny-obj_last.pb và file model yolov3-tiny-obj_last.meta ở thư mục build_graph
2.3.3 Convert yolov3-tiny-obj_last.pb sang yolov3-tiny-obj_last.lite bằng lệnh:
tflite_convert \
  --graph_def_file=built_graph/yolov2-tiny.pb \
  --output_file=built_graph/yolov2_graph.lite \
  --input_format=TENSORFLOW_GRAPHDEF \
  --output_format=TFLITE \
  --input_shape=1,416,416,3 \
  --input_array=input \
  --output_array=output \
  --inference_type=FLOAT \
  --input_data_type=FLOAT
Sau khi complete, ta sẽ có được model yolov3-tiny-obj_last.lite, 
