import 'package:audioplayers/audioplayers.dart';

class SoundUtil {
  static const SOUND_ZIHOU = 'sounds/zihou.mp3';

  static final AudioCache _cache = AudioCache(
    fixedPlayer: AudioPlayer(),
  );

  static void initLoad() {
    _cache.loadAll([SOUND_ZIHOU]);
  }

  static void playZihou() {
    play(SOUND_ZIHOU);
  }

  static void play(String filePath) {
    _cache.play(filePath);
  }
}
