    // Перехват запросов (JavaScript)
    window.addEventListener('flutter-first-frame', function () {
        // Сохраняем оригинальные функции fetch и XMLHttpRequest.
        const originalFetch = window.fetch;
        const originalXMLHttpRequest = window.XMLHttpRequest;

        // Переопределяем fetch
        window.fetch = (url, options) => {
            const modifiedUrl = modifyUrl(url);
            return originalFetch(modifiedUrl, options);
        };

        // Переопределяем XMLHttpRequest (для canvaskit.js)
        window.XMLHttpRequest = class extends originalXMLHttpRequest {
            constructor() {
                super();
            }

            open(method, url, async, user, password) {
                const modifiedUrl = modifyUrl(url);
                super.open(method, modifiedUrl, async, user, password);
            }
        };

      function modifyUrl(url) {
        // Заменяем URL-адреса gstatic.com на локальные.
          if (url.match(/^https:\/\/www\.gstatic\.com\/flutter-canvaskit\/[^\/]+\/chromium\/canvaskit\.wasm/)) {
            return 'http://localhost/static/canvaskit.wasm';
          }
          // Обработка CanvasKit JS
          else if (url.match(/^https:\/\/www\.gstatic\.com\/flutter-canvaskit\/[^\/]+\/chromium\/canvaskit\.js/)) {
            return 'http://localhost/static/canvaskit.js';
          }
          // Обработка Roboto
          else if (url.match(/^https:\/\/fonts\.gstatic\.com\/s\/roboto\/[^\/]+\/[^\/]+\.ttf/)) {
            return 'http://localhost/static/roboto.ttf';
          }
          // Обработка Noto Sans SC
          else if (url.match(/^https:\/\/fonts\.gstatic\.com\/s\/notosanssc\/[^\/]+\.ttf/)) {
            return 'http://localhost/static/notosanssc.ttf';
          }
        return url;
      }
    });