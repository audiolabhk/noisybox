class Sound {
  String category;
  String noisepath;
  Sound(this.category, this.noisepath);
}

Sound dog1 = Sound('dog', 'dog1.wav');
Sound dog2 = Sound('dog', 'dog2.wav');
Sound dog3 = Sound('dog', 'dog3.wav');
Sound cat1 = Sound('cat', 'cat1.wav');
Sound cat2 = Sound('cat', 'cat2.wav');
Sound cat3 = Sound('cat', 'cat3.wav');
Sound poop1 = Sound('poop', 'poop1.mp3');
Sound poop2 = Sound('poop', 'poop2.mp3');
Sound poop3 = Sound('poop', 'poop3.mp3');
Sound llama1 = Sound('llama', 'llama1.mp3');
Sound llama2 = Sound('llama', 'llama2.mp3');
Sound llama3 = Sound('llama', 'llama3.mp3');

var sounds = [dog1, dog2, dog3, cat1, cat2, cat3, llama1, llama2, llama3, poop1, poop2, poop3];