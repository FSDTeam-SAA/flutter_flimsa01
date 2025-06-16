import 'package:flutter/material.dart';

class VideoSettingsPopup extends StatefulWidget {
  const VideoSettingsPopup({super.key});

  @override
  State<VideoSettingsPopup> createState() => _VideoSettingsPopupState();
}

class _VideoSettingsPopupState extends State<VideoSettingsPopup> {
  String selectedQuality = "720p";
  double selectedSpeed = 1.0;
  bool subtitlesEnabled = true;

  void _showPlaybackSpeedSelector() {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          width: 320,
          height: 450,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Playback Speed",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0].map((
                      speed,
                    ) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              speed.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            Radio<double>(
                              value: speed,
                              groupValue: selectedSpeed,
                              onChanged: (value) {
                                setState(() {
                                  selectedSpeed = value!;
                                });
                                Navigator.of(context).pop();
                              },
                              activeColor: Colors.white,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showQualitySelector() {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 320,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Quality",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(color: Colors.white30, height: 1),

            // 👇 Scrollable ListView wrapped in Expanded
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  ...[
                    "Auto", "270p", "360p", "480p", "540p", "640p", "720p", "1080p"
                  ].map((quality) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            quality,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Radio<String>(
                            value: quality,
                            groupValue: selectedQuality,
                            onChanged: (value) {
                              setState(() {
                                selectedQuality = value!;
                              });
                              Navigator.of(context).pop();
                            },
                            activeColor: Colors.white,
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


  


  @override
  Widget build(BuildContext context) {
  return Dialog(
    elevation: 10,
    backgroundColor: Colors.transparent,
    insetPadding: const EdgeInsets.all(20),
    child: SizedBox(
      width: 320, // 👈 Set your desired width
      height: 250, // 👈 Set your desired height
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF3C3C3C),
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.close, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Quality Selector
                    InkWell(
                      onTap: _showQualitySelector,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Quality", style: TextStyle(color: Colors.white, fontSize: 16)),
                          Container(
                            width: 80,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2C2C2C),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(selectedQuality, style: const TextStyle(color: Colors.white)),
                                const SizedBox(width: 4),
                                const Icon(Icons.arrow_drop_down, color: Colors.white, size: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Playback Speed Selector
                    InkWell(
                      onTap: _showPlaybackSpeedSelector,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Playback Speed", style: TextStyle(color: Colors.white, fontSize: 16)),
                          Container(
                            width: 80,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2C2C2C),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(selectedSpeed.toString(), style: const TextStyle(color: Colors.white)),
                                const SizedBox(width: 4),
                                const Icon(Icons.arrow_drop_down, color: Colors.white, size: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Subtitle/CC", style: TextStyle(color: Colors.white)),
                        SizedBox(
                          width: 80,
                          child: Switch(
                            value: subtitlesEnabled,
                            onChanged: (val) => setState(() => subtitlesEnabled = val),
                            activeColor: Colors.white,
                            activeTrackColor: Colors.grey,
                            inactiveThumbColor: Colors.grey,
                            inactiveTrackColor: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

}
