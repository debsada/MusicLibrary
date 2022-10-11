require "music_library"
require "track"

RSpec.describe "integration" do
    context "when we add a track to the library" do 
        it "comes back in the list" do 
            music_library = MusicLibrary.new
            track_1 = Track.new("my_title1", "my_artist1")
            track_2 = track_1 = Track.new("my_title2", "my_artist2")
            music_library.add(track_1)
            music_library.add(track_2)
            expect(music_library.all).to eq [track_1, track_2]
        end
    end

    context "with some tracks added" do 
        it "searches for those tracks by full title" do 
            music_library = MusicLibrary.new
            track_1 = Track.new("my_title1", "my_artist1")
            track_2 = Track.new("my_title2", "my_artist2")
            music_library.add(track_1)
            music_library.add(track_2)
            results = music_library.search_by_title("my_title2")
            expect(results).to eq [track_2]
        end
    end

    context "with some tracks added" do 
        it "searches for those tracks by full title" do 
            music_library = MusicLibrary.new
            track_1 = Track.new("my_title1", "my_artist1")
            track_2 = Track.new("my_title2", "my_artist2")
            music_library.add(track_1)
            music_library.add(track_2)
            results = music_library.search_by_title("title2")
            expect(results).to eq [track_2]
        end
    end

    context "where there are not tracks matching" do 
        it "yields an empty list when searching" do 
            music_library = MusicLibrary.new
            track_1 = Track.new("my_title1", "my_artist1")
            music_library.add(track_1)
            results = music_library.search_by_title("hello")
            expect(results).to eq []
        end
    end

end 