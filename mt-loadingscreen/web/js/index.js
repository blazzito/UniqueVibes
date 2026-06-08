
document.addEventListener("DOMContentLoaded", () => {
    const mainContainer = document.getElementById("main-container");
    const logoContainer = document.getElementById("logo-container");
    const progressContainer = document.getElementById("progress-container");
    const musicPlayer = document.getElementById("music-player");
    const bgMusic = document.getElementById("bg-music");
    const playPauseBtn = document.getElementById("play-pause-btn");
    const playIcon = document.getElementById("play-icon");
    const pauseIcon = document.getElementById("pause-icon");
    const muteBtn = document.getElementById("mute-btn");
    const volumeIcon = document.getElementById("volume-icon");
    const muteIcon = document.getElementById("mute-icon");
    const volumeSlider = document.getElementById("volume-slider");
    const visualizer = document.getElementById("visualizer");
    const progressBar = document.getElementById("progress-bar");
    const loadPercentage = document.getElementById("load-percentage");
    const currentSongName = document.getElementById("current-song-name");
    const nextBtn = document.getElementById("next-btn");
    const prevBtn = document.getElementById("prev-btn");

    let isPlaying = false;
    let volume = 0.3;
    let currentSongIndex = Math.floor(Math.random() * Config.Songs.length);

    bgMusic.volume = volume;
    loadSong(currentSongIndex);

    function loadSong(index) {
        const song = Config.Songs[index];
        bgMusic.src = song.url;
        currentSongName.innerText = song.name;
        bgMusic.load();
        if (isPlaying) {
            bgMusic.play().catch(e => {});
        }
    }

    function nextTrack() {
        currentSongIndex = (currentSongIndex + 1) % Config.Songs.length;
        loadSong(currentSongIndex);
    }

    function prevTrack() {
        currentSongIndex = (currentSongIndex - 1 + Config.Songs.length) % Config.Songs.length;
        loadSong(currentSongIndex);
    }

    const particlesContainer = document.getElementById("particles-container");
    const particleCount = 50;

    function generateParticles() {
        for (let i = 0; i < particleCount; i++) {
            const p = document.createElement("div");
            p.className = "particle";

            const size = Math.random() * 3 + 1;
            const x = Math.random() * 100;
            const y = Math.random() * 100;
            const duration = Math.random() * 15 + 10;
            const delay = Math.random() * 10;
            const opacity = Math.random() * 0.5 + 0.2;

            p.style.width = `${size}px`;
            p.style.height = `${size}px`;
            p.style.left = `${x}%`;
            p.style.top = `${y}%`;
            p.style.setProperty('--p-duration', `${duration}s`);
            p.style.setProperty('--p-delay', `${delay}s`);
            p.style.setProperty('--p-opacity', opacity);

            particlesContainer.appendChild(p);
        }
    }

    generateParticles();


    setTimeout(() => {
        mainContainer.classList.remove("opacity-0");
        mainContainer.classList.add("opacity-100");
    }, 100);

    setTimeout(() => {
        logoContainer.classList.remove("opacity-0", "translate-y-5");
        logoContainer.classList.add("opacity-100", "translate-y-0");
    }, 500);

    setTimeout(() => {
        progressContainer.classList.remove("opacity-0");
        progressContainer.classList.add("opacity-100");
    }, 1000);

    setTimeout(() => {
        musicPlayer.classList.remove("opacity-0", "translate-x-5");
        musicPlayer.classList.add("opacity-100", "translate-x-0");

        toggleMusic();
    }, 1500);


    function toggleMusic() {
        if (!bgMusic.paused) {
            bgMusic.pause();
            isPlaying = false;
            playIcon.classList.remove("hidden");
            pauseIcon.classList.add("hidden");
            visualizer.classList.add("hidden");
        } else {
            const playPromise = bgMusic.play();
            if (playPromise !== undefined) {
                playPromise.then(_ => {
                    isPlaying = true;
                    playIcon.classList.add("hidden");
                    pauseIcon.classList.remove("hidden");
                    visualizer.classList.remove("hidden");
                }).catch(error => {
                    isPlaying = false;
                });
            }
        }
    }

    const volumeControl = document.getElementById("volume-control");
    const volumeSliderContainer = document.getElementById("volume-slider-container");

    volumeControl.addEventListener("mouseenter", () => {
        volumeSliderContainer.classList.remove("w-0", "opacity-0");
        volumeSliderContainer.classList.add("w-20", "opacity-100");
    });

    volumeControl.addEventListener("mouseleave", () => {
        volumeSliderContainer.classList.remove("w-20", "opacity-100");
        volumeSliderContainer.classList.add("w-0", "opacity-0");
    });

    playPauseBtn.addEventListener("click", toggleMusic);

    muteBtn.addEventListener("click", () => {
        if (bgMusic.volume > 0) {
            bgMusic.volume = 0;
            volumeIcon.classList.add("hidden");
            muteIcon.classList.remove("hidden");
        } else {
            bgMusic.volume = volume;
            volumeIcon.classList.remove("hidden");
            muteIcon.classList.add("hidden");
        }
    });

    volumeSlider.addEventListener("input", (e) => {
        volume = parseFloat(e.target.value);
        bgMusic.volume = volume;
        if (volume === 0) {
            volumeIcon.classList.add("hidden");
            muteIcon.classList.remove("hidden");
        } else {
            volumeIcon.classList.remove("hidden");
            muteIcon.classList.add("hidden");
        }
    });

    nextBtn.addEventListener("click", nextTrack);
    prevBtn.addEventListener("click", prevTrack);

    bgMusic.addEventListener("ended", nextTrack);


    const handlers = {
        loadProgress(data) {
            const progress = data.loadFraction * 100;
            progressBar.style.width = `${progress}%`;
            loadPercentage.innerText = Math.round(progress);
        },

        onLogLine(data) {
        },

        startDataFileEntries(data) {
        },

        performMapLoadFunction(data) {
        },

        onDataFileEntry(data) {
        }
    };

    setInterval(() => {
        if (bgMusic && !bgMusic.paused) {
            fetch(`https://${GetParentResourceName()}/reportAudioTime`, {
                method: 'POST',
                body: JSON.stringify({
                    audioTime: bgMusic.currentTime
                })
            });
        }
    }, 500);

    window.addEventListener('message', (event) => {
        let data = event.data;

        // Handle JSON strings (often sent by SendLoadingScreenMessage)
        if (typeof data === 'string') {
            try {
                data = JSON.parse(data);
            } catch (e) {
            }
        }

        // Handle both eventName (custom) and type (FiveM core)
        const type = data.eventName || data.type;
        if (type && handlers[type]) {
            handlers[type](data);
        }
    });
});
