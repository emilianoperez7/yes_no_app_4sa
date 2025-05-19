import 'package:yes_no_app_4sa/domain/entities/message.dart';

class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Message toMessageEntity() => Message(
        text: answer == 'yes'
            ? 'Sí'
            : answer == 'no'
                ? 'No'
                : 'No sé',
        fromWho: FromWho.hers,
        imageUrl: image,
      );
}
