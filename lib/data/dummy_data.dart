import 'package:smart_urban_planner/data/models/report.dart';

final reports = [
  Report(
    id: "1",
    title: "Jalan Rusak di Depan Kampus Pens",
    description:
        "Lorem ipsum dolor sit amet consectetur adipiscing elit posuere aliquam hendrerit fringilla eu, litora interdum egestas congue montes non lacus porta semper scelerisque quisque. Eget justo montes ornare nascetur malesuada hac aliquam, cubilia euismod mattis dis senectus. Eu cursus integer hendrerit placerat litora posuere rhoncus, nam volutpat ridiculus odio sed sociis, netus platea penatibus fusce faucibus hac.",
    images: [
      "https://tribratanews.jateng.polri.go.id/wp-content/uploads/2023/02/WhatsApp-Image-2023-02-24-at-10.40.45.jpeg"
    ],
    createdAt: DateTime.now(),
    location: "Jalan Raya ITS",
    popularity: 256,
    latitude: -7.2758471,
    longitude: 112.7937557,
  ),
  Report(
    id: "2",
    title: "Pohon Tumbang di Jalan Raya ITS",
    description:
        "Lorem ipsum dolor sit amet consectetur adipiscing elit odio senectus mauris iaculis, justo aliquet tristique habitasse augue risus cubilia mattis habitant. Lectus fusce malesuada penatibus porta orci convallis faucibus egestas, cursus dignissim viverra netus elementum tempor tempus risus nec, lacinia mollis tincidunt interdum quam imperdiet inceptos. Netus montes sodales donec praesent rutrum diam pharetra pretium sociis tempus, odio eleifend pellentesque vitae velit ad a suspendisse placerat, lobortis habitant torquent hendrerit primis libero porttitor est eros.",
    images: ["https://mmc.kalteng.go.id/files/berita/26012023034727_0.jpeg"],
    createdAt: DateTime.now(),
    location: "Jalan Raya ITS",
    popularity: 128,
    latitude: -7.2804494,
    longitude: 112.7947228,
  ),
];
