
;;=================== Setup php-mode: https://github.com/emacs-php/php-mode
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

; Company language package for PHP
(use-package company-php
  :defer
  :after company)


(add-hook 'php-mode-hook
          '(lambda ()
             ;; Enable company-mode
             (company-mode t)
             (require 'company-php)

             ;; Enable ElDoc support (optional)
             (ac-php-core-eldoc-setup)

             (set (make-local-variable 'company-backends)
                  '((company-ac-php-backend company-dabbrev-code)
                    company-capf company-files))

             ;; Jump to definition (optional)
             (define-key php-mode-map (kbd "M-]")
               'ac-php-find-symbol-at-point)

             ;; Return back (optional)
             (define-key php-mode-map (kbd "M-[")
               'ac-php-location-stack-back)))

;;================== Setup php-auto-yasnippets
(require 'php-auto-yasnippets)
(setq php-auto-yasnippet-php-program "~/.emacs.d/elpa/php-auto-yasnippets-2.3.1/Create-PHP-YASnippet.php")
(define-key php-mode-map (kbd "C-<tab>") 'yas/create-php-snippet)



(provide 'php-bundle)
