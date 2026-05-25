// =====================================================
// HACKING MINIGAME - MEMORY SEQUENCE (NAMESPACE SEPARADO)
// =====================================================




(function() {
    'use strict';
    
    
    
    // Variables del juego
    const HackingGame = {
        isActive: false,
        currentLevel: 0,
        totalLevels: 5,
        timePerLevel: 10,
        timeLeft: 10,
        timerInterval: null,
        currentSequence: [],
        playerSequence: [],
        isShowingSequence: false,
        GRID_CODES: ['00', '01', '10', '11', 'FF', 'A7', 'B3', '7E', 'C4']
    };
    
    
    
    
    // =====================================================
    // POST TO CLIENT
    // =====================================================
    
    function post(action, data = {}) {
        const resourceName = 'mt-minijuegos';
        
        
        return $.post(`https://${resourceName}/${action}`, JSON.stringify(data))
            .done(function(response) {
                
            })
            .fail(function(error) {
                console.error('[HACKING] POST FAILED ->', action, error);
            });
    }
    
    // =====================================================
    // LISTENER DE MENSAJES
    // =====================================================
    
    
    
    window.addEventListener('message', function(event) {
        const data = event.data;
        
        
        
        
        
        if (data.action === 'startHacking') {
            
            
            startHacking(data.config);
        }
    });
    
    
    
    // =====================================================
    // INICIAR HACKING
    // =====================================================
    
    function startHacking(config) {
        
        
        
        if (HackingGame.isActive) {
            console.warn('[HACKING] Ya hay un hacking activo!');
            return;
        }
        
        HackingGame.totalLevels = config.levels || 5;
        HackingGame.timePerLevel = config.timePerLevel || 10;
        HackingGame.currentLevel = 0;
        HackingGame.timeLeft = HackingGame.timePerLevel;
        HackingGame.isActive = true;
        
        
        
        
        
        const container = $('#hacking-container');
        
        
        if (container.length === 0) {
            console.error('[HACKING] ERROR: No se encontró #hacking-container');
            return;
        }
        
        
        container.css('display', 'flex');
        
        
        generateGrid();
        
        
        generateProgressDots();
        
        
        startNewLevel();
        
        
    }
    
    // =====================================================
    // GENERAR GRID
    // =====================================================
    
    function generateGrid() {
        const container = $('#code-grid');
        
        
        container.empty();
        
        HackingGame.GRID_CODES.forEach((code, index) => {
            const cell = $(`<div class="code-cell" data-index="${index}">${code}</div>`);
            cell.on('click', () => handleCellClick(index));
            container.append(cell);
        });
        
        
    }
    
    // =====================================================
    // GENERAR PROGRESS DOTS
    // =====================================================
    
    function generateProgressDots() {
        const container = $('#hacking-progress-dots');
        
        
        container.empty();
        
        for (let i = 0; i < HackingGame.totalLevels; i++) {
            const dot = $('<div class="progress-dot"></div>');
            if (i === 0) dot.addClass('active');
            container.append(dot);
        }
        
        
    }
    
    // =====================================================
    // NUEVO NIVEL
    // =====================================================
    
    function startNewLevel() {
        
        
        HackingGame.timeLeft = HackingGame.timePerLevel;
        HackingGame.playerSequence = [];
        HackingGame.isShowingSequence = true;
        
        const sequenceLength = 2 + HackingGame.currentLevel;
        HackingGame.currentSequence = [];
        
        for (let i = 0; i < sequenceLength; i++) {
            HackingGame.currentSequence.push(Math.floor(Math.random() * 9));
        }
        
        
        
        updateUI();
        disableGrid(true);
        showSequence();
    }
    
    // =====================================================
    // MOSTRAR SECUENCIA
    // =====================================================
    
    function showSequence() {
        
        $('#instruction-text').text('MEMORIZA LA SECUENCIA');
        
        let index = 0;
        
        const showNext = () => {
            if (index >= HackingGame.currentSequence.length) {
                setTimeout(() => {
                    HackingGame.isShowingSequence = false;
                    disableGrid(false);
                    $('#instruction-text').text('REPITE LA SECUENCIA');
                    startTimer();
                }, 500);
                return;
            }
            
            const cellIndex = HackingGame.currentSequence[index];
            const cell = $(`.code-cell[data-index="${cellIndex}"]`);
            
            cell.addClass('showing');
            
            setTimeout(() => {
                cell.removeClass('showing');
                index++;
                setTimeout(showNext, 300);
            }, 600);
        };
        
        setTimeout(showNext, 500);
    }
    
    // =====================================================
    // HANDLE CELL CLICK
    // =====================================================
    
    function handleCellClick(index) {
        if (!HackingGame.isActive || HackingGame.isShowingSequence) return;
        
        
        
        HackingGame.playerSequence.push(index);
        const cell = $(`.code-cell[data-index="${index}"]`);
        
        const currentStep = HackingGame.playerSequence.length - 1;
        const isCorrect = HackingGame.currentSequence[currentStep] === index;
        
        if (isCorrect) {
            cell.addClass('correct');
            setTimeout(() => cell.removeClass('correct'), 300);
            
            if (HackingGame.playerSequence.length === HackingGame.currentSequence.length) {
                successLevel();
            }
        } else {
            cell.addClass('wrong');
            setTimeout(() => {
                cell.removeClass('wrong');
                failHacking();
            }, 500);
        }
    }
    
    // =====================================================
    // TIMER
    // =====================================================
    
    function startTimer() {
        
        
        if (HackingGame.timerInterval) clearInterval(HackingGame.timerInterval);
        
        HackingGame.timerInterval = setInterval(() => {
            HackingGame.timeLeft -= 0.1;
            
            if (HackingGame.timeLeft <= 0) {
                failHacking();
            }
            
            updateTimer();
        }, 100);
    }
    
    function updateTimer() {
        const timerElement = $('#hacking-timer');
        timerElement.text(Math.max(0, HackingGame.timeLeft).toFixed(1));
        
        timerElement.removeClass('warning danger');
        if (HackingGame.timeLeft < 3) {
            timerElement.addClass('danger');
        } else if (HackingGame.timeLeft < 5) {
            timerElement.addClass('warning');
        }
    }
    
    // =====================================================
    // ACTUALIZAR UI
    // =====================================================
    
    function updateUI() {
        $('#hacking-current-level').text(HackingGame.currentLevel + 1);
        $('#hacking-total-levels').text(HackingGame.totalLevels);
        $('#hacking-total-levels-2').text(HackingGame.totalLevels);
        $('#hacking-completed-levels').text(HackingGame.currentLevel);
        
        $('#hacking-progress-dots .progress-dot').each(function(index) {
            $(this).removeClass('active completed');
            if (index < HackingGame.currentLevel) {
                $(this).addClass('completed');
            } else if (index === HackingGame.currentLevel) {
                $(this).addClass('active');
            }
        });
    }
    
    // =====================================================
    // DISABLE/ENABLE GRID
    // =====================================================
    
    function disableGrid(disabled) {
        if (disabled) {
            $('.code-cell').addClass('disabled');
        } else {
            $('.code-cell').removeClass('disabled');
        }
    }
    
    // =====================================================
    // ÉXITO NIVEL
    // =====================================================
    
    function successLevel() {
        
        
        clearInterval(HackingGame.timerInterval);
        disableGrid(true);
        
        setTimeout(() => {
            HackingGame.currentLevel++;
            
            if (HackingGame.currentLevel >= HackingGame.totalLevels) {
                
                completeHacking(true);
            } else {
                startNewLevel();
            }
        }, 500);
    }
    
    // =====================================================
    // FALLO
    // =====================================================
    
    function failHacking() {
        
        
        clearInterval(HackingGame.timerInterval);
        disableGrid(true);
        
        setTimeout(() => {
            completeHacking(false);
        }, 500);
    }
    
    // =====================================================
    // COMPLETAR
    // =====================================================
    
    function completeHacking(success) {
        
        
        HackingGame.isActive = false;
        
        if (HackingGame.timerInterval) clearInterval(HackingGame.timerInterval);
        
        setTimeout(() => {
            $('#hacking-container').css('display', 'none');
            
            post('hackingResult', { success: success });
        }, 300);
    }
    
    // =====================================================
    // CERRAR (ESC)
    // =====================================================
    
    $(document).on('keydown', function(e) {
        if (e.key === 'Escape' && HackingGame.isActive) {
            
            clearInterval(HackingGame.timerInterval);
            HackingGame.isActive = false;
            
            $('#hacking-container').css('display', 'none');
            post('closeHacking', {});
        }
    });
    
    
    
})();

