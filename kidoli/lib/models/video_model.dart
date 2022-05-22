class videoModel{
  String? fileName;
  String? downloadUrl;


  videoModel({this.fileName,this.downloadUrl });
  factory videoModel.fromMap(map){
    return videoModel(
      fileName: map['fileName'],
      downloadUrl: map['downloadUrl'],


    );
  }
  Map<String,dynamic> toMap(){
    return{

      'fileName':fileName,
      'downloadUrl':downloadUrl,
    };
  }
}