import 'package:smart_urban_planner/data/models/report.dart';

final reports = [
  Report(
    id: "1",
    title: "Jalan Rusak",
    description: "Jalan rusak di depan kampus",
    images: [
      "https://tribratanews.jateng.polri.go.id/wp-content/uploads/2023/02/WhatsApp-Image-2023-02-24-at-10.40.45.jpeg"
    ],
    createdAt: DateTime.now(),
    location: "Jalan Raya ITS",
    popularity: 10,
    latitude: -7.2758471,
    longitude: 112.7937557,
  ),
  Report(
    id: "2",
    title: "Pohon Tumbang",
    description: "Pohon tumbang di depan kampus ITS, menyebabkan kemacetan",
    images: ["https://mmc.kalteng.go.id/files/berita/26012023034727_0.jpeg"],
    createdAt: DateTime.now(),
    location: "Jalan Raya ITS",
    popularity: 5,
    latitude: -7.2804494,
    longitude: 112.7947228,
  ),
];
