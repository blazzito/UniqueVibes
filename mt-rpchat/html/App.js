window.APP = {
  template: '#app_template',
  name: 'app',
  data() {
    return {
      style: CONFIG.style,
      showInput: false,
      showWindow: false,
      shouldHide: true,
      backingSuggestions: [],
      removedSuggestions: [],
      templates: CONFIG.templates,
      message: '',
      localId: -1,
      showEmojiPicker: false,
      emojiSearch: '',
      currentCategory: 'all',
      categories: [
        { id: 'all', icon: 'fas fa-th-large', label: 'Todo' },
        { id: 'fav', icon: 'fas fa-star', label: 'Favoritos' },
        { id: 'smileys', icon: 'fas fa-smile', label: 'Caras' },
        { id: 'gestures', icon: 'fas fa-hand-paper', label: 'Gestos' },
        { id: 'people', icon: 'fas fa-user', label: 'Personas' },
        { id: 'nature', icon: 'fas fa-leaf', label: 'Naturaleza' },
        { id: 'food', icon: 'fas fa-hamburger', label: 'Comida' },
        { id: 'activity', icon: 'fas fa-running', label: 'Actividad' },
        { id: 'travel', icon: 'fas fa-car', label: 'Viaje' },
        { id: 'items', icon: 'fas fa-keyboard', label: 'Objetos' },
        { id: 'symbols', icon: 'fas fa-icons', label: 'Símbolos' },
        { id: 'flags', icon: 'fas fa-flag', label: 'Banderas' }
      ],
      favorites: JSON.parse(localStorage.getItem('chat_emoji_favorites') || '[]'),
      emojiList: [
        // SMILEYS
        { char: '😊', name: 'sonrisa carita feliz happy', cat: 'smileys' },
        { char: '😂', name: 'risa llorar laugh lol', cat: 'smileys' },
        { char: '🤣', name: 'risa suelo rolling', cat: 'smileys' },
        { char: '😍', name: 'ojos corazon love', cat: 'smileys' },
        { char: '😘', name: 'beso kiss', cat: 'smileys' },
        { char: '😁', name: 'sonrisa diente', cat: 'smileys' },
        { char: '😉', name: 'guiño wink', cat: 'smileys' },
        { char: '😎', name: 'gafas cool', cat: 'smileys' },
        { char: '🥰', name: 'encantado lovely', cat: 'smileys' },
        { char: '🤩', name: 'estrellas starstruck', cat: 'smileys' },
        { char: '😋', name: 'rico yummy', cat: 'smileys' },
        { char: '😛', name: 'lengua tongue', cat: 'smileys' },
        { char: '😜', name: 'lengua guiño', cat: 'smileys' },
        { char: '🤪', name: 'loco crazy', cat: 'smileys' },
        { char: '😝', name: 'lengua ojos cerrados', cat: 'smileys' },
        { char: '🤨', name: 'ceja levantada eyebrow', cat: 'smileys' },
        { char: '🧐', name: 'monoculo smart', cat: 'smileys' },
        { char: '🤓', name: 'nerd empollon', cat: 'smileys' },
        { char: '😲', name: 'asombrado wow', cat: 'smileys' },
        { char: '😴', name: 'dormido sleep', cat: 'smileys' },
        { char: '🤤', name: 'babas drool', cat: 'smileys' },
        { char: '🤢', name: 'asco vomit sick', cat: 'smileys' },
        { char: '🤮', name: 'vomito puke', cat: 'smileys' },
        { char: '🥵', name: 'calor hot', cat: 'smileys' },
        { char: '🥶', name: 'frio cold', cat: 'smileys' },
        { char: '😵', name: 'mareado dizzy', cat: 'smileys' },
        { char: '🤯', name: 'cabeza explosion mind blown', cat: 'smileys' },
        { char: '🥳', name: 'fiesta party', cat: 'smileys' },
        { char: '🥴', name: 'borracho drunk', cat: 'smileys' },
        { char: '🥺', name: 'favor please', cat: 'smileys' },
        { char: '🤫', name: 'silencio shh', cat: 'smileys' },
        { char: '🤬', name: 'insulto mad', cat: 'smileys' },
        { char: '😡', name: 'enfado angry', cat: 'smileys' },
        { char: '😭', name: 'llorar cry', cat: 'smileys' },
        { char: '😱', name: 'miedo wow', cat: 'smileys' },
        { char: '🤐', name: 'silencio mudo', cat: 'smileys' },
        { char: '🤡', name: 'payaso clown', cat: 'smileys' },
        { char: '👻', name: 'fantasma ghost', cat: 'smileys' },
        { char: '👽', name: 'alien ovni', cat: 'smileys' },
        { char: '🤖', name: 'robot bot', cat: 'smileys' },
        { char: '💩', name: 'mierda poop', cat: 'smileys' },

        // GESTURES
        { char: '👋', name: 'hola adios wave', cat: 'gestures' },
        { char: '🤚', name: 'pare stop hand', cat: 'gestures' },
        { char: '🖐️', name: 'cinco five hand', cat: 'gestures' },
        { char: '🖖', name: 'vulcano vulcan', cat: 'gestures' },
        { char: '👌', name: 'ok perfecto bien', cat: 'gestures' },
        { char: '🤌', name: 'italiano que dices', cat: 'gestures' },
        { char: '✌️', name: 'victoria paz peace', cat: 'gestures' },
        { char: '🤞', name: 'suerte luck fingers crossed', cat: 'gestures' },
        { char: '🤟', name: 'te quiero rock', cat: 'gestures' },
        { char: '🤘', name: 'rock metal', cat: 'gestures' },
        { char: '🤙', name: 'llamame call', cat: 'gestures' },
        { char: '👈', name: 'izquierda left', cat: 'gestures' },
        { char: '👉', name: 'derecha right', cat: 'gestures' },
        { char: '👆', name: 'arriba up', cat: 'gestures' },
        { char: '👇', name: 'abajo down', cat: 'gestures' },
        { char: '☝️', name: 'uno one', cat: 'gestures' },
        { char: '👍', name: 'like bien up', cat: 'gestures' },
        { char: '👎', name: 'dislike mal down', cat: 'gestures' },
        { char: '✊', name: 'puño fist', cat: 'gestures' },
        { char: '👊', name: 'puñetazo punch', cat: 'gestures' },
        { char: '🤛', name: 'puño izquierda', cat: 'gestures' },
        { char: '🤜', name: 'puño derecha', cat: 'gestures' },
        { char: '👏', name: 'aplauso clap', cat: 'gestures' },
        { char: '🙌', name: 'manos arriba celebrate', cat: 'gestures' },
        { char: '👐', name: 'abrir open hands', cat: 'gestures' },
        { char: '🤲', name: 'rezo pray hands', cat: 'gestures' },
        { char: '🤝', name: 'trato shake', cat: 'gestures' },
        { char: '🙏', name: 'por favor gracias pray', cat: 'gestures' },
        { char: '🖕', name: 'dedo insulto f-word', cat: 'gestures' },
        { char: '✍️', name: 'escribir write', cat: 'gestures' },
        { char: '💅', name: 'uñas nails', cat: 'gestures' },
        { char: '🤳', name: 'selfie foto', cat: 'gestures' },
        { char: '💪', name: 'fuerza muscle strong', cat: 'gestures' },

        // PEOPLE
        { char: '👶', name: 'bebe baby', cat: 'people' },
        { char: '🧒', name: 'niño kid', cat: 'people' },
        { char: '👦', name: 'chico boy', cat: 'people' },
        { char: '👧', name: 'chica girl', cat: 'people' },
        { char: '👨', name: 'hombre man', cat: 'people' },
        { char: '👩', name: 'mujer woman', cat: 'people' },
        { char: '👱', name: 'rubio blond', cat: 'people' },
        { char: '👴', name: 'abuelo old man', cat: 'people' },
        { char: '👵', name: 'abuela old woman', cat: 'people' },
        { char: '👮', name: 'policia police cop', cat: 'people' },
        { char: '🕵️', name: 'detective espia', cat: 'people' },
        { char: '💂', name: 'guardia guard', cat: 'people' },
        { char: '👷', name: 'obrero worker', cat: 'people' },
        { char: '🤴', name: 'principe prince', cat: 'people' },
        { char: '👸', name: 'princesa queen', cat: 'people' },
        { char: '🤵', name: 'novio groom tuxedo', cat: 'people' },
        { char: '👰', name: 'novia bride dress', cat: 'people' },
        { char: '🤰', name: 'embarazada pregnant', cat: 'people' },
        { char: '🤶', name: 'mama noel santa', cat: 'people' },
        { char: '🎅', name: 'papa noel santa claus', cat: 'people' },
        { char: '🧙', name: 'mago wizard', cat: 'people' },
        { char: '🧚', name: 'hada fairy', cat: 'people' },
        { char: '🧛', name: 'vampiro vampire', cat: 'people' },
        { char: '🧟', name: 'zombie muerto', cat: 'people' },
        { char: '🧞', name: 'genio genie', cat: 'people' },
        { char: '🧜', name: 'sirena merman', cat: 'people' },
        { char: '👼', name: 'angel bebe', cat: 'people' },
        { char: '💃', name: 'baile mujer dance', cat: 'people' },
        { char: '🕺', name: 'baile hombre dance', cat: 'people' },

        // NATURE
        { char: '🐶', name: 'perro dog puppy', cat: 'nature' },
        { char: '🐱', name: 'gato cat kitty', cat: 'nature' },
        { char: '🐭', name: 'raton mouse', cat: 'nature' },
        { char: '🐹', name: 'hamster', cat: 'nature' },
        { char: '🐰', name: 'conejo rabbit', cat: 'nature' },
        { char: '🦊', name: 'zorro fox', cat: 'nature' },
        { char: '🐻', name: 'oso bear', cat: 'nature' },
        { char: '🐼', name: 'panda', cat: 'nature' },
        { char: '🦁', name: 'leon lion', cat: 'nature' },
        { char: '🐸', name: 'rana frog', cat: 'nature' },
        { char: '🐵', name: 'mono monkey', cat: 'nature' },
        { char: '🐔', name: 'pollo chicken', cat: 'nature' },
        { char: '🐧', name: 'pingüino penguin', cat: 'nature' },
        { char: '🦆', name: 'pato duck', cat: 'nature' },
        { char: '🦅', name: 'aguila eagle', cat: 'nature' },
        { char: '🦇', name: 'murcielago bat', cat: 'nature' },
        { char: '🐺', name: 'lobo wolf', cat: 'nature' },
        { char: '🐴', name: 'caballo horse', cat: 'nature' },
        { char: '🦄', name: 'unicornio', cat: 'nature' },
        { char: '🐝', name: 'abeja bee', cat: 'nature' },
        { char: '🐛', name: 'gusano bug', cat: 'nature' },
        { char: '🦋', name: 'mariposa butterfly', cat: 'nature' },
        { char: '🐌', name: 'caracol snail', cat: 'nature' },
        { char: '🐢', name: 'tortuga turtle', cat: 'nature' },
        { char: '🐍', name: 'serpiente snake', cat: 'nature' },
        { char: '🐬', name: 'delfin dolphin', cat: 'nature' },
        { char: '🦈', name: 'tiburon shark', cat: 'nature' },
        { char: '🐙', name: 'pulpo octopus', cat: 'nature' },
        { char: '🦀', name: 'cangrejo crab', cat: 'nature' },
        { char: '🕷️', name: 'araña spider', cat: 'nature' },
        { char: '🥀', name: 'rosa marchita dead flower', cat: 'nature' },
        { char: '🌸', name: 'flor cherry blossom', cat: 'nature' },
        { char: '🍀', name: 'trebol clover luck', cat: 'nature' },
        { char: '🌿', name: 'hierba herb leaf', cat: 'nature' },
        { char: '🍄', name: 'seta mushroom droga', cat: 'nature' },
        { char: '🌑', name: 'luna moon noche', cat: 'nature' },
        { char: '🌕', name: 'luna llena full moon', cat: 'nature' },
        { char: '🌙', name: 'luna creciente moon', cat: 'nature' },
        { char: '⭐', name: 'estrella star', cat: 'nature' },
        { char: '☀️', name: 'sol sun dia hot', cat: 'nature' },
        { char: '☁️', name: 'nube cloud', cat: 'nature' },
        { char: '⛈️', name: 'tormenta lightning storm', cat: 'nature' },
        { char: '🌩️', name: 'rayo lightning', cat: 'nature' },
        { char: '❄️', name: 'nieve snow frio', cat: 'nature' },

        // FOOD
        { char: '🍇', name: 'uvas grape fruit', cat: 'food' },
        { char: '🍉', name: 'sandia watermelon', cat: 'food' },
        { char: '🍋', name: 'limon lemon', cat: 'food' },
        { char: '🍌', name: 'platano banana', cat: 'food' },
        { char: '🍎', name: 'manzana apple fruit', cat: 'food' },
        { char: '🍏', name: 'manzana verde apple', cat: 'food' },
        { char: '🍐', name: 'pera pear', cat: 'food' },
        { char: '🍑', name: 'melocoton peach culo ass', cat: 'food' },
        { char: '🍒', name: 'cerezas cherry', cat: 'food' },
        { char: '🍓', name: 'fresa strawberry', cat: 'food' },
        { char: '🥝', name: 'kiwi', cat: 'food' },
        { char: '🍅', name: 'tomate tomato', cat: 'food' },
        { char: '🥥', name: 'coco coconut', cat: 'food' },
        { char: '🥑', name: 'aguacate avocado', cat: 'food' },
        { char: '🍆', name: 'berenjena eggplant penis d***', cat: 'food' },
        { char: '🥔', name: 'patata potato', cat: 'food' },
        { char: '🥕', name: 'zanahoria carrot', cat: 'food' },
        { char: '🌽', name: 'maiz corn', cat: 'food' },
        { char: '🌶️', name: 'picante hot chili', cat: 'food' },
        { char: '🥒', name: 'pepino cucumber', cat: 'food' },
        { char: '🍞', name: 'pan bread', cat: 'food' },
        { char: '🥐', name: 'croissant breakfast', cat: 'food' },
        { char: '🧀', name: 'queso cheese', cat: 'food' },
        { char: '🍖', name: 'carne meat', cat: 'food' },
        { char: '🍗', name: 'pollo frito chicken', cat: 'food' },
        { char: '🍔', name: 'hamburguesa burger food', cat: 'food' },
        { char: '🍟', name: 'patatas fritas fries', cat: 'food' },
        { char: '🍕', name: 'pizza', cat: 'food' },
        { char: '🥪', name: 'sandwich', cat: 'food' },
        { char: '🌮', name: 'taco', cat: 'food' },
        { char: '🍝', name: 'pasta spaghetti', cat: 'food' },
        { char: '🍣', name: 'sushi', cat: 'food' },
        { char: '🍚', name: 'arroz rice', cat: 'food' },
        { char: '🍩', name: 'donut comida sweet', cat: 'food' },
        { char: '🍦', name: 'helado ice cream cold', cat: 'food' },
        { char: '🍰', name: 'pastel cake', cat: 'food' },
        { char: '🍫', name: 'chocolate', cat: 'food' },
        { char: '🍬', name: 'caramelo candy', cat: 'food' },
        { char: '🍭', name: 'piruleta lollipop', cat: 'food' },
        { char: '🍿', name: 'palomitas popcorn', cat: 'food' },
        { char: '🍺', name: 'cerveza beer drink', cat: 'food' },
        { char: '🍻', name: 'cervezas beers', cat: 'food' },
        { char: '🥂', name: 'brindis cheers', cat: 'food' },
        { char: '🍷', name: 'vino wine', cat: 'food' },
        { char: '🥃', name: 'whisky drink', cat: 'food' },
        { char: '🍸', name: 'martini drink', cat: 'food' },
        { char: '🍹', name: 'cocktail drink', cat: 'food' },
        { char: '🍾', name: 'champagne celebration', cat: 'food' },
        { char: '🥤', name: 'refresco soda drink', cat: 'food' },
        { char: '☕', name: 'cafe coffee hot', cat: 'food' },

        // ACTIVITY
        { char: '⚽', name: 'futbol football soccer', cat: 'activity' },
        { char: '🏀', name: 'baloncesto basketball', cat: 'activity' },
        { char: '🏐', name: 'voleyball', cat: 'activity' },
        { char: '🏈', name: 'futbol americano football', cat: 'activity' },
        { char: '🥊', name: 'boxeo boxing gloves', cat: 'activity' },
        { char: '🥋', name: 'karate judo', cat: 'activity' },
        { char: '⛳', name: 'golf', cat: 'activity' },
        { char: '🎾', name: 'tenis tennis', cat: 'activity' },
        { char: '🏒', name: 'hockey', cat: 'activity' },
        { char: '🏓', name: 'ping pong', cat: 'activity' },
        { char: '🏸', name: 'badminton', cat: 'activity' },
        { char: '🥅', name: 'porteria net', cat: 'activity' },
        { char: '🎯', name: 'diana dart bullseye', cat: 'activity' },
        { char: '🎱', name: 'billar pool 8-ball', cat: 'activity' },
        { char: '🎮', name: 'mando game play console ps4 xbox', cat: 'activity' },
        { char: '🕹️', name: 'joystick game retro', cat: 'activity' },
        { char: '🎰', name: 'tragamonedas slot casino luck', cat: 'activity' },
        { char: '🎲', name: 'dado dice random luck', cat: 'activity' },
        { char: '♟️', name: 'ajedrez chess', cat: 'activity' },
        { char: '🃏', name: 'comodin joker cards', cat: 'activity' },
        { char: '🎴', name: 'cartas cards', cat: 'activity' },
        { char: '🎭', name: 'teatro drama masks', cat: 'activity' },
        { char: '🎨', name: 'pintura art brush palette', cat: 'activity' },

        // TRAVEL
        { char: '🚗', name: 'coche car vehiculo', cat: 'travel' },
        { char: '🚕', name: 'taxi', cat: 'travel' },
        { char: '🚓', name: 'policia police cops', cat: 'travel' },
        { char: '🚑', name: 'ambulancia ems medic', cat: 'travel' },
        { char: '🚒', name: 'bomberos fire truck', cat: 'travel' },
        { char: '🏎️', name: 'formula 1 race car', cat: 'travel' },
        { char: '🏍️', name: 'moto bike motorcycle', cat: 'travel' },
        { char: '🚲', name: 'bicicleta bicycle', cat: 'travel' },
        { char: '🚁', name: 'helicoptero heli', cat: 'travel' },
        { char: '✈️', name: 'avion plane trip flight', cat: 'travel' },
        { char: '🚀', name: 'cohete rocket space', cat: 'travel' },
        { char: '🏙️', name: 'ciudad city downtown', cat: 'travel' },
        { char: '🏘️', name: 'casas neighborhood', cat: 'travel' },
        { char: '🏠', name: 'casa house home', cat: 'travel' },
        { char: '🏨', name: 'hotel', cat: 'travel' },
        { char: '🏢', name: 'oficina office building', cat: 'travel' },
        { char: '🚔', name: 'policia police siren', cat: 'travel' },
        { char: '🚦', name: 'semaforo traffic light', cat: 'travel' },
        { char: '⛽', name: 'gasolina gas fuel station', cat: 'travel' },
        { char: '🗺️', name: 'mapa map', cat: 'travel' },
        { char: '🏝️', name: 'isla island beach vacation', cat: 'travel' },
        { char: '⛰️', name: 'montaña mountain', cat: 'travel' },
        { char: '🌋', name: 'volcan volcano', cat: 'travel' },

        // ITEMS
        { char: '🔫', name: 'pistola arma gun weapon shoot glock', cat: 'items' },
        { char: '🔪', name: 'cuchillo knife weapon kill', cat: 'items' },
        { char: '💣', name: 'bomba bomb explosion terror', cat: 'items' },
        { char: '🧨', name: 'dinamita dynamite', cat: 'items' },
        { char: '🚬', name: 'cigarro smoke fuma weed', cat: 'items' },
        { char: '💊', name: 'droga pastilla pill drug medication', cat: 'items' },
        { char: '💉', name: 'jeringuilla needle drug vaccine', cat: 'items' },
        { char: '💀', name: 'calavera muerto death skull', cat: 'items' },
        { char: '☠️', name: 'peligro danger death poison', cat: 'items' },
        { char: '💰', name: 'dinero money bolsa cash rich', cat: 'items' },
        { char: '💵', name: 'billete dinero dollar cash', cat: 'items' },
        { char: '💸', name: 'dinero volando money', cat: 'items' },
        { char: '💎', name: 'diamante rich diamond jewelry', cat: 'items' },
        { char: '💳', name: 'tarjeta credit card bank', cat: 'items' },
        { char: '📱', name: 'movil phone cell smartphone', cat: 'items' },
        { char: '💻', name: 'portatil laptop pc computer desktop', cat: 'items' },
        { char: '🖥️', name: 'monitor pc screen', cat: 'items' },
        { char: '⌚', name: 'reloj watch time', cat: 'items' },
        { char: '🎧', name: 'cascos audio headphones music', cat: 'items' },
        { char: '📻', name: 'radio', cat: 'items' },
        { char: '📷', name: 'camara camera photo', cat: 'items' },
        { char: '🎥', name: 'video movie camera', cat: 'items' },
        { char: '📹', name: 'grabadora recorder', cat: 'items' },
        { char: '📽️', name: 'proyector projector', cat: 'items' },
        { char: '📺', name: 'television tv', cat: 'items' },
        { char: '🔦', name: 'linterna flashlight light', cat: 'items' },
        { char: '🕯️', name: 'vela candle', cat: 'items' },
        { char: '🗑️', name: 'papelera trash bin', cat: 'items' },
        { char: '🗝️', name: 'llaves keys secret', cat: 'items' },
        { char: '🔨', name: 'martillo hammer tool', cat: 'items' },
        { char: '⛏️', name: 'pico pickaxe mine', cat: 'items' },
        { char: '⚒️', name: 'herramientas tools', cat: 'items' },
        { char: '🛠️', name: 'llave inglesa tools', cat: 'items' },
        { char: '⚔️', name: 'espadas swords war battle', cat: 'items' },
        { char: '🛡️', name: 'escudo shield protection', cat: 'items' },
        { char: '🔧', name: 'herramienta wrench mechanic', cat: 'items' },
        { char: '⚙️', name: 'engranaje gear settings system', cat: 'items' },
        { char: '⚖️', name: 'balanza justice law', cat: 'items' },
        { char: '🔗', name: 'cadena link bond', cat: 'items' },
        { char: '⚖️', name: 'justicia balance', cat: 'items' },
        { char: '🧪', name: 'quimica test tube drug', cat: 'items' },
        { char: '🌡️', name: 'termometro fever temperature', cat: 'items' },
        { char: '🔭', name: 'telescopio stars', cat: 'items' },
        { char: '🔬', name: 'microscopio science', cat: 'items' },
        { char: '💊', name: 'medicina medicine pill', cat: 'items' },
        { char: '💉', name: 'inyeccion syringe', cat: 'items' },
        { char: '🪜', name: 'escalera ladder', cat: 'items' },
        { char: '🪑', name: 'silla chair', cat: 'items' },
        { char: '🚪', name: 'puerta door exit', cat: 'items' },
        { char: '🪞', name: 'espejo mirror', cat: 'items' },
        { char: '🧸', name: 'osito teddy bear', cat: 'items' },
        { char: '🎁', name: 'regalo gift present', cat: 'items' },
        { char: '🎈', name: 'globo balloon party', cat: 'items' },
        { char: '🪄', name: 'varita magic wand', cat: 'items' },

        // SYMBOLS
        { char: '❤️', name: 'corazon love heart rojo', cat: 'symbols' },
        { char: '🧡', name: 'corazon naranja', cat: 'symbols' },
        { char: '💛', name: 'corazon amarillo', cat: 'symbols' },
        { char: '💚', name: 'corazon verde', cat: 'symbols' },
        { char: '💙', name: 'corazon azul', cat: 'symbols' },
        { char: '💜', name: 'corazon morado purple', cat: 'symbols' },
        { char: '🖤', name: 'corazon negro black', cat: 'symbols' },
        { char: '💔', name: 'corazon roto heartbreak', cat: 'symbols' },
        { char: '❣', name: 'exclamacion corazon', cat: 'symbols' },
        { char: '💕', name: 'corazones love couples', cat: 'symbols' },
        { char: '💖', name: 'brillo corazon sparkly heart', cat: 'symbols' },
        { char: '🔥', name: 'fuego fire hot trending spicy', cat: 'symbols' },
        { char: '💯', name: 'cien 100 top perfect', cat: 'symbols' },
        { char: '✨', name: 'brillos spark magic new', cat: 'symbols' },
        { char: '💥', name: 'explosion boom pow', cat: 'symbols' },
        { char: '💢', name: 'enfado anger manga', cat: 'symbols' },
        { char: '💨', name: 'viento speed fast smoke', cat: 'symbols' },
        { char: '💦', name: 'gotas water sweat sex', cat: 'symbols' },
        { char: '💤', name: 'sueño sleep', cat: 'symbols' },
        { char: '⚠️', name: 'aviso warning alert', cat: 'symbols' },
        { char: '🚫', name: 'prohibido forbidden stop', cat: 'symbols' },
        { char: '❌', name: 'error cruz fail', cat: 'symbols' },
        { char: '✅', name: 'bien check ok pass', cat: 'symbols' },
        { char: '✳️', name: 'asterisco star', cat: 'symbols' },
        { char: '🆒', name: 'cool guay', cat: 'symbols' },
        { char: '🅿️', name: 'parking p policia', cat: 'symbols' },
        { char: '🆘', name: 'ayuda help emergency', cat: 'symbols' },
        { char: '⛔', name: 'prohibido no entry stop', cat: 'symbols' },
        { char: '🔞', name: 'mayor de edad adult sex', cat: 'symbols' },
        { char: '☣️', name: 'biopeligro biohazard', cat: 'symbols' },
        { char: '☢️', name: 'radiacion radioactive', cat: 'symbols' },
        { char: '⬆️', name: 'arriba up arrow', cat: 'symbols' },
        { char: '⬇️', name: 'abajo down arrow', cat: 'symbols' },
        { char: '⬅️', name: 'izquierda left arrow', cat: 'symbols' },
        { char: '➡️', name: 'derecha right arrow', cat: 'symbols' },
        { char: '⚧️', name: 'transgender lgbt', cat: 'symbols' },
        { char: '♾️', name: 'infinito infinite forever', cat: 'symbols' },
        { char: '💲', name: 'dolar dollar money symbol', cat: 'symbols' },

        // FLAGS
        { char: '🇪🇸', name: 'españa spain flag bandera', cat: 'flags' },
        { char: '🇲🇽', name: 'mexico bandera flag', cat: 'flags' },
        { char: '🇦🇷', name: 'argentina bandera flag', cat: 'flags' },
        { char: '🇨🇴', name: 'colombia bandera flag', cat: 'flags' },
        { char: '🇨🇱', name: 'chile bandera flag', cat: 'flags' },
        { char: '🇵🇪', name: 'peru bandera flag', cat: 'flags' },
        { char: '🇻🇪', name: 'venezuela bandera flag', cat: 'flags' },
        { char: '🇺🇸', name: 'usa estados unidos bandera flag america', cat: 'flags' },
        { char: '🇬🇧', name: 'uk reino unido reino unido flag england britain', cat: 'flags' },
        { char: '🇫🇷', name: 'francia france bandera flag', cat: 'flags' },
        { char: '🇩🇪', name: 'alemania germany bandera flag', cat: 'flags' },
        { char: '🇮🇹', name: 'italia italy bandera flag', cat: 'flags' },
        { char: '🇧🇷', name: 'brasil brazil bandera flag', cat: 'flags' },
        { char: '🇯🇵', name: 'japon japan bandera flag anime', cat: 'flags' },
        { char: '🇨🇳', name: 'china bandera flag', cat: 'flags' },
        { char: '🇰🇷', name: 'corea korea bandera flag kpop', cat: 'flags' },
        { char: '🇷🇺', name: 'rusia russia bandera flag', cat: 'flags' },
        { char: '🇨🇦', name: 'canada bandera flag', cat: 'flags' },
        { char: '🇦🇺', name: 'australia bandera flag', cat: 'flags' },
        { char: '🏳️‍🌈', name: 'orgullo pride lgbt rainbow', cat: 'flags' },
        { char: '🏴‍☠️', name: 'pirata pirate flag bandana', cat: 'flags' },
        { char: '🏁', name: 'meta race finish flag bandera', cat: 'flags' },
        { char: '🚩', name: 'alerta red flag warning alert', cat: 'flags' }
      ],
      messages: [],
      oldMessages: [],
      oldMessagesIndex: -1,
      tplBackups: [],
      msgTplBackups: [],
      billboardMessages: [],
      announcementQueue: [],
      currentAnnouncement: null,
      showBillboard: false,
      bubbles: []
    };
  },
  destroyed() {
    clearInterval(this.focusTimer);
    window.removeEventListener('message', this.listener);
  },
  mounted() {
    this.listener = window.addEventListener('message', (event) => {
      const item = event.data || event.detail; //'detail' is for debuging via browsers
      if (this[item.type]) {
        this[item.type](item);
      }
    });
    post('https://mt-rpchat/loaded', JSON.stringify({}));

    // Close emoji picker when clicking outside
    document.addEventListener('mousedown', (e) => {
      const picker = document.querySelector('.emoji-picker');
      if (picker && !picker.contains(e.target) && !e.target.classList.contains('fa-smile')) {
        this.showEmojiPicker = false;
      }
    });
  },
  watch: {
    messages() {
      if (this.showWindowTimer) {
        clearTimeout(this.showWindowTimer);
      }
      this.showWindow = true;
      this.resetShowWindowTimer();

      const messagesObj = this.$refs.messages;
      this.$nextTick(() => {
        messagesObj.scrollTop = messagesObj.scrollHeight;
      });
    },
  },
  computed: {
    suggestions() {
      return this.backingSuggestions.filter((el) => this.removedSuggestions.indexOf(el.name) <= -1);
    },
    filteredEmojis() {
      const search = this.emojiSearch.toLowerCase().trim();
      
      // If there's a search, show all matching emojis regardless of category
      if (search.length > 0) {
        return this.emojiList.filter(e => 
          e.name.toLowerCase().includes(search)
        );
      }

      // If category is favorites, show favorites
      if (this.currentCategory === 'fav') {
        return this.emojiList.filter(e => this.isFavorite(e.char));
      }

      // Otherwise show by specific category (if not 'all')
      if (this.currentCategory !== 'all') {
        return this.emojiList.filter(e => e.cat === this.currentCategory);
      }

      return [];
    },
    groupedEmojis() {
      if (this.currentCategory !== 'all' || this.emojiSearch.length > 0) return [];
      
      const groups = [];
      this.categories.forEach(cat => {
        if (cat.id === 'all' || cat.id === 'fav') return;
        const emojis = this.emojiList.filter(e => e.cat === cat.id);
        if (emojis.length > 0) {
          groups.push({
            id: cat.id,
            label: cat.label,
            emojis: emojis
          });
        }
      });
      return groups;
    }
  },
  methods: {
    ON_UPDATE_BUBBLES({ bubbles }) {
      this.bubbles = bubbles;
    },
    getBubbleColor(type) {
      if (type === 'do') return '#00a8cc'; // Petrol for DO
      return '#ff6b00'; // Orange for ME
    },
    getAccentColor(type) {
      if (type === 'do') return '#00a8cc'; 
      return '#ff6b00';
    },
    toggleEmojiPicker() {
      this.showEmojiPicker = !this.showEmojiPicker;
      if (this.showEmojiPicker) {
        this.$nextTick(() => {
          if (this.$refs.emojiSearch) this.$refs.emojiSearch.focus();
        });
      }
    },
    setCategory(catId) {
      this.currentCategory = catId;
    },
    addEmoji(emoji) {
      this.message += emoji;
      this.$refs.input.focus();
    },
    toggleFavorite(emoji) {
      const index = this.favorites.indexOf(emoji);
      if (index > -1) {
        this.favorites.splice(index, 1);
      } else {
        this.favorites.unshift(emoji);
        if (this.favorites.length > 10) this.favorites.pop(); // Max 10 favorites
      }
      localStorage.setItem('chat_emoji_favorites', JSON.stringify(this.favorites));
    },
    isFavorite(emoji) {
      return this.favorites.indexOf(emoji) > -1;
    },
    SET_LOCAL_ID({ id }) {
      this.localId = id;
    },
    ON_SCREEN_STATE_CHANGE({ shouldHide }) {
      this.shouldHide = shouldHide;
    },
    ON_OPEN() {
      this.showInput = true;
      this.showWindow = true;
      if (this.showWindowTimer) {
        clearTimeout(this.showWindowTimer);
      }
      this.focusTimer = setInterval(() => {
        if (this.$refs.input) {
          const active = document.activeElement;
          const isSearch = active && active.classList.contains('emoji-search-input');
          if (!isSearch) {
            this.$refs.input.focus();
          }
        } else {
          clearInterval(this.focusTimer);
        }
      }, 100);
    },
    ON_MESSAGE({ message }) {
      if (message && message.args && message.args[2] === 'global_announcement') {
        const id = Date.now();
        message.id = id;
        this.announcementQueue.push(message);
        this.processAnnouncementQueue();
        return;
      }
      if (message) {
        this.messages.push(message);
      }
    },
    formatBillboard(msg) {
      if (!msg) return "";
      let s = msg.template ? msg.template : "";

      // Basic escaping if needed (placeholder for future refinement)
      // For now just handle the ^ colors
      return s.replace(/\^([0-9])/g, (str, color) => `<span class="color-${color}">`).replace(/<span class="color-(\d+)">/g, (match) => `</span>${match}`);
    },
    ON_CLEAR() {
      this.messages = [];
      this.oldMessages = [];
      this.oldMessagesIndex = -1;
    },
    ON_SUGGESTION_ADD({ suggestion }) {
      if (!suggestion.params) {
        suggestion.params = []; //TODO Move somewhere else
      }
      if (this.backingSuggestions.find(a => a.name == suggestion.name)) {
        return;
      }
      this.backingSuggestions.push(suggestion);
    },
    ON_SUGGESTION_REMOVE({ name }) {
      if (this.removedSuggestions.indexOf(name) <= -1) {
        this.removedSuggestions.push(name);
      }
    },
    ON_TEMPLATE_ADD({ template }) {
      if (this.templates[template.id]) {
        this.warn(`Tried to add duplicate template '${template.id}'`)
      } else {
        this.templates[template.id] = template.html;
      }
    },
    ON_UPDATE_THEMES({ themes }) {
      this.removeThemes();

      this.setThemes(themes);
    },
    removeThemes() {
      for (let i = 0; i < document.styleSheets.length; i++) {
        const styleSheet = document.styleSheets[i];
        const node = styleSheet.ownerNode;

        if (node.getAttribute('data-theme')) {
          node.parentNode.removeChild(node);
        }
      }

      this.tplBackups.reverse();

      for (const [elem, oldData] of this.tplBackups) {
        elem.innerText = oldData;
      }

      this.tplBackups = [];

      this.msgTplBackups.reverse();

      for (const [id, oldData] of this.msgTplBackups) {
        this.templates[id] = oldData;
      }

      this.msgTplBackups = [];
    },
    setThemes(themes) {
      for (const [id, data] of Object.entries(themes)) {
        if (data.style) {
          const style = document.createElement('style');
          style.type = 'text/css';
          style.setAttribute('data-theme', id);
          style.appendChild(document.createTextNode(data.style));

          document.head.appendChild(style);
        }

        if (data.styleSheet) {
          const link = document.createElement('link');
          link.rel = 'stylesheet';
          link.type = 'text/css';
          link.href = data.baseUrl + data.styleSheet;
          link.setAttribute('data-theme', id);

          document.head.appendChild(link);
        }

        if (data.templates) {
          for (const [tplId, tpl] of Object.entries(data.templates)) {
            const elem = document.getElementById(tplId);

            if (elem) {
              this.tplBackups.push([elem, elem.innerText]);
              elem.innerText = tpl;
            }
          }
        }

        if (data.script) {
          const script = document.createElement('script');
          script.type = 'text/javascript';
          script.src = data.baseUrl + data.script;

          document.head.appendChild(script);
        }

        if (data.msgTemplates) {
          for (const [tplId, tpl] of Object.entries(data.msgTemplates)) {
            this.msgTplBackups.push([tplId, this.templates[tplId]]);
            this.templates[tplId] = tpl;
          }
        }
      }
    },
    warn(msg) {
      this.messages.push({
        args: [msg],
        template: '^3<b>CHAT-WARN</b>: ^0{0}',
      });
    },
    clearShowWindowTimer() {
      clearTimeout(this.showWindowTimer);
    },
    resetShowWindowTimer() {
      this.clearShowWindowTimer();
      this.showWindowTimer = setTimeout(() => {
        if (!this.showInput) {
          this.showWindow = false;
        }
      }, CONFIG.fadeTimeout);
    },
    keyUp() {
      this.resize();
    },
    keyDown(e) {
      if (e.which === 38 || e.which === 40) {
        e.preventDefault();
        this.moveOldMessageIndex(e.which === 38);
      } else if (e.which == 33) {
        var buf = document.getElementsByClassName('chat-messages')[0];
        buf.scrollTop = buf.scrollTop - 100;
      } else if (e.which == 34) {
        var buf = document.getElementsByClassName('chat-messages')[0];
        buf.scrollTop = buf.scrollTop + 100;
      }
    },
    moveOldMessageIndex(up) {
      if (up && this.oldMessages.length > this.oldMessagesIndex + 1) {
        this.oldMessagesIndex += 1;
        this.message = this.oldMessages[this.oldMessagesIndex];
      } else if (!up && this.oldMessagesIndex - 1 >= 0) {
        this.oldMessagesIndex -= 1;
        this.message = this.oldMessages[this.oldMessagesIndex];
      } else if (!up && this.oldMessagesIndex - 1 === -1) {
        this.oldMessagesIndex = -1;
        this.message = '';
      }
    },
    resize() {
      const input = this.$refs.input;
      input.style.height = '5px';
      input.style.height = `${input.scrollHeight + 2}px`;
    },
    send(e) {
      if (this.message !== '') {
        post('https://mt-rpchat/chatResult', JSON.stringify({
          message: this.message,
        }));
        this.oldMessages.unshift(this.message);
        this.oldMessagesIndex = -1;
        this.hideInput();
      } else {
        this.hideInput(true);
      }
    },
    processAnnouncementQueue() {
      if (this.showBillboard || this.currentAnnouncement) return; // Already showing one
      if (this.announcementQueue.length === 0) return; // Empty queue

      // Get next message
      this.currentAnnouncement = this.announcementQueue.shift();
      this.showBillboard = true;

      // Show for 5 seconds
      setTimeout(() => {
        this.showBillboard = false; // Trigger exit animation

        // Wait for exit animation (e.g. 1s) then clear and process next
        setTimeout(() => {
          this.currentAnnouncement = null;
          this.processAnnouncementQueue();
        }, 1000);

      }, 5000);
    },
    hideInput(canceled = false) {
      if (canceled) {
        post('https://mt-rpchat/chatResult', JSON.stringify({ canceled }));
      }
      this.message = '';
      this.showInput = false;
      clearInterval(this.focusTimer);
      this.resetShowWindowTimer();
    },
  },
};
