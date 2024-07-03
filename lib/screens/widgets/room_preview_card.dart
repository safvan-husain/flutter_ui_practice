import 'package:flutter/material.dart';

class RoomPreviewCard extends StatelessWidget {
  const RoomPreviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        // horizontal: 10,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 29, 53, 87),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DefaultTextStyle(
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 200, 197, 197),
              fontWeight: FontWeight.bold,
            ),
            child: Text(
              "12 traits emotionally intelligent people share (You can learn them) | Daniel Goleman for Big Think+",
            ),
          ),
          SizedBox(
            height: 50,
            child: GridView.builder(
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3 / 2,
                  crossAxisCount: 8,
                ),
                itemBuilder: (context, i) {
                  return Container(
                    width: 50,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 168, 218, 220),
                    ),
                    child: const DefaultTextStyle(
                      style: TextStyle(
                          color: Color.fromARGB(255, 42, 42, 42), fontSize: 9),
                      child: Text(
                        "Tag",
                      ),
                    ),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                alignment: Alignment.center,
                // height: 50,
                // width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 168, 218, 220),
                ),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person),
                        Column(
                          children: [
                            Text(
                              "20 of your vibees ",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Alredy joined",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                alignment: Alignment.center,
                // height: 50,
                // width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 168, 218, 220),
                ),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person),
                        Text(
                          "1K+",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "members",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                alignment: Alignment.center,
                // height: 50,
                // width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 168, 218, 220),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.exit_to_app),
                    Text(
                      "Lauch",
                      style: TextStyle(
                        color: Color.fromARGB(255, 14, 14, 13),
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            // alignment: Alignment.center,
            height: 250,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 69, 123, 157),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Safvan Husain",
                      style: TextStyle(
                        color: Color.fromARGB(255, 241, 250, 238),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.all(2),
                        alignment: Alignment.center,
                        // height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 241, 250, 238),
                        ),
                        child: const Text(
                          "Most liked tweet",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                const Divider(),
                const Text(
                  "Snippets are defined in a JSON format and stored in a per-user (languageId).json file. For example, Markdown snippets go in a markdown.json file.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 241, 250, 238),
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 230, 57, 70),
            ),
            child: const DefaultTextStyle(
              style: TextStyle(
                color: Color.fromARGB(255, 241, 250, 238),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              child: Text(
                "Try Vibe",
              ),
            ),
          )
        ],
      ),
    );
  }
}
