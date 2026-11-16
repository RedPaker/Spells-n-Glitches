
(function () {
    function iniciar() {
        if (document.querySelector('.lightbox-overlay')) return;

        var css =
            '.primarybox img { cursor: zoom-in; }' +
            '.lightbox-overlay {' +
            '  position: fixed; top: 0; left: 0; right: 0; bottom: 0; z-index: 99999;' +
            '  display: none; align-items: center; justify-content: center; flex-direction: column;' +
            '  padding: 20px; background: rgba(0, 20, 50, 0.85); cursor: zoom-out;' +
            '}' +
            '.lightbox-overlay.aberto { display: flex; }' +
            '.lightbox-overlay img {' +
            '  max-width: 95vw; max-height: 85vh; width: auto; height: auto; min-width: 0;' +
            '  object-fit: contain; border: 3px solid rgba(255,255,255,0.9); border-radius: 12px;' +
            '  box-shadow: 0 16px 50px rgba(0,0,0,0.6); background: #fff; cursor: zoom-out;' +
            '}' +
            '.lightbox-overlay .lightbox-legenda {' +
            '  margin-top: 12px; color: #fff; font-size: 18px; text-shadow: 0 2px 6px rgba(0,0,0,0.7);' +
            '}' +
            '.lightbox-overlay .lightbox-fechar {' +
            '  position: absolute; top: 16px; right: 22px; color: #fff; font-size: 40px; line-height: 1;' +
            '}';

        var estilo = document.createElement('style');
        estilo.textContent = css;
        document.head.appendChild(estilo);

    
        var overlay = document.createElement('div');
        overlay.className = 'lightbox-overlay';
        overlay.innerHTML =
            '<span class="lightbox-fechar">&times;</span>' +
            '<img alt="">' +
            '<div class="lightbox-legenda"></div>';
        document.body.appendChild(overlay);

        var imgGrande = overlay.querySelector('img');
        var legenda = overlay.querySelector('.lightbox-legenda');

        function abrir(img) {
            imgGrande.src = img.currentSrc || img.src;
            imgGrande.alt = img.alt || '';
            legenda.textContent = img.alt || '';
            overlay.classList.add('aberto');
        }

        function fechar() {
            overlay.classList.remove('aberto');
        }

        document.addEventListener('click', function (e) {
            var alvo = e.target;
            if (!alvo || alvo.tagName !== 'IMG') return;
            if (overlay.contains(alvo)) return;           
            if (!alvo.closest('.primarybox')) return;     
            if (alvo.closest('a')) return;                
            abrir(alvo);
        }, true);

        overlay.addEventListener('click', fechar);

        document.addEventListener('keydown', function (e) {
            if (e.key === 'Escape') fechar();
        });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', iniciar);
    } else {
        iniciar();
    }
})();