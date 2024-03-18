import 'package:flutter/material.dart';
import 'package:thandri_sannidhi/components/neu_box.dart';
import 'package:thandri_sannidhi/mp3_songs/mp3_song_details.dart';
import 'package:thandri_sannidhi/song_lyrics/showdetails.dart';
import 'package:thandri_sannidhi/song_lyrics/song.dart';

class SongBookScreen extends StatefulWidget {
  const SongBookScreen({super.key});

  @override
  State<SongBookScreen> createState() => _SongBookScreenState();
}

class _SongBookScreenState extends State<SongBookScreen> {
  // List<String> items = [
  //   "అందరి ప్రభువైన దేవా",
  //   "నమ్మదగిన దేవుడా నను",
  //   "చెమ్మగిల్లు కళ్ళలోన కన్నీళ్ళెంత",
  //   "జాలరీ ఓ జాలరీ",
  //   "యేసు నీ కోసం",
  //   "వందనాలే నే చేయనా",
  //   "కలువరి కొండపైనా",
  //   "పాడవే కోయిలా",
  //   "మంచిమనస్సున్న",
  //   "ఎగసిపడే ఆనందం",
  //   "కృపలను తలపోయుచు",
  //   "యేసయ్యా నా యేసయ్యా ",
  //   "యేసూ నీవే నా ఆధారము",
  //   "ఎంచితివా దేవా నను",
  //   "ఇంతకాలము నన్ను కాచెను",
  //   "యేసయ్యా నీ ప్రాణ త్యాగం",
  //   "దీవించు మా తండ్రి",
  //   "ఏ యోగ్యత",
  //   "నీ ఆశ",
  //   "ప్రేమంటే ప్రేమ",
  //   "సిలువలో నీదు కేక",
  //   "విన్నపాలు",
  //   "ఏమివ్వగలనయ్య",
  //   "ఆనంద గానాలు",
  //   "ఎన్నతగని నన్ను!",
  //   "నీ సేవలోనన్ను కరిగిపోని!",
  //   "ఆశ్రయము నీవేనయా",
  //   "జీవ జలమా!",
  //   "అంకితం నీకంకితం!",
  //   "పరలోక మందున్న మా తండ్రి!",
  //   "మారాలి మారాలి!",
  //   "యేసూ నీ అనురాగం!",
  //   "ఆశపడకు",
  //   "ప్రియుడా యేసయ్యా",
  //   "అందుకొనుము దేవా!",
  //   "దేవా నా మొర వినవా",
  //   "కాలం మారినా",
  //   "ఆనందమానంద",
  //   "ఉన్నతమందున్న దేవా!",
  //   "యేసయ్యా నీ ప్రేమకు",
  //   "ఆరాధనా",
  //   "ఆకాశమా",
  //   "చూచే కన్నులీయుమా",
  //   "నా ప్రియుడు",
  //   "గోల్గతా",
  //   " నా బలమా ",
  // ];
  // List<String> filteredItems = [];
  // void filterItems(String query) {
  //   setState(() {
  //     filteredItems = items
  //         .where((item) => item.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   });
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   filteredItems = items;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 54, 1, 63),
        title: const Text('Song Book'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 18),
          //   child: TextFormField(
          //     onChanged: filterItems,
          //     decoration: InputDecoration(
          //       hintText: 'Search Here',
          //       prefixIcon: Icon(Icons.search),
          //     ),
          //   ),
          // ),
          Expanded(
            child: ListView.separated(
              //itemCount: filteredItems.length,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowDetails(index: index)));
                  },
                  child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 54, 1, 63),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ShowDetails(index: index)));
                        },
                        child: Text(
                          //filteredItems[index],
                          songs[index].name,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontFamily: 'Sree'),
                        ),
                      ),
                      subtitle: Text(
                        songs[index].albumname,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 139, 110, 110),
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.volume_up,
                          color: Color.fromARGB(255, 54, 1, 63),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Mo3SongShowDetails(index: index)));
                        },
                      )
                      // onTap: () {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => ShowDetails(index: index)));
                      // },
                      ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
